Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LXlKl-0004yL-Py
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 00:51:08 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id DCC3C4025B;
	Thu, 12 Feb 2009 19:50:03 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 58636740D9;
	Thu, 12 Feb 2009 21:50:02 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 3BB186101F6; Thu, 12 Feb 2009 21:49:50 -0200 (BRST)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-6-git-send-email-otavio@ossystems.com.br>
	<1234456715-23618-7-git-send-email-otavio@ossystems.com.br>
	<gn1maj$5tl$6@ger.gmane.org>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Thu, 12 Feb 2009 21:49:50 -0200
In-Reply-To: <gn1maj$5tl$6@ger.gmane.org> (Koen Kooi's message of "Thu, 12 Feb
	2009 18:29:54 +0100")
Message-ID: <87tz6zmd0h.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 6/6] flash-plugin: add 10.0.12.36
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
X-List-Received-Date: Thu, 12 Feb 2009 23:51:08 -0000
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 12-02-09 17:38, Otavio Salvador wrote:
>> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
>
>> +	cat>>  ${libdir}/X11/fonts/misc/fonts.alias<<_PUNT
>
> Won't that append to the file each time the package gets upgraded?

From what I can tell it is indeed not required; I've droped it and if I
discover any regression due that I can readd it later.

Please ack of rest looks OK.


-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."

--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=0006-flash-plugin-add-10.0.12.36.patch

From 154836cb8881eb56197b8fa1dec956d0408463a9 Mon Sep 17 00:00:00 2001
From: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 10 Feb 2009 15:47:04 -0200
Subject: [PATCH 6/6] flash-plugin: add 10.0.12.36

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/bitbake.conf                               |    1 +
 conf/checksums.ini                              |    5 +++
 packages/adobe-flash/flash-plugin_10.0.12.36.bb |   35 +++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 packages/adobe-flash/flash-plugin_10.0.12.36.bb

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 81d4c93..a86317c 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -494,6 +494,7 @@ FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
 GENTOO_MIRROR = "http://distro.ibiblio.org/pub/linux/distributions/gentoo/distfiles"
 APACHE_MIRROR = "http://www.apache.org/dist"
 KERNELORG_MIRROR = "http://kernel.org"
+ADOBE_MIRROR = "http://fpdownload.macromedia.com/get/flashplayer/current/"
 
 # You can use the mirror of your country to get faster downloads by putting
 #  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
diff --git a/conf/checksums.ini b/conf/checksums.ini
index 4742b61..a4e7ff3 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5494,6 +5494,10 @@ sha256=ce4f7d11b3c04a7368c916ca4abc284dd0c0256f461dfb7f07df1ab445e7a5c0
 md5=2bfc127cdda02834d0491ab531a20960
 sha256=ce4f7d11b3c04a7368c916ca4abc284dd0c0256f461dfb7f07df1ab445e7a5c0
 
+[http://fpdownload.macromedia.com/get/flashplayer/current//flash-plugin-10.0.12.36-release.i386.rpm]
+md5=8845d4536fcd3a329690c93bce9bbf8e
+sha256=c7345faf10b269b3556f2e1373c4afc35f08891f8bbd54e45d49151a8c8e4ac0
+
 [http://downloads.sourceforge.net/flex/flex-2.5.31.tar.bz2]
 md5=363dcc4afc917dc51306eb9d3de0152f
 sha256=701353279a17655d78e3b3678ad78d0375f5bf45877ad8b3507d589c42427f26
@@ -25249,3 +25253,4 @@ sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
 [http://heanet.dl.sourceforge.net/zziplib/zziplib-0.13.49.tar.bz2]
 md5=5f7b88ebb2bcd7e8044328482d079661
 sha256=f57c4e33eb2cdd87a6c2f01bfa4794340fbe61ea1a1cfc7dac3b6671e1dd22af
+
diff --git a/packages/adobe-flash/flash-plugin_10.0.12.36.bb b/packages/adobe-flash/flash-plugin_10.0.12.36.bb
new file mode 100644
index 0000000..d6cde60
--- /dev/null
+++ b/packages/adobe-flash/flash-plugin_10.0.12.36.bb
@@ -0,0 +1,35 @@
+# Adobe provides two versions of flash player packages
+#
+# One "unversioned" download at :
+#
+#     ${ADOBE_MIRROR}/install_flash_player_9_linux.tar.gz
+#
+# And the other, versioned, which is encapsulated in RPM.
+#
+# We use the versioned one to make sure we can keep track of the
+# version and thus do repeatable builds at the cost of future download
+# failures when adobe updates.
+DESCRIPTION = "Adobe Flash 9 plugin for Mozilla/Firefox web browsers"
+LICENSE = "AdobeFlash"
+DEPENDS = "rpm2cpio-native"
+PR = "r1"
+
+SRC_URI = "${ADOBE_MIRROR}/flash-plugin-${PV}-release.i386.rpm"
+
+do_configure() {
+        rpm=${WORKDIR}/flash-plugin-${PV}-release.i386.rpm
+        if [ -f "$rpm" ]; then
+                rpm2cpio.pl $rpm | cpio -id
+                find . -type f -exec mv -i {} "`pwd`" \;
+        fi
+}
+do_install() {
+        mkdir -p ${D}${libdir}/mozilla/plugins/
+        install -m 0755 libflashplayer.so ${D}${libdir}/mozilla/plugins/
+        # AFAIK this is not needed
+        # install -m 0644 flashplayer.xpt ${D}${libdir}/mozilla/plugins/
+}
+
+FILES_${PN} = "${libdir}/* ${libdir}/X11/*"
+
+COMPATIBLE_HOST = "i.86.*-linux"
-- 
1.6.2.rc0


--=-=-=--
