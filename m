Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OSUJd-0001Om-Cl
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jun 2010 14:16:58 +0200
Received: by fxm1 with SMTP id 1so2843584fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jun 2010 05:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=HoS/CDbGnDKtFHXzkLAssuV/lQVRgqMaXng7eKvIx3Q=;
	b=rMfKL/0Gd8d3YoC6pNJFRfpktHM/Eahao7HcAPmj12Pucnd9nmDV5cW5haGe1bPCih
	uW9zGR8vRt98HBZExrH0aa0zw40krHXg5oZZ91YtbaOvWWIX+Y2xcbokereFsWYBTNOP
	9Dnx9df+Gm+9+Rgcw2jTOmQVadUK4CQRhrkpk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tFHFE8+9uHt1E8L9L4ZL9KWzXpcnBwrF495LjSuZfn0n/Crv9T0q5Nr38KlBq1NmuC
	EB58BwXU5qUnBgNFeicOiZBJ1uvyIqegRhwwVuhUed3ud0Uj2YHr3Whb1NGe5fuag/ZP
	cbWnqpuZmMmDoi6OuOajZXAVhXf14ZtZXczl0=
Received: by 10.223.25.74 with SMTP id y10mr1641355fab.81.1277554336960;
	Sat, 26 Jun 2010 05:12:16 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm40278947fav.25.2010.06.26.05.12.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 26 Jun 2010 05:12:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Jun 2010 14:11:45 +0200
Message-Id: <1277554305-25541-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20100626120314.GL17650@jama>
References: <20100626120314.GL17650@jama>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] matchbox-keyboard*: drop RPROVIDES
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
X-List-Received-Date: Sat, 26 Jun 2010 12:16:58 -0000

* RCONFLICTS is enough to block packages providing conflicting files
* distributions can still decide if they need only some or all 3 parts of
  matchbox-keyboard-inputmethod or if matchbox-keyboard (like
  matchbox-keyboard-inputmethod package but without Xsession script) is enough

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../matchbox-keyboard-inputmethod_svn.bb           |    3 +--
 recipes/matchbox-keyboard/matchbox-keyboard_svn.bb |    3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb b/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
index bbe8874..f8822e7 100644
--- a/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
+++ b/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
@@ -2,11 +2,10 @@ DESCRIPTION = "Matchbox virtual keyboard for X11"
 LICENSE = "GPL"
 DEPENDS = "libfakekey expat libxft gtk+ matchbox-panel-2"
 RCONFLICTS_${PN} = "matchbox-keyboard"
-RPROVIDES_${PN} = "matchbox-keyboard"
 SECTION = "x11"
 SRCREV = "1910"
 PV = "0.0+svnr${SRCPV}"
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-keyboard;proto=http \
 	    file://smallscreen-fontsize.patch \
diff --git a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb b/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
index 28e3ac7..28d8035 100644
--- a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
+++ b/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
@@ -2,11 +2,10 @@ DESCRIPTION = "Matchbox virtual keyboard for X11"
 LICENSE = "GPL"
 DEPENDS = "libfakekey expat libxft"
 RCONFLICTS_${PN} = matchbox-keyboard-inputmethod
-RPROVIDES_${PN} = matchbox-keyboard-inputmethod
 SECTION = "x11"
 SRCREV = "1910"
 PV = "0.0+svnr${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=${PN};proto=http \
            file://smallscreen-fontsize.patch \
-- 
1.7.1



