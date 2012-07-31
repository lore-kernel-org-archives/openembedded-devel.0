Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1vE-00074e-OK
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:10:56 +0200
Received: by wibhq4 with SMTP id hq4so2102403wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 18:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xxtbixaBQW6roKnuvBH2TL+YxOlTlWqKGZTdFLFR8Dw=;
	b=yZFGJVAzEVFS4v7vMkZxi/S3CRI2hkgV2XTQq3mX5v34JpyjY8Oc3ZuKzLNt9c3q4s
	o/A0Qu9bLOdwb3b2TWxPE9dsateTPO30lgxLez2ztPdlQNV0LfSCR86r7qWcTH/NrUGA
	VOlxO4bDkfTC0rIc0ECVYo8p/dHdW46hovujU9DqOyvKfvKDYz7dcWjM9H9Kxo3BidHj
	vI1tV3/8W7JG1QIW+coqzxGIkKJ7Pol69mpnhCNg0xQHRitjZW0fsRFUwbU9DbQOtLhP
	vLM5iYRW9Q1LZ9xYU4ir61TFIFo4mqMxzoWgvFi3Ka6Y9U7XRCBk5B/Vs/ZO8tL33Ng7
	eM7w==
Received: by 10.216.136.227 with SMTP id w77mr6083713wei.111.1343699960557;
	Mon, 30 Jul 2012 18:59:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm19612079wib.10.2012.07.30.18.59.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 18:59:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:34 +0200
Message-Id: <6f8d256ca710420553ec68ddcf2fc7d98f63aea0.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 09/24] e-wm: use new update-alternatives syntax
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
X-List-Received-Date: Tue, 31 Jul 2012 02:10:56 -0000

* fixes warning WARNING: e-wm: Use of ALTERNATIVE_NAME is deprecated, see update-alternatives.bbclass for more info.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 852bbcc..6f5fab1 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2667a0f4120372ea91f7467cdff4095f"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -182,7 +182,6 @@ FILES_${PN}-doc += "\
 CONFFILES_${PN}-menu = "${sysconfdir}/xdg/menus/applications.menu"
 CONFFILES_${PN}-sysactions = "/etc/enlightenment/sysactions.conf"
 
-ALTERNATIVE_PATH = "${bindir}/enlightenment_start.oe"
-ALTERNATIVE_NAME = "x-window-manager"
-ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PRIORITY = "16"
+ALTERNATIVE_${PN} = "x-window-manager"
+ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/enlightenment_start.oe"
+ALTERNATIVE_PRIORITY[x-window-manager] = "16"
-- 
1.7.8.6



