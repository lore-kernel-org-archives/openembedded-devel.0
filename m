Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HzD2e-0002jK-5U
	for openembedded-devel@openembedded.org; Fri, 15 Jun 2007 16:44:48 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HzCwx-00008S-FL
	for openembedded-devel@openembedded.org; Fri, 15 Jun 2007 16:38:55 +0200
Received: from c-134-232-252.f.dsl.de.ignite.net ([62.134.232.252])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 15 Jun 2007 16:38:55 +0200
Received: from no2spam by c-134-232-252.f.dsl.de.ignite.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 15 Jun 2007 16:38:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 15 Jun 2007 16:26:39 +0200
Message-ID: <f4u7j0$ogd$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: c-134-232-252.f.dsl.de.ignite.net
User-Agent: Thunderbird 1.5.0.12 (X11/20070604)
Sender: news <news@sea.gmane.org>
Subject: ANN: OE, qemu-native and gcc4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2007 14:44:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

after a brief consultation with psokolovsky on IRC I have taken the
liberty to apply the patch below (I think attachments to the list are
filtered) which is essentially
http://bugs.openembedded.org/attachment.cgi?id=1362 from bug 2157. 
Applying this patch enables compilation of qemu-native with gcc4.  The
revision where this was applied is 20f86cced0cd0f3af307002570f8505ef976e07a.

This is a pretty intrusive patch but it has been tested out by me and
others for quite some time now.  Furthermore, qemu-gcc-4-all.patch is
from upstream busybox project and thus believed to be correct for both
gcc3 & 4.  Should you face any issues, report them here or via the
bugtracker #2157.

Regards

Rolf



# old_revision [8b898d0942d30145271bb483305009e42605dbdd]
#
# patch "packages/qemu/qemu-qop-nogfx-native_svn.bb"
#  from [5b3231dfc660361ef1f0c0e31db16d1edf5b82cf]
#    to [7f715692875ab4ee00b652ff1e640a7074c07021]
#
# patch "packages/qemu/qemu_cvs.bb"
#  from [382c1faeff834d51e44b3b373e98fbd18d809d85]
#    to [a1c43b431c24813b3186b20f390639c0b6b2fb4c]
#
============================================================
--- packages/qemu/qemu-qop-nogfx-native_svn.bb 
5b3231dfc660361ef1f0c0e31db16d1edf5b82cf
+++ packages/qemu/qemu-qop-nogfx-native_svn.bb 
7f715692875ab4ee00b652ff1e640a7074c07021
@@ -1,9 +1,10 @@ SRC_URI = "svn://nowt.dyndns.org/svn/qem
 LICENSE = "GPL"
 PV = "0.8.0+svn${SRCDATE}"
 PROVIDES = "qemu-native"

 SRC_URI = "svn://nowt.dyndns.org/svn/qemu;module=trunk;proto=https \
            file://configure.patch;patch=1 \
+          
http://www.busybox.net/downloads/qemu/qemu-gcc-4-all.patch;patch=1 \
            "

 S = "${WORKDIR}/trunk"
============================================================
--- packages/qemu/qemu_cvs.bb   382c1faeff834d51e44b3b373e98fbd18d809d85
+++ packages/qemu/qemu_cvs.bb   a1c43b431c24813b3186b20f390639c0b6b2fb4c
@@ -14,8 +14,11 @@ SRC_URI = "cvs://anonymous@cvs.savannah.
            file://compiler.patch;patch=1 \
            file://qemu-usb-wacom-0.8.2.patch;patch=1 \
            file://qemu-usb-wacom-pressure.patch;patch=1 \
-           file://qemu-usb-wacom-buttons.patch;patch=1"
+           file://qemu-usb-wacom-buttons.patch;patch=1 \
+          
http://www.busybox.net/downloads/qemu/qemu-gcc-4-all.patch;patch=1"
 S = "${WORKDIR}/qemu"

+EXTRA_OECONF="--disable-gcc-check"
+
 inherit autotools



