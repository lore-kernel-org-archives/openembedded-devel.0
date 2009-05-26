Received: from [213.230.128.226] (helo=fep03-svc.tim.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1M945X-0008EP-Vt
	for openembedded-devel@openembedded.org; Tue, 26 May 2009 23:21:36 +0200
Received: from deunan.loc ([217.203.151.193]) by fep03-svc.tim.it
	(InterMail vM.6.01.06.03 201-2131-130-104-20060516) with ESMTP
	id <20090526201858.CRTL18645.fep03-svc.tim.it@deunan.loc>
	for <openembedded-devel@openembedded.org>;
	Tue, 26 May 2009 22:18:58 +0200
Message-ID: <4A1C4DB6.6080005@gremlin.it>
Date: Tue, 26 May 2009 22:14:46 +0200
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: [PATCH] kaeilos.conf and SPLASH
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
X-List-Received-Date: Tue, 26 May 2009 21:21:36 -0000
Content-Type: multipart/mixed; boundary="------------060807060806030206000601"

--------------060807060806030206000601
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Make kaeilos.conf be aware of the new SPASH variable used in images recipes.

At least it make bitbake start work, as soon as build the x11-image I'll 
check if also the image is working proper

Alessandro

-- 
  /------------------------------------------------\
|     Alessandro Gardich : gremlin#gremlin!it      |
  >------------------------------------------------<
|  I never saw a wild thing sorry for itself.      |
|  A small bird will drop frozen dead from a bough |
|  without ever having felt sorry for itself.      |
  \------------------------------------------------/

diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index 718239b..6d01c77 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -209,12 +209,12 @@ DEBUG_APPS += '${@base_conditional("DISTRO_TYPE", "release", "", "strace procps"
 # contains ipkg specific stuff as well :(
 DISTRO_EXTRA_RDEPENDS += "\
     update-modules \
-    ${@base_contains("MACHINE_FEATURES", "screen", "psplash", "",d)} \   
     kaeilos-version \
     opkg-nogpg opkg-collateral ${ANGSTROM_FEED_CONFIGS} \
     util-linux-ng-mount util-linux-ng-umount \
     ${DEBUG_APPS} angstrom-libc-fixup-hack \
     "
+#   ${@base_contains("MACHINE_FEATURES", "screen", "psplash", "",d)} \   
 
 # This also hooks into task-base, but isn't mandatory.
 # If you don't want parts of this in your task-base using images you can put this in the image recipe:
@@ -233,5 +233,7 @@ DISTRO_EXTRA_RRECOMMENDS += " \
     openssh-sftp-server \
     "
 
+SPLASH ?= "psplash"
+
 ARM_INSTRUCTION_SET_pn-uclibc = "arm"
 ARM_INSTRUCTION_SET_pn-uclibc-initial = "arm"

--------------060807060806030206000601--
