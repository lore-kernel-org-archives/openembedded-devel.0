Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9FF77B27
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:19:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v658JVte016693
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:19:31 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 5 Jul 2017 01:19:30 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jul 2017 16:11:31 +0800
Message-ID: <20170705081133.6496-9-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170705081133.6496-1-kai.kang@windriver.com>
References: <20170705081133.6496-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 08/10] stunnel: fix compile error when openssl disable des support
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
X-List-Received-Date: Wed, 05 Jul 2017 08:19:29 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When openssl disable des support with configure option 'no-des', it
doesn't provide des related header file and functions. That causes
stunnel compile failed. Fix it by checking macro OPENSSL_NO_DES to use
openssl des related library conditionaly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch       | 54 ++++++++++++++++++++++
 .../recipes-support/stunnel/stunnel_5.35.bb        |  4 +-
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
new file mode 100644
index 0000000..209b0dd
--- /dev/null
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Pending
+
+When openssl disable des support with configure option 'no-des', it doesn't
+provide des related header file and functions. That causes stunnel compile
+failed. Fix it by checking macro OPENSSL_NO_DES to use openssl des related
+library conditionaly.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/src/common.h b/src/common.h
+index f7d38b0..bf485af 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -471,7 +471,9 @@ extern char *sys_errlist[];
+ #ifndef OPENSSL_NO_MD4
+ #include <openssl/md4.h>
+ #endif /* !defined(OPENSSL_NO_MD4) */
++#ifndef OPENSSL_NO_DES
+ #include <openssl/des.h>
++#endif
+ #ifndef OPENSSL_NO_DH
+ #include <openssl/dh.h>
+ #if OPENSSL_VERSION_NUMBER<0x10100000L
+diff --git a/src/protocol.c b/src/protocol.c
+index 587df09..8198eb6 100644
+--- a/src/protocol.c
++++ b/src/protocol.c
+@@ -66,7 +66,7 @@ NOEXPORT char *imap_server(CLI *, SERVICE_OPTIONS *, const PHASE);
+ NOEXPORT char *nntp_client(CLI *, SERVICE_OPTIONS *, const PHASE);
+ NOEXPORT char *connect_server(CLI *, SERVICE_OPTIONS *, const PHASE);
+ NOEXPORT char *connect_client(CLI *, SERVICE_OPTIONS *, const PHASE);
+-#ifndef OPENSSL_NO_MD4
++#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
+ NOEXPORT void ntlm(CLI *, SERVICE_OPTIONS *);
+ NOEXPORT char *ntlm1();
+ NOEXPORT char *ntlm3(char *, char *, char *, char *);
+@@ -1175,7 +1175,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+     fd_printf(c, c->remote_fd.fd, "Host: %s", opt->protocol_host);
+     if(opt->protocol_username && opt->protocol_password) {
+         if(!strcasecmp(opt->protocol_authentication, "ntlm")) {
+-#ifndef OPENSSL_NO_MD4
++#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
+             ntlm(c, opt);
+ #else
+             s_log(LOG_ERR, "NTLM authentication is not available");
+@@ -1216,7 +1216,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+     return NULL;
+ }
+ 
+-#ifndef OPENSSL_NO_MD4
++#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
+ 
+ /*
+  * NTLM code is based on the following documentation:
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
index 3e2e2c2..33eedf1 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
@@ -7,7 +7,9 @@ DEPENDS = "openssl zlib tcp-wrappers"
 
 RDEPENDS_${PN} += "perl"
 
-SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
+SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
+           file://fix-openssl-no-des.patch \
+"
 
 SRC_URI[md5sum] = "9079f5fafbccaf88b7d92b227d78249a"
 SRC_URI[sha256sum] = "ffa386ae4c825f35f35157c285e7402a6d58779ad8c3822f74a9d355b54aba1d"
-- 
2.10.1


