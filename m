Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4861960886
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 09:09:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01E98BZc014934
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2020 01:08:53 -0800
Received: from pek-wkang-d1.wrs.com (128.224.162.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 14 Feb 2020 01:08:20 -0800
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Feb 2020 17:08:19 +0800
Message-ID: <20200214090819.15989-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ipmitool: fix CVE-2020-5208
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Feb 2020 09:09:02 -0000
Content-Type: text/plain

Fix CVE-2020-5208

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...-Fix-buffer-overflow-vulnerabilities.patch | 133 ++++++++++++++++++
 .../ipmitool/ipmitool_1.8.18.bb               |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch
new file mode 100644
index 000000000..b65e3ef1a
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch
@@ -0,0 +1,133 @@
+From e824c23316ae50beb7f7488f2055ac65e8b341f2 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:33:59 +0000
+Subject: [PATCH] fru: Fix buffer overflow vulnerabilities
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `read_fru_area_section` function only performs size validation of
+requested read size, and falsely assumes that the IPMI message will not
+respond with more than the requested amount of data; it uses the
+unvalidated response size to copy into `frubuf`. If the response is
+larger than the request, this can result in overflowing the buffer.
+
+The same issue affects the `read_fru_area` function.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/e824c23316ae50beb7f7488f2055ac65e8b341f2]
+CVE: CVE-2020-5208
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/ipmi_fru.c | 33 +++++++++++++++++++++++++++++++--
+ 1 file changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/lib/ipmi_fru.c b/lib/ipmi_fru.c
+index c2a139d..2e323ff 100644
+--- a/lib/ipmi_fru.c
++++ b/lib/ipmi_fru.c
+@@ -663,7 +663,10 @@ int
+ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 			uint32_t offset, uint32_t length, uint8_t *frubuf)
+ {
+-	uint32_t off = offset, tmp, finish;
++	uint32_t off = offset;
++	uint32_t tmp;
++	uint32_t finish;
++	uint32_t size_left_in_buffer;
+ 	struct ipmi_rs * rsp;
+ 	struct ipmi_rq req;
+ 	uint8_t msg_data[4];
+@@ -676,10 +679,12 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 
+ 	finish = offset + length;
+ 	if (finish > fru->size) {
++		memset(frubuf + fru->size, 0, length - fru->size);
+ 		finish = fru->size;
+ 		lprintf(LOG_NOTICE, "Read FRU Area length %d too large, "
+ 			"Adjusting to %d",
+ 			offset + length, finish - offset);
++		length = finish - offset;
+ 	}
+ 
+ 	memset(&req, 0, sizeof(req));
+@@ -715,6 +720,7 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 		}
+ 	}
+ 
++	size_left_in_buffer = length;
+ 	do {
+ 		tmp = fru->access ? off >> 1 : off;
+ 		msg_data[0] = id;
+@@ -756,9 +762,18 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 		}
+ 
+ 		tmp = fru->access ? rsp->data[0] << 1 : rsp->data[0];
++		if(rsp->data_len < 1
++		   || tmp > rsp->data_len - 1
++		   || tmp > size_left_in_buffer)
++		{
++			printf(" Not enough buffer size");
++			return -1;
++		}
++
+ 		memcpy(frubuf, rsp->data + 1, tmp);
+ 		off += tmp;
+ 		frubuf += tmp;
++		size_left_in_buffer -= tmp;
+ 		/* sometimes the size returned in the Info command
+ 		* is too large.  return 0 so higher level function
+ 		* still attempts to parse what was returned */
+@@ -791,7 +806,9 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 			uint32_t offset, uint32_t length, uint8_t *frubuf)
+ {
+ 	static uint32_t fru_data_rqst_size = 20;
+-	uint32_t off = offset, tmp, finish;
++	uint32_t off = offset;
++	uint32_t tmp, finish;
++	uint32_t size_left_in_buffer;
+ 	struct ipmi_rs * rsp;
+ 	struct ipmi_rq req;
+ 	uint8_t msg_data[4];
+@@ -804,10 +821,12 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 
+ 	finish = offset + length;
+ 	if (finish > fru->size) {
++		memset(frubuf + fru->size, 0, length - fru->size);
+ 		finish = fru->size;
+ 		lprintf(LOG_NOTICE, "Read FRU Area length %d too large, "
+ 			"Adjusting to %d",
+ 			offset + length, finish - offset);
++		length = finish - offset;
+ 	}
+ 
+ 	memset(&req, 0, sizeof(req));
+@@ -822,6 +841,8 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 	if (fru->access && fru_data_rqst_size > 16)
+ #endif
+ 		fru_data_rqst_size = 16;
++
++	size_left_in_buffer = length;
+ 	do {
+ 		tmp = fru->access ? off >> 1 : off;
+ 		msg_data[0] = id;
+@@ -853,8 +874,16 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 		}
+ 
+ 		tmp = fru->access ? rsp->data[0] << 1 : rsp->data[0];
++		if(rsp->data_len < 1
++		   || tmp > rsp->data_len - 1
++		   || tmp > size_left_in_buffer)
++		{
++			printf(" Not enough buffer size");
++			return -1;
++		}
+ 		memcpy((frubuf + off)-offset, rsp->data + 1, tmp);
+ 		off += tmp;
++		size_left_in_buffer -= tmp;
+ 
+ 		/* sometimes the size returned in the Info command
+ 		* is too large.  return 0 so higher level function
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
index b7f1aa914..500d5bd0b 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
@@ -24,6 +24,7 @@ DEPENDS = "openssl readline ncurses"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2 \
            file://0001-Migrate-to-openssl-1.1.patch \
+           file://0001-fru-Fix-buffer-overflow-vulnerabilities.patch \
            "
 SRC_URI[md5sum] = "bab7ea104c7b85529c3ef65c54427aa3"
 SRC_URI[sha256sum] = "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01"
-- 
2.17.1


