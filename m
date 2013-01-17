Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1TvfzQ-0005Yl-NU
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 04:18:52 +0100
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp2.tranzpeer.net with ESMTP; 17 Jan 2013 16:01:38 +1300
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jan 2013 16:01:34 +1300
Message-ID: <004501cdf45e$f5c87270$e1595750$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac30XoBeWTfFc/BgQaq4iorm5GEKUg==
Subject: Angstrom build failure
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
X-List-Received-Date: Thu, 17 Jan 2013 03:19:02 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-nz

Dear All,
I'm getting the following failure building an Angstrom image.

| checking for UDEV... no
| configure: error: Package requirements ( libudev >= 172 ) were not met:
| 
| No package 'libudev' found
| 
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
| 
| Alternatively, you may set the environment variables UDEV_CFLAGS
| and UDEV_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| ERROR: oe_runconf failed
NOTE: package systemd-git-r28: task do_configure: Failed
ERROR: Task 518
(/home/service/oe/sources/meta-openembedded/meta-oe/recipes-core/systemd/sys
temd_git.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2549 tasks of which 2548 didn't need to be
rerun and 1 failed.

My build environment is:
OE Build Configuration:
BB_VERSION        = "1.15.2"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "pandaboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2012.05"
TUNE_FEATURES     = "armv7a vfp neon cortexa9"
TARGET_FPU        = "vfp-neon"
meta-angstrom     =
"angstrom-v2012.05-yocto1.2:6a2febed13f179c042c2371b2e86286c80c0df5e"
meta-oe           
toolchain-layer   
meta-efl          
meta-gpe          
meta-gnome        
meta-xfce         
meta-initramfs    = "denzil:c0117f5ad7d1fe18d149bda426c7134ff24daae8"
meta-opie         = "master:efa3892b20a4ef80274e56e5633ebd62c16f9731"
meta-java         = "master:3386ea6c96096f107f43f282f654e5afa456109e"
meta-browser      = "master:c47f59df2e723495679c751cbdf6a8c6adec4b6a"
meta-mono         = "master:83f8233b0498aadb18bf7605c3ba6c71d9e13a3a"
meta-kde          = "master:5b0882d951cfd71886d423c190faaa7c7f932333"
meta-ti           = "denzil:95e9cf6299f5bae6965fe6fc4abe3eeb631df196"
meta-efikamx      = "master:2c09a3a780b23448e8a6ca964256ff7f5ccba65d"
meta-nslu2        = "master:3d9fc951b05b4df476374b6fc3085ebac7f293ee"
meta-htc          
meta-nokia        
meta-openmoko     
meta-palm         = "master:2b106be01228f64298d6cb338f93088806594344"
meta-handheld     = "master:1f05a15aceb4c3a19fa070463b58125b5658b2a9"
meta-raspberrypi  = "denzil:34eef2ea4f5f24630dbb73b386861430167b8431"
meta-intel        
meta-sugarbay     
meta-crownbay     
meta-emenlow      
meta-fishriver    
meta-fri2         
meta-jasperforest 
meta-n450         = "master:f75f9b6f68473eb0efac802409608f8389be0030"
meta              = "denzil:0a9e8bf35afd5990c1b586bba5eb68f643458a4b"


Any pointers would be appreciated.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Damien RANNOU
Sent: Wednesday, 2 January 2013 23:21
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][PATCH] HostAP-daemon patch to make it compile with
libnl 3.2

Signed-off-by: Damien RANNOU <damien.rannou@diateam.net>
---
 meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig |    2 +-
 meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb        |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git
a/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
b/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
index 1f3c6f4..2789640 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
@@ -24,7 +24,7 @@ CONFIG_DRIVER_PRISM54=y
 
 # Driver interface for drivers using the nl80211 kernel interface
CONFIG_DRIVER_NL80211=y -CONFIG_LIBNL20=y
+CONFIG_LIBNL32=y
 # driver_nl80211.c requires a rather new libnl (version 1.1) which may not
be  # shipped with your distribution yet. If that is the case, you need to
build  # newer libnl version and point the hostapd build to use it.
diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
index 310e8aa..e62531f 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
@@ -26,6 +26,7 @@ do_configure() {
 }
 
 do_compile() {
+	export CFLAGS="-MMD -O2 -Wall -g -I${STAGING_INCDIR}/libnl3"
 	make
 }
 
--
1.7.10.4


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

__________ Information from ESET NOD32 Antivirus, version of virus signature
database 7866 (20130106) __________

The message was checked by ESET NOD32 Antivirus.

http://www.eset.com





