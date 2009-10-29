Received: from [195.64.66.119] (helo=mx1.grimmerink.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1N3Vy5-0002Kv-E8
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Oct 2009 15:27:16 +0100
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id BAA716A0D1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2009 15:26:05 +0100 (CET)
From: pieterg <pieterg@gmx.com>
Date: Thu, 29 Oct 2009 15:23:45 +0100
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Message-Id: <200910291523.45611.pieterg@gmx.com>
X-SA-Exim-Connect-IP: 195.64.66.119
X-SA-Exim-Mail-From: pieterg@gmx.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] fix libxext-native_1.0.5 dependencies
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
X-List-Received-Date: Thu, 29 Oct 2009 14:27:16 -0000
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

---

The only available libxext-native version is 1.0.5 at the moment, 
and that version requires xextproto >= 7.0.5, and libx11 >= 1.1.99.1
So in order to allow libxext-native to be built with X11R7.4, the following 
changes would be required.

I think it is relatively harmless, because it only affects native stuff. 
But I must admit my build doesn't require lots of x11-native stuff (apart 
from libxext), so I'm not 100% certain libx11-native_1.2 won't cause 
problems for other x11-native stuff.

 conf/distro/include/preferred-xorg-versions-X11R7.4.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc 
b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
index 156653f..ac0f6e4 100644
--- a/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
+++ b/conf/distro/include/preferred-xorg-versions-X11R7.4.inc
@@ -160,7 +160,7 @@ PREFERRED_VERSION_libfontenc ?= "1.0.4"
 PREFERRED_VERSION_libsm ?= "1.1.0"
 PREFERRED_VERSION_libwindowswm ?= "1.0.0"
 PREFERRED_VERSION_libx11 ?= "1.1.5"
-PREFERRED_VERSION_libx11-native ?= "1.1.1"
+PREFERRED_VERSION_libx11-native ?= "1.2"
 PREFERRED_VERSION_libxau ?= "1.0.4"
 PREFERRED_VERSION_libxaw ?= "1.0.4"
 PREFERRED_VERSION_libxcomposite ?= "0.4.0"
@@ -220,7 +220,7 @@ PREFERRED_VERSION_videoproto ?= "2.2.2"
 PREFERRED_VERSION_windowswmproto ?= "1.0.3"
 PREFERRED_VERSION_xmiscproto ?= "1.1.2"
 PREFERRED_VERSION_xextproto ?= "7.0.3"
-PREFERRED_VERSION_xextproto-native ?= "7.0.3"
+PREFERRED_VERSION_xextproto-native ?= "7.0.5"
 PREFERRED_VERSION_xf86dgaproto ?= "2.0.3"
 PREFERRED_VERSION_xf86driproto ?= "2.0.4"
 PREFERRED_VERSION_xf86miscproto ?= "0.9.2"
-- 
1.6.5.rc1.44.ga1675


