Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D3F7C6BC19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 04:45:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,510,1559491200"; d="scan'208";a="75506105"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 12:45:34 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id EEF234CE0C9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:45:14 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 16 Sep 2019 12:45:35 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Sep 2019 12:45:29 +0800
Message-ID: <1568609129-49183-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-yoursite-MailScanner-ID: EEF234CE0C9C.AD670
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xrdp: 0.9.4 -> 0.9.11
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
X-List-Received-Date: Mon, 16 Sep 2019 04:45:54 -0000
Content-Type: text/plain

1) Upgrade xrdp from 0.9.4 to 0.9.11.
2) Remove patch that is included in 0.9.11.
   0001-Fix-of-CVE-2017-16927.patch
3) Remove patch that is not suitable for 0.9.11.
   0001-Fix-sesman.ini-and-xrdp.ini.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../xrdp/0001-Fix-of-CVE-2017-16927.patch     | 148 ------------------
 .../0001-Fix-sesman.ini-and-xrdp.ini.patch    |  75 ---------
 .../xrdp/{xrdp_0.9.4.bb => xrdp_0.9.11.bb}    |  10 +-
 3 files changed, 4 insertions(+), 229 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Fix-of-CVE-2017-16927.patch
 delete mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Fix-sesman.ini-and-xrdp.ini.patch
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.4.bb => xrdp_0.9.11.bb} (91%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-of-CVE-2017-16927.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-of-CVE-2017-16927.patch
deleted file mode 100644
index 4c93647f6..000000000
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-of-CVE-2017-16927.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-Subject: [PATCH] Fix CVE-2017-16927
-
-sesman: scpv0, accept variable length data fields
-
-Upstream-Status: Backport 
-
----
- sesman/libscp/libscp_v0.c | 32 +++++++++++++++++++++++++-------
- 1 file changed, 25 insertions(+), 7 deletions(-)
-
-diff --git a/sesman/libscp/libscp_v0.c b/sesman/libscp/libscp_v0.c
-index 5a0c8bf..5693407 100644
---- a/sesman/libscp/libscp_v0.c
-+++ b/sesman/libscp/libscp_v0.c
-@@ -161,7 +161,7 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
-     struct SCP_SESSION *session = 0;
-     tui16 sz;
-     tui32 code = 0;
--    char buf[257];
-+    char *buf = 0;
- 
-     if (!skipVchk)
-     {
-@@ -226,27 +226,31 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
- 
-         /* reading username */
-         in_uint16_be(c->in_s, sz);
--        buf[sz] = '\0';
-+        buf = g_new0(char, sz);
-         in_uint8a(c->in_s, buf, sz);
--
-+        buf[sz] = '\0';
-         if (0 != scp_session_set_username(session, buf))
-         {
-             scp_session_destroy(session);
-             log_message(LOG_LEVEL_WARNING, "[v0:%d] connection aborted: error setting username", __LINE__);
-+            g_free(buf);
-             return SCP_SERVER_STATE_INTERNAL_ERR;
-         }
-+        g_free(buf);
- 
-         /* reading password */
-         in_uint16_be(c->in_s, sz);
--        buf[sz] = '\0';
-+        buf = g_new0(char, sz);
-         in_uint8a(c->in_s, buf, sz);
--
-+        buf[sz] = '\0';
-         if (0 != scp_session_set_password(session, buf))
-         {
-             scp_session_destroy(session);
-             log_message(LOG_LEVEL_WARNING, "[v0:%d] connection aborted: error setting password", __LINE__);
-+            g_free(buf);
-             return SCP_SERVER_STATE_INTERNAL_ERR;
-         }
-+        g_free(buf);
- 
-         /* width */
-         in_uint16_be(c->in_s, sz);
-@@ -272,9 +276,11 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
- 
-             if (sz > 0)
-             {
-+                buf = g_new0(char, sz);
-                 in_uint8a(c->in_s, buf, sz);
-                 buf[sz] = '\0';
-                 scp_session_set_domain(session, buf);
-+                g_free(buf);
-             }
-         }
- 
-@@ -285,9 +291,11 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
- 
-             if (sz > 0)
-             {
-+                buf = g_new0(char, sz);
-                 in_uint8a(c->in_s, buf, sz);
-                 buf[sz] = '\0';
-                 scp_session_set_program(session, buf);
-+                g_free(buf);
-             }
-         }
- 
-@@ -298,9 +306,11 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
- 
-             if (sz > 0)
-             {
-+                buf = g_new0(char, sz);
-                 in_uint8a(c->in_s, buf, sz);
-                 buf[sz] = '\0';
-                 scp_session_set_directory(session, buf);
-+                g_free(buf);
-             }
-         }
- 
-@@ -311,9 +321,11 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
- 
-             if (sz > 0)
-             {
-+                buf = g_new0(char, sz);
-                 in_uint8a(c->in_s, buf, sz);
-                 buf[sz] = '\0';
-                 scp_session_set_client_ip(session, buf);
-+                g_free(buf);
-             }
-         }
-     }
-@@ -332,29 +344,35 @@ scp_v0s_accept(struct SCP_CONNECTION *c, struct SCP_SESSION **s, int skipVchk)
-         scp_session_set_type(session, SCP_GW_AUTHENTICATION);
-         /* reading username */
-         in_uint16_be(c->in_s, sz);
--        buf[sz] = '\0';
-+        buf = g_new0(char, sz);
-         in_uint8a(c->in_s, buf, sz);
-+        buf[sz] = '\0';
- 
-         /* g_writeln("Received user name: %s",buf); */
-         if (0 != scp_session_set_username(session, buf))
-         {
-             scp_session_destroy(session);
-             /* until syslog merge log_message(s_log, LOG_LEVEL_WARNING, "[v0:%d] connection aborted: error setting        username", __LINE__);*/
-+            g_free(buf);
-             return SCP_SERVER_STATE_INTERNAL_ERR;
-         }
-+        g_free(buf);
- 
-         /* reading password */
-         in_uint16_be(c->in_s, sz);
--        buf[sz] = '\0';
-+        buf = g_new0(char, sz);
-         in_uint8a(c->in_s, buf, sz);
-+        buf[sz] = '\0';
- 
-         /* g_writeln("Received password: %s",buf); */
-         if (0 != scp_session_set_password(session, buf))
-         {
-             scp_session_destroy(session);
-             /* until syslog merge log_message(s_log, LOG_LEVEL_WARNING, "[v0:%d] connection aborted: error setting password", __LINE__); */
-+            g_free(buf);
-             return SCP_SERVER_STATE_INTERNAL_ERR;
-         }
-+        g_free(buf);
-     }
-     else
-     {
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-sesman.ini-and-xrdp.ini.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-sesman.ini-and-xrdp.ini.patch
deleted file mode 100644
index deaadde8c..000000000
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-Fix-sesman.ini-and-xrdp.ini.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From a9c460f158d68c1b3de6a31ce853de5379977695 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Thu, 30 Nov 2017 11:10:04 +0900
-Subject: [PATCH] Fix sesman.ini and xrdp.ini
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
- sesman/sesman.ini | 20 ++++++--------------
- xrdp/xrdp.ini     | 10 ----------
- 2 files changed, 6 insertions(+), 24 deletions(-)
-
-diff --git a/sesman/sesman.ini b/sesman/sesman.ini
-index 8225ee4..c09189e 100644
---- a/sesman/sesman.ini
-+++ b/sesman/sesman.ini
-@@ -54,12 +54,14 @@ LogLevel=DEBUG
- EnableSyslog=1
- SyslogLevel=DEBUG
- 
--[X11rdp]
--param=X11rdp
--param=-bs
-+[Xorg]
-+param=Xorg
-+param=-config
-+param=xrdp/xorg.conf
-+param=-noreset
- param=-nolisten
- param=tcp
--param=-uds
-+
- 
- [Xvnc]
- param=Xvnc
-@@ -70,16 +72,6 @@ param=-localhost
- param=-dpi
- param=96
- 
--[Xorg]
--param=Xorg
--param=-config
--param=xrdp/xorg.conf
--param=-noreset
--param=-nolisten
--param=tcp
--param=-logfile
--param=.xorgxrdp.%s.log
--
- [Chansrv]
- ; drive redirection, defaults to xrdp_client if not set
- FuseMountName=thinclient_drives
-diff --git a/xrdp/xrdp.ini b/xrdp/xrdp.ini
-index cb6d7c3..9f63a69 100644
---- a/xrdp/xrdp.ini
-+++ b/xrdp/xrdp.ini
-@@ -157,16 +157,6 @@ ip=127.0.0.1
- port=-1
- code=20
- 
--[X11rdp]
--name=X11rdp
--lib=libxup.so
--username=ask
--password=ask
--ip=127.0.0.1
--port=-1
--xserverbpp=24
--code=10
--
- [Xvnc]
- name=Xvnc
- lib=libvnc.so
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
similarity index 91%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
index 3ef7c9853..a3986177b 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
@@ -12,15 +12,13 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 SRC_URI = "git://github.com/neutrinolabs/xrdp.git \
            file://xrdp.sysconfig \
-           file://0001-Fix-sesman.ini-and-xrdp.ini.patch \
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-Fix-the-compile-error.patch \
-           file://0001-Fix-of-CVE-2017-16927.patch \
            "
 
-SRCREV = "c295dd61b882e8b56677cf12791f43634f9190b5"
+SRCREV = "1e4b03eb3c9aa7173de251a328c93c073dcc0fca"
 
-PV = "0.9.4+git${SRCPV}"
+PV = "0.9.11+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
@@ -68,9 +66,9 @@ do_install_append() {
 	sed -i -e 's,@sbindir@,${sbindir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
 
 	install -m 0644 ${S}/instfiles/*.ini ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${S}/sesman/sesman.ini ${D}${sysconfdir}/xrdp/
+	install -m 0644 ${S}/sesman/sesman.ini.in ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/sesman/startwm.sh ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${S}/xrdp/xrdp.ini ${D}${sysconfdir}/xrdp/
+	install -m 0644 ${S}/xrdp/xrdp.ini.in ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/xrdp/xrdp_keyboard.ini ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/instfiles/xrdp.sh ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/keygen/openssl.conf ${D}${sysconfdir}/xrdp/
-- 
2.17.1




