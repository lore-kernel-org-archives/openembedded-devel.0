Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalreizer@googlemail.com>) id 1RinsI-0003Od-E8
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 15:00:58 +0100
Received: by yhoo47 with SMTP id o47so99259yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 05:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0R1H10D5LCMI8vKrKwdkewHF0iMWZ72RKFV7X1NTBYU=;
	b=mWt6ZpCq17MywQ8TVzCsCjJwOL30uf+p1GuzIGIj1PrEUgb9T2pg9MhVO0F4FhOvsL
	9LWzTFWUXZVdsFW9wjHfGM0u1Sy0hoEdtBKvaG1/q/od/y8NadlU0lbBZK0H4Rr9lUGB
	R8q9fcgLUeDFnUCw1XjH0yuFo45F26Xmdk6cA=
Received: by 10.236.148.36 with SMTP id u24mr1550350yhj.49.1325771615205;
	Thu, 05 Jan 2012 05:53:35 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id c44sm81822518yhm.5.2012.01.05.05.53.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 05:53:33 -0800 (PST)
From: Eyal Reizer <eyalreizer@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2012 15:53:24 +0200
Message-Id: <1325771604-6756-1-git-send-email-eyalr@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCHv3] iw_git: Update to commit 8b2b1c6a (version 3.2)
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
X-List-Received-Date: Thu, 05 Jan 2012 14:00:58 -0000

Update to the latest formal release of iw which has wowlan and p2p support.
This version was tested together with official R4_SP2 nlcp release from TI
Using the following platforms:

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



