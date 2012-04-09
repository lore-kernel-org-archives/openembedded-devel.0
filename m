Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHGTQ-0001du-9d
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Apr 2012 17:25:44 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so2626913wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2012 08:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=odp7McaJ13SoxRYLOXXrjThCsNie9rzR4KVPvMWM+9Q=;
	b=jRzAqUWbps9tSkH76vtzh7m9GnatWLpeYF848Mg3TMOAq1LgiAJAUBnx2rgM57NJKH
	YrM7E2ILNAL0OIh09Lh4VTQvgkBOXZdqKG5iFNiXEyPjFP4Y71GLzKY29QR3zobcUrb+
	tBeOMzxRyyIM1m2yCzwJUl9Ul4M7TuzbOrZIFQzl1rdrGFif+bZQUo6l1xCzOj3tqgfi
	cUadcjTTXYz+oPkZwXihdqlvy8AH6bajIuq8o6697t9oOq6/qqj3kbC/QT7GKBwVTOgI
	nqi6PWko3i/kttJ5WJW7LCvCnlH9DjCGvMvnm4yaeE0uqaNcWgql1rbuJ6wF2D3vfi0j
	tJiw==
Received: by 10.180.92.228 with SMTP id cp4mr16973489wib.2.1333984589993;
	Mon, 09 Apr 2012 08:16:29 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id l5sm30956670wia.11.2012.04.09.08.16.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 08:16:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Apr 2012 17:16:10 +0200
Message-Id: <1333984573-28464-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
References: <1333984573-28464-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkJAmwAIwf5sHVLMgJ2pUHjDdVrRnyVjqkbs8pJRHHXP+DKxex95lc7TBkD48c9/tGn6g9V
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 07/10] systemd: fix vconsole-setup dependencies
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
X-List-Received-Date: Mon, 09 Apr 2012 15:25:44 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index d38bbc1..becbc90 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r24"
+PR = "r25"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -86,7 +86,7 @@ FILES_${PN}-vconsole-setup = "${systemd_unitdir}/systemd-vconsole-setup \
                               ${systemd_unitdir}/system/systemd-vconsole-setup.service \
                               ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
 
-RRECOMMENDS_$PN}-vconsole-setup = "kbd kbd-consolefonts"
+RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
 
 FILES_${PN} = " ${base_bindir}/* \
                 ${datadir}/dbus-1/services \
-- 
1.7.2.5



