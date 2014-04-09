Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id A3F6665D27
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 09:15:56 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id ar20so2186140iec.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 02:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qLDdl5y/4EQGAye/HQ0JgkOQel5ESQeGrzRsUxHhP8Y=;
	b=bxLoxAcQrS4FBlJ01Up4fLs/thW/1TAq4ePy/gpHrbnP3LlVjtolAVo9AGuk3u6m51
	X3+svKyludW5WqlXiGsJTPzKSun1oJasts8km2UmjzjHVW/HchqNfzDJicOvQ4zG762Y
	HGiXRytltk+ZseQNynFlzyl/3shdJAAHISAaB7+d3EcxUK+skmc+msjgMd50OHl9WyOd
	fZ2KOSzjNSKHCmSnoeTMnmeTZveBaatx/JNAyetigj9H1ywijW0b1SzHtJrAxUxxIe+Z
	MQz0lDFLikTZdRSMIwywAZq7d+b1b2YQKa02OvB9KR6qpPj7p1iuaSxurKZAsq3zFnt4
	wfIA==
X-Gm-Message-State: ALoCoQl/w/cHJNKBvO2Hy95CsqQIm2ezFekLlqyUeCzOAUIJwLjBAhEWdZ7YOt3kxAK5q5mWXzBL
X-Received: by 10.50.80.11 with SMTP id n11mr3603661igx.36.1397034957049;
	Wed, 09 Apr 2014 02:15:57 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id r4sm10080984igh.1.2014.04.09.02.15.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Apr 2014 02:15:56 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Apr 2014 05:15:40 -0400
Message-Id: <1397034941-6268-1-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>, patches@linaro.org
Subject: [meta-oe][PATCH] acpitests: add individual checksums
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
X-List-Received-Date: Wed, 09 Apr 2014 09:15:56 -0000

This recipe includes two source tarballs, add a second set of checksums so
both have checksum definitions.

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-extended/acpica/acpitests_20140114.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140114.bb b/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
index 4afe3a9..d8a3b9f 100644
--- a/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
+++ b/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
@@ -6,12 +6,14 @@ LIC_FILES_CHKSUM = "file://tests/aapits/atexec.c;beginline=1;endline=115;md5=e92
 
 DEPENDS = "bison flex"
 
-SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz \
-           https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
+SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;name=acpitests \
+           https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz;name=acpica \
            file://0001-Fixup-aapits-build.patch \
     "
-SRC_URI[md5sum] = "c72b61e092d2b25726dfff6e455116c9"
-SRC_URI[sha256sum] = "368f69296edef5138fd33affa2d50bdcdd1dfd2f6919ba782f8ecf03971a3a2c"
+SRC_URI[acpitests.md5sum] = "c72b61e092d2b25726dfff6e455116c9"
+SRC_URI[acpitests.sha256sum] = "368f69296edef5138fd33affa2d50bdcdd1dfd2f6919ba782f8ecf03971a3a2c"
+SRC_URI[acpica.md5sum] = "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
+SRC_URI[acpica.sha256sum] = "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3ddd6f5559ab24ebc3"
 
 S = "${WORKDIR}/acpitests-unix-${PV}"
 
-- 
1.9.0


