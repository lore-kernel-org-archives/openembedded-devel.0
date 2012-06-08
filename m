Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrI-0004PX-Nv
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:51:56 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so982280eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=6kQvhSTUiiHxzNDVJjG5aVIbmu8WeSw3c/EaodYU9Sk=;
	b=ifTNQcVjXJmUBqcJ6SYENLa5PnQdJDMOpQCZDnFObgCmdwrgGAGughESdSYpVoA5il
	icCzd+Ol7fUvhoYEkvXYUZzxOjV0VICKDtzDvEMg7DOp2MQbBzK2h2733wLAUxsbHkKn
	dsQL+wTCjmB8ND2JYHBfCsOaBD1LHfB+HkRwX8rYUkHVhtP2ZbVGUH/UCxR6lKYfNLjN
	VFrMyHFWfmsd3d7p9DPOghkBQpOcRr8TYHkQrWI5Pfhb4TeZHevi3NuhFGOQMyqLbOYO
	Tlohkzor9Kl0h6e2KYzJ10GijCrgVc+OGV+IrzcegWVmVpOLX0c4e7cDVkhfdc/gqWyw
	UPBw==
Received: by 10.14.127.130 with SMTP id d2mr3644451eei.82.1339148489396;
	Fri, 08 Jun 2012 02:41:29 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id q53sm20229536eef.8.2012.06.08.02.41.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:36 +0200
Message-Id: <1339148443-9467-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmFlq9Uyj9/jFou/oqBmVbNzZLx7/xZQarLDBRHG1W+9wBszpnVpAhbojUo1MguchKnDVJv
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 07/14] bootchart: update to v1.16
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
X-List-Received-Date: Fri, 08 Jun 2012 09:51:57 -0000

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



