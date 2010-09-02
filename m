Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Or0bF-0003qU-Qx
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 05:36:35 +0200
Received: by pzk2 with SMTP id 2so3247036pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 20:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=VW61b6Z2wpzELPZdEbvvxrFBsrLA9xWj/Fs/3n798bk=;
	b=KNVUDCpp1eSxZR3f5XoUSY0urCeFkkBIdbdhJmTi1n6ZrJlv3TEWCl4Foqc2k6PuWW
	pE0OuriMm89oggv4RWu1IADrbXijZgKdkxgkI0KnpFxTzggVcTsbYr5wPusAzKrsFjj4
	zpFuUMwu6ejh97fEmT8nLoHSMW9Hf1oUxkYzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=vAmSzLTifNqAMi6VuYcUu8oGw9VqhffBujfaITxHmkm7oiDjkm6yIbY5+nwyTkPQbk
	1WOPuVo25Aro3h1q9hLv6RNxAxTtbEYp4iz0KkxSyAork8Sqmh3Bhom8oq9DgIEk3X9U
	XATtKpxxr9ICBY+l4YvsUniYrIFjBmB7tp/74=
Received: by 10.114.135.11 with SMTP id i11mr3669566wad.2.1283398544390;
	Wed, 01 Sep 2010 20:35:44 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q6sm19824976waj.10.2010.09.01.20.35.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Sep 2010 20:35:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Sep 2010 20:35:38 -0700
Message-Id: <1283398538-3325-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] preferred-xorg-versions-X11R7.5-latest.inc, preferred-xorg-versions-X11R7.5.inc: Bump pinned versions of lndir and libxvmc
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
X-List-Received-Date: Thu, 02 Sep 2010 03:36:35 -0000

* The already pinned versions of these packages are in obsolete
  therefore pin something thats available and supported.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../preferred-xorg-versions-X11R7.5-latest.inc     |    2 +-
 .../include/preferred-xorg-versions-X11R7.5.inc    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
index a8e0e49..3c9aac0 100644
--- a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
+++ b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
@@ -121,6 +121,6 @@ PREFERRED_VERSION_xproxymanagementprotocol ?= "1.0.3"
 #util
 PREFERRED_VERSION_gccmakedep ?= "1.0.2"
 PREFERRED_VERSION_imake ?= "1.0.2"
-PREFERRED_VERSION_lndir ?= "1.0.1"
+PREFERRED_VERSION_lndir ?= "1.0.2"
 PREFERRED_VERSION_xorg-cf-files ?= "1.0.3"
 #xserver
diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.5.inc b/conf/distro/include/preferred-xorg-versions-X11R7.5.inc
index 625213a..997db27 100644
--- a/conf/distro/include/preferred-xorg-versions-X11R7.5.inc
+++ b/conf/distro/include/preferred-xorg-versions-X11R7.5.inc
@@ -221,7 +221,7 @@ PREFERRED_VERSION_libxt ?= "1.0.7"
 PREFERRED_VERSION_libxt-native ?= "1.0.7"
 PREFERRED_VERSION_libxtst ?= "1.1.0"
 PREFERRED_VERSION_libxv ?= "1.0.5"
-PREFERRED_VERSION_libxvmc ?= "1.0.5"
+PREFERRED_VERSION_libxvmc ?= "1.0.6"
 PREFERRED_VERSION_libxxf86dga ?= "1.1.1"
 PREFERRED_VERSION_libxxf86vm ?= "1.1.0"
 PREFERRED_VERSION_libdmx ?= "1.1.0"
-- 
1.7.1



