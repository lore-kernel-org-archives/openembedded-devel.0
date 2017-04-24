Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFFFB71DDA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:05:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3O95cM9019492
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 02:05:44 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 02:05:39 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Apr 2017 17:05:04 +0800
Message-ID: <1493024704-196407-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] collectd: CVE-2017-7401
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
X-List-Received-Date: Mon, 24 Apr 2017 09:05:46 -0000
Content-Type: text/plain

Incorrect interaction of the parse_packet() and parse_part_sign_sha256() functions
in network.c in collectd 5.7.1 and earlier allows remote attackers to cause a
denial of service (infinite loop) of a collectd instance (configured with
"SecurityLevel None" and with empty "AuthFile" options) via a crafted UDP packet.

Backport upstream patch from https://github.com/collectd/collectd/
commit f6be4f9b49b949b379326c3d7002476e6ce4f211

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../collectd/collectd/collectd-CVE-2017-7401.patch | 54 ++++++++++++++++++++++
 .../recipes-extended/collectd/collectd_5.5.0.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/collectd-CVE-2017-7401.patch

diff --git a/meta-oe/recipes-extended/collectd/collectd/collectd-CVE-2017-7401.patch b/meta-oe/recipes-extended/collectd/collectd/collectd-CVE-2017-7401.patch
new file mode 100644
index 0000000..9dc975e
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/collectd-CVE-2017-7401.patch
@@ -0,0 +1,54 @@
+
+network plugin: Fix endless loop DOS in parse_packet()
+
+When correct 'Signature part' is received by Collectd, configured without
+AuthFile option, condition for endless loop occurs due to missing increase
+of pointer to next unprocessed part.
+
+This is a forward-port of #2233.
+
+Fixes: CVE-2017-7401
+Closes: #2174
+
+CVE: CVE-2017-7401
+
+Upstream-States: Backport
+
+Signed-off-by: Florian Forster <octo@collectd.org>
+
+diff --git a/src/network.c b/src/network.c
+--- a/src/network.c
++++ b/src/network.c
+@@ -1050,14 +1050,6 @@ static int parse_part_sign_sha256(sockent_t *se, /* {{{ */
+   buffer_len = *ret_buffer_len;
+   buffer_offset = 0;
+ 
+-  if (se->data.server.userdb == NULL)
+-  {
+-    c_complain (LOG_NOTICE, &complain_no_users,
+-        "network plugin: Received signed network packet but can't verify it "
+-        "because no user DB has been configured. Will accept it.");
+-    return (0);
+-  }
+-
+   /* Check if the buffer has enough data for this structure. */
+   if (buffer_len <= PART_SIGNATURE_SHA256_SIZE)
+     return (-ENOMEM);
+@@ -1027,6 +1019,17 @@ static int parse_part_sign_sha256(sockent_t *se, /* {{{ */
+     return (-1);
+   }
+ 
++  if (se->data.server.userdb == NULL) {
++    c_complain(LOG_NOTICE, &complain_no_users,
++        "network plugin: Received signed network packet but can't verify it "
++        "because no user DB has been configured. Will accept it.");
++
++    *ret_buffer = buffer + pss_head_length;
++    *ret_buffer_len -= pss_head_length;
++
++    return (0);
++  }
++
+   /* Copy the hash. */
+   BUFFER_READ(pss.hash, sizeof(pss.hash));
+ 
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
index 59732db..e325835 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.5.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0001-collectd-replace-deprecated-readdir_r-with-readdir.patch \
            file://CVE-2016-6254.patch \
            file://0001-fix-to-build-with-glibc-2.25.patch \
+           file://collectd-CVE-2017-7401.patch \
 "
 SRC_URI[md5sum] = "c39305ef5514b44238b0d31f77e29e6a"
 SRC_URI[sha256sum] = "847684cf5c10de1dc34145078af3fcf6e0d168ba98c14f1343b1062a4b569e88"
-- 
1.9.1


