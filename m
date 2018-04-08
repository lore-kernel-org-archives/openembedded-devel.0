Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id ECBFB7550C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:58:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j2so3718873pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JCz7elyr7qhS03mZZexSs1l3Ay96KJsNm2nlxtAQcYc=;
	b=uR/D44HnOW4LNAqSBFD2D+fE1QsOcgcx8gV4CLF2lcG+3Z+0H3kzkM9cZFKjGCqLMZ
	yvxh4WMuD/IQ++0EabLVd4W/+XcWnEIiBo92l79VBbsWRg9uD5M77F9V2H845OArHPbb
	3Yu6t9GVqlwnXPOuB5P41ZGx9r8Bffu/hPbq642dTw6bL3h7b0bHDB2LihmSg0Z4WO3s
	DMt6iW9hCorg2ZXHrrP2CI4p1u8UYlTP02D6wbBOxSTbWhpZ2cPh576pGEOzuy9tbsai
	I+CHjTuZksDnKWxa+hPYP4896U1IIjyOM8/NCK9udtMiioyqhz2b9q54v7ckxu/OLfy5
	5AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JCz7elyr7qhS03mZZexSs1l3Ay96KJsNm2nlxtAQcYc=;
	b=Txf4haiIItL9wAdSiuCe5imQD/EJzf71pFwJEW6REVNfwNo1Nl0c7IuqDKmYNdQXBy
	7yAIUTP/wlnDc7cFHI31j9yMUn6xdyzfxoymhB3T8PChXc3iz2Jn0J8MnReMGapNhmEy
	XAvTeR0N4rBZVE+uL6sgY/Z7lQG4ZNXkO4T8Tb91eI7dbrwVHySoZlKfeqKzbF2MPlLN
	HQz7lZTWbTWO8f1Xvy0/Tqe1NxKYo/7DbvT16yYzyTnZhsfcyw1GY+arnyatEMvcMhrp
	j8wlDKiRHGYI3w2/hwgfqZ9jUBRp8y8qe7PEM8RxHPc3VTJX8hisAqjPErudGYerN8Sj
	nfXw==
X-Gm-Message-State: AElRT7FpViyNOpFul40Ofd9Bryhfc9lbMxXQH+He/X/ntBYlYSiQF9wq
	YBLIoAOfVvCIFV2Zqkl2qMa7lQ==
X-Google-Smtp-Source: AIpwx48ii9pBsEdNMN7aZPSvBd4URlASi2KCdcMBQRnEOOPPSThC1PeWkJah9uNRaAeeyapNGjeOsg==
X-Received: by 10.101.70.132 with SMTP id h4mr21824416pgr.155.1523170738067;
	Sat, 07 Apr 2018 23:58:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.58.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:58:57 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:18 -0700
Message-Id: <1523170729-26321-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 06/37] concurrencykit: patch refresh
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
X-List-Received-Date: Sun, 08 Apr 2018 06:58:57 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
patching file configure
Hunk #1 succeeded at 535 with fuzz 1 (offset 96 lines).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../concurrencykit/concurrencykit/cross.patch      | 33 +++++++++++++---------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
index d3bfab7..9e5058f 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit/cross.patch
@@ -1,8 +1,16 @@
-Index: git/configure
-===================================================================
---- git.orig/configure	2012-11-19 21:07:51.917429465 -0800
-+++ git/configure	2012-11-19 21:13:19.337437278 -0800
-@@ -439,14 +442,18 @@
+From ab0eec78382bd00ce533aec2c84fd50c1733033d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 Jan 2013 19:42:51 -0800
+
+---
+ configure | 32 ++++++++++++++++++--------------
+ 1 file changed, 18 insertions(+), 14 deletions(-)
+
+diff --git a/configure b/configure
+index 76c2812..78ce2ff 100755
+--- a/configure
++++ b/configure
+@@ -535,14 +535,18 @@ else
  	GZIP_SUFFIX=".gz"
  fi
  
@@ -25,12 +33,16 @@ Index: git/configure
 +	cat << EOF > .1.c
  #include <stdio.h>
  int main(void) {
- #if defined(__GNUC__) && (__GNUC__ >= 4)
-@@ -569,16 +576,16 @@
+ #if defined(_WIN32)
+@@ -569,16 +573,16 @@ int main(void) {
  #endif
  }
  EOF
--
++	$CC -o .1 .1.c
++	COMPILER=`./.1`
++	r=$?
++	rm -f .1.c .1
+ 
 -$CC -o .1 .1.c
 -COMPILER=`./.1`
 -r=$?
@@ -40,11 +52,6 @@ Index: git/configure
 -	assert "" "update compiler"
 -else
 -	echo "success [$CC]"
-+	$CC -o .1 .1.c
-+	COMPILER=`./.1`
-+	r=$?
-+	rm -f .1.c .1
-+
 +	if test "$r" -ne 0; then
 +		assert "" "update compiler"
 +	else
-- 
2.7.4


