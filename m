Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id D689360C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Jan 2014 07:45:29 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so6963364eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2014 23:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E2P15P79BjuKRvB28N2dFbahU/H7g5B2EXYNs4Ii40A=;
	b=kJxPQcAnsPhdRPARX2Y+92c0iuIAbuE98u9PLmcZZzxzQd55Q7z6rpQGEEMaSxbkzD
	SG0rJlIbhLjVNI4Gef43+vVw0qt+yxcsbpKAsdmhBHF9Dkd1fbTEICcOJJGsuHrFrHUI
	8lR/FcRv+/MmTyZB//eDN6D3DYzStyQIUJwVUFhn7hl3SPeg2k4/Dho1hKUnTDHIAZye
	fnfmhGjAUI7GLPbZCccAosNGTT07jUppHQTlEpL2L5e1aCaU1IoOYYr9zF0spua+lR1a
	dWaQfu8c14e7wDkpsqumr7dNGgF03GiNyi9Bxg3ENMzIoozPW3wa8+vE7GlGgvJaN2fp
	raZg==
X-Received: by 10.15.83.8 with SMTP id b8mr78360295eez.6.1388821530342;
	Fri, 03 Jan 2014 23:45:30 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	e3sm151325479eeg.11.2014.01.03.23.45.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 23:45:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Jan 2014 08:45:32 +0100
Message-Id: <1388821532-10851-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-browser][PATCH] Update after toplevel LICENSE file checksum change
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
X-List-Received-Date: Sat, 04 Jan 2014 07:45:32 -0000

* it would be good time to remove ugly hack now instead of this change

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox-addon/firefox-addon.inc | 2 +-
 recipes-mozilla/firefox-l10n/firefox-l10n.inc   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-mozilla/firefox-addon/firefox-addon.inc b/recipes-mozilla/firefox-addon/firefox-addon.inc
index 24e0c18..5bbd626 100644
--- a/recipes-mozilla/firefox-addon/firefox-addon.inc
+++ b/recipes-mozilla/firefox-addon/firefox-addon.inc
@@ -7,7 +7,7 @@ RDEPENDS_${PN} = "firefox"
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 
 # Ugly hack for now; we need to check license per recipe later
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 S = "${WORKDIR}"
 
diff --git a/recipes-mozilla/firefox-l10n/firefox-l10n.inc b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
index 2369318..945fe90 100644
--- a/recipes-mozilla/firefox-l10n/firefox-l10n.inc
+++ b/recipes-mozilla/firefox-l10n/firefox-l10n.inc
@@ -7,7 +7,7 @@ RDEPENDS_${PN} = "firefox"
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 
 # Ugly hack for now; we need to check license per recipe later
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
 LANGUAGE = "${@get_language_name('${PN}')}"
 INC_PR = "r2"
-- 
1.8.4.3


