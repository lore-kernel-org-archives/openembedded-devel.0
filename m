Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Ool2t-0004xR-A8
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 00:35:44 +0200
Received: by yxk30 with SMTP id 30so922749yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 15:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=m0TzABHBhivTiLsBmA8O5w7PBwm+ytS79T9ZSYVEgjM=;
	b=uu2GYxkh79tuJPsTNvAT1RC07SQSopSBus8ih6awNewCp8KPyf6Ho75s3FWX1alOVY
	Kjm9GGAyomlTTfHqf9WlDd9WB0N/MnTqJhrhr3npuUk92dgBLpZljNM/BeNWppHXC+yL
	MnRjrQwL5BjKH1iakt267dwJhAc+4rATTcdYE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nJmPolFdSkmhvXluat40nC1WRLtXvwTrp3G6X1YAp0UGwug5nUfnyxAOlN6WSSjAZM
	QCAqhHzGYSVsTKEd22HXc+v1NlmMsU7nsO+0wQUedlzwSmkO1SNnr/ZvTKPF3PdEPWUg
	9hxQzyOWZclPtSuwZBUYiX/IC50+3joTcqCSs=
Received: by 10.151.48.17 with SMTP id a17mr902742ybk.95.1282855152018;
	Thu, 26 Aug 2010 13:39:12 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c2sm7895189ybi.21.2010.08.26.13.39.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 26 Aug 2010 13:39:11 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Aug 2010 15:31:08 -0500
Message-Id: <1282854668-16940-2-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1282854668-16940-1-git-send-email-chase.maupin@ti.com>
References: <1282854668-16940-1-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] matrix-gui-e: change initscript start level
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
X-List-Received-Date: Thu, 26 Aug 2010 22:35:45 -0000

* Set the init script to be added to list of run level
  5 scripts.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-gui-e_svn.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/ti/matrix-gui-e_svn.bb b/recipes/ti/matrix-gui-e_svn.bb
index 3bb304d..35abd25 100644
--- a/recipes/ti/matrix-gui-e_svn.bb
+++ b/recipes/ti/matrix-gui-e_svn.bb
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 
 SRCREV = "58"
 PV = "1.0"
-PR = "r15+svnr${SRCPV}"
+PR = "r16+svnr${SRCPV}"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
 	file://init \
@@ -15,8 +15,8 @@ SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=ano
 S = "${WORKDIR}/trunk"
 
 INITSCRIPT_NAME = "matrix-gui-e"
-#INITSCRIPT_PARAMS = "defaults 99"
-INITSCRIPT_PARAMS = "start 99 3 . stop 99 3 ."
+INITSCRIPT_PARAMS = "defaults 99"
+#INITSCRIPT_PARAMS = "start 99 3 . stop 99 3 ."
 
 inherit qt4e update-rc.d
 
-- 
1.7.0.4



