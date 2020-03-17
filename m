Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDD076062C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 14:41:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02HEfARu000940
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 07:41:35 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 17 Mar 2020 07:41:19 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 07:41:19 -0700
Message-ID: <20200317144119.97477-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][zeus][PATCH] ipmitool: fix CVE-2020-5208
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
X-List-Received-Date: Tue, 17 Mar 2020 14:41:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fix CVE-2020-5208

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...-Fix-buffer-overflow-vulnerabilities.patch | 133 ++++++++++++++++
 ...uffer-overflow-in-ipmi_spd_print_fru.patch |  53 +++++++
 ...er-overflow-in-ipmi_get_session_info.patch |  53 +++++++
 .../0004-channel-Fix-buffer-overflow.patch    |  69 +++++++++
 ...er-overflows-in-get_lan_param_select.patch |  94 ++++++++++++
 ...u-sdr-Fix-id_string-buffer-overflows.patch | 142 ++++++++++++++++++
 .../ipmitool/ipmitool_1.8.18.bb               |   6 +
 7 files changed, 550 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0002-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0003-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0004-channel-Fix-buffer-overflow.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0005-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
 create mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0006-fru-sdr-Fix-id_string-buffer-overflows.patch

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch
new file mode 100644
index 000000000..aeb0da80e
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-fru-Fix-buffer-overflow-vulnerabilities.patch
@@ -0,0 +1,133 @@
+From 2542bade29c192370ca897eab67c40f27b8912f8 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Wed, 12 Feb 2020 12:32:00 +0800
+Subject: [PATCH 1/6] fru: Fix buffer overflow vulnerabilities
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
+index cf00eff..af99aa9 100644
+--- a/lib/ipmi_fru.c
++++ b/lib/ipmi_fru.c
+@@ -615,7 +615,10 @@ int
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
+@@ -628,10 +631,12 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
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
+@@ -667,6 +672,7 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 		}
+ 	}
+ 
++	size_left_in_buffer = length;
+ 	do {
+ 		tmp = fru->access ? off >> 1 : off;
+ 		msg_data[0] = id;
+@@ -707,9 +713,18 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
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
+@@ -742,7 +757,9 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
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
+@@ -755,10 +772,12 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
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
+@@ -773,6 +792,8 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 	if (fru->access && fru_data_rqst_size > 16)
+ #endif
+ 		fru_data_rqst_size = 16;
++
++	size_left_in_buffer = length;
+ 	do {
+ 		tmp = fru->access ? off >> 1 : off;
+ 		msg_data[0] = id;
+@@ -804,8 +825,16 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
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
+2.23.0
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0002-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0002-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
new file mode 100644
index 000000000..50a5635a0
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0002-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
@@ -0,0 +1,53 @@
+From 16b10ba5d3a368cd0ed90e9789553c306f1136a6 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:44:18 +0000
+Subject: [PATCH 2/6] fru: Fix buffer overflow in ipmi_spd_print_fru
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `ipmi_spd_print_fru` function has a similar issue as the one fixed
+by the previous commit in `read_fru_area_section`. An initial request is
+made to get the `fru.size`, which is used as the size for the allocation
+of `spd_data`. Inside a loop, further requests are performed to get the
+copy sizes which are not checked before being used as the size for a
+copy into the buffer.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/840fb1cbb4fb365cb9797300e3374d4faefcdb10]
+CVE: CVE-2020-5208
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/dimm_spd.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/lib/dimm_spd.c b/lib/dimm_spd.c
+index 41e30db..68f3b4f 100644
+--- a/lib/dimm_spd.c
++++ b/lib/dimm_spd.c
+@@ -1621,7 +1621,7 @@ ipmi_spd_print_fru(struct ipmi_intf * intf, uint8_t id)
+ 	struct ipmi_rq req;
+ 	struct fru_info fru;
+ 	uint8_t *spd_data, msg_data[4];
+-	int len, offset;
++	uint32_t len, offset;
+ 
+ 	msg_data[0] = id;
+ 
+@@ -1697,6 +1697,13 @@ ipmi_spd_print_fru(struct ipmi_intf * intf, uint8_t id)
+ 		}
+ 
+ 		len = rsp->data[0];
++		if(rsp->data_len < 1
++		   || len > rsp->data_len - 1
++		   || len > fru.size - offset)
++		{
++			printf(" Not enough buffer size");
++			return -1;
++		}
+ 		memcpy(&spd_data[offset], rsp->data + 1, len);
+ 		offset += len;
+ 	} while (offset < fru.size);
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0003-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0003-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
new file mode 100644
index 000000000..6b5022533
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0003-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
@@ -0,0 +1,53 @@
+From 89621b1ce67065fb9044b73c215862fc8aef523f Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:51:49 +0000
+Subject: [PATCH 3/6] session: Fix buffer overflow in ipmi_get_session_info
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `ipmi_get_session_info` function does not properly check the
+response `data_len`, which is used as a copy size, allowing stack buffer
+overflow.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/41d7026946fafbd4d1ec0bcaca3ea30a6e8eed22]
+CVE: CVE-2020-5208
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/ipmi_session.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/lib/ipmi_session.c b/lib/ipmi_session.c
+index 141f0f4..b9af1fd 100644
+--- a/lib/ipmi_session.c
++++ b/lib/ipmi_session.c
+@@ -309,8 +309,10 @@ ipmi_get_session_info(struct ipmi_intf         * intf,
+ 		}
+ 		else
+ 		{
+-			memcpy(&session_info,  rsp->data, rsp->data_len);
+-			print_session_info(&session_info, rsp->data_len);
++			memcpy(&session_info,  rsp->data,
++			       __min(rsp->data_len, sizeof(session_info)));
++			print_session_info(&session_info,
++			                   __min(rsp->data_len, sizeof(session_info)));
+ 		}
+ 		break;
+ 		
+@@ -341,8 +343,10 @@ ipmi_get_session_info(struct ipmi_intf         * intf,
+ 				break;
+ 			}
+ 
+-			memcpy(&session_info,  rsp->data, rsp->data_len);
+-			print_session_info(&session_info, rsp->data_len);
++			memcpy(&session_info,  rsp->data,
++			       __min(rsp->data_len, sizeof(session_info)));
++			print_session_info(&session_info,
++			                   __min(rsp->data_len, sizeof(session_info)));
+ 			
+ 		} while (i <= session_info.session_slot_count);
+ 		break;
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0004-channel-Fix-buffer-overflow.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0004-channel-Fix-buffer-overflow.patch
new file mode 100644
index 000000000..480090b92
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0004-channel-Fix-buffer-overflow.patch
@@ -0,0 +1,69 @@
+From 2a84669ea0d685b4a2ccb664fa3236ec5f19a80a Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:56:38 +0000
+Subject: [PATCH 4/6] channel: Fix buffer overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `ipmi_get_channel_cipher_suites` function does not properly check
+the final response’s `data_len`, which can lead to stack buffer overflow
+on the final copy.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/9452be87181a6e83cfcc768b3ed8321763db50e4]
+CVE: CVE-2020-5208
+
+[Make some changes to apply it]
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ include/ipmitool/ipmi_channel.h |  2 ++
+ lib/ipmi_channel.c              | 10 ++++++++--
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/include/ipmitool/ipmi_channel.h b/include/ipmitool/ipmi_channel.h
+index b138c26..d7cce5e 100644
+--- a/include/ipmitool/ipmi_channel.h
++++ b/include/ipmitool/ipmi_channel.h
+@@ -77,6 +77,8 @@ struct channel_access_t {
+ 	uint8_t user_level_auth;
+ };
+ 
++#define MAX_CIPHER_SUITE_DATA_LEN 0x10
++
+ /*
+  * The Get Authentication Capabilities response structure
+  * From table 22-15 of the IPMI v2.0 spec
+diff --git a/lib/ipmi_channel.c b/lib/ipmi_channel.c
+index fab2e54..76ecdcd 100644
+--- a/lib/ipmi_channel.c
++++ b/lib/ipmi_channel.c
+@@ -378,7 +378,10 @@ ipmi_get_channel_cipher_suites(struct ipmi_intf *intf, const char *payload_type,
+ 		lprintf(LOG_ERR, "Unable to Get Channel Cipher Suites");
+ 		return -1;
+ 	}
+-	if (rsp->ccode > 0) {
++	if (rsp->ccode
++	    || rsp->data_len < 1
++	    || rsp->data_len > sizeof(uint8_t) + MAX_CIPHER_SUITE_DATA_LEN)
++	{
+ 		lprintf(LOG_ERR, "Get Channel Cipher Suites failed: %s",
+ 			val2str(rsp->ccode, completion_code_vals));
+ 		return -1;
+@@ -413,7 +416,10 @@ ipmi_get_channel_cipher_suites(struct ipmi_intf *intf, const char *payload_type,
+ 			lprintf(LOG_ERR, "Unable to Get Channel Cipher Suites");
+ 			return -1;
+ 		}
+-		if (rsp->ccode > 0) {
++		if (rsp->ccode
++		    || rsp->data_len < 1
++		    || rsp->data_len > sizeof(uint8_t) + MAX_CIPHER_SUITE_DATA_LEN)
++		{
+ 			lprintf(LOG_ERR, "Get Channel Cipher Suites failed: %s",
+ 					val2str(rsp->ccode, completion_code_vals));
+ 			return -1;
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0005-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0005-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
new file mode 100644
index 000000000..1b1dec1c1
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0005-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
@@ -0,0 +1,94 @@
+From f45e6d84b75dcd649e18c9256c136cda354de6fd Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 17:06:39 +0000
+Subject: [PATCH 5/6] lanp: Fix buffer overflows in get_lan_param_select
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `get_lan_param_select` function is missing a validation check on the
+response’s `data_len`, which it then returns to caller functions, where
+stack buffer overflow can occur.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/d45572d71e70840e0d4c50bf48218492b79c1a10]
+CVE: CVE-2020-5208
+
+[Make some changes to apply it]
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/ipmi_lanp.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/lib/ipmi_lanp.c b/lib/ipmi_lanp.c
+index 65d881b..022c7f1 100644
+--- a/lib/ipmi_lanp.c
++++ b/lib/ipmi_lanp.c
+@@ -1809,7 +1809,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 		/* set new ipaddr */
+ 		memcpy(data+3, temp, 4);
+ 		printf("Setting LAN Alert %d IP Address to %d.%d.%d.%d\n", alert,
+@@ -1824,7 +1824,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 		/* set new macaddr */
+ 		memcpy(data+7, temp, 6);
+ 		printf("Setting LAN Alert %d MAC Address to "
+@@ -1838,7 +1838,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (strncasecmp(argv[1], "def", 3) == 0 ||
+ 		    strncasecmp(argv[1], "default", 7) == 0) {
+@@ -1864,7 +1864,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (strncasecmp(argv[1], "on", 2) == 0 ||
+ 		    strncasecmp(argv[1], "yes", 3) == 0) {
+@@ -1889,7 +1889,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (strncasecmp(argv[1], "pet", 3) == 0) {
+ 			printf("Setting LAN Alert %d destination to PET Trap\n", alert);
+@@ -1917,7 +1917,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (str2uchar(argv[1], &data[2]) != 0) {
+ 			lprintf(LOG_ERR, "Invalid time: %s", argv[1]);
+@@ -1933,7 +1933,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (str2uchar(argv[1], &data[3]) != 0) {
+ 			lprintf(LOG_ERR, "Invalid retry: %s", argv[1]);
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0006-fru-sdr-Fix-id_string-buffer-overflows.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0006-fru-sdr-Fix-id_string-buffer-overflows.patch
new file mode 100644
index 000000000..38ca41b68
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool/0006-fru-sdr-Fix-id_string-buffer-overflows.patch
@@ -0,0 +1,142 @@
+From 401b7dda5ad1beada4791d54a7e75880f2a4fc24 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 17:13:45 +0000
+Subject: [PATCH 6/6] fru, sdr: Fix id_string buffer overflows
+
+Final part of the fixes for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+9 variants of stack buffer overflow when parsing `id_string` field of
+SDR records returned from `CMD_GET_SDR` command.
+
+SDR record structs have an `id_code` field, and an `id_string` `char`
+array.
+
+The length of `id_string` is calculated as `(id_code & 0x1f) + 1`,
+which can be larger than expected 16 characters (if `id_code = 0xff`,
+then length will be `(0xff & 0x1f) + 1 = 32`).
+
+In numerous places, this can cause stack buffer overflow when copying
+into fixed buffer of size `17` bytes from this calculated length.
+
+Upstream-Status: Backport[https://github.com/ipmitool/ipmitool/commit/7ccea283dd62a05a320c1921e3d8d71a87772637]
+CVE: CVE-2020-5208
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ lib/ipmi_fru.c |  2 +-
+ lib/ipmi_sdr.c | 40 ++++++++++++++++++++++++----------------
+ 2 files changed, 25 insertions(+), 17 deletions(-)
+
+diff --git a/lib/ipmi_fru.c b/lib/ipmi_fru.c
+index af99aa9..98bc984 100644
+--- a/lib/ipmi_fru.c
++++ b/lib/ipmi_fru.c
+@@ -3062,7 +3062,7 @@ ipmi_fru_print(struct ipmi_intf * intf, struct sdr_record_fru_locator * fru)
+ 		return 0;
+ 
+ 	memset(desc, 0, sizeof(desc));
+-	memcpy(desc, fru->id_string, fru->id_code & 0x01f);
++	memcpy(desc, fru->id_string, __min(fru->id_code & 0x01f, sizeof(desc)));
+ 	desc[fru->id_code & 0x01f] = 0;
+ 	printf("FRU Device Description : %s (ID %d)\n", desc, fru->device_id);
+ 
+diff --git a/lib/ipmi_sdr.c b/lib/ipmi_sdr.c
+index 2a9cbe3..62aac08 100644
+--- a/lib/ipmi_sdr.c
++++ b/lib/ipmi_sdr.c
+@@ -2084,7 +2084,7 @@ ipmi_sdr_print_sensor_eventonly(struct ipmi_intf *intf,
+ 		return -1;
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (sensor->id_code & 0x1f) + 1, "%s", sensor->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (sensor->id_code & 0x1f) + 1, sensor->id_string);
+ 
+ 	if (verbose) {
+ 		printf("Sensor ID              : %s (0x%x)\n",
+@@ -2135,7 +2135,7 @@ ipmi_sdr_print_sensor_mc_locator(struct ipmi_intf *intf,
+ 		return -1;
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (mc->id_code & 0x1f) + 1, "%s", mc->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (mc->id_code & 0x1f) + 1, mc->id_string);
+ 
+ 	if (verbose == 0) {
+ 		if (csv_output)
+@@ -2228,7 +2228,7 @@ ipmi_sdr_print_sensor_generic_locator(struct ipmi_intf *intf,
+ 	char desc[17];
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (dev->id_code & 0x1f) + 1, "%s", dev->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (dev->id_code & 0x1f) + 1, dev->id_string);
+ 
+ 	if (!verbose) {
+ 		if (csv_output)
+@@ -2285,7 +2285,7 @@ ipmi_sdr_print_sensor_fru_locator(struct ipmi_intf *intf,
+ 	char desc[17];
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (fru->id_code & 0x1f) + 1, "%s", fru->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (fru->id_code & 0x1f) + 1, fru->id_string);
+ 
+ 	if (!verbose) {
+ 		if (csv_output)
+@@ -2489,35 +2489,43 @@ ipmi_sdr_print_name_from_rawentry(struct ipmi_intf *intf, uint16_t id,
+ 
+    int rc =0;
+    char desc[17];
++   const char *id_string;
++   uint8_t id_code;
+    memset(desc, ' ', sizeof (desc));
+ 
+    switch ( type) {
+       case SDR_RECORD_TYPE_FULL_SENSOR:
+       record.full = (struct sdr_record_full_sensor *) raw;
+-      snprintf(desc, (record.full->id_code & 0x1f) +1, "%s",
+-               (const char *)record.full->id_string);
++      id_code = record.full->id_code;
++      id_string = record.full->id_string;
+       break;
++
+       case SDR_RECORD_TYPE_COMPACT_SENSOR:
+       record.compact = (struct sdr_record_compact_sensor *) raw	;
+-      snprintf(desc, (record.compact->id_code & 0x1f)  +1, "%s",
+-               (const char *)record.compact->id_string);
++      id_code = record.compact->id_code;
++      id_string = record.compact->id_string;
+       break;
++
+       case SDR_RECORD_TYPE_EVENTONLY_SENSOR:
+       record.eventonly  = (struct sdr_record_eventonly_sensor *) raw ;
+-      snprintf(desc, (record.eventonly->id_code & 0x1f)  +1, "%s",
+-               (const char *)record.eventonly->id_string);
+-      break;            
++      id_code = record.eventonly->id_code;
++      id_string = record.eventonly->id_string;
++      break;
++
+       case SDR_RECORD_TYPE_MC_DEVICE_LOCATOR:
+       record.mcloc  = (struct sdr_record_mc_locator *) raw ;
+-      snprintf(desc, (record.mcloc->id_code & 0x1f)  +1, "%s",
+-               (const char *)record.mcloc->id_string);		
++      id_code = record.mcloc->id_code;
++      id_string = record.mcloc->id_string;
+       break;
++
+       default:
+       rc = -1;
+-      break;
+-   }   
++   }
++   if (!rc) {
++       snprintf(desc, sizeof(desc), "%.*s", (id_code & 0x1f) + 1, id_string);
++   }
+ 
+-      lprintf(LOG_INFO, "ID: 0x%04x , NAME: %-16s", id, desc);
++   lprintf(LOG_INFO, "ID: 0x%04x , NAME: %-16s", id, desc);
+    return rc;
+ }
+ 
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
index b7f1aa914..16dbcb291 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
@@ -24,6 +24,12 @@ DEPENDS = "openssl readline ncurses"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2 \
            file://0001-Migrate-to-openssl-1.1.patch \
+           file://0001-fru-Fix-buffer-overflow-vulnerabilities.patch \
+           file://0002-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch \
+           file://0003-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch \
+           file://0004-channel-Fix-buffer-overflow.patch \
+           file://0005-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch \
+           file://0006-fru-sdr-Fix-id_string-buffer-overflows.patch \
            "
 SRC_URI[md5sum] = "bab7ea104c7b85529c3ef65c54427aa3"
 SRC_URI[sha256sum] = "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01"
-- 
2.23.0


