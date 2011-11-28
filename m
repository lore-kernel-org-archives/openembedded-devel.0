Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVB37-0006wU-FK
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2011 00:55:49 +0100
Received: by iahk25 with SMTP id k25so9657729iah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 15:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5ZOOW3IbE0VvJTQFA1TH3TdwEPIjcM5QBFmcGjhtLNI=;
	b=hDbvx2VzyPApFb9niq2vemMdL6tFO0RbvSW8ZjuxLUUNbKtW2MMgAOTbHFdMl6VMUK
	6CddghxML5qoXGThY/WGpnx8ctlHuLeduAzr8f1Xmu3IBjiGOk4yIAXZwZ7cdVpFj91s
	9lSoxGXA1pC/cYnkLlKE45OJT95lMPMEd46C8=
Received: by 10.50.213.6 with SMTP id no6mr56052922igc.51.1322524150132;
	Mon, 28 Nov 2011 15:49:10 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id cb15sm46349163ibb.4.2011.11.28.15.49.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 15:49:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 15:56:42 -0800
Message-Id: <1322524602-11331-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [2011.03-maintenance][PATCH] eglibc: Fix build when OPTION_EGLIBC_NSSWITCH is not set.
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
X-List-Received-Date: Mon, 28 Nov 2011 23:55:49 -0000

Few of build problems are being reported on classic OE
when OPTION_EGLIBC_NSSWITCH is set to 'n' by default it
works well. But when its set to 'n' then we have to make
sure that OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG and
OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS are set to point
to abosolute paths in sources

Fixes build errors like

Makefile:85: *** OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG variable left
unset.  Stop.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc-options.inc |    6 +++++-
 recipes/eglibc/eglibc.inc         |    4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes/eglibc/eglibc-options.inc b/recipes/eglibc/eglibc-options.inc
index 0af0aab..c3ba5e3 100644
--- a/recipes/eglibc/eglibc-options.inc
+++ b/recipes/eglibc/eglibc-options.inc
@@ -4,7 +4,11 @@ def eglibc_cfg(feature, features, tokens, cnf ):
 	if type(features) == type([]) and feature in features:
 		cnf.extend([token + ' = y' for token in tokens])
 	else:
-		cnf.extend([token + ' = n' for token in tokens])
+		for token in tokens:
+			cnf.extend([token + ' = n'])
+			if token == 'OPTION_EGLIBC_NSSWITCH':
+				cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG = ${S}/nss/nsswitch.conf"])
+				cnf.extend(["OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS = ${S}/nss/fixed-nsswitch.functions"])
 
 # Map distro features to eglibc options settings
 def features_to_eglibc_settings(d):
diff --git a/recipes/eglibc/eglibc.inc b/recipes/eglibc/eglibc.inc
index f0cfca8..23c3763 100644
--- a/recipes/eglibc/eglibc.inc
+++ b/recipes/eglibc/eglibc.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r21"
+INC_PR = "r22"
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 #this leads to circular deps, so lets not add it yet
@@ -42,7 +42,7 @@ do_move_ports() {
 	    mv ${WORKDIR}/${EGLIBC_BRANCH}/ports ${S}/
 	fi
 }
-OE_FEATURES := "${@features_to_eglibc_settings(d)}"
+OE_FEATURES = "${@features_to_eglibc_settings(d)}"
 do_configure_prepend() {
 	echo '${OE_FEATURES}' > ${B}/option-groups.config
 }
-- 
1.7.0.4



