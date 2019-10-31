Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2CD7F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:54:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 473ryF1G8Bz40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 17:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572540853;
	bh=hdOTfeDzUNOPQd7cWoj/rJVsL7Z39uOvvYj5vH/2zeE=;
	h=From:To:Subject:Date:From;
	b=Ys81qQUOzHmJvn1clS/Z+kjFXgLAzJpJlrBpaTyajb/YHoMj1pUxXZFtsSfOyHCgg
	NjTSlzD7bArd5qn6H7Y+EZykj6OjxTwU/AQ4+37EA64WAWrL3PduVZ1lATObGU7awB
	hlx+cOwi+KuYvVIe2cEQwMQa+dnYu8+zAGg62xJYrbkx5xlXssjl3huMOP22KrRluq
	uBSFSmWwM98RXQPPbrBwEXYBo+RslT7xTXUfHxPNzTw2lHlRp8/HrSTF8vrnj7CD6W
	pvV7GTn9l1OmTmDwMY9GoLl02AaxZ/sms8M3fde7RttRBbcZam4WTmyzlQm9owMMD5
	hjPWLCF7kmvmpUqKZTzFjGpvcQeXJv3bDT2TRS1MH9cAGCCRyrEQ/0Res/bW8iB+wl
	I34EKCd8dul/uxsIEy9lSio7sCDglBEP+iFK0YVYJJ5GAhsfIX0chhNnyrQ54riCeD
	erT9njmrJXM323hnYvo2m3n6EWczceidfNMQJs3aNlyXs/8LYCeFhecf22ts3gfitS
	SLi8Nx+9zZo+1IA3c6mrVY0LkUTVBqytfW0UG+S49gXq5Bgum64OrHT9qPnmgO7nK7
	SPvcV5ar6pP9QzqLd2nOD9edDiTucOTNLmKmwaD4AV6MWldysV/pWDBaQzx/kB5iro
	Ncea4vLF1vB4ETL5Jxt2emVA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Oct 2019 18:54:10 +0200
Message-Id: <20191031165412.24745-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] gpsd: Fix CVE-2018-17937
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
X-List-Received-Date: Thu, 31 Oct 2019 16:54:12 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
Already fixed in gpsd 3.19 in zeus and master.
---
 ...ck-in-in_escape-state-of-JSON-parser.patch | 46 +++++++++++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-Add-bounds-check-in-in_escape-state-of-JSON-parser.patch

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-Add-bounds-check-in-in_escape-state-of-JSON-parser.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-Add-bounds-check-in-in_escape-state-of-JSON-parser.patch
new file mode 100644
index 000000000..1a8a6ac0a
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-3.17/0001-Add-bounds-check-in-in_escape-state-of-JSON-parser.patch
@@ -0,0 +1,46 @@
+From a6e718c0dd32501c8961b6ac0493b148b6489f14 Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Fri, 15 Jun 2018 13:26:28 -0400
+Subject: Add bounds check in in_escape state of JSON parser.
+
+CVE: CVE-2018-17937
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+
+---
+ json.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/json.c b/json.c
+index f5b59fba2..e7cac81fd 100644
+--- a/json.c
++++ b/json.c
+@@ -374,6 +374,12 @@ static int json_internal_read_object(const char *cp,
+ 	    if (pval == NULL)
+ 		/* don't update end here, leave at value start */
+ 		return JSON_ERR_NULLPTR;
++	    else if (pval > valbuf + JSON_VAL_MAX - 1
++		       || pval > valbuf + maxlen) {
++		json_debug_trace((1, "String value too long.\n"));
++		/* don't update end here, leave at value start */
++		return JSON_ERR_STRLONG;	/*  */
++	    }
+ 	    switch (*cp) {
+ 	    case 'b':
+ 		*pval++ = '\b';
+@@ -394,8 +400,10 @@ static int json_internal_read_object(const char *cp,
+ 		for (n = 0; n < 4 && cp[n] != '\0'; n++)
+ 		    uescape[n] = *cp++;
+ 		--cp;
+-		(void)sscanf(uescape, "%04x", &u);
+-		*pval++ = (char)u;	/* will truncate values above 0xff */
++		if (1 != sscanf(uescape, "%4x", &u)) {
++		    return JSON_ERR_BADSTRING;
++                }
++		*pval++ = (unsigned char)u;  /* will truncate values above 0xff */
+ 		break;
+ 	    default:		/* handles double quote and solidus */
+ 		*pval++ = *cp;
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
index e823e42a5..488fa3a52 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
@@ -11,6 +11,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
     file://0004-SConstruct-disable-html-and-man-docs-building-becaus.patch \
     file://0001-include-sys-ttydefaults.h.patch \
+    file://0001-Add-bounds-check-in-in_escape-state-of-JSON-parser.patch \
 "
 SRC_URI[md5sum] = "e0cfadcf4a65dfbdd2afb11c58f4e4a1"
 SRC_URI[sha256sum] = "68e0dbecfb5831997f8b3d6ba48aed812eb465d8c0089420ab68f9ce4d85e77a"
-- 
2.17.1


