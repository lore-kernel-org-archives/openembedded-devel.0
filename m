Received: from exprod5og111.obsmtp.com ([64.18.0.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nte2K-0005ja-Nn
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 10:35:20 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob111.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6c5DjGV3gIW+oYiwJ0qOhEDM/VEE47C@postini.com;
	Mon, 22 Mar 2010 02:31:59 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip08.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:57 -0400
Received: from es-j7s4d2j.amer.consind.ge.com ([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 22 Mar 2010 05:31:57 -0400
From: Martyn Welch <martyn.welch@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 09:35:12 +0000
Message-ID: <20100322093512.27540.878.stgit@ES-J7S4D2J.amer.consind.ge.com>
In-Reply-To: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>
User-Agent: StGIT/0.13
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 64.18.0.22
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,UPPERCASE_50_75 autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 06/12] Modify location of busybox applets
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
X-List-Received-Date: Mon, 22 Mar 2010 09:35:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Modify where busybox puts it's applets so that they conform more to what we
believe to be their standard location.
---

 recipes/busybox/busybox_1.13.2.bb        |    1 +
 recipes/busybox/files/applets-path.patch |   58 ++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
index d22819e..9945673 100644
--- a/recipes/busybox/busybox_1.13.2.bb
+++ b/recipes/busybox/busybox_1.13.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "\
   file://defconfig \
   file://mdev \
   file://mdev.conf \
+  file://applets-path.patch;patch=1 \
 "
 SRC_URI[tarball.md5sum] = "9e2a604d18bef219a5a6bf3acf78b9e1"
 SRC_URI[tarball.sha256sum] = "927774408bd982dd246fb716bb2e646ab0708ce321b42c5e271dc98c1f5d1dc8"
diff --git a/recipes/busybox/files/applets-path.patch b/recipes/busybox/files/applets-path.patch
new file mode 100644
index 0000000..137781c
--- /dev/null
+++ b/recipes/busybox/files/applets-path.patch
@@ -0,0 +1,58 @@
+--- busybox-1.13.2-orig/include/applets.h	2009-08-16 05:08:58.528072682 +0100
++++ busybox-1.13.2/include/applets.h	2009-08-16 05:10:22.667618636 +0100
+@@ -89,7 +89,7 @@
+ USE_CAT(APPLET_NOFORK(cat, cat, _BB_DIR_BIN, _BB_SUID_NEVER, cat))
+ USE_CATV(APPLET(catv, _BB_DIR_BIN, _BB_SUID_NEVER))
+ USE_CHAT(APPLET(chat, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+-USE_CHATTR(APPLET(chattr, _BB_DIR_BIN, _BB_SUID_NEVER))
++USE_CHATTR(APPLET(chattr, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_CHCON(APPLET(chcon, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_CHGRP(APPLET_NOEXEC(chgrp, chgrp, _BB_DIR_BIN, _BB_SUID_NEVER, chgrp))
+ USE_CHMOD(APPLET_NOEXEC(chmod, chmod, _BB_DIR_BIN, _BB_SUID_NEVER, chmod))
+@@ -165,7 +165,7 @@
+ USE_FTPPUT(APPLET_ODDNAME(ftpput, ftpgetput, _BB_DIR_USR_BIN, _BB_SUID_NEVER, ftpput))
+ USE_FUSER(APPLET(fuser, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_GETENFORCE(APPLET(getenforce, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))
+-USE_GETOPT(APPLET(getopt, _BB_DIR_BIN, _BB_SUID_NEVER))
++USE_GETOPT(APPLET(getopt, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_GETSEBOOL(APPLET(getsebool, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))
+ USE_GETTY(APPLET(getty, _BB_DIR_SBIN, _BB_SUID_NEVER))
+ USE_GREP(APPLET(grep, _BB_DIR_BIN, _BB_SUID_NEVER))
+@@ -288,7 +288,7 @@
+ USE_PSCAN(APPLET(pscan, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_PWD(APPLET_NOFORK(pwd, pwd, _BB_DIR_BIN, _BB_SUID_NEVER, pwd))
+ USE_RAIDAUTORUN(APPLET(raidautorun, _BB_DIR_SBIN, _BB_SUID_NEVER))
+-USE_RDATE(APPLET(rdate, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))
++USE_RDATE(APPLET(rdate, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_RDEV(APPLET(rdev, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))
+ USE_READAHEAD(APPLET(readahead, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_READLINK(APPLET(readlink, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+@@ -307,8 +307,8 @@
+ USE_ROUTE(APPLET(route, _BB_DIR_SBIN, _BB_SUID_NEVER))
+ USE_RPM(APPLET(rpm, _BB_DIR_BIN, _BB_SUID_NEVER))
+ USE_RPM2CPIO(APPLET(rpm2cpio, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+-USE_RTCWAKE(APPLET(rtcwake, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+-USE_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_BIN, _BB_SUID_NEVER, run_parts))
++USE_RTCWAKE(APPLET(rtcwake, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))
++USE_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, _BB_DIR_USR_BIN, _BB_SUID_NEVER, run_parts))
+ USE_RUNCON(APPLET(runcon, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_RUNLEVEL(APPLET(runlevel, _BB_DIR_SBIN, _BB_SUID_NEVER))
+ USE_RUNSV(APPLET(runsv, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+@@ -324,7 +324,7 @@
+ USE_SETCONSOLE(APPLET(setconsole, _BB_DIR_SBIN, _BB_SUID_NEVER))
+ USE_SETENFORCE(APPLET(setenforce, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))
+ USE_SETFILES(APPLET(setfiles, _BB_DIR_SBIN, _BB_SUID_NEVER))
+-USE_SETFONT(APPLET(setfont, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))
++USE_SETFONT(APPLET(setfont, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_SETKEYCODES(APPLET(setkeycodes, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_SETLOGCONS(APPLET(setlogcons, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))
+ USE_SETSEBOOL(APPLET(setsebool, _BB_DIR_USR_SBIN, _BB_SUID_NEVER))
+@@ -396,7 +396,7 @@
+ USE_VCONFIG(APPLET(vconfig, _BB_DIR_SBIN, _BB_SUID_NEVER))
+ USE_VI(APPLET(vi, _BB_DIR_BIN, _BB_SUID_NEVER))
+ USE_VLOCK(APPLET(vlock, _BB_DIR_USR_BIN, _BB_SUID_ALWAYS))
+-USE_WATCH(APPLET(watch, _BB_DIR_BIN, _BB_SUID_NEVER))
++USE_WATCH(APPLET(watch, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_WATCHDOG(APPLET(watchdog, _BB_DIR_SBIN, _BB_SUID_NEVER))
+ USE_WC(APPLET(wc, _BB_DIR_USR_BIN, _BB_SUID_NEVER))
+ USE_WGET(APPLET(wget, _BB_DIR_USR_BIN, _BB_SUID_NEVER))


--
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


