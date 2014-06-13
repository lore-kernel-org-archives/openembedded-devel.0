Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0488A6FD24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 06:13:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5D6D3ct013502
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 23:13:03 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 12 Jun 2014 23:13:02 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 14:12:56 +0800
Message-ID: <1402639978-4607-3-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402639978-4607-1-git-send-email-Chong.Lu@windriver.com>
References: <1402639978-4607-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] samba: fix two CVEs CVE-2013-0213 CVE-2013-0214
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jun 2014 06:13:05 -0000
Content-Type: text/plain

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch |  160 ++++++++++++++++++++
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |    1 +
 2 files changed, 161 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/samba/samba/samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch

diff --git a/meta-oe/recipes-connectivity/samba/samba/samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch
new file mode 100644
index 0000000..cccb341
--- /dev/null
+++ b/meta-oe/recipes-connectivity/samba/samba/samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch
@@ -0,0 +1,160 @@
+Upstream-Status: Backport
+
+From 71225948a249f079120282740fcc39fd6faa880e Mon Sep 17 00:00:00 2001
+From: Kai Blin <kai@samba.org>
+Date: Fri, 18 Jan 2013 23:11:07 +0100
+Subject: [PATCH 1/2] swat: Use X-Frame-Options header to avoid clickjacking
+
+Jann Horn reported a potential clickjacking vulnerability in SWAT where
+the SWAT page could be embedded into an attacker's page using a frame or
+iframe and then used to trick the user to change Samba settings.
+
+Avoid this by telling the browser to refuse the frame embedding via the
+X-Frame-Options: DENY header.
+
+Signed-off-by: Kai Blin <kai@samba.org>
+
+Fix bug #9576 - CVE-2013-0213: Clickjacking issue in SWAT.
+---
+ source3/web/swat.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/source3/web/swat.c b/source3/web/swat.c
+index 1f6eb6c..ed80c38 100644
+--- a/source3/web/swat.c
++++ b/source3/web/swat.c
+@@ -266,7 +266,8 @@ static void print_header(void)
+ 	if (!cgi_waspost()) {
+ 		printf("Expires: 0\r\n");
+ 	}
+-	printf("Content-type: text/html\r\n\r\n");
++	printf("Content-type: text/html\r\n");
++	printf("X-Frame-Options: DENY\r\n\r\n");
+ 
+ 	if (!include_html("include/header.html")) {
+ 		printf("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 3.2//EN\">\n");
+-- 
+1.7.7
+
+
+From 91f4275873ebeda8f57684f09df67162ae80515a Mon Sep 17 00:00:00 2001
+From: Kai Blin <kai@samba.org>
+Date: Mon, 28 Jan 2013 21:41:07 +0100
+Subject: [PATCH 2/2] swat: Use additional nonce on XSRF protection
+
+If the user had a weak password on the root account of a machine running
+SWAT, there still was a chance of being targetted by an XSRF on a
+malicious web site targetting the SWAT setup.
+
+Use a random nonce stored in secrets.tdb to close this possible attack
+window. Thanks to Jann Horn for reporting this issue.
+
+Signed-off-by: Kai Blin <kai@samba.org>
+
+Fix bug #9577: CVE-2013-0214: Potential XSRF in SWAT.
+---
+ source3/web/cgi.c        |   40 ++++++++++++++++++++++++++--------------
+ source3/web/swat.c       |    2 ++
+ source3/web/swat_proto.h |    1 +
+ 3 files changed, 29 insertions(+), 14 deletions(-)
+
+diff --git a/source3/web/cgi.c b/source3/web/cgi.c
+index ef1b856..861bc84 100644
+--- a/source3/web/cgi.c
++++ b/source3/web/cgi.c
+@@ -48,6 +48,7 @@ static const char *baseurl;
+ static char *pathinfo;
+ static char *C_user;
+ static char *C_pass;
++static char *C_nonce;
+ static bool inetd_server;
+ static bool got_request;
+ 
+@@ -329,20 +330,7 @@ static void cgi_web_auth(void)
+ 	C_user = SMB_STRDUP(user);
+ 
+ 	if (!setuid(0)) {
+-		C_pass = secrets_fetch_generic("root", "SWAT");
+-		if (C_pass == NULL) {
+-			char *tmp_pass = NULL;
+-			tmp_pass = generate_random_password(talloc_tos(),
+-							    16, 16);
+-			if (tmp_pass == NULL) {
+-				printf("%sFailed to create random nonce for "
+-				       "SWAT session\n<br>%s\n", head, tail);
+-				exit(0);
+-			}
+-			secrets_store_generic("root", "SWAT", tmp_pass);
+-			C_pass = SMB_STRDUP(tmp_pass);
+-			TALLOC_FREE(tmp_pass);
+-		}
++		C_pass = SMB_STRDUP(cgi_nonce());
+ 	}
+ 	setuid(pwd->pw_uid);
+ 	if (geteuid() != pwd->pw_uid || getuid() != pwd->pw_uid) {
+@@ -459,6 +447,30 @@ char *cgi_user_pass(void)
+ }
+ 
+ /***************************************************************************
++return a ptr to the nonce
++  ***************************************************************************/
++char *cgi_nonce(void)
++{
++	const char *head = "Content-Type: text/html\r\n\r\n<HTML><BODY><H1>SWAT installation Error</H1>\n";
++	const char *tail = "</BODY></HTML>\r\n";
++	C_nonce = secrets_fetch_generic("root", "SWAT");
++	if (C_nonce == NULL) {
++		char *tmp_pass = NULL;
++		tmp_pass = generate_random_password(talloc_tos(),
++						    16, 16);
++		if (tmp_pass == NULL) {
++			printf("%sFailed to create random nonce for "
++			       "SWAT session\n<br>%s\n", head, tail);
++			exit(0);
++		}
++		secrets_store_generic("root", "SWAT", tmp_pass);
++		C_nonce = SMB_STRDUP(tmp_pass);
++		TALLOC_FREE(tmp_pass);
++	}
++        return(C_nonce);
++}
++
++/***************************************************************************
+ handle a file download
+   ***************************************************************************/
+ static void cgi_download(char *file)
+diff --git a/source3/web/swat.c b/source3/web/swat.c
+index ed80c38..f8933d2 100644
+--- a/source3/web/swat.c
++++ b/source3/web/swat.c
+@@ -154,6 +154,7 @@ void get_xsrf_token(const char *username, const char *pass,
+ 	MD5_CTX md5_ctx;
+ 	uint8_t token[16];
+ 	int i;
++	char *nonce = cgi_nonce();
+ 
+ 	token_str[0] = '\0';
+ 	ZERO_STRUCT(md5_ctx);
+@@ -167,6 +168,7 @@ void get_xsrf_token(const char *username, const char *pass,
+ 	if (pass != NULL) {
+ 		MD5Update(&md5_ctx, (uint8_t *)pass, strlen(pass));
+ 	}
++	MD5Update(&md5_ctx, (uint8_t *)nonce, strlen(nonce));
+ 
+ 	MD5Final(token, &md5_ctx);
+ 
+diff --git a/source3/web/swat_proto.h b/source3/web/swat_proto.h
+index 424a3af..fe51b1f 100644
+--- a/source3/web/swat_proto.h
++++ b/source3/web/swat_proto.h
+@@ -32,6 +32,7 @@ const char *cgi_variable_nonull(const char *name);
+ bool am_root(void);
+ char *cgi_user_name(void);
+ char *cgi_user_pass(void);
++char *cgi_nonce(void);
+ void cgi_setup(const char *rootdir, int auth_required);
+ const char *cgi_baseurl(void);
+ const char *cgi_pathinfo(void);
+-- 
+1.7.7
+
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index c3e834d..a5e7dcd 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -32,6 +32,7 @@ SRC_URI += "\
     file://configure-libunwind.patch;patchdir=.. \
     file://samba-3.6.22-CVE-2013-4496.patch;patchdir=.. \
     file://0001-PIDL-fix-parsing-linemarkers-in-preprocessor-output.patch;patchdir=.. \
+    file://samba-3.6.11-CVE-2013-0213-CVE-2013-0214.patch;patchdir=.. \
 "
 SRC_URI[md5sum] = "fbb245863eeef2fffe172df779a217be"
 SRC_URI[sha256sum] = "4f5a171a8d902c6b4f822ed875c51eb8339196d9ccf0ecd7f6521c966b3514de"
-- 
1.7.9.5


