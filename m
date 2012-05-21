Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SWLdv-00044N-Lo
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 07:58:55 +0200
Received: by wgbds1 with SMTP id ds1so2325893wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2012 22:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=6kQvhSTUiiHxzNDVJjG5aVIbmu8WeSw3c/EaodYU9Sk=;
	b=GruD8/mT5Njj9F7rBcp/9jOzu5yg9MfQ94WHrdPsM6z9Oeq0azDLuEHHTMH0SqhJvB
	IBy/rTP+sOsnTOw+xoBkpXiYsToLMxYYyl0jbSgJ69r/90GzqpgpNn7dUbqQ6rIMAihQ
	PKTnFyQGDW1mUplf9Wh8AJNvAMeo33i9swCPNJRCzk5+F1pvg0nm+SpE6qblsmi2cj6c
	cP23NZq0BehsqevycFDBS5j8F6onXUGdvg/2cznz49eebWswe4Ufz15X97L7tYXkhlyC
	dYAOGgbyKhX7oBommwR3QX5UJoXLhzs9OIqA3xPZuMhl8KXcMQXTCGc7O9VQ6Zmfhl/0
	wRdg==
Received: by 10.216.139.73 with SMTP id b51mr12752966wej.72.1337579328619;
	Sun, 20 May 2012 22:48:48 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm36554873wib.2.2012.05.20.22.48.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 22:48:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 May 2012 07:48:36 +0200
Message-Id: <1337579316-13833-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkeOjG5m1cxrdCLQuZ2BPRTUxozizLX5XXjmdYjrijO29G+g0PGQWo0Mdb0eHs+bydGcuZd
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] bootchart: update to v1.16
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
X-List-Received-Date: Mon, 21 May 2012 05:58:56 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...g-add-rudimentary-support-for-ARM-cpuinfo.patch |   49 ++++++++++++++++++++
 ...c-os-release-and-use-PRETTY_NAME-for-the-.patch |   39 ++++++++++++++++
 .../recipes-devtools/bootchart/bootchart_git.bb    |   16 +++++--
 3 files changed, 99 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
 create mode 100644 meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch

diff --git a/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch b/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
new file mode 100644
index 0000000..0494c4f
--- /dev/null
+++ b/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
@@ -0,0 +1,49 @@
+From 8d40b4c286e005e82fa50b66fbbbde22b7e65e15 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sun, 20 May 2012 21:35:34 +0200
+Subject: [PATCH 1/2] svg: add rudimentary support for ARM cpuinfo
+
+On ARM /proc/cpuinfo looks like this:
+
+root@beagleboneA3-0428:~# cat /proc/cpuinfo
+Processor	: ARMv7 Processor rev 2 (v7l)
+BogoMIPS	: 498.89
+Features	: swp half thumb fastmult vfp edsp thumbee neon vfpv3 tls
+CPU implementer	: 0x41
+CPU architecture: 7
+CPU variant	: 0x3
+CPU part	: 0xc08
+CPU revision	: 2
+
+Hardware	: am335xevm
+Revision	: 0000
+Serial		: 0000000000000000
+
+So no real way to get the actual SoC name, TI AM3359, but a lot better than 'Unknown'
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+
+Upstream-status: submitted
+
+ svg.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/svg.c b/svg.c
+index 80e0292..53724b2 100644
+--- a/svg.c
++++ b/svg.c
+@@ -178,6 +178,10 @@ void svg_title(void)
+ 				strncpy(cpu, &buf[13], 255);
+ 				break;
+ 			}
++			if (strstr(buf, "Processor")) {
++				strncpy(cpu, &buf[12], 255);
++				break;
++			}
+ 		}
+ 		fclose(f);
+ 	}
+-- 
+1.7.10
+
diff --git a/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch b/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
new file mode 100644
index 0000000..b3bda45
--- /dev/null
+++ b/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
@@ -0,0 +1,39 @@
+From e3adb4c312c6ba3491b7c173559efac7a53e5abc Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sun, 20 May 2012 22:12:29 +0200
+Subject: [PATCH 2/2] svg: open /etc/os-release and use PRETTY_NAME for the
+ 'Build' name
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+
+Upstream-status: Submitted
+
+ svg.c |   11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/svg.c b/svg.c
+index 53724b2..c675d84 100644
+--- a/svg.c
++++ b/svg.c
+@@ -194,6 +194,17 @@ void svg_title(void)
+ 		fclose(f);
+ 	}
+ 
++	f = fopen("/etc/os-release", "r");
++	if(f) {
++		while (fgets(buf, 255, f)) {
++			if (strstr(buf, "PRETTY_NAME=")) {
++				strncpy(build, &buf[12], 255);
++				break;
++			}
++		}
++		fclose(f);
++	}
++
+ 	svg("<text class=\"t1\" x=\"0\" y=\"30\">Bootchart for %s - %s</text>\n",
+ 	    uts.nodename, date);
+ 	svg("<text class=\"t2\" x=\"20\" y=\"50\">System: %s %s %s %s</text>\n",
+-- 
+1.7.10
+
diff --git a/meta-oe/recipes-devtools/bootchart/bootchart_git.bb b/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
index 62705f6..f5ef582 100644
--- a/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
+++ b/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
@@ -4,12 +4,18 @@ HOMEPAGE = "http://meego.gitorious.org/meego-developer-tools/bootchart"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 
-SRC_URI = "git://gitorious.org/meego-developer-tools/bootchart.git"
-SRCREV = "4420bc4318c4aada7c7d128105e56ecc8c84cb19"
+PV = "1.16"
+PR = "r1"
+PE = "1"
+
+SRC_URI = "git://gitorious.org/meego-developer-tools/bootchart.git \
+           file://0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch \
+           file://0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch \
+          "
+
+SRCREV = "872fb107028e377eef3c0c7c8a6e0f7c32b8ebb8"
 
 S = "${WORKDIR}/git"
 
-do_install() {
-	oe_runmake install DESTDIR=${D}
-}
+inherit autotools
 
-- 
1.7.10



