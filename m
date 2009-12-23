Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NNZoZ-0007sY-8K
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 23:36:22 +0100
Received: by gxk7 with SMTP id 7so16258487gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 14:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=3VnkUvBktMyxGB7gkSFu9k12Kvca7u7/BMttsCULop8=;
	b=xVAJSf4M+2LGVdNrSOdaTjRhKQz3qLHjsl9QbGBPAQ+EurZI46DwPkBIk7qc4SsOeP
	7Mkfp1Wqqx7F3/RqRRRKZGZgsFydLbfW30Na8AXGka3+t62fBS66v38aJePowTLnwY/I
	Idn2J23KZkBy+WWS10/ALsnawZHlyz+5zv1Ec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FG/CDRbWifYmyqb1jPHu2lUFURLJQsm8yVe13wWDARXjd+F6rs+Aa2FwjZgj4Qlo+l
	KP7rDb4LsY+C0JTf3OddrjBFtM0qs1FM3bbuuUZqBPy6d9OECH/sdI5jcfcngTk3pG4l
	dD0+3tjfO1qTjENv/nYS8GQ6ug0hoB+sNyCM8=
Received: by 10.90.134.20 with SMTP id h20mr3706009agd.30.1261607665768;
	Wed, 23 Dec 2009 14:34:25 -0800 (PST)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 15sm3421102yxh.58.2009.12.23.14.34.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 23 Dec 2009 14:34:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Dec 2009 14:34:14 -0800
Message-Id: <1261607654-12015-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] minimal.conf: Add PREFERRED_PROVIDER for opkg and update-alternatives.
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
X-List-Received-Date: Wed, 23 Dec 2009 22:36:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/minimal.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 00397db..ad89611 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -99,6 +99,9 @@ require conf/distro/include/preferred-opie-versions-1.2.4.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.4-updates.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.4.inc
 
+PREFERRED_PROVIDER_opkg ?= "opkg-nogpg"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-nogpg"
+
 #############################################################################
 # CONTENTS
 #############################################################################
-- 
1.6.3.3



