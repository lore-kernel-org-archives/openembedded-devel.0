Received: from mail-qa0-f51.google.com ([209.85.216.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1TtleM-0000u0-Vo
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 21:56:28 +0100
Received: by mail-qa0-f51.google.com with SMTP id i20so155494qad.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 12:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=TaJFWY6bnHi/A/Cw8+CjiQAlkq/h73VS9DElU0uwacg=;
	b=fNgZWN0wUS9anQYE5SF6020b+sooejuzQzn5QIyItIBWMGnvLIPezIH0QcXzIG7Mt+
	VUM8M8fV5v4NmNwEyQczfkbjcqWc3MqKtyVkEUAuMU0rAtdTx5cXIZBweEVayvf+rA2h
	cjXzMGC54Kp8FYAxcnbnk7EhDWJ9JW4iiK13wuuvARaJjq+FBlpNsIYRN1ZsFqhZ2/M1
	XP/GkafhtydsD8d0uOF8oPE0oGUZ34ULRdWOCJudH5JG9KlTOQ9NH6e18of4v+7Khqsp
	nnYdOGM6DDOi4moPkEIPunfMX6Uue3iqjY5DFENESv7irkYBY0gk9hgZv5G40DKTrg3l
	M75g==
X-Received: by 10.224.78.82 with SMTP id j18mr50848860qak.69.1357936871534;
	Fri, 11 Jan 2013 12:41:11 -0800 (PST)
Received: from localhost.localdomain ([96.240.164.36])
	by mx.google.com with ESMTPS id hr3sm4424378qab.4.2013.01.11.12.41.10
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 11 Jan 2013 12:41:10 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Jan 2013 15:41:00 -0500
Message-Id: <1357936861-8245-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1357936861-8245-1-git-send-email-philip@balister.org>
References: <1357936861-8245-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 2/3] uhd : Update to version 3.5.0.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 20:56:30 -0000

This version drops the usrp E100 utilities. Also, the recipe depends on
python-cheetah-native now.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-connectivity/uhd/uhd.inc    | 7 +++----
 meta-oe/recipes-connectivity/uhd/uhd_git.bb | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd.inc b/meta-oe/recipes-connectivity/uhd/uhd.inc
index c237a96..d3cc4c8 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd.inc
+++ b/meta-oe/recipes-connectivity/uhd/uhd.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Universal Hardware Driver for Ettus Research products."
 HOMEPAGE = "http://www.ettus.com"
-LICENSE = "GPLV3+"
+LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=51b35d652c070d136bf20244494be2d3"
 
-DEPENDS = "git-native boost libusb1 uhd-firmware orc-native"
+DEPENDS = "git-native python-cheetah-native boost libusb1 uhd-firmware orc-native"
 RDEPENDS_${PN} += "uhd-firmware"
 
 PE = "1"
@@ -18,7 +18,6 @@ INSANE_SKIP_${PN} = "dev-so"
 FILES_${PN} += "${libdir}/libuhd.so \
                 ${datadir}/uhd/utils/*"
 FILES_${PN}-tests += "${datadir}/uhd/tests/*"
-FILES_${PN}-e1xx += "${datadir}/uhd/usrp_e_utils/*"
 FILES_${PN}-dbg += "${datadir}/uhd/examples/.debug/* \
                     ${datadir}/uhd/utils/.debug/* \
                     ${datadir}/uhd/tests/.debug/* \
@@ -28,6 +27,6 @@ FILES_${PN}-examples = "${datadir}/uhd/examples/*"
 OECMAKE_BUILDPATH = "${S}/build"
 OECMAKE_SOURCEPATH = "${S}"
 
-EXTRA_OECMAKE = "-DENABLE_E100=TRUE -DENABLE_USRP_E_UTILS=TRUE"
+EXTRA_OECMAKE = "-DENABLE_E100=TRUE"
 
 EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
diff --git a/meta-oe/recipes-connectivity/uhd/uhd_git.bb b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
index e740ccd..721182c 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd_git.bb
+++ b/meta-oe/recipes-connectivity/uhd/uhd_git.bb
@@ -1,10 +1,10 @@
 require uhd.inc
 
-PV = "3.4.1"
+PV = "3.5.0"
 PR = "${INC_PR}.0"
 
-SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;protocol=git \
+SRC_URI = "git://ettus.sourcerepo.com/ettus/uhd.git;branch=maint;protocol=git \
           "
 S = "${WORKDIR}/git/host"
 
-SRCREV = "3fb067567b0c799b3c707938491eb8489d85fefa"
+SRCREV = "5cb9779da40491b06157596b06422f704a58c7d0"
-- 
1.7.11.7



