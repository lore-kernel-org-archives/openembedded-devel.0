Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9Mz9-000880-Nk
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 21:45:51 +0100
Received: by mail-wi0-f171.google.com with SMTP id hj13so2594716wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=sY+DBRw7Twtn9e5FXCvjW7WDtBfPsED53IpW4FIifjE=;
	b=lzNbgaB2fLug8VC7SU/km/tHrmi6KHsDJp9Ky871qb1d+DZR6Lq00okJfcmeFKHvTc
	TyDc6Sv+PYq3gQcFJJWLdV0JD6kq58b/b0bzpgL0WU3B9Z64DVFVXeQDvT28ob6X4wDO
	pQPNH3PLyV/kdqoGS0WA20K4TofovTMwPjrIAL5ELwADaT+fORMY9Hkev8cJQG39p3JO
	fFD9YCAaa/6YuK13aiu8TDUKE80RcRR5yBUZ+lQ2ywpAEnbgkyFryCXPUjgWQWvlzaXt
	aAyheZNaeJbv4r7aLS291LxaOB1wgXymsED8nXfaWl1s/bo2yDi81GKgBoGMy+keyFQe
	vmiQ==
Received: by 10.180.19.37 with SMTP id b5mr14488045wie.9.1332103023591;
	Sun, 18 Mar 2012 13:37:03 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D2E.dip.t-dialin.net.
	[79.223.13.46])
	by mx.google.com with ESMTPS id l5sm19761891wia.11.2012.03.18.13.37.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 13:37:01 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 21:40:54 +0100
Message-Id: <1332103254-3729-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 6/6] task-xfce-extended: add xfmpc, xfce4-mpc-plugin and xfce4-mixer
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
X-List-Received-Date: Sun, 18 Mar 2012 20:45:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
index 2dbd9f0..7bbc7fd 100644
--- a/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/tasks/task-xfce-extended.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-PR = "r1"
+PR = "r2"
 
 inherit task
 
@@ -33,8 +33,11 @@ RRECOMMENDS_${PN} = " \
     xfce4-diskperf-plugin \
     xfce4-netload-plugin \
     xfce4-genmon-plugin \
+    xfce4-mpc-plugin \
     \
     xfce4-appfinder \
     xfce4-screenshooter \
+    xfce4-mixer \
+    xfmpc \
     ristretto \
 "
-- 
1.7.4.4



