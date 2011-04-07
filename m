Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q7pAG-00027A-Tn
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 15:22:25 +0200
Received: by mail-gx0-f175.google.com with SMTP id 3so462376gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=j1j/QOifspDcNqC9IqjRw4zQYS1UKBpUyz2/FbhLNrg=;
	b=TxZIZg7Q/fliiD+FkUKaqy60pFdgBY9uVteDj3H0WepG2cPJxcwfMu2ZAxEdCmeHPt
	tJqGdd8bZrHnj2um3QCVdoTYdNUWB1jI7QrF7dGqReKZ+8fBAhCLgJNuqXkTkE/Y4ZdA
	mM4UL+EvBc3CIenidiSWcZ3ostutrD+RGfUzc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Lj/WfZPKA6LAnyp/EmR7R6w4YiHNnIe7IgVjFlUv97MsdHqBQ0p+zlVP3eQofTz/Uh
	lmsh0chALUXVPAVev41+v50pSWplqvx2EdBm1Mw19CxiX2JFpxVqzJEvOIq2+UbChwmA
	qy5AUSQzQ9YoAfTH7R22Up4b7Az63QF9+D4cc=
Received: by 10.236.150.212 with SMTP id z60mr1080195yhj.139.1302182419105;
	Thu, 07 Apr 2011 06:20:19 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l43sm726453yhn.36.2011.04.07.06.20.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 06:20:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:19:53 +0000
Message-Id: <1302182396-4171-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
References: <1302182396-4171-1-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-2-git-send-email-otavio@ossystems.com.br>
	<1302182396-4171-3-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Thu, 07 Apr 2011 13:22:25 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/xorg-xserver/xorg-xserver-common.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-xserver/xorg-xserver-common.inc b/recipes/xorg-xserver/xorg-xserver-common.inc
index 29e3b10..8f59b0b 100644
--- a/recipes/xorg-xserver/xorg-xserver-common.inc
+++ b/recipes/xorg-xserver/xorg-xserver-common.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 PROVIDES = "virtual/xserver"
 
@@ -108,4 +108,5 @@ FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
 
 do_install_append () {
 	ln -sf ${datadir}/fonts/X11 ${D}/${libdir}/X11/fonts
+	find ${D}/${libdir} -name '*.la' -exec rm '{}' ';'
 }
-- 
1.7.2.3



