Return-Path: <rudolf.streif@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 843E0737F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:46:37 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so30923000pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=eg8coOJ/4HOiTR4p/1l0ZE5J69jxIdshjnnCAlQ0hnw=;
	b=bnnkaD82n8F6kEoif2JHo3KpZE/QBCc91+1o0VISA+Gegk19mYnQBRuGNPZHoyBkS3
	Z2WW1PMi/ZzOe4guc53+wb/8xLzHQKVkIvQKbQtgTOOVRRvSdcd44euQuahoZyNg078C
	EPW/C72XyNZUUquQ8yQ/FiNo9MNhNl2Q0MyQrhsbS7mQPT7dbijMxUxCZeYtOoLHfjcw
	o7kwyJiToRKMbYkCa/3Aws08dPiI75Hk6kXKI2o4haEM1svdvvePqR/qiTR6+eeIk8tj
	QvR8gqC5maJXJCEBLlFnYA4TptbrrRWrpJwX243ZhZ2/fXbPREzo1oAeQ9OUGQGvXg4k
	sAtw==
X-Received: by 10.68.200.72 with SMTP id jq8mr10288122pbc.91.1440107197506;
	Thu, 20 Aug 2015 14:46:37 -0700 (PDT)
Received: from rjs-mbpro.streifs.net (ip68-7-48-20.sd.sd.cox.net. [68.7.48.20])
	by smtp.gmail.com with ESMTPSA id b6sm5399058pdo.63.2015.08.20.14.46.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 14:46:36 -0700 (PDT)
From: Rudolf J Streif <rudolf.streif@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:46:35 -0700
Message-ID: <1688210.4AcqYYVCbn@rjs-mbpro.streifs.net>
User-Agent: KMail/4.14.6 (Linux/3.19.3-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <20150820204157.GB15465@jama>
References: <1440101942-6993-1-git-send-email-rudolf.streif@gmail.com>
	<20150820204157.GB15465@jama>
MIME-Version: 1.0
Subject: Re: [PATCH] synergy: project has moved from synergy.googlecode.com
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
X-List-Received-Date: Thu, 20 Aug 2015 21:46:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The synergy project on synergy.googlecode.com is defunct. The
sources cannot be downloaded from there anymore. The new project
home is synergy-project.org, but sources can only be downloaded
from ther with a login. The source code repo is on github.com/synergy.

New recipe to check out the code from GitHub. The code contains
zip archives for gmock and gtest, which need to be extracted before
do_configure. The license file has changed from COPYING to LICENSE. The
authors apparently added their copyright information before the GPLv2
license text. Hence, the md5sum is different.

Removed the synergy_1.3.8.bb recipe.

Signed-off-by: Rudolf J Streif <rudolf.streif@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_1.3.8.bb | 24 -----------------
 meta-oe/recipes-support/synergy/synergy_git.bb   | 34 
++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 24 deletions(-)
 delete mode 100644 meta-oe/recipes-support/synergy/synergy_1.3.8.bb
 create mode 100644 meta-oe/recipes-support/synergy/synergy_git.bb

diff --git a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb b/meta-
oe/recipes-support/synergy/synergy_1.3.8.bb
deleted file mode 100644
index 545f9fa..0000000
--- a/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Synergy - control multiple computers with one keyboard and mouse"
-HOMEPAGE = "http://synergy.googlecode.com"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9772a11e3569985855e2ce450e56f991"
-LICENSE = "GPL-2.0"
-SECTION = "x11/utils"
-
-DEPENDS = "virtual/libx11 libxtst libxinerama"
-
-SRC_URI = "http://synergy.googlecode.com/files/synergy-${PV}-Source.tar.gz"
-
-SRC_URI[md5sum] = "3534c65ecfa6e47d7899c57975442f03"
-SRC_URI[sha256sum] = 
"0afc83e4ed0b46ed497d4229b2b2854e8d3c581a112f4da05110943edbfacc03"
-
-S = "${WORKDIR}/${BP}-Source"
-
-inherit cmake distro_features_check
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-do_install() {
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/bin/synergy* ${D}/usr/bin/
-}
-
diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-
support/synergy/synergy_git.bb
new file mode 100644
index 0000000..cb842c8
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Synergy - control multiple computers with one keyboard and mouse"
+HOMEPAGE = "http://synergy-project.org"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f366945b209c5523e39889f636af00a"
+LICENSE = "GPL-2.0"
+SECTION = "x11/utils"
+
+DEPENDS = "virtual/libx11 libxtst libxinerama"
+
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = "git://github.com/synergy/synergy.git;protocol=http"
+
+# Version 1.7.4-rc8
+SRCREV ?= "588fb4b805dd452556d05dbc03fe29ea5b4e43c0"
+PV = "1.7.3+1.7.4-rc8+${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit cmake distro_features_check
+
+do_unpack_extra() {
+    cd ${S}/ext
+    for file in *.zip; do
+        fname="${file##*/}"
+        unzip $file -d ${fname%.*}
+    done
+}
+addtask unpack_extra after do_unpack before do_patch
+
+do_install() {
+    install -d ${D}/usr/bin
+    install -m 0755 ${S}/bin/synergy* ${D}/usr/bin/
+}
-- 
2.1.0

>Remove
>meta-openembedded/meta-oe/recipes-support/synergy/synergy_1.3.8.bb
>n the same commit.

Done.

> Add comment in commit message explaining why license checksum is
> different in this version.
> 

Done. Authors apparently. added their copyright on top of the GPLv2 license 
text.

> Why did you drop virtual from libx11?
> 
> DEPENDS = "virtual/libx11 libxtst libxinerama"

I accidentally based my recipe on an older version of synergy_1.3.8.bb. Sorry.

> 
> > +
> > +SRC_URI = "git://github.com/synergy/synergy.git;protocol=http"
> > +
> > +# HEAD
> > +SRCREV_pn-synergy ?= "${AUTOREV}"
> 
> NAK

removed

> 
> > +
> > +# Version 1.7.4-rc8
> > +SRCREV_pn-synergy ?= "c734bab59ecb7703605e01438e6bff4338b5cb34"
> 
> Drop "_pn-synergy ?"
> 

done

> normal assignment is enough
> 
> Set PV "1.7.3+1.7.4-rc8+${SRCPV}"
> 

done

> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake
> 
> What happened with distro_features_check from original recipe?
> 

I accidentally based my recipe on an older version of synergy_1.3.8.bb. Sorry.



