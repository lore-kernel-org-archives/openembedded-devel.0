Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6O-0006VU-Qw
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:23:56 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=6kQvhSTUiiHxzNDVJjG5aVIbmu8WeSw3c/EaodYU9Sk=;
	b=i/ZeJ5q/wiJNBd6D+xU6VUNptjPsA7SNK9dbtt0V14ffxKDZe3GVl0SA5fXcr6gbcY
	sBTczaMMs6SEbDfiQr3LxSCVlrnqNEte+cA0ySZH/euHsoSJa0IgAQPN6S1unX9i62Th
	cNeKGaLicLf7aDdmeXnYDyEVAScjV/PkCxLiHTbBUZRbxLFWiz9de+7e8DNa+OF7ssQE
	OBjYc0dhPi24AfgRyEIp9/ZSK+/7eH4xXCdLJfm/VJJcupnxSEsU0pRUUp/ETv2ozW+l
	5kCsN82ztaDJD0c8MvQ73cnAFZud/7bqNh+EfN4HK0KgsTRLb7tkv6yXgXfTHAr3tMuG
	UiMw==
Received: by 10.14.94.77 with SMTP id m53mr74448eef.107.1342170764878;
	Fri, 13 Jul 2012 02:12:44 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id v16sm23135815eem.17.2012.07.13.02.12.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:12:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:53 +0200
Message-Id: <1342170730-14982-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkZylAK0qS73v4MGIAEgIpkRknD0iz+jJ3Viz/jkXwijjxxBa1vfTQ0J6xPNe0GMNFeZZnw
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 07/24] bootchart: update to v1.16
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
X-List-Received-Date: Fri, 13 Jul 2012 09:23:57 -0000

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



