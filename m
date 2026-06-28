Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D3DC43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14743.1782634345634031232
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kcLwWQlW;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30c6874d295so1451838eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634345; x=1783239145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzNglTzCQRsvXLE+vufWaYy9WGL0FssCMoyzgieD3lo=;
        b=kcLwWQlWcBEaOfT/PlRBJ4PHVoS4JP+gxoADHv2D2Sqa8YU86xQAHFnEXYbpdye8B8
         B2BQ6OKtEpSa1SjOSYiQkMIuNYHk/Cy2IMroCI4zIgJp2dY+KRTXbZRXHojIlQuqYjB6
         N8DSwFA6Cwm3/FUIjuXQCsZ47jEfl04pObjqE60pWPBg7J0Ab93QkVeQP5hE3y28aSSY
         IAAKJFkesuQ9nfcNqRodEY4XOhefkSfkwkYtmpjThbzXPk83FNqx3+HCJsJxlWV90QKA
         veDdndFZJzoUbeSJvu8pdun+ieCbh53lrfgyhtL4oRbQTAvbVDqJRLiU2wbw4cwfGwEr
         BWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634345; x=1783239145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FzNglTzCQRsvXLE+vufWaYy9WGL0FssCMoyzgieD3lo=;
        b=rNSrckXiQit3mucLRVJOa3WQ+h4AlxwoGko/wgVHNV5XFS9v0ao6wNQpahMO1/M2IH
         5XCw3a0yniBjAThUgOLBMKU+eua8ccoWlTJ8F5IKk3/L47gRCA6WmQWDOsJHZH3X/uKq
         LkQkr/fSgxmLoYAQgtcDOmOa+OAb8ZIhKAElG9wedmzR+VpXczSS7Fr7CxVYdOVIbL/x
         JgKh5zsV1VFzrMsU7hcP4c+mzObmSDRwdwdIK6U01mhgrZoM23CKpdicEwwpc3EZVDwA
         pklG8hv8F8mfyOeB3Jv0q/wKqQkE7tYwMcSKIdN1kGCrnRpFUHSX8r+z6OX09xiC4/Z1
         A1lw==
X-Gm-Message-State: AOJu0YynrBhTjpn+JMZlqeQq+MXa2Fkmo7GZKbs+NM1aeQModxzz3BA+
	nhy4hAGi3fourxwz+veEtr0oenyUEhp4h6GKIE+okNFKVYeZ/ag90ePdia1ufemkp3rL1A==
X-Gm-Gg: AfdE7cmruzI4TGu5m6CmeQJtkWN4e/i1VDj2v0FufJIutvWtC365UENURv/MB+P7zji
	7bA1depEdOv4HWFCb45piIpf5jOhykEwCS6r2kLsXfjLsuO3RF0Aw86ZtdNAywbmTKCmR/cS3R/
	we6cGYOJi9lDUsC/zezxlmMbsvmWGU4YA79P3dWwlUQN4bK5Ze/n6a5U3zoWBtoGrwHvfleE9I7
	PbOu0910OKzKpi7o5y+6On0lT+g4qJHNYUl4ni1gHTbiiYQA1bPZdBpplV06FGYpWcgCd2CvAOq
	ShAw7rPiulIp7wvWGFqT1VHSVpciQi5h931tMIeLOSko9rcpA1r6vbjeN9Pfuvm9KX/8yzZEUHr
	XTtBM7WA/KbtpkLQ6yJO7vgfpf/nxVGeSgSQsuPAzFd6c0gSp1VA+DXcctCAxLE/ZIUEQLFysF5
	bsPV+bLurGbOEb74hJaJ5iXalBJbEQMkNMf3GAavXOkfzK6heoMoMZUBddOZmFo08BCzxMnSn7l
	QNbDWeKPlPYBQRC2P3N1FD6+SqohUs6BjuWSaqT9sT42TtgotLr/qLdrDBrzmiE18ICkoImj3mT
	wwr6uGvtO8NnoJeVU0eRXEyq/WP7QA==
X-Received: by 2002:a05:693c:639c:20b0:30c:829a:f67c with SMTP id 5a478bee46e88-30c829af7admr7710312eec.3.1782634344398;
        Sun, 28 Jun 2026 01:12:24 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 064/128] xmlsec1: upgrade 1.3.9 -> 1.3.11
Date: Sun, 28 Jun 2026 01:10:15 -0700
Message-ID: <20260628081122.178348-64-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127874

