Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 18905760A6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:32:52 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id c4so394216wrd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h1dYHxu03RuGObqHoEYxtzQ1v/1Rv5BV8gQBi2Du5as=;
	b=UG+2syEpvrevgGx6F1N2PP+GSaSOf44buYh8bHdHu9IQti1sniNInIhObWLnup4DWW
	Qd8SmvIeoeR3DwhPRWm0MpsM2HFosHhhGy42E1QF5PNw1W3Fb3JDRKpKgwL8KQn8g9az
	TzkgL+Yx2wMwBp7o+CFpr7XLyuK2ZlRjXf3V1IP3aNRNsmJu0BSZsd9AKZg+E0vC7NK/
	PuY+C84bhABF9+n6gRlxIAcqM59mhb7BdNM4jB77dByK9fYMF6nJpL1XrtSgJR1LBtO/
	8uh99UfusTLRG5WO13kwnyS/TAUWEjulLGC5BHnEYuRFKDBjGnDE8XEr87F07NLzcc+7
	lllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=h1dYHxu03RuGObqHoEYxtzQ1v/1Rv5BV8gQBi2Du5as=;
	b=XIW3kHCCLWglUvC/B9CYaYTHBoQGcg6seeAOT14dnG4zX5tb/d9Prb2dMMu+8TBZ2+
	DIHe2I2ANGnGxJgZ4LMJGWmTqFWMhmR8cQBkz2vzGW5Muryp2oFq0gdgcB5FlgSMqeyX
	pB01uUicuauSSzeFEvzL3TMr/0IiiBR7BOlY2OLKqOLe1EO3j7tz/qXRkcPGooScztnw
	fRdosGY26bWDmA7gcZuEzairuietOhARFH4PMsg/wp+TyLorR7lCVxMrckW/I08qkpxa
	wJxbgWK2lvUXKDiGAXV1VqaHVaFJ9/3tsDLrvsKHh7Ofw/gnHeENiMxfj9f8+tvrxy3G
	Dl1g==
X-Gm-Message-State: AMke39m1MWGP2iq3vWeSnBDkqN57f8Eh2Dayu6Z2PNBKD83UxcuWz/dAARLvEhX0P0T1Ig==
X-Received: by 10.223.146.228 with SMTP id 91mr21489831wrn.203.1487025172569; 
	Mon, 13 Feb 2017 14:32:52 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:32:51 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:35 +0100
Message-Id: <1487025163-21628-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
References: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-initramfs][PATCH 1/9] klcc-cross: fixes for recipe specific sysroot
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
X-List-Received-Date: Mon, 13 Feb 2017 22:32:54 -0000

The klcc script encodes the paths with custom escaping.
As stated in the patch "Turn the horribly encoded paths into something which
sstate can transform using its ususal magic by removing all the crazy escaping".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
index 3a4e7b5..15d860a 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
@@ -17,8 +17,13 @@ do_compile() {
 do_install() {
     install -d ${D}${bindir_crossscripts}/
     install -m 0755 klcc/klcc ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
-    # Insert an unencoded path as a comment to trigger the sstate renaming functions
-    sed -i '2i #${STAGING_DIR_TARGET}' ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
+    # Turn the horribly encoded paths into something which sstate can transform using its ususal
+    # magic by removing all the crazy escaping.
+    sed -i -e "2i \$TARGETSYSROOT = '${STAGING_DIR_TARGET}';" \
+           -e "2i \$NATIVESYSROOT = '${STAGING_DIR_NATIVE}';" \
+           -e 's#${@d.getVar("STAGING_DIR_NATIVE", True).replace("/", "\\\\/").replace("-", "\\\\-").replace(".", "\\\\.")}#${NATIVESYSROOT}#g;' \
+           -e 's#${@d.getVar("STAGING_DIR_TARGET", True).replace("/", "\\\\/").replace("-", "\\\\-").replace(".", "\\\\.")}#${TARGETSYSROOT}#g' \
+        ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
 }
 
 SYSROOT_PREPROCESS_FUNCS += "klcc_sysroot_preprocess"
@@ -35,6 +40,3 @@ deltask do_package_write_deb
 deltask do_package_write_tar
 
 SSTATE_SCAN_FILES = "*"
-EXTRA_STAGING_FIXMES = "MANGLEDSTAGINGDIRTARGET MANGLEDSTAGINGDIR"
-MANGLEDSTAGINGDIR = "${@d.getVar("STAGING_DIR").replace("/", "\\\\/").replace("-", "\\\\-")}"
-MANGLEDSTAGINGDIRTARGET = "${@d.getVar("STAGING_DIR_TARGET").replace("/", "\\\\/").replace("-", "\\\\-")}"
-- 
2.7.4


