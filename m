Return-Path: <joe@deserted.net>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5899777F90
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 13:23:48 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id m16so6010823iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=0k9C6snReTAXZOCOLeRdCZ17OSjvIpeN03fJOwdivAg=;
	b=tPubIO9H/OBJmUrxK85kBNtZOxH0np84UM1XD2rJgaG2eJkmDFDjFN95mZ39wpk1bC
	HpXfEy56xT83rmhl2OFXr0B8cun1F6YUkLisKtXEj1+RigYMhm/6huQnWezDdr4eGmAZ
	M7FMVV/ljLORIFCTLOntQZKWXpo2NfcPhpFX1NgAjLA+AbMlsj7IXBtxVBoMUtTVYuLO
	2PPRNaikr0Q8qeKVc/EJv/cmQZPyH9lI21H0f46hx0g7fNS0tZ3CA+Zz3tf6jGEs1URz
	3OezPlc1GRwXhAY6LqNt1HGLfWfKc82kyArpF5S3Z5RJRfrj8WoGQua+KC1yU8gehFL8
	ojoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=0k9C6snReTAXZOCOLeRdCZ17OSjvIpeN03fJOwdivAg=;
	b=hEofQoTeh3EqxDbVXRsfZ/C4oKzVZg8bPdEX/qqjo7TxrUwct286QISu2sxQpw8XvV
	25gbkqw4/GuYF5IwN2ZCUnmVH7IPvDqyUct/vm4FVyyLc6GIeHLGiki8kA9w5KxGUXRl
	6srbSf25Rs87hLn58j6y+tCa3pTpG8Q5M7iJZuMsN1YTFTmY3HuPK/ha71iPjNQ5yYph
	kXPe5PicW7hL2t7jvpPk4BOklEGArNxbLgS/0WE3G/hV82VSx+7WTwEtgDmajYxUfv7g
	EDCFxZe98EEloh3OILVRqsyD/KOPCBhmi6d30z9PK7tsP3HVBKT3G6lQWHJ8KodEJFm9
	5G6A==
X-Gm-Message-State: AMCzsaXqxaYR+chm0/TdI4sYumkhK1eg144X8D32jKArBEzde47tmpwp
	wD1TZbelP4ukASIGQGaDQqB7RDqc
X-Google-Smtp-Source: ABhQp+T/1dJ6SjfGveAYJW4mgH+lzgJT6G9gJMHf9Ms6GewmgqW6ELD6kG8LQkBqK9a6PqDQmsm0/A==
X-Received: by 10.36.4.212 with SMTP id 203mr427965itb.10.1509542629970;
	Wed, 01 Nov 2017 06:23:49 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	d129sm256232ioe.1.2017.11.01.06.23.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 06:23:49 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 09:23:41 -0400
Message-Id: <1509542622-20015-6-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
References: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH v2 5/6] stunnel: fix compile error when openssl disable des support
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
X-List-Received-Date: Wed, 01 Nov 2017 13:23:49 -0000

From: Kai Kang <kai.kang@windriver.com>

When openssl disable des support with configure option 'no-des', it
doesn't provide des related header file and functions. That causes
stunnel compile failed. Fix it by checking macro OPENSSL_NO_DES to use
openssl des related library conditionaly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
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
index efe9d9e..ec8478d 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
@@ -8,7 +8,9 @@ DEPENDS = "openssl zlib tcp-wrappers"
 
 RDEPENDS_${PN} += "perl"
 
-SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
+SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
+           file://fix-openssl-no-des.patch \
+"
 
 SRC_URI[md5sum] = "9079f5fafbccaf88b7d92b227d78249a"
 SRC_URI[sha256sum] = "ffa386ae4c825f35f35157c285e7402a6d58779ad8c3822f74a9d355b54aba1d"
-- 
2.7.4


