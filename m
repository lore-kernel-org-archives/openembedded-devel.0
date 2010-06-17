Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OPNov-0006de-Ak
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 00:44:27 +0200
Received: by pxi3 with SMTP id 3so199329pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=t+PDGGvRhSyDdGNNUE4w0obFeqvDUjWAwcQ/qv14OkY=;
	b=YwnSqq7KjTqBZTu9jggfiP6lD2EfgLHgPIqGOcHdR7IxJemJNs8KdVtvkLYAKTfaSx
	ofTfliXOd1WEtgctAmlIyB3PvFZTELBQanYmSgbAYEmBBU8IfwQM3ueAXBFRgm16Alg0
	R/tx5zt8glcqKHcyEoXpLgBCPZw1Ca/l97Avg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=DYjdI/t2zrJmrNAci6IoyGLmwkUJWlrnwqYKG9ca8cXolAUXqtBWfOT8HBQ1p4NBfr
	iwPHePFSQgKL3L47Zpq4UP75ANbUuBCLpVVvAcKLFVfvLg4UhHj+En7Zj1abpIkTV86x
	fMqXntcguNMVvPfAqSu68JCn6/ockDV3qyVE4=
Received: by 10.114.248.20 with SMTP id v20mr163311wah.65.1276814387042;
	Thu, 17 Jun 2010 15:39:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c22sm100490110wam.6.2010.06.17.15.39.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 17 Jun 2010 15:39:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Jun 2010 15:39:39 -0700
Message-Id: <1276814379-13161-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276814379-13161-1-git-send-email-raj.khem@gmail.com>
References: <1276814379-13161-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] libx11_1.3.2.bb: Work around the gcc 4.5 ICE on thumb.
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
X-List-Received-Date: Thu, 17 Jun 2010 22:44:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/xorg-lib/libx11_1.3.2.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes/xorg-lib/libx11_1.3.2.bb b/recipes/xorg-lib/libx11_1.3.2.bb
index 291486b..7faf679 100644
--- a/recipes/xorg-lib/libx11_1.3.2.bb
+++ b/recipes/xorg-lib/libx11_1.3.2.bb
@@ -5,7 +5,7 @@ DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 PROVIDES = "virtual/libx11"
 PE = "1"
-PR = "r4"
+PR = "r5"
 
 XORG_PN = "libX11"
 
@@ -19,7 +19,12 @@ EXTRA_OECONF += "--without-xcb --with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.
 # see http://gcc.gnu.org/PR42981 for further details.
 # We could potentially take it off when its fixed in gcc 4.5
 
-CFLAGS_append_arm = " -fforward-propagate "
+# gcc 4.5 has this bug on thumb
+# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44557
+# so add -fomit-frame-pointer
+# this should be removed once the above bug is fixed
+
+CFLAGS_append_arm = " -fforward-propagate -fomit-frame-pointer"
 
 do_compile() {
 	(
-- 
1.7.1



