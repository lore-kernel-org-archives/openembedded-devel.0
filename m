Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7B91678889
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:09 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id y26so1447765pfi.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6c0QlxqcvaAotbLycaLZeVcozB/t9AwXb+Ck8OwgE6o=;
	b=bOGJA6cnCtRprelPJu/cit4MAE5t8ixpdNA8nCLhaJJd+k9od6n/e/+cecRBfujJVq
	TtaxozhXY92XKbj+vr5YIXFEquEhdYTOLpKhXvwOGExFmO/BPBSAw++6tHx8iRSd4ZMT
	6OxAl9TUazut1DTZ9JFrj+RMthLsHlaIKxkQ/lpwMK+kZ2G2LBg/CrjJUvzKy5W+qWmn
	4IFFiW85UFwciRKO4EtHEcC0lR6u0QNugfZPEbJ8QluUQs/79kmd9BFcuBzztkOb4zCh
	iRt9Er+tCKOwXsTfjXBn5wO7sU745PBuBM4X8wWD/PggLA6yjFPTTHAJOcRXWiidmnAl
	6wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6c0QlxqcvaAotbLycaLZeVcozB/t9AwXb+Ck8OwgE6o=;
	b=QoqevzBNG43NqhdyW5MU8mEe/kNgqcnBMnJjbJvcJ1JvRyV19gTKPPf+jgPAJmHXjH
	qlqvhbgNhW8R2KmM9Av5ZmtAGLcvKu8GjRt1s0GKBq7qJAg2YWjQI67CEhSq+KE+zUrm
	ZkcvlykW2btgObd/1Js5qO2khmmYnJRA8PMFUs7sFDp538KKfLttYziAIGY3zWcpIb12
	MERCWvCouYPF0wjhcLKnO6I7jtoG6cv8RIV62U+EcTiURpIMNMZrBx77/2c1doxYnMcG
	fLLHiMAI3/Nn4T8jR6mbIDtTbwdBAM+RRJNfyW14ADRGLXoysPpVhpbsVX7QgSFN4UcK
	JWGQ==
X-Gm-Message-State: AKwxytdhDU31RgBpUDvRvu3F8/LQi2VmDhFjwhTrxcRvfXTOc5tfyAgd
	ynv++XLki4qKVA4zjucNRus=
X-Google-Smtp-Source: AH8x2276faw7vilcknXMk0YZuK800Rp1iqXn3PoqMtT0MDHU1jiEHvA0f4APXDOivRT6bxMleT3fSQ==
X-Received: by 10.98.166.195 with SMTP id r64mr20750960pfl.175.1517023510640; 
	Fri, 26 Jan 2018 19:25:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:33 -0800
Message-Id: <c65e16cd8e13985dda982f4286510d6a065c8a8e.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 33/36] stunnel: fix compile error when openssl disable des support
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:09 -0000

From: Kai Kang <kai.kang@windriver.com>

When openssl disable des support with configure option 'no-des', it
doesn't provide des related header file and functions. That causes
stunnel compile failed. Fix it by checking macro OPENSSL_NO_DES to use
openssl des related library conditionaly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit f9a1fe6ab2dfb6a53e58fc8da3a1580e76954e5e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


