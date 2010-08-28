Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxl-0001qz-Uk
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:19 +0200
Received: by pxi11 with SMTP id 11so1624265pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=VPL/ajosdmdB5rtI/mIOhx0eKNzlg9UouXgi0pT93gk=;
	b=UbmbJCSMgNIkndU4qkfwRcvp8fQErUSgmN5Ee+MR6VV+Wh3EBjGh9fgg+BPm1qC5GA
	1iw/VlipzcrkGvS7RWAYrb/4Gq7REnRoKm1qa3YjxgyT53veKqaci6hOF6YDUYdXQ3yE
	3IcpiXnvx7vy6aXAu6O1L04/Nnf7A8N1r8EV0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UQZyu4DQthxK9H2gOa1C/o91RyhWY3L8xrb8eFNVRyDL6x4xYbegS4ki8CM48wkLgR
	nOGXhhmmxi0mCaAIgO6AeloCVG4MmNd8IhIKkVS9SrP5Gj47TPejNo7iczUFX9Ftk34r
	h0Zlj6LB1uq/iSupQPEQ7N+MRPaDJYpwtz6dA=
Received: by 10.142.232.13 with SMTP id e13mr2770805wfh.87.1283027086092;
	Sat, 28 Aug 2010 13:24:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:12 -0700
Message-Id: <1283027073-12308-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	TVD_SPACE_RATIO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 02/23] clutter_0.6svn.bb, clutter-gtk-0.6_git.bb: Unused and unbuildable for long hence removed.
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/clutter/clutter-gtk-0.6_git.bb |   10 ----------
 recipes/clutter/clutter_0.6svn.bb      |   10 ----------
 2 files changed, 0 insertions(+), 20 deletions(-)
 delete mode 100644 recipes/clutter/clutter-gtk-0.6_git.bb
 delete mode 100644 recipes/clutter/clutter_0.6svn.bb

diff --git a/recipes/clutter/clutter-gtk-0.6_git.bb b/recipes/clutter/clutter-gtk-0.6_git.bb
deleted file mode 100644
index e37c4c9..0000000
--- a/recipes/clutter/clutter-gtk-0.6_git.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter-gtk.inc
-
-SRCREV = "2ba362a1a223c2b28541030a80aa11191615340a"
-PV = "0.6.0+git${SRCREV}"
-
-DEPENDS += "clutter-0.6"
-
-SRC_URI = "git://git.clutter-project.org/clutter-gtk.git;protocol=git;branch=clutter-gtk-0-6"
-
-S = "${WORKDIR}/git"
diff --git a/recipes/clutter/clutter_0.6svn.bb b/recipes/clutter/clutter_0.6svn.bb
deleted file mode 100644
index e86cbaf..0000000
--- a/recipes/clutter/clutter_0.6svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require clutter.inc
-
-PV = "0.6.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-SRCREV = "3240"
-
-SRC_URI = "svn://svn.o-hand.com/repos/clutter/branches;module=clutter-0-6;proto=http \
-	   file://enable_tests-0.6.patch "
-
-S = "${WORKDIR}/clutter-0-6"
-- 
1.7.1



