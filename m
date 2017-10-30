Return-Path: <joe@deserted.net>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id D850271C56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 18:11:21 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id h70so29222267ioi.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=0k9C6snReTAXZOCOLeRdCZ17OSjvIpeN03fJOwdivAg=;
	b=2FxnJ3WklUwQ6yzHj0X3p/pxIRFKH6jc4UbxhXfOCrZXysgnNK4d4/7MS8tL13Ec32
	+PyCKE1ZJZwr9ukDF3bk4OiBJkmUYOG2G7Yp1NoVTldU5spp5MdPK0H8SiKR9F/1CqZj
	OCtVDcKYMh+1SJR+Kcwl72gZXxnP7AXyMbk1bbhAFsqa6/yWFe9eHUM+JpZZwKquvbuF
	kijJkn+0z0kNI0ho1sTLW80VEeSmn7lXPOP2pRbUXYqSkMUWaHG+8BI0Q04Th00yLe+n
	p0XA/AHbcID2bgtODkDMK8iBJiOprgjpnVW0fumUXZBawWe6Y5WUDbYqkuXxRL3N0i39
	9vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=0k9C6snReTAXZOCOLeRdCZ17OSjvIpeN03fJOwdivAg=;
	b=HFEzreYrtmt4iFT/hIjWY9uDYxjwRhHAQ5J6DWytA1TvMtG9fo2e4RSTT1M3l24+Ru
	XlNIeBT6ewrJV0E2nHJjzDVKHRfAiqwdZ+ymKweyGh2SkDtnDO06qjxDqtQzW+oDaoeo
	vjIWNlfPc4Usf+S8+zNH3DY7cZdp33G+Au/y5PBWJrdC1okp+jO/K5E5DCeY+Sj0jZJ3
	ass6403jC+96jZWRt8XCQmCqVvyGLEXlTzEaO3BzSNV6I6PR/MyoywSzNSjnbNzvOTHv
	tDHVG+9RgipztmCgL44iHZhUMq8iVPD7VxTF5g2MVktCA7PyIgtsWQ5Fdm+lcazeVDpO
	WQ/w==
X-Gm-Message-State: AMCzsaWMepxtv1qGIJWx+BNXsF6bS0xc8hiOV3RVB7LEKnLu66d5uyoB
	qun3ECN9TxloHkfrRSnfKxfwEqFE
X-Google-Smtp-Source: ABhQp+R0JlvvGyWbKsButK/GzocK+7FFU+qWzBspt1vB2XBiZyA4ZQ+ggdW7sSPNMz0IXEv79lhByw==
X-Received: by 10.36.46.131 with SMTP id i125mr6881254ita.99.1509387082522;
	Mon, 30 Oct 2017 11:11:22 -0700 (PDT)
Received: from mir.deserted.net (23-233-29-148.cpe.pppoe.ca. [23.233.29.148])
	by smtp.gmail.com with ESMTPSA id
	81sm2182416itl.20.2017.10.30.11.11.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Oct 2017 11:11:21 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Oct 2017 14:11:12 -0400
Message-Id: <1509387073-21934-6-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 5/6] stunnel: fix compile error when openssl disable des support
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
X-List-Received-Date: Mon, 30 Oct 2017 18:11:22 -0000

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


