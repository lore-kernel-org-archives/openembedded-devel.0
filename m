Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1RilBB-0007rE-8r
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 12:08:17 +0100
Received: by yenm12 with SMTP id m12so124905yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 03:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HlzeS8GJzHfN2eIYa+lxX+cr9wKAWXGt+JszWVVR354=;
	b=g9hYQAtSxWFWQligWajQ+Ikw3uWFVjr9UTymiLuyCc7c4I8LPNmx95cG+CFxbkb49A
	nveJLcrpsPbPNOgCqF2gGiPI+hNs4fSUhIxlANvA7vaurSkcFByRk2VWoC8WlyLDAvvg
	8oEvnJiIcdi/swAU2GzNFEd3iLOyir2xgCo+Q=
Received: by 10.236.129.177 with SMTP id h37mr790522yhi.9.1325761254069;
	Thu, 05 Jan 2012 03:00:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k48sm17331446yhj.16.2012.01.05.03.00.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 03:00:53 -0800 (PST)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2012 13:00:43 +0200
Message-Id: <1325761243-6703-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCHv2] iw_git: Update to commit 8b2b1c6a (version 3.2)
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
X-List-Received-Date: Thu, 05 Jan 2012 11:08:17 -0000

Upadte to the latest formal release of iw whcih has wowlan and p2p support.
This version was tested together with official R4_SP2 nlcp release from TI
Using the following platfors:

am335x-evm, am180x-evm, am37x-evm

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 recipes/iw/iw_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/iw/iw_git.bb b/recipes/iw/iw_git.bb
index c98e1bc..f0dc7ff 100644
--- a/recipes/iw/iw_git.bb
+++ b/recipes/iw/iw_git.bb
@@ -4,9 +4,9 @@ SECTION = "base"
 PRIORITY = "optional"
 LICENSE = "BSD"
 
-SRCREV = "0a236ef5f8e4ba7218aac7d0cdacf45673d5b35c"
-PR = "r0"
-PV = "0.9.22"
+SRCREV = "8b2b1c6a77ee17e4128b22845cb8c5901de296c9"
+PR = "r1"
+PV = "3.2"
 PR_append = "+gitr${SRCPV}"
 
 DEPENDS = "libnl pkgconfig"
-- 
1.7.0.4



