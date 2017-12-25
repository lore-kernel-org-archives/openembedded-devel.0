Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6343160616
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 01:30:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="32572656"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Dec 2017 09:30:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 16633486A799
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Dec 2017 09:30:42 +0800 (CST)
Received: from localhost.localdomain (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 25 Dec 2017 09:30:45 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Dec 2017 18:30:16 +0800
Message-ID: <1514197816-84459-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 16633486A799.A3385
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xrdp: CVE-2017-16927
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
X-List-Received-Date: Mon, 25 Dec 2017 01:30:44 -0000
Content-Type: text/plain

Fix of CVE-2017-16927

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../xrdp/xrdp/0001-Fix-of-CVE-2017-16927.patch     | 148 +++++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb         |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Fix-of-CVE-2017-16927.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-of-CVE-2017-16927.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-of-CVE-2017-16927.patch
new file mode 100644
index 0000000..4c93647
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-of-CVE-2017-16927.patch
@@ -0,0 +1,148 @@
+Subject: [PATCH] Fix CVE-2017-16927
+
+sesman: scpv0, accept variable length data fields
+
+Upstream-Status: Backport 
+
+---
+ sesman/libscp/libscp_v0.c | 32 +++++++++++++++++++++++++-------
+ 1 file changed, 25 insertions(+), 7 deletions(-)
+
+diff --git a/sesman/libscp/libscp_v0.c b/sesman/libscp/libscp_v0.c
+index 5a0c8bf..5693407 100644
+--- a/sesman/libscp/libscp_v0.c
++++ b/sesman/libscp/libscp_v0.c
+@@ -161,7 +161,7 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
+     struct SCP_SESSION *session = 0;
+     tui16 sz;
+     tui32 code = 0;
+-    char buf[257];
++    char *buf = 0;
+ 
+     if (!skipVchk)
+     {
+@@ -226,27 +226,31 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
+ 
+         /* reading username */
+         in_uint16_be(c->in_s, sz);
+-        buf[sz] = '\0';
++        buf = g_new0(char, sz);
+         in_uint8a(c->in_s, buf, sz);
+-
++        buf[sz] = '\0';
+         if (0 != scp_session_set_username(session, buf))
+         {
+             scp_session_destroy(session);
+             log_message(LOG_LEVEL_WARNING, "[v0:%d] connection aborted: error setting username", __LINE__);
++            g_free(buf);
+             return SCP_SERVER_STATE_INTERNAL_ERR;
+         }
++        g_free(buf);
+ 
+         /* reading password */
+         in_uint16_be(c->in_s, sz);
+-        buf[sz] = '\0';
++        buf = g_new0(char, sz);
+         in_uint8a(c->in_s, buf, sz);
+-
++        buf[sz] = '\0';
+         if (0 != scp_session_set_password(session, buf))
+         {
+             scp_session_destroy(session);
+             log_message(LOG_LEVEL_WARNING, "[v0:%d] connection aborted: error setting password", __LINE__);
++            g_free(buf);
+             return SCP_SERVER_STATE_INTERNAL_ERR;
+         }
++        g_free(buf);
+ 
+         /* width */
+         in_uint16_be(c->in_s, sz);
+@@ -272,9 +276,11 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
+ 
+             if (sz > 0)
+             {
++                buf = g_new0(char, sz);
+                 in_uint8a(c->in_s, buf, sz);
+                 buf[sz] = '\0';
+                 scp_session_set_domain(session, buf);
++                g_free(buf);
+             }
+         }
+ 
+@@ -285,9 +291,11 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
+ 
+             if (sz > 0)
+             {
++                buf = g_new0(char, sz);
+                 in_uint8a(c->in_s, buf, sz);
+                 buf[sz] = '\0';
+                 scp_session_set_program(session, buf);
++                g_free(buf);
+             }
+         }
+ 
+@@ -298,9 +306,11 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
+ 
+             if (sz > 0)
+             {
++                buf = g_new0(char, sz);
+                 in_uint8a(c->in_s, buf, sz);
+                 buf[sz] = '\0';
+                 scp_session_set_directory(session, buf);
++                g_free(buf);
+             }
+         }
+ 
+@@ -311,9 +321,11 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
+ 
+             if (sz > 0)
+             {
++                buf = g_new0(char, sz);
+                 in_uint8a(c->in_s, buf, sz);
+                 buf[sz] = '\0';
+                 scp_session_set_client_ip(session, buf);
++                g_free(buf);
+             }
+         }
+     }
+@@ -332,29 +344,35 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
+         scp_session_set_type(session, SCP_GW_AUTHENTICATION);
+         /* reading username */
+         in_uint16_be(c->in_s, sz);
+-        buf[sz] = '\0';
++        buf = g_new0(char, sz);
+         in_uint8a(c->in_s, buf, sz);
++        buf[sz] = '\0';
+ 
+         /* g_writeln("Received user name: %s",buf); */
+         if (0 != scp_session_set_username(session, buf))
+         {
+             scp_session_destroy(session);
+             /* until syslog merge log_message(s_log, LOG_LEVEL_WARNING, "[v0:%d] connection aborted: error setting        username", __LINE__);*/
++            g_free(buf);
+             return SCP_SERVER_STATE_INTERNAL_ERR;
+         }
++        g_free(buf);
+ 
+         /* reading password */
+         in_uint16_be(c->in_s, sz);
+-        buf[sz] = '\0';
++        buf = g_new0(char, sz);
+         in_uint8a(c->in_s, buf, sz);
++        buf[sz] = '\0';
+ 
+         /* g_writeln("Received password: %s",buf); */
+         if (0 != scp_session_set_password(session, buf))
+         {
+             scp_session_destroy(session);
+             /* until syslog merge log_message(s_log, LOG_LEVEL_WARNING, "[v0:%d] connection aborted: error setting password", __LINE__); */
++            g_free(buf);
+             return SCP_SERVER_STATE_INTERNAL_ERR;
+         }
++        g_free(buf);
+     }
+     else
+     {
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
index e7a77e4..ccc8e35 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
            file://0001-Fix-sesman.ini-and-xrdp.ini.patch \
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-Fix-the-compile-error.patch \
+           file://0001-Fix-of-CVE-2017-16927.patch \
            "
 
 SRCREV = "c295dd61b882e8b56677cf12791f43634f9190b5"
-- 
2.7.4




