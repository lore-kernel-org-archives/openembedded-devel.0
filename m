Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N9oAJ-0002yu-8m
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 00:05:54 +0100
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N9NUy-0006eZ-Mj for openembedded-devel@lists.openembedded.org;
	Sat, 14 Nov 2009 13:37:24 -0500
Date: Sat, 14 Nov 2009 13:37:04 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911141335020.32191@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] sensors-applet: Add support for current version 2.2.4.
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
X-List-Received-Date: Sun, 15 Nov 2009 23:05:54 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  sadly, i can't actually test the build since it depends on
guile-native, but it's based directly on the existing 2.2.1, and i've
verified that the checksums are fine with "-c fetchall".

  is this the correct patch format?  (generated with "git diff HEAD".)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 8252329..dbfc17f 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -23786,6 +23786,10 @@ sha256=57c86e7c17b8af6d6ecbdc17086ad22ec72d815f0db8a475a1d9adef2879f922
 md5=4ba94415125db147efcc1ae76f9703ee
 sha256=6be95f70458d299f28bfc81dee201b3e1c328bc55df00fc7f2c30d7f8f6faba0

+[http://downloads.sourceforge.net/sensors-applet/sensors-applet-2.2.4.tar.gz]
+md5=778f637524a90a9b6475ab77b0e90dd9
+sha256=a52214f2cf2b23a49394804dc589be51eecd4b8674f141047a46a550882f28f6
+
 [ftp://ftp.berlios.de/pub/ser/0.9.0/src/ser-0.9.0_src.tar.gz]
 md5=ae1f9b237f0006785ff22eafa1470ac4
 sha256=65eb4c5735859f3ed191437749a85e9fd24a66a6567025f36a0739f9c34c444e
diff --git a/recipes/lm_sensors/sensors-applet_2.2.4.bb b/recipes/lm_sensors/sensors-applet_2.2.4.bb
new file mode 100644
index 0000000..40f8823
--- /dev/null
+++ b/recipes/lm_sensors/sensors-applet_2.2.4.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "GNOME Sensors Applet is an applet for the GNOME Panel to display readings from hardware sensors"
+LICENSE = "GPLv2"
+
+inherit gnome
+
+DEPENDS += "gnome-panel libnotify"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/sensors-applet/sensors-applet-${PV}.tar.gz"
+
+EXTRA_OECONF = " --disable-scrollkeeper --with-libsensors=${STAGING_LIBDIR}/../ "
+
+FILES_${PN}-dbg += "${libdir}/sensors-applet/plugins/"
+


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