Refresh the remaining patches and drop the ones now upstreamed. libxml2
2.15 removed the tree-debug module (LIBXML_DEBUG_ENABLED off), so guard
the xmlDebugDumpDocument() call that otherwise fails to compile the
transform-helpers unit test.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../xmlsec1/0003-xmlsec1-add-new-recipe.patch |   48 +-
 ...examples-allow-build-in-separate-dir.patch |   29 -
 ...Fix-LibXML2-deprecation-warnings-and.patch | 1190 -----------------
 ...xmlDebugDumpDocument-with-LIBXML_DEB.patch |   26 +
 .../{xmlsec1_1.3.9.bb => xmlsec1_1.3.11.bb}   |    5 +-
 5 files changed, 57 insertions(+), 1241 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0004-examples-allow-build-in-separate-dir.patch
 delete mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch
 create mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.9.bb => xmlsec1_1.3.11.bb} (91%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch
index 1b50e2ed0e..9a0752dec0 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0003-xmlsec1-add-new-recipe.patch
@@ -6,34 +6,44 @@ Subject: [PATCH] xmlsec1: add new recipe
 This enables the building of the examples directory
 and it's installed as ptest.
 
+Also allow the examples to be built from a separate build directory
+by honoring top_srcdir/top_builddir so that the include and library
+paths point at the cross build tree instead of the host.
+
 Upstream-Status: Inappropriate [ OE ptest specific ]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- examples/Makefile | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
 
+Refreshed for xmlsec1 1.3.11 (examples/Makefile rewritten upstream).
+---
 diff --git a/examples/Makefile b/examples/Makefile
-index c6a25f09..3da1cb33 100644
+index dfba58e..f6f4d51 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
-@@ -12,9 +12,17 @@ PROGRAMS = \
- 	$(PROGRAMS_DEC) \
- 	xmldsigverify
- 
-+ifndef CC
- CC	= gcc
--CFLAGS	+= -g $(shell xmlsec1-config --cflags) -DUNIX_SOCKETS -Wall -Wextra
--LDLIBS	+= -g $(shell xmlsec1-config --libs)
-+endif
-+
-+CFLAGS  += -I../include -g $(shell PKG_CONFIG_PATH=.. pkg-config --cflags xmlsec1 ) -DUNIX_SOCKETS -Wall -Wextra
-+LDLIBS  += -L../src/.libs -g $(shell PKG_CONFIG_PATH=.. pkg-config --libs xmlsec1 )
+@@ -12,6 +12,12 @@ PROGRAMS = \
+ 	$(PROGRAMS_DEC)
+
+ # try to find pkg-config, if available
++# OE: allow building from a separate build dir against the cross build tree
++top_srcdir ?= ..
++top_builddir ?= ..
++CFLAGS += -I$(top_srcdir)/include
++LDLIBS += -L$(top_builddir)/src/.libs
 +
+ XMLSEC_PKG_CONFIG = "xmlsec1"
+ PKG_CONFIG := $(shell command -v pkg-config 2> /dev/null)
+ XMLSEC_CHECK := $(shell $(PKG_CONFIG) --exists $(XMLSEC_PKG_CONFIG) 2> /dev/null && echo "found")
+@@ -40,6 +46,11 @@ endif
+ # rules
+ all: $(PROGRAMS)
+
 +DESTDIR = /usr/share/xmlsec1
 +install-ptest:
 +	if [ ! -d $(DESTDIR) ]; then mkdir -p $(DESTDIR); fi
 +	cp * $(DESTDIR)
- 
- all: $(PROGRAMS)
- 
++
+ clean:
+ 	rm -rf $(PROGRAMS)
+
+--
+2.34.1
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0004-examples-allow-build-in-separate-dir.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0004-examples-allow-build-in-separate-dir.patch
deleted file mode 100644
index d7188083b3..0000000000
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0004-examples-allow-build-in-separate-dir.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From fab6503dca2046d32fa186c33c566c58110334a5 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Tue, 30 Dec 2014 11:18:17 +0800
-Subject: [PATCH] examples: allow build in separate dir
-
-Upstream-Status: Inappropriate [ OE specific ]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- examples/Makefile | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/examples/Makefile b/examples/Makefile
-index 3da1cb33..ff44cb7b 100644
---- a/examples/Makefile
-+++ b/examples/Makefile
-@@ -16,8 +16,10 @@ ifndef CC
- CC	= gcc
- endif
- 
--CFLAGS  += -I../include -g $(shell PKG_CONFIG_PATH=.. pkg-config --cflags xmlsec1 ) -DUNIX_SOCKETS -Wall -Wextra
--LDLIBS  += -L../src/.libs -g $(shell PKG_CONFIG_PATH=.. pkg-config --libs xmlsec1 )
-+top_srcdir = ..
-+top_builddir = ..
-+CFLAGS  += -I$(top_srcdir)/include -g $(shell PKG_CONFIG_PATH=$(top_srcdir) pkg-config --cflags xmlsec1 ) -DUNIX_SOCKETS -Wall -Wextra
-+LDLIBS += -L$(top_builddir)/src/.libs -g $(shell PKG_CONFIG_PATH=$(top_srcdir) pkg-config --libs xmlsec1 )
- 
- DESTDIR = /usr/share/xmlsec1
- install-ptest:
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch
deleted file mode 100644
index 156c7d8402..0000000000
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch
+++ /dev/null
@@ -1,1190 +0,0 @@
-From b68f4aa1d450b1a940dd950e1e5eadc2c91ac82f Mon Sep 17 00:00:00 2001
-From: lsh123 <aleksey@aleksey.com>
-Date: Sat, 15 Nov 2025 09:38:02 -0800
-Subject: [PATCH] (xmlsec-examples) Fix LibXML2 deprecation warnings and update
- README to show key name use (#990)
-
-See https://github.com/lsh123/xmlsec/issues/989
-
-Upstream-Status: Backport
-(cherry picked from commit f15b6dcb5276facfbdbcd8dfe1f23026aa079e7a)
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- docs/xmldsig-verifier.html                    |   5 +-
- examples/Makefile                             |   3 +-
- examples/README.md                            |  40 +-
- examples/decrypt1.c                           |   4 +-
- examples/decrypt2.c                           |   4 +-
- examples/decrypt3.c                           |   4 +-
- examples/encrypt1-tmpl.xml                    |   8 +-
- examples/encrypt1.c                           |   4 +-
- examples/encrypt2.c                           |   4 +-
- examples/encrypt3-res.xml                     |   8 +-
- examples/encrypt3.c                           |   7 +-
- examples/sign1-tmpl.xml                       |   6 +-
- examples/sign1.c                              |   4 +-
- examples/sign2.c                              |   4 +-
- examples/sign3.c                              |   4 +-
- examples/sign4.c                              |   4 +-
- examples/verify-saml.c                        |   4 +-
- examples/verify1.c                            |   4 +-
- examples/verify2.c                            |   4 +-
- examples/verify3.c                            |   2 -
- examples/verify4.c                            |   2 -
- examples/xmldsigverify.c                      | 379 ------------------
- .../aleksey-xmldsig-01/enveloped-gost2001.xml |   3 -
- .../enveloped-x509-digest-sha1.tmpl           |   3 -
- .../enveloped-x509-digest-sha1.xml            |   3 -
- .../enveloped-x509-digest-sha224.tmpl         |   3 -
- .../enveloped-x509-digest-sha224.xml          |   3 -
- .../enveloped-x509-digest-sha256.tmpl         |   3 -
- .../enveloped-x509-digest-sha256.xml          |   3 -
- .../enveloped-x509-digest-sha384.tmpl         |   3 -
- .../enveloped-x509-digest-sha384.xml          |   3 -
- .../enveloped-x509-digest-sha512.tmpl         |   3 -
- .../enveloped-x509-digest-sha512.xml          |   3 -
- .../enveloped-x509-issuerserial.tmpl          |   3 -
- .../enveloped-x509-issuerserial.xml           |   3 -
- .../enveloped-x509-missing-cert.tmpl          |   3 -
- .../enveloped-x509-missing-cert.xml           |   3 -
- .../enveloped-x509-same-subj-cert.tmpl        |   3 -
- .../enveloped-x509-ski.tmpl                   |   3 -
- .../aleksey-xmldsig-01/enveloped-x509-ski.xml |   3 -
- .../enveloped-x509-subjectname.tmpl           |   3 -
- .../enveloped-x509-subjectname.xml            |   3 -
- 43 files changed, 46 insertions(+), 525 deletions(-)
- delete mode 100644 examples/xmldsigverify.c
-
-diff --git a/docs/xmldsig-verifier.html b/docs/xmldsig-verifier.html
-index befd21a6..c8381e98 100644
---- a/docs/xmldsig-verifier.html
-+++ b/docs/xmldsig-verifier.html
-@@ -47,11 +47,8 @@
- <div align="center">
-         <h1>Online XML Digital Signature Verifer is retired as of October, 2022</h1>
-     </div>
--<p>If you are interested in verifying an XML Digital Signature, then you should consider using
-+    <p>If you are interested in verifying an XML Digital Signature, then you should consider using
-     <a href="xmlsec-man.html">the xmlsec command line tool</a>.
--    The source code for the Online XML Digital Signature Verifer is available on
--    <a href="https://github.com/lsh123/xmlsec/blob/master/examples/xmldsigverify.c">GitHub</a> and in the "examples/"
--    folder of the source tarfile.
-     </p>
- </td></tr></table></td>
- </tr></table></body>
-diff --git a/examples/Makefile b/examples/Makefile
-index ff44cb7b..945f3dab 100644
---- a/examples/Makefile
-+++ b/examples/Makefile
-@@ -9,8 +9,7 @@ PROGRAMS = \
- 	$(PROGRAMS_SIGN) \
- 	$(PROGRAMS_VERIFY) \
- 	$(PROGRAMS_ENC) \
--	$(PROGRAMS_DEC) \
--	xmldsigverify
-+	$(PROGRAMS_DEC)
- 
- ifndef CC
- CC	= gcc
-diff --git a/examples/README.md b/examples/README.md
-index f07a07cb..acf39c31 100644
---- a/examples/README.md
-+++ b/examples/README.md
-@@ -35,9 +35,10 @@ To run this example:
- ./sign1 sign1-tmpl.xml rsakey.pem
- ```
- 
--To sign a template file with `xmlsec1` command line utility (use `xmlsec` on Windows):
-+To sign a template file with `xmlsec1` command line utility (use `xmlsec` on Windows).
-+Note that in this example we set KeyName to be the same as the filename of the private key:
- ```
--xmlsec1 sign --privkey rsakey.pem --output sign1.xml sign1-tmpl.xml
-+xmlsec1 sign --privkey:rsakey.pem rsakey.pem --output sign1.xml sign1-tmpl.xml
- ```
- 
- ### sign2: signing a file with a dynamicaly created template
-@@ -108,10 +109,11 @@ To run this example:
- ./verify2 sign2-res.xml rsapub.pem
- ```
- 
--To verify a signed document with `xmlsec1` command line utility (use `xmlsec` on Windows):
-+To verify a signed document with `xmlsec1` command line utility (use `xmlsec` on Windows).
-+Note that in this example we set KeyName to be the same as the filename of the private key:
- ```
--xmlsec1 verify --pubkey rsapub.pem sign1-res.xml
--xmlsec1 verify --pubkey rsapub.pem sign2-res.xml
-+xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign1-res.xml
-+xmlsec1 verify --pubkey:rsakey.pem rsapub.pem sign2-res.xml
- ```
- 
- ### verify3: verifying an enveloped signature using X509 certificate
-@@ -185,9 +187,10 @@ To run this example:
- ```
- 
- To encrypt binary data with a template file with `xmlsec1` command line
--utility (use `xmlsec` on Windows):
-+utility (use `xmlsec` on Windows). Note that in this example we set KeyName to be
-+the same as the filename of the key:
- ```
--xmlsec1 encrypt --deskey deskey.bin  --binary-data binary.dat --output encrypt1.xml encrypt1-tmpl.xml
-+xmlsec1 encrypt --deskey:deskey.bin deskey.bin  --binary-data binary.dat --output encrypt1.xml encrypt1-tmpl.xml
- ```
- 
- ### encrypt2: encrypting XML file using a dynamicaly created template
-@@ -213,7 +216,8 @@ encrypt3-doc.xml    An example XML file for encryption by encrypt3.c
- encrypt3-res.xml    The result of encryptin encrypt3-doc.xml by encrypt3.c
- ```
- 
--To run this example:
-+To run this example (note: we are using the private key here instead of the public
-+key to make decrypt3 example work)):
- ```
- ./encrypt3 encrypt3-doc.xml rsakey.pem
- ```
-@@ -244,11 +248,13 @@ To run this example:
- ./decrypt2 encrypt2-res.xml deskey.bin
- ```
- 
--To decrypt binary data with `xmlsec1` command line utility (use `xmlsec` on Windows):
-+To decrypt binary data with `xmlsec1` command line utility (use `xmlsec` on Windows).
-+Note that in this example we set KeyName to be the same as the filename of the
-+(private) key:
- ```
--xmlsec1 decrypt --deskey deskey.bin encrypt1-res.xml
--xmlsec1 decrypt --deskey deskey.bin encrypt2-res.xml
--xmlsec1 decrypt --privkey rsakey.pem encrypt3-res.xml
-+xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt1-res.xml
-+xmlsec1 decrypt --deskey:deskey.bin deskey.bin encrypt2-res.xml
-+xmlsec1 decrypt --privkey:rsakey.pem rsakey.pem encrypt3-res.xml
- ```
- 
- ### decrypt3: decrypting binary file using custom keys manager
-@@ -265,16 +271,6 @@ To run this example:
- ./decrypt3 encrypt3-res.xml
- ```
- 
--### xmldsigverify: CGI script for signatures verifications
--
--Files:
--```
--xmldsigverify.c     The source code
--```
--
--To run this example, install compiled xmldsigverify script into
--your web server cgi-bin directory.
--
- ### Keys and certificates
- ```
- cacert.pem          Root (trusted) certificate
-diff --git a/examples/decrypt1.c b/examples/decrypt1.c
-index e069bd7a..c9d2ec38 100644
---- a/examples/decrypt1.c
-+++ b/examples/decrypt1.c
-@@ -52,8 +52,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -149,7 +147,7 @@ decrypt_file(const char* enc_file, const char* key_file) {
-     assert(key_file);
- 
-     /* load template */
--    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", enc_file);
-         goto done;
-diff --git a/examples/decrypt2.c b/examples/decrypt2.c
-index 522af222..49be8e60 100644
---- a/examples/decrypt2.c
-+++ b/examples/decrypt2.c
-@@ -55,8 +55,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -232,7 +230,7 @@ decrypt_file(xmlSecKeysMngrPtr mngr, const char* enc_file) {
-     assert(enc_file);
- 
-     /* load template */
--    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", enc_file);
-         goto done;
-diff --git a/examples/decrypt3.c b/examples/decrypt3.c
-index e24effc0..8fddfa70 100644
---- a/examples/decrypt3.c
-+++ b/examples/decrypt3.c
-@@ -58,8 +58,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -165,7 +163,7 @@ decrypt_file(xmlSecKeysMngrPtr mngr, const char* enc_file) {
-     assert(enc_file);
- 
-     /* load template */
--    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(enc_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", enc_file);
-         goto done;
-diff --git a/examples/encrypt1-tmpl.xml b/examples/encrypt1-tmpl.xml
-index 3d61a901..5c1a5f3f 100644
---- a/examples/encrypt1-tmpl.xml
-+++ b/examples/encrypt1-tmpl.xml
-@@ -1,12 +1,12 @@
- <?xml version="1.0"?>
--<!-- 
--XML Security Library example: Simple encryption template file for encrypt1 example. 
-+<!--
-+XML Security Library example: Simple encryption template file for encrypt1 example.
- -->
- <EncryptedData xmlns="http://www.w3.org/2001/04/xmlenc#">
-     <EncryptionMethod Algorithm="http://www.w3.org/2001/04/xmlenc#tripledes-cbc"/>
-     <KeyInfo xmlns="http://www.w3.org/2000/09/xmldsig#">
--	<KeyName/>
--    </KeyInfo>   
-+	<KeyName>deskey.bin</KeyName>
-+    </KeyInfo>
-     <CipherData>
- 	<CipherValue></CipherValue>
-     </CipherData>
-diff --git a/examples/encrypt1.c b/examples/encrypt1.c
-index ee3eaa8b..dc52ccf5 100644
---- a/examples/encrypt1.c
-+++ b/examples/encrypt1.c
-@@ -55,8 +55,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -156,7 +154,7 @@ encrypt_file(const char* tmpl_file, const char* key_file,
-     assert(data);
- 
-     /* load template */
--    doc = xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", tmpl_file);
-         goto done;
-diff --git a/examples/encrypt2.c b/examples/encrypt2.c
-index 14b57af9..989afec3 100644
---- a/examples/encrypt2.c
-+++ b/examples/encrypt2.c
-@@ -56,8 +56,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -154,7 +152,7 @@ encrypt_file(const char* xml_file, const char* key_file) {
-     assert(key_file);
- 
-     /* load template */
--    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
-         goto done;
-diff --git a/examples/encrypt3-res.xml b/examples/encrypt3-res.xml
-index 2fca87e7..129771a6 100644
---- a/examples/encrypt3-res.xml
-+++ b/examples/encrypt3-res.xml
-@@ -11,13 +11,13 @@ XML Security Library example: Original XML doc file before encryption (encrypt3
- <KeyName>rsakey.pem</KeyName>
- </KeyInfo>
- <CipherData>
--<CipherValue>QYYKljhcX20QyP20hYmq8CSES875oIdbrsjMOxnb0VnYDn01Jk00OIPpb9gdIdZg
--MLOtSy26mWrQ+XqfPGuyaA==</CipherValue>
-+<CipherValue>pFfhaCpQfHTOJ+mRN919Ia3JimY2AS/8u9pimLEWGGjh3egy3pE2st4+YoVkpS4G
-+XyUU4Ps+KRzsdJcKI4moXQ==</CipherValue>
- </CipherData>
- </EncryptedKey>
- </KeyInfo>
- <CipherData>
--<CipherValue>+UiDv73SE8K8KwXuOmHLHK7N2hNWDakTAEu6NprbCdULC1w/LXT9FLtNRJetmwwO
--XpBqTY56AAMeMgpxPWN3SPO0ETeQw7pR+bp0IjUvcGlFSXz6yE1qgQ==</CipherValue>
-+<CipherValue>PMuoILFXjCmMg2pCzrmJYZcySLsTzgGYRX2ymYV9tLVrNSPhWV2mwMHWMchSWH9b
-+8pRgdaJ3msWmN3EqqElV1Y5wEDQjB5nMz7Tsz3+QmrAxGfxj7bCPyw==</CipherValue>
- </CipherData>
- </EncryptedData>
-diff --git a/examples/encrypt3.c b/examples/encrypt3.c
-index e3f23104..71a6a559 100644
---- a/examples/encrypt3.c
-+++ b/examples/encrypt3.c
-@@ -7,7 +7,8 @@
-  * Usage:
-  *      ./encrypt3 <xml-doc> <rsa-pem-key-file>
-  *
-- * Example:
-+ * Example (note: we are using the private key here instead of the public
-+ * key to make decrypt3 example work):
-  *      ./encrypt3 encrypt3-doc.xml rsakey.pem > encrypt3-res.xml
-  *
-  * The result could be decrypted with decrypt3 example:
-@@ -58,8 +59,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -233,7 +232,7 @@ encrypt_file(xmlSecKeysMngrPtr mngr, const char* xml_file, const char* key_name)
-     assert(key_name);
- 
-     /* load template */
--    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
-         goto done;
-diff --git a/examples/sign1-tmpl.xml b/examples/sign1-tmpl.xml
-index ac71a949..34b96f6f 100644
---- a/examples/sign1-tmpl.xml
-+++ b/examples/sign1-tmpl.xml
-@@ -1,6 +1,6 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!-- 
--XML Security Library example: Simple signature template file for sign1 example. 
-+<!--
-+XML Security Library example: Simple signature template file for sign1 example.
- -->
- <Envelope xmlns="urn:envelope">
-   <Data>
-@@ -20,7 +20,7 @@ XML Security Library example: Simple signature template file for sign1 example.
-     </SignedInfo>
-     <SignatureValue/>
-     <KeyInfo>
--	<KeyName/>
-+      <KeyName>rsakey.pem</KeyName>
-     </KeyInfo>
-   </Signature>
- </Envelope>
-diff --git a/examples/sign1.c b/examples/sign1.c
-index be107333..e86d3604 100644
---- a/examples/sign1.c
-+++ b/examples/sign1.c
-@@ -54,8 +54,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -150,7 +148,7 @@ sign_file(const char* tmpl_file, const char* key_file) {
-     assert(key_file);
- 
-     /* load template */
--    doc = xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(tmpl_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", tmpl_file);
-         goto done;
-diff --git a/examples/sign2.c b/examples/sign2.c
-index 1a6ee936..a5408a0a 100644
---- a/examples/sign2.c
-+++ b/examples/sign2.c
-@@ -57,8 +57,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -156,7 +154,7 @@ sign_file(const char* xml_file, const char* key_file) {
-     assert(key_file);
- 
-     /* load doc file */
--    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
-         goto done;
-diff --git a/examples/sign3.c b/examples/sign3.c
-index de372e42..c927d946 100644
---- a/examples/sign3.c
-+++ b/examples/sign3.c
-@@ -61,8 +61,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -164,7 +162,7 @@ sign_file(const char* xml_file, const char* key_file, const char* cert_file) {
-     assert(cert_file);
- 
-     /* load doc file */
--    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
-         goto done;
-diff --git a/examples/sign4.c b/examples/sign4.c
-index bb5f03b3..012e4b63 100644
---- a/examples/sign4.c
-+++ b/examples/sign4.c
-@@ -60,8 +60,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -167,7 +165,7 @@ sign_file(const char* xml_file, const char* id_attr, const char* key_file, const
-     assert(cert_file);
- 
-     /* load doc file */
--    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
-         goto done;
-diff --git a/examples/verify-saml.c b/examples/verify-saml.c
-index fea78a7f..95abaf0e 100644
---- a/examples/verify-saml.c
-+++ b/examples/verify-saml.c
-@@ -65,8 +65,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -221,7 +219,7 @@ verify_file(xmlSecKeysMngrPtr mngr, const char* xml_file) {
-     assert(xml_file);
- 
-     /* load file */
--    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
-         goto done;
-diff --git a/examples/verify1.c b/examples/verify1.c
-index 00ad07e1..73c6063f 100644
---- a/examples/verify1.c
-+++ b/examples/verify1.c
-@@ -53,8 +53,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -149,7 +147,7 @@ verify_file(const char* xml_file, const char* key_file) {
-     assert(key_file);
- 
-     /* load file */
--    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
-         goto done;
-diff --git a/examples/verify2.c b/examples/verify2.c
-index 377dccc5..f421f89f 100644
---- a/examples/verify2.c
-+++ b/examples/verify2.c
-@@ -56,8 +56,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-@@ -232,7 +230,7 @@ verify_file(xmlSecKeysMngrPtr mngr, const char* xml_file) {
-     assert(xml_file);
- 
-     /* load file */
--    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET);
-+    doc = xmlReadFile(xml_file, NULL, XML_PARSE_PEDANTIC | XML_PARSE_NONET | XML_PARSE_NOENT);
-     if ((doc == NULL) || (xmlDocGetRootElement(doc) == NULL)){
-         fprintf(stderr, "Error: unable to parse file \"%s\"\n", xml_file);
-         goto done;
-diff --git a/examples/verify3.c b/examples/verify3.c
-index 558e3290..04dd32b0 100644
---- a/examples/verify3.c
-+++ b/examples/verify3.c
-@@ -57,8 +57,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-diff --git a/examples/verify4.c b/examples/verify4.c
-index 705d8a5f..23a96918 100644
---- a/examples/verify4.c
-+++ b/examples/verify4.c
-@@ -57,8 +57,6 @@ main(int argc, char **argv) {
-     /* Init libxml and libxslt libraries */
-     xmlInitParser();
-     LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
- 
-     /* Init libxslt */
- #ifndef XMLSEC_NO_XSLT
-diff --git a/examples/xmldsigverify.c b/examples/xmldsigverify.c
-deleted file mode 100644
-index c6611f43..00000000
---- a/examples/xmldsigverify.c
-+++ /dev/null
-@@ -1,379 +0,0 @@
--/**
-- * XML Security Library example: CGI verification script.
-- *
-- * This is free software; see Copyright file in the source
-- * distribution for preciese wording.
-- *
-- * Copyright (C) 2002-2024 Aleksey Sanin <aleksey@aleksey.com>. All Rights Reserved.
-- */
--#include <stdlib.h>
--#include <string.h>
--#include <assert.h>
--#include <dirent.h>
--
--#include <libxml/tree.h>
--#include <libxml/xmlmemory.h>
--#include <libxml/parser.h>
--
--#ifndef XMLSEC_NO_XSLT
--#include <libxslt/xslt.h>
--#include <libxslt/security.h>
--#endif /* XMLSEC_NO_XSLT */
--
--#include <xmlsec/xmlsec.h>
--#include <xmlsec/xmltree.h>
--#include <xmlsec/xmldsig.h>
--#include <xmlsec/crypto.h>
--
--#include <xmlsec/parser.h>
--/* #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER   "/etc/httpd/conf/ssl.crt" */
--#define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER      "/var/www/cgi-bin/keys-certs.def"
--#define XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER              "/var/www/cgi-bin/keys-certs"
--
--
--int load_keys(xmlSecKeysMngrPtr mngr, const char* path, int report_loaded_keys);
--int load_trusted_certs(xmlSecKeysMngrPtr mngr, const char* path, int report_loaded_certs);
--int verify_request(xmlSecKeysMngrPtr mngr);
--int url_decode(char *buf, size_t size);
--
--int
--main() {
--    xmlSecKeysMngrPtr mngr;
--#ifndef XMLSEC_NO_XSLT
--    xsltSecurityPrefsPtr xsltSecPrefs = NULL;
--#endif /* XMLSEC_NO_XSLT */
--
--    /* start response */
--    fprintf(stdout, "Content-type: text/plain\n");
--    fprintf(stdout, "\n");
--
--    /* Init libxml and libxslt libraries */
--    xmlInitParser();
--    LIBXML_TEST_VERSION
--    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
--    xmlSubstituteEntitiesDefault(1);
--
--    /* make sure that we print out everything to stdout */
--    xmlGenericErrorContext = stdout;
--
--    /* Init libxslt */
--#ifndef XMLSEC_NO_XSLT
--    /* disable everything */
--    xsltSecPrefs = xsltNewSecurityPrefs();
--    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_READ_FILE,        xsltSecurityForbid);
--    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_WRITE_FILE,       xsltSecurityForbid);
--    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_CREATE_DIRECTORY, xsltSecurityForbid);
--    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_READ_NETWORK,     xsltSecurityForbid);
--    xsltSetSecurityPrefs(xsltSecPrefs,  XSLT_SECPREF_WRITE_NETWORK,    xsltSecurityForbid);
--    xsltSetDefaultSecurityPrefs(xsltSecPrefs);
--#endif /* XMLSEC_NO_XSLT */
--
--    /* Init xmlsec library */
--    if(xmlSecInit() < 0) {
--        fprintf(stdout, "Error: xmlsec initialization failed.\n");
--        return(-1);
--    }
--
--    /* Check loaded library version */
--    if(xmlSecCheckVersion() != 1) {
--        fprintf(stdout, "Error: loaded xmlsec library version is not compatible.\n");
--        return(-1);
--    }
--
--    /* Load default crypto engine if we are supporting dynamic
--     * loading for xmlsec-crypto libraries. Use the crypto library
--     * name ("openssl", "nss", etc.) to load corresponding
--     * xmlsec-crypto library.
--     */
--#ifdef XMLSEC_CRYPTO_DYNAMIC_LOADING
--    if(xmlSecCryptoDLLoadLibrary(NULL) < 0) {
--        fprintf(stdout, "Error: unable to load default xmlsec-crypto library. Make sure\n"
--                        "that you have it installed and check shared libraries path\n"
--                        "(LD_LIBRARY_PATH and/or LTDL_LIBRARY_PATH) environment variables.\n");
--        return(-1);
--    }
--#endif /* XMLSEC_CRYPTO_DYNAMIC_LOADING */
--
--    /* Init crypto library */
--    if(xmlSecCryptoAppInit(XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER) < 0) {
--        fprintf(stdout, "Error: crypto initialization failed.\n");
--        return(-1);
--    }
--
--    /* Init xmlsec-crypto library */
--    if(xmlSecCryptoInit() < 0) {
--        fprintf(stdout, "Error: xmlsec-crypto initialization failed.\n");
--        return(-1);
--    }
--
--    /* create keys manager */
--    mngr = xmlSecKeysMngrCreate();
--    if(mngr == NULL) {
--        fprintf(stdout, "Error: failed to create keys manager.\n");
--        return(-1);
--    }
--    if(xmlSecCryptoAppDefaultKeysMngrInit(mngr) < 0) {
--        fprintf(stdout, "Error: failed to initialize keys manager.\n");
--        return(-1);
--    }
--
--    if(load_keys(mngr, XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER, 0) < 0) {
--        xmlSecKeysMngrDestroy(mngr);
--        return(-1);
--    }
--
--    if(load_trusted_certs(mngr, XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER, 0) < 0) {
--        xmlSecKeysMngrDestroy(mngr);
--        return(-1);
--    }
--
--    if(verify_request(mngr) < 0) {
--        xmlSecKeysMngrDestroy(mngr);
--        return(-1);
--    }
--
--    /* Destroy keys manager */
--    xmlSecKeysMngrDestroy(mngr);
--
--    /* Shutdown xmlsec-crypto library */
--    xmlSecCryptoShutdown();
--
--    /* Shutdown crypto library */
--    xmlSecCryptoAppShutdown();
--
--    /* Shutdown xmlsec library */
--    xmlSecShutdown();
--
--    /* Shutdown libxslt/libxml */
--#ifndef XMLSEC_NO_XSLT
--    xsltFreeSecurityPrefs(xsltSecPrefs);
--    xsltCleanupGlobals();
--#endif /* XMLSEC_NO_XSLT */
--
--    xmlCleanupParser();
--
--    return(0);
--}
--
--/**
-- * load_trusted_certs:
-- * @mngr:       the keys manager.
-- * @path:       the path to a folder that contains trusted certificates.
-- *
-- * Loads trusted certificates from @path.
-- *
-- * Returns 0 on success or a negative value if an error occurs.
-- */
--int load_trusted_certs(xmlSecKeysMngrPtr mngr, const char* path, int report_loaded_certs) {
--    DIR* dir;
--    struct dirent* entry;
--    char filename[2048];
--    int len;
--
--    assert(mngr);
--    assert(path);
--
--    dir = opendir(path);
--    if(dir == NULL) {
--        fprintf(stdout, "Error: failed to open folder \"%s\".\n", path);
--        return(-1);
--    }
--    while((entry = readdir(dir)) != NULL) {
--        assert(entry->d_name);
--        len = strlen(entry->d_name);
--        if((len > 4) && (strcmp(entry->d_name + len - 4, ".pem") == 0)) {
--            snprintf(filename, sizeof(filename), "%s/%s", path, entry->d_name);
--            if(xmlSecCryptoAppKeysMngrCertLoad(mngr, filename, xmlSecKeyDataFormatPem, xmlSecKeyDataTypeTrusted) < 0) {
--                fprintf(stdout,"Error: failed to load pem certificate from \"%s\"\n", filename);
--                closedir(dir);
--                return(-1);
--            }
--            if(report_loaded_certs) {
--                fprintf(stdout, "Loaded trusted certificate from \"%s\"...\n", filename);
--            }
--        } else if((len > 4) && (strcmp(entry->d_name + len - 4, ".der") == 0)) {
--            snprintf(filename, sizeof(filename), "%s/%s", path, entry->d_name);
--            if(xmlSecCryptoAppKeysMngrCertLoad(mngr, filename, xmlSecKeyDataFormatDer, xmlSecKeyDataTypeTrusted) < 0) {
--                fprintf(stdout,"Error: failed to load der certificate from \"%s\"\n", filename);
--                closedir(dir);
--                return(-1);
--            }
--            if(report_loaded_certs) {
--                fprintf(stdout, "Loaded trusted certificate from \"%s\"...\n", filename);
--            }
--        }
--    }
--    closedir(dir);
--    return(0);
--}
--
--int load_keys(xmlSecKeysMngrPtr mngr, const char* path, int report_loaded_keys) {
--    char filename[256];
--
--    assert(mngr);
--
--    snprintf(filename, sizeof(filename), "%s/keys.xml", path);
--    if(xmlSecCryptoAppDefaultKeysMngrLoad(mngr, filename) < 0) {
--        fprintf(stdout,"Error: failed to load keys from \"%s\"\n", filename);
--        return(-1);
--    }
--
--    if(report_loaded_keys) {
--        fprintf(stdout, "Loaded keys from \"%s\"...\n", filename);
--    }
--    return(0);
--}
--
--
--/**
-- * verify_request:
-- * @mng:                the keys manager
-- *
-- * Verifies XML signature in the request (stdin).
-- *
-- * Returns 0 on success or a negative value if an error occurs.
-- */
--int
--verify_request(xmlSecKeysMngrPtr mngr) {
--    xmlBufferPtr buffer = NULL;
--    xmlSecByte buf[256];
--    xmlDocPtr doc = NULL;
--    xmlNodePtr node = NULL;
--    xmlSecDSigCtxPtr dsigCtx = NULL;
--    int ret;
--    int res = -1;
--
--    assert(mngr);
--
--    /* load request in the buffer */
--    buffer = xmlBufferCreate();
--    if(buffer == NULL) {
--        fprintf(stdout,"Error: failed to create buffer\n");
--        goto done;
--    }
--
--    while(!feof(stdin)) {
--        ret = fread(buf, 1, sizeof(buf), stdin);
--        if(ret < 0) {
--            fprintf(stdout,"Error: read failed\n");
--            goto done;
--        }
--        xmlBufferAdd(buffer, buf, (xmlSecSize)ret);
--    }
--
--    /* is the document submitted from the form? */
--    if(strncmp((char*)xmlBufferContent(buffer), "_xmldoc=", 8) == 0) {
--        xmlBufferShrink(buffer, 8);
--        buffer->use = url_decode((char*)xmlBufferContent(buffer), xmlBufferLength(buffer));
--    }
--
--    /**
--     * Load doc
--     */
--    xmlSecParserSetDefaultOptions(XML_PARSE_NOENT | XML_PARSE_NOCDATA |
--                        XML_PARSE_PEDANTIC | XML_PARSE_NOCDATA);
--    doc = xmlReadMemory((const char*)xmlBufferContent(buffer), xmlBufferLength(buffer),
--        NULL, NULL, xmlSecParserGetDefaultOptions());
--    if (doc == NULL) {
--        fprintf(stdout, "Error: unable to parse xml document (syntax error)\n");
--        goto done;
--    }
--
--    /*
--     * Check the document is of the right kind
--     */
--    if(xmlDocGetRootElement(doc) == NULL) {
--        fprintf(stdout,"Error: empty document\n");
--        goto done;
--    }
--
--    /* find start node */
--    node = xmlSecFindNode(xmlDocGetRootElement(doc), xmlSecNodeSignature, xmlSecDSigNs);
--    if(node == NULL) {
--        fprintf(stdout, "Error: start <dsig:Signature/> node not found\n");
--        goto done;
--    }
--
--    /* create signature context */
--    dsigCtx = xmlSecDSigCtxCreate(mngr);
--    if(dsigCtx == NULL) {
--        fprintf(stdout,"Error: failed to create signature context\n");
--        goto done;
--    }
--
--    /* we would like to store and print out everything */
--    /* actually we would not because it opens a security hole
--    dsigCtx->flags = XMLSEC_DSIG_FLAGS_STORE_SIGNEDINFO_REFERENCES |
--                     XMLSEC_DSIG_FLAGS_STORE_MANIFEST_REFERENCES |
--                     XMLSEC_DSIG_FLAGS_STORE_SIGNATURE;
--    */
--
--    /* Verify signature */
--    if(xmlSecDSigCtxVerify(dsigCtx, node) < 0) {
--        fprintf(stdout,"Error: signature verification failed\n");
--        goto done;
--    }
--
--    /* print verification result to stdout */
--    if(dsigCtx->status == xmlSecDSigStatusSucceeded) {
--        fprintf(stdout, "RESULT: Signature is OK\n");
--    } else {
--        fprintf(stdout, "RESULT: Signature is INVALID\n");
--    }
--    fprintf(stdout, "---------------------------------------------------\n");
--    xmlSecDSigCtxDebugDump(dsigCtx, stdout);
--
--    /* success */
--    res = 0;
--
--done:
--    /* cleanup */
--    if(dsigCtx != NULL) {
--        xmlSecDSigCtxDestroy(dsigCtx);
--    }
--
--    if(doc != NULL) {
--        xmlFreeDoc(doc);
--    }
--
--    if(buffer != NULL) {
--        xmlBufferFree(buffer);
--    }
--    return(res);
--}
--
--/* not the best way to do it */
--#define toHex(c) ( ( ('0' <= (c)) && ((c) <= '9') ) ? (c) - '0' : \
--                 ( ( ('A' <= (c)) && ((c) <= 'F') ) ? (c) - 'A' + 10 : 0 ) )
--
--/**
-- * url_decode:
-- * @buf:        the input buffer.
-- * @size:       the input buffer size.
-- *
-- * Does url decoding in-place.
-- *
-- * Returns length of the decoded result on success or
-- * a negative value if an error occurs.
-- */
--int url_decode(char *buf, size_t size) {
--    size_t ii, jj;
--    char ch;
--
--    assert(buf);
--
--    for(ii = jj = 0; ii < size; ++ii, ++jj) {
--        ch = buf[ii];
--        if((ch == '%') && ((ii + 2) < size)) {
--            buf[jj] = (char)(toHex(buf[ii + 1]) * 16 + toHex(buf[ii + 2]));
--            ii += 2;
--        } else if(ch == '+') {
--            buf[jj] = ' ';
--        } else if(ii != jj){
--            buf[jj] = buf[ii];
--        }
--    }
--    return((int)jj);
--}
--
--
-diff --git a/tests/aleksey-xmldsig-01/enveloped-gost2001.xml b/tests/aleksey-xmldsig-01/enveloped-gost2001.xml
-index a00b1a91..d2535e92 100644
---- a/tests/aleksey-xmldsig-01/enveloped-gost2001.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-gost2001.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!-- 
--XML Security Library example: Simple signature template file for sign1 example. 
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl
-index b1aef672..90c53215 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml
-index 51813562..d0b7272f 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha1.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl
-index fe5e8e5d..6737c0e8 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml
-index 865770bf..06a76abd 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha224.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl
-index 3ccee872..86755bc8 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml
-index 33c16f5d..283ebf57 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha256.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl
-index 2342efb5..f0513280 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml
-index ca8581ce..384fcdaa 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha384.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl
-index 4c4d5e2c..05572e63 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml
-index 2ff30400..c781cc0f 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-digest-sha512.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl
-index 48160c0b..bc7f712d 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml
-index d7ff383f..5adbecac 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-issuerserial.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!-- 
--XML Security Library example: Simple signature template file for sign1 example. 
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl
-index 915dd55c..9e1cd393 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml
-index 2a517e0e..3dcba72e 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-missing-cert.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl
-index 915dd55c..9e1cd393 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-same-subj-cert.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl
-index 542680a9..adf7084c 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-ski.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml b/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml
-index 68b2c554..89e77f0f 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-ski.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!-- 
--XML Security Library example: Simple signature template file for sign1 example. 
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl
-index ba982e63..868540cf 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.tmpl
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!--
--XML Security Library example: Simple signature template file for sign1 example.
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
-diff --git a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml
-index daa82e85..b4cfdb85 100644
---- a/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml
-+++ b/tests/aleksey-xmldsig-01/enveloped-x509-subjectname.xml
-@@ -1,7 +1,4 @@
- <?xml version="1.0" encoding="UTF-8"?>
--<!-- 
--XML Security Library example: Simple signature template file for sign1 example. 
---->
- <Envelope xmlns="urn:envelope">
-   <Data>
- 	Hello, World!
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch
new file mode 100644
index 0000000000..2f753db12c
--- /dev/null
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch
@@ -0,0 +1,26 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jun 2026 00:00:00 +0000
+Subject: [PATCH] unit_tests: guard xmlDebugDumpDocument with LIBXML_DEBUG_ENABLED
+
+libxml2 2.14 removed the tree-debugging module; in 2.15 LIBXML_DEBUG_ENABLED
+is no longer defined and xmlDebugDumpDocument() is not declared. The transform
+helpers unit test called it unconditionally, which fails to compile with a
+strict compiler (-Werror=implicit-function-declaration). Only emit the debug
+dump when the libxml2 debug module is available.
+
+Upstream-Status: Submitted [https://github.com/lsh123/xmlsec/issues]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/apps/unit_tests/transform_helpers_unit_tests.c
++++ b/apps/unit_tests/transform_helpers_unit_tests.c
+@@ -288,7 +288,9 @@
+     nonceContent = xmlNodeGetContent(nonceNode);
+     if((nonceContent == NULL) || (xmlStrcmp(nonceContent, BAD_CAST "000102030405060708090a0b") != 0)) {
+         testLog("Error: ChaCha20-Poly1305 params write serialized unexpected nonce\n");
++#ifdef LIBXML_DEBUG_ENABLED
+         xmlDebugDumpDocument(stdout, doc);
++#endif /* LIBXML_DEBUG_ENABLED */
+ 
+         xmlFree(nonceContent);
+         xmlFreeDoc(doc);
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.11.bb
similarity index 91%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.11.bb
index e178fc2125..dfdd7d5572 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.11.bb
@@ -16,14 +16,13 @@ SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PV}/${BP}.tar.gz
            file://0001-force-to-use-our-own-libtool.patch \
            file://0002-change-finding-path-of-nss-and-nspr.patch \
            file://0003-xmlsec1-add-new-recipe.patch \
-           file://0004-examples-allow-build-in-separate-dir.patch \
            file://0005-nss-nspr-fix-for-multilib.patch \
            file://0006-xmlsec1-Fix-configure-QA-error-caused-by-host-lookup.patch \
-           file://0007-xmlsec-examples-Fix-LibXML2-deprecation-warnings-and.patch \
+           file://0008-unit_tests-guard-xmlDebugDumpDocument-with-LIBXML_DEB.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "a631c8cd7a6b86e6adb9f5b935d45a9cf9768b3cb090d461e8eb9d043cf9b62f"
+SRC_URI[sha256sum] = "53675e98fa83b48201d24f7bfbcaeaa1b51496b8b19ff969785856bdeb196af3"
 
 UPSTREAM_CHECK_URI = "https://github.com/lsh123/xmlsec/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"

