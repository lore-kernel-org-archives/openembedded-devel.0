Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukasmaerdian@googlemail.com>) id 1QF9hn-00063k-7n
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Apr 2011 20:43:19 +0200
Received: by bwz5 with SMTP id 5so1837353bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2011 11:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	bh=SfvyTsSvwWjriy2qZHYpS2UhYPdMdDmKoT1/aX/h5/A=;
	b=Yls/XtK99PDDcBgbWWDmX3xbjJHyQ1ptjbNb2JXlOeFfmm9GyTn48e6ug8atKThWvx
	6oHsm1k9t1uVlf6w18o/zYyA0jGYXxvgtGn/BF3YrNY4SBmD/PGP0VSMMYlZwlbdAvc1
	ctvlb+8jxXqvAI5Z0Q8KK5hAhLGe009zPFCpE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=jSdUykcajfAAVd5ZHgWO95YRj6qLLRGI6u3gz74xGOjALpBa2WSmNrNFXxUPmx600r
	cN2JB0B54dKbxVcwVKWHVysH0AKqDRZ19vMk4LxzbaMm4fPkIZDsDTCf1Jw+3gOW7FtC
	ydrODogNpKodod/TKlgp+uDM7kaIYezcTkx0A=
Received: by 10.204.136.1 with SMTP id p1mr612833bkt.105.1303929648021;
	Wed, 27 Apr 2011 11:40:48 -0700 (PDT)
Received: from localhost.localdomain
	(ppp-188-174-68-179.dynamic.mnet-online.de [188.174.68.179])
	by mx.google.com with ESMTPS id q24sm585823bks.9.2011.04.27.11.40.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Apr 2011 11:40:45 -0700 (PDT)
From: "=?UTF-8?q?Lukas=20M=C3=A4rdian?=" <lukasmaerdian@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2011 20:40:32 +0200
Message-Id: <1303929633-1636-1-git-send-email-lukasmaerdian@gmail.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukasmaerdian@gmail.com>
Subject: [PATCH 1/2] shr-e-gadgets: bump SRCREV and PR
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
X-List-Received-Date: Wed, 27 Apr 2011 18:43:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this adds a new e-gadget: battery-fso
* battery-fso is an alternative battery gadget, which uses fsodeviced as data source

Signed-off-by: Lukas Märdian <lukasmaerdian@gmail.com>
---
 recipes/shr/shr-e-gadgets_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/shr/shr-e-gadgets_git.bb b/recipes/shr/shr-e-gadgets_git.bb
index acb56b4..418d99a 100644
--- a/recipes/shr/shr-e-gadgets_git.bb
+++ b/recipes/shr/shr-e-gadgets_git.bb
@@ -5,9 +5,9 @@ DEPENDS = "e-wm"
 RDEPENDS_${PN} = "e-wm"
 SECTION = "x11/application"
 
-SRCREV = "5c9d0f8f778565f3ae69e45b8c35b04529156345"
+SRCREV = "6db7db75a77f611665e33f777ec407428f1488eb"
 PV = "0.0.0+gitr${SRCPV}"
-PR = "r10"
+PR = "r11"
 
 inherit autotools
 
-- 
1.7.1



