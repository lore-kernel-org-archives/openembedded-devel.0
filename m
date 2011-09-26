Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1R86gI-0007XX-64
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Sep 2011 10:36:54 +0200
Received: by gwaa2 with SMTP id a2so5181422gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2011 01:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=5s0WpXV5rBv4CnZti05MUPCDxET7o3lul0bPCo6m4Fo=;
	b=vteY82lu4ZaDWdeYDfgoApDVC0cnDNztMnJhQOnA+QeeyqERGR+bwO9u0SmxXVqKrw
	HaCU/H/bAc3ISbF3L0EoFzGJEF0KjaqguZPfKm3fC4bJ5ffYuFKRpoiYeWamCU+u7sp9
	s2SC/q7tA3fa3/S9Tl8d6QTOFrc00/uljHgOs=
Received: by 10.236.190.130 with SMTP id e2mr1123494yhn.107.1317025885517;
	Mon, 26 Sep 2011 01:31:25 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id u4sm31008356ane.21.2011.09.26.01.31.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 01:31:24 -0700 (PDT)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2011 11:29:00 +0300
Message-Id: <1317025740-2398-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] hostapd: update to use a newer commit
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
X-List-Received-Date: Mon, 26 Sep 2011 08:36:54 -0000

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/hostap/hostap-daemon_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/hostap/hostap-daemon_git.bb b/recipes/hostap/hostap-daemon_git.bb
index cf0e6e9..bdbde1a 100644
--- a/recipes/hostap/hostap-daemon_git.bb
+++ b/recipes/hostap/hostap-daemon_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "User space daemon for extended IEEE 802.11 management"
 require hostap-daemon-0.7.inc
 
 PR = "r0"
-SRCREV = "b8fb017272ed4794339978c9fbc0e74571a44728"
+SRCREV = "83fa07226debc2f7082b6ccd62dbb1cd47c30472"
 PV = "0.7.3+0.8.0-rc"
 PR_append = "gitr${SRCPV}"
 FILESPATHPKG =. "hostap-daemon-git:"
-- 
1.7.0.4



