Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 369967712D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 04:40:41 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id z14so5638080igp.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 20:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=//LCLNsNtrk4sbf+9PtcWd0Q8C8xGMur5Os2gA4gUR8=;
	b=R2BK25UHahemOsm3FZLHvjf5o8IPdXM7WTgQDzoxpZsfsMEEoNoOmneZ5F9N6Huu46
	zHid/asH68WBkd3BWHJqqmmI7EoMpOShH6vqtIiLlIWBeih5gsqqvoaQeOzoMpotHb6X
	6ataK7V7TBJdCCjdWzE8iQ1xCzG25PEI/HTNCF6Mny/Sq9Q0FjZEiC4VR80uVdLQdfYj
	KEOjqL548F/gNMQuFA/B3Gf1XTHkxj/1BKdlcJuUCvN/BAuJEAUVCWT25mDq2Te8Kf1p
	EXfWhuAYMAL2QSlY9jV7wQWovqcrewWUmLmvw+VfqG1uY3szsqM+vgAtffSlckdgy7I1
	umxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=//LCLNsNtrk4sbf+9PtcWd0Q8C8xGMur5Os2gA4gUR8=;
	b=l1D9JpwFyVC7/tZzcqAUUq5HjIx7vTe60M+4SQelI3UfRMqAdPYAA6Y1UDO37DBXIp
	hvmEHg13CJ0g+wUvxYrpgQZ2kvOKeHzGt/7jIfJEBbDBl6oCH5LyybbagHpVr7mnNHXT
	jU1LH4of3D6rafZY/1HnEQZ22pcEPb35Qs7NjmhLekSgSU1YLivJC3IIWnhxLofmFJ/L
	popSgaBAEqwJ7Coq1R/MbgMAg7sVOB/aJ4/2zB2ZVcFZjnreEhCpVpOn9V4v54+iEaKX
	AZ17YryEklXB7ylHoGcR4VP8J7ySjiKomVP+p8ptG32UTRWcOM/nMA50ZjBZW8eKubp6
	uW1w==
X-Gm-Message-State: AG10YOQmnr1eVf1vX07hZs7Owoeo7tjCMPS9JbA7ZD+UjQgXIQObtnxYE4ULyxOklOD4UQ==
X-Received: by 10.50.152.41 with SMTP id uv9mr1023566igb.3.1453956041934;
	Wed, 27 Jan 2016 20:40:41 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	s19sm455906ign.4.2016.01.27.20.40.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jan 2016 20:40:41 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jan 2016 23:40:27 -0500
Message-Id: <1453956027-30065-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.7.0.rc3
Subject: [meta-oe][PATCH] nodejs: upgrade from 4.2.4 to 4.2.6
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
X-List-Received-Date: Thu, 28 Jan 2016 04:40:44 -0000

...plus a switch to xz.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_4.2.4.bb => nodejs_4.2.6.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.2.4.bb => nodejs_4.2.6.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.6.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.6.bb
index 18e23b7..be863d6 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.2.4.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.6.bb
@@ -9,11 +9,11 @@ COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
 COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "86e4d0d8b626f6e60ca7bef02f2543d2"
-SRC_URI[sha256sum] = "4ee244ffede7328d9fa24c3024787e71225b7abaac49fe2b30e68b27460c10ec"
+SRC_URI[md5sum] = "edd0c12a6417a96f04ca735c468e624f"
+SRC_URI[sha256sum] = "dcb935647f9e32fc90db52d393f00c9868ba9d84c5ebe5ddd766e225deb52c40"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.0.rc3


