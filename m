Received: from [209.85.128.189] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1INlNH-0004y7-Cp
	for openembedded-devel@openembedded.org; Wed, 22 Aug 2007 10:15:36 +0200
Received: by fk-out-0910.google.com with SMTP id 18so100176fks
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Aug 2007 01:14:31 -0700 (PDT)
Received: by 10.82.170.2 with SMTP id s2mr964859bue.1187770470695;
	Wed, 22 Aug 2007 01:14:30 -0700 (PDT)
Received: by 10.82.117.9 with HTTP; Wed, 22 Aug 2007 01:14:30 -0700 (PDT)
Message-ID: <74d0deb30708220114v5a52985dx6ae79eace522bb6e@mail.gmail.com>
Date: Wed, 22 Aug 2007 10:14:30 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: gsmd machine dependent configuration and PACKAGE_ARCH
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
X-List-Received-Date: Wed, 22 Aug 2007 08:15:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I don't like how currently all (lib)gsmd(-plugin-...) packages are
PACKAGE_ARCH="${MACHINE_ARCH}" just because of the small
/etc/default/gsmd configuration file. Are there any objections to the
patch below? It uses a single configuration file for all currently
supported machines, parsing /proc/cpuinfo similarly to how Xserver
configuration is done in xserver-kdrive-common.

regards
Philipp

#
# old_revision [386ea80af330bd25812f5cdff58b9291ad20ed55]
#
# delete "packages/gsm/files/fic-gta01"
#
# delete "packages/gsm/files/fic-gta01/default"
#
# delete "packages/gsm/files/htcuniversal"
#
# delete "packages/gsm/files/htcuniversal/default"
#
# delete "packages/gsm/files/magician"
#
# delete "packages/gsm/files/magician/default"
#
# patch "packages/gsm/files/default"
#  from [7ce0e5ef1d869657220f2726615b4248e22cf672]
#    to [ec341c8038634b15744e9c6b74f64b81cee153b3]
#
# patch "packages/gsm/libgsmd_svn.bb"
#  from [5bfef07ab90056b98c4bcf253d3d8773ff46f2e9]
#    to [d593ae51c7fbbde0555e0fead8b05db83e9016a5]
#
============================================================
--- packages/gsm/files/default	7ce0e5ef1d869657220f2726615b4248e22cf672
+++ packages/gsm/files/default	ec341c8038634b15744e9c6b74f64b81cee153b3
@@ -1,9 +1,34 @@
 # gsmd	This shell script configures for the gsmd init script.

-# If you must specify special options, uncomment and modify the next line
-#GSMD_OPTS="-s 115200 -F"
+board_id() {
+	awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
+}

-# If your GSM device needs to be powered up, uncomment and modify the next line
-#GSM_POW="/sys/bus/platform/devices/gta01-pm-gsm.0/power_on"
+case `board_id` in
+	"GTA01")
+		GSMD_OPTS="-s 115200 -F"
+		GSM_POW="/sys/bus/platform/devices/gta01-pm-gsm.0/power_on"
+		GSM_DEV="/dev/ttySAC0"
+		;;
+        "HTC Magician")
+		GSMD_OPTS="-s 115200 -F"
+		GSM_DEV="/dev/ttyS1"
+		;;
+        "HTC Universal")
+		GSMD_OPTS="-s 115200 -F -w 1"
+		GSM_DEV="/dev/ttyS0"
+		;;
+	*)
+		# Unknown board

+		# If you must specify special options, uncomment and modify the next line
+		#GSMD_OPTS="-s 115200 -F"
+
+		# If your GSM device needs to be powered up, uncomment and modify
the next line
+		#GSM_POW="/sys/bus/platform/devices/gta01-pm-gsm.0/power_on"
+
+		# This should be in a common /etc/default/serial, together with
+		# BT_DEV and IR_DEV for devices that have those on a serial port
+		#GSM_DEV="/dev/ttyS1"
+		;;
+esac
-#GSM_DEV="/dev/ttyS1"
============================================================
--- packages/gsm/libgsmd_svn.bb	5bfef07ab90056b98c4bcf253d3d8773ff46f2e9
+++ packages/gsm/libgsmd_svn.bb	d593ae51c7fbbde0555e0fead8b05db83e9016a5
@@ -1,13 +1,11 @@ PROVIDES += "gsmd"
 DESCRIPTION = "GSM libraries and daemons implementing the 07.10 specification"
 HOMEPAGE = "http://www.openmoko.org"
 LICENSE = "GPL LGPL"
 SECTION = "libs/gsm"
 PROVIDES += "gsmd"
 PV = "0.1+svn${SRCDATE}"
-PR = "r19"
+PR = "r20"

-SRC_URI_OVERRIDES_PACKAGE_ARCH = "1"
-
 SRC_URI = "svn://svn.openmoko.org/trunk/src/target;module=gsm;proto=http \
            file://fix-mlbuf.patch;patch=1 \
            file://gsmd \


