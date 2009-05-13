Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3N-0006OF-UG
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:09 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+Css9/WlZefhyUa9hTvHOHHO19JgG6bZTZlj9GYqRqE=;
	b=e2pnsJs5ezYw2e8Q5ZkGkZW/hPfYXsF1TAENWtN1bT2Nv6YnXgyYVd8qmE21goueT0
	Yu1/AyB8X2KkT9KvrRTz29P4Ba+hblBg+ujfEWndiNah/dCUzEzfnws0i/r285jHPr0x
	F8JSrGOQaZ6vOHR4tIFzjJt5XYy7GTEu6NiiA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cnC4fQX03JYE2PbFfowE8AVZ8sa7RSNBedGLh5DKQS0SIdOnPInZqN379HAO1rP80c
	kMniRriV9NHyn+3HQKCCYWTyrd5t4ejRMSLdC/UWoXASAwN5vChV5Th58LWcHaupzBFb
	FfQe2OVfJ4ssZGTXVwh02BNpHR4jacvAZmnxE=
Received: by 10.210.129.19 with SMTP id b19mr989381ebd.0.1242207627459;
	Wed, 13 May 2009 02:40:27 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 10sm1287704eyd.22.2009.05.13.02.40.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:27 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:06 +0200
Message-Id: <1242207556-15601-28-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 27/37] gpe-plucker: Fix install
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
X-List-Received-Date: Wed, 13 May 2009 10:45:37 -0000

From: Steve Sakoman <steve@sakoman.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-plucker/gpe-plucker_0.4.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes/gpe-plucker/gpe-plucker_0.4.bb b/recipes/gpe-plucker/gpe-plucker_0.4.bb
index 8e90d2f..4a2937a 100644
--- a/recipes/gpe-plucker/gpe-plucker_0.4.bb
+++ b/recipes/gpe-plucker/gpe-plucker_0.4.bb
@@ -5,10 +5,13 @@ DEPENDS = "gtk+ libgpewidget gpe-icons"
 RDEPENDS = "gpe-icons"
 SECTION = "gpe"
 PRIORITY = "optional"
+PR = "r3"
+
+SRC_URI += " \
+           file://plucker-no-host-includes.patch;patch=1 \
+           file://fix-install.patch;patch=1 \
+           "
 
-SRC_URI += " file://plucker-no-host-includes.patch;patch=1"
 PARALLEL_MAKE=""
 EXTRA_OEMAKE="RANLIB=${RANLIB}"
 
-PR = "r2"
-
-- 
1.6.1



