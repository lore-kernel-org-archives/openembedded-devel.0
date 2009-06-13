Received: from [151.189.21.47] (helo=mail-in-07.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1MFJ2s-0004n4-To
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Jun 2009 04:32:38 +0200
Received: from mail-in-07-z2.arcor-online.net (mail-in-07-z2.arcor-online.net
	[151.189.8.19]) by mx.arcor.de (Postfix) with ESMTP id A59CF3CA1CD;
	Sat, 13 Jun 2009 04:22:39 +0200 (CEST)
Received: from mail-in-02.arcor-online.net (mail-in-02.arcor-online.net
	[151.189.21.42])
	by mail-in-07-z2.arcor-online.net (Postfix) with ESMTP id 9D6DD2C712F; 
	Sat, 13 Jun 2009 04:22:39 +0200 (CEST)
Received: from localhost.localdomain (p3077-ipngn201marunouchi.tokyo.ocn.ne.jp
	[114.177.118.77]) (Authenticated sender: leggewie@arcor.de)
	by mail-in-02.arcor-online.net (Postfix) with ESMTPSA id 711623FE2D7;
	Sat, 13 Jun 2009 04:22:38 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-02.arcor-online.net 711623FE2D7
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jun 2009 11:22:33 +0900
Message-Id: <1244859753-28054-1-git-send-email-no2spam@nospam.arcornews.de>
X-Mailer: git-send-email 1.6.0.4
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: [PATCH] preferred-xorg-versions-X11R7.4.inc: pin xextproto-native and xtrans-native
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
X-List-Received-Date: Sat, 13 Jun 2009 02:32:39 -0000

From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>

This file is sourced by the jlime, kaleios and minimal distribution.

Pin down
* xextproto-native: 7.0.3
* xtrans: 1.2.1

These are the latest two versions to successfully compile in the Xorg 7.4 context.
Others require a more recent xorg-macros.m4.

http://tinderbox.openembedded.net/builds/158904/
http://tinderbox.openembedded.net/builds/159024/
---
 .../include/preferred-xorg-versions-X11R7.4.inc    |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
index 46fa8d4..21f9758 100644
--- a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
+++ b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
@@ -195,6 +195,7 @@ PREFERRED_VERSION_xtrans ?= "1.2.1"
 # This should be here but is needed until bitbake can do
 # versioned depends
 PREFERRED_VERSION_mesa ?= "7.2"
+PREFERRED_VERSION_xtrans-native ?= "1.2.1"
 
 # proto
 PREFERRED_VERSION_applewmproto ?= "1.0.3"
@@ -218,6 +219,7 @@ PREFERRED_VERSION_videoproto ?= "2.2.2"
 PREFERRED_VERSION_windowswmproto ?= "1.0.3"
 PREFERRED_VERSION_xmiscproto ?= "1.1.2"
 PREFERRED_VERSION_xextproto ?= "7.0.3"
+PREFERRED_VERSION_xextproto-native ?= "7.0.3"
 PREFERRED_VERSION_xf86dgaproto ?= "2.0.3"
 PREFERRED_VERSION_xf86driproto ?= "2.0.4"
 PREFERRED_VERSION_xf86miscproto ?= "0.9.2"
-- 
1.6.0.4



