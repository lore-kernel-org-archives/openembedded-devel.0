Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id DF8216011C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 18:46:10 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id c6so64375819qga.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FSQG3Qm+RLILhtWtias/3RZb/8sXrIr0U5mpYYcfCo0=;
	b=TpVBNZrzT+b/40qbP8yFKbUjVB+SA6Ux1AxobhQ+iLpoPRJ6p6zUnjPAxwtVR6NP3s
	oqQK5dTwopKP6rtGqXzlTCpUN0ktLFJsjaEvswygWfOqeJGUUtAMkQSM4poomQkRmmHS
	CGMxre9reA/9RX5tSU1E+lKHlUc71161/iVQv3hZ7cyoqudJnzx856JRpLKIh1jrvwz3
	w64Wxs23wv/AFqP2/iDEEP5jTYZGzbJXwmIBrk0A1qjDJ2Wb/BHxF/T6WfToBRaevyUr
	JxZplKsmWVbxuybIE7WnWTxdgKYvPH2mTo87wRxIbKWBsxnqh0+4KR0AG4eLkCHA3gMs
	hXzg==
X-Gm-Message-State: AOPr4FU+Yl3ZN0ZoiYmFXDBHJfFAFyEbWmS/zfsBOjpKz03rr4qSUtA1NX5mQg5YGOLEWg==
X-Received: by 10.140.93.67 with SMTP id c61mr6683191qge.101.1461350771229;
	Fri, 22 Apr 2016 11:46:11 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	p101sm2888522qge.13.2016.04.22.11.46.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 11:46:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 14:45:59 -0400
Message-Id: <1461350759-939-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] concurrencykit: update to version 0.5.1
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
X-List-Received-Date: Fri, 22 Apr 2016 18:46:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../concurrencykit/concurrencykit/cross.patch            | 16 +---------------
 .../concurrencykit/concurrencykit_git.bb                 |  6 +++---
 2 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
index 38504fe..d3bfab7 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
@@ -2,20 +2,6 @@ Index: git/configure
 ===================================================================
 --- git.orig/configure	2012-11-19 21:07:51.917429465 -0800
 +++ git/configure	2012-11-19 21:13:19.337437278 -0800
-@@ -275,8 +275,11 @@
- assert "$SYSTEM" "$SYSTEM" "unsupported"
- 
- CORES=${CORES:-${DCORES}}
--printf "Detecting machine architecture..."
--PLATFORM=`uname -m 2> /dev/null`
-+if test -z "$PLATFORM"; then
-+	printf "Detecting machine architecture..."
-+	PLATFORM=`uname -m 2> /dev/null`
-+fi
-+
- case $PLATFORM in
- 	"macppc"|"Power Macintosh"|"powerpc")
- 		MM="${MM:-"CK_MD_RMO"}"
 @@ -439,14 +442,18 @@
  	GZIP_SUFFIX=".gz"
  fi
@@ -40,7 +26,7 @@ Index: git/configure
  #include <stdio.h>
  int main(void) {
  #if defined(__GNUC__) && (__GNUC__ >= 4)
-@@ -460,16 +467,16 @@
+@@ -569,16 +576,16 @@
  #endif
  }
  EOF
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index b4ac9c9..51243c2 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -7,9 +7,9 @@ LICENSE = "BSD & Apache-2.0"
 HOMEPAGE = "http://concurrencykit.org"
 SECTION = "base"
 
-PV = "0.4.3+git${SRCPV}"
-SRCREV = "900d203aa9e41288545368ea40da0bee89f7907f"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f12611e65e064515ce264249b2bdea98"
+PV = "0.5.1+git${SRCPV}"
+SRCREV = "f97d3da5c375ac2fc5a9173cdd36cb828915a2e1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a0b24c1a8f9ad516a297d055b0294231"
 SRC_URI = "git://github.com/concurrencykit/ck.git;protocol=https \
            file://cross.patch \
 "
-- 
1.9.1


