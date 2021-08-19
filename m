Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.72560.1629393120831526543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 10:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OMZBVSJu;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 7so6107695pfl.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 10:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W/J+JenGbL7jr7iBymC5Vlcz/D0BFuwcF1nguLL88h0=;
        b=OMZBVSJuybZ2OGs1bAPQAK86XAdpI1cqfTsw2z+EWPlX+MCQZfk4u5s3sBjizbrDHP
         AtLxjKdVdVykg49buIFBfpp0nxwlMgaFzPEpPKHvNPddbNXHMjhJezH0d/toJ/gs01R8
         3MCYWNtZnfCmkfoDD7ncC27joZbXOxHVWa0HpK+xrrMq56zriZKovKiXbBhK2si4SLeH
         cMxmOAI9J4pxcqlIEtFwgYuSwybLeGzmcKZL3RjndriAOs8QJYugQTkEcw2YhIVTNy6b
         8LKMk1nGhp36KY3KTa+OMnzn8cRgOaWrf2ZJLSAgG3+5tYsSX4U+Q04zl14QiusgmVOG
         ia/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W/J+JenGbL7jr7iBymC5Vlcz/D0BFuwcF1nguLL88h0=;
        b=WVKd4uVW0phyw3rqpAcDFwvyEtvxxGtYCZ+BJG/AlYJsJgcyISjgHFYtPXyQWppbk5
         ha3zB0s0LBvDzwkISBrBBCSEm1ug3JgPVYTMJ7neyHEGY1+6VWRz4Pk+dT+ZINd91qvC
         M36HAT6rtM/r65SYmuAUg+uIL6s7q8P9elBS1O2nW3uQ/kWzQRLmJ9tDMGhJFYDuYH3R
         GgHxT6xw0efcfstYvO1QU2t5EGHdROQca8tM3wOxWDbczPaGvwLcRKllQ96JJUF4GWAP
         Y+o0bnE1xgKsRibJbnisSb3C4IKbAVsa88rtC/w+MV2ZztlZkoWusfG29M8BZhwX04Xx
         eL8A==
X-Gm-Message-State: AOAM530CaEHn8PgWRPPV+1ZQIZ1QbyR80kH9k2gdUIA6ESfcSpY0zAPa
	BIlgv1mZeHKT68YR11m88Ko2QC+fuik=
X-Google-Smtp-Source: ABdhPJyNlcc81183tD/xDUBt/X7SdK8Pxjy54+Fem9Up8xb/Wy/EIwNNsxXjtU0eC2zdc8m1s4KnUg==
X-Received: by 2002:a63:6ca:: with SMTP id 193mr14851824pgg.265.1629393119798;
        Thu, 19 Aug 2021 10:11:59 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:bd83:4d24:dd3e:4962])
        by smtp.gmail.com with ESMTPSA id g3sm4847709pgj.66.2021.08.19.10.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 10:11:59 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [PATCH] bootchart: drop; unfetchable
Date: Thu, 19 Aug 2021 10:11:37 -0700
Message-Id: <20210819171137.3606548-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was replaced by bootchart2 long ago in oe-core.
gitorious.org no longer exists, so this is unfetchable.

Also, this has seen no development since bootchart2 was
created.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 ...-rudimentary-support-for-ARM-cpuinfo.patch | 49 -------------------
 ...release-and-use-PRETTY_NAME-for-the-.patch | 39 ---------------
 .../bootchart/bootchart_git.bb                | 21 --------
 3 files changed, 109 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
 delete mode 100644 meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
 delete mode 100644 meta-oe/recipes-devtools/bootchart/bootchart_git.bb

diff --git a/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch b/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
deleted file mode 100644
index 4581ef25fce..00000000000
--- a/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 8d40b4c286e005e82fa50b66fbbbde22b7e65e15 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 20 May 2012 21:35:34 +0200
-Subject: [PATCH 1/2] svg: add rudimentary support for ARM cpuinfo
-
-On ARM /proc/cpuinfo looks like this:
-
-root@beagleboneA3-0428:~# cat /proc/cpuinfo
-Processor	: ARMv7 Processor rev 2 (v7l)
-BogoMIPS	: 498.89
-Features	: swp half thumb fastmult vfp edsp thumbee neon vfpv3 tls
-CPU implementer	: 0x41
-CPU architecture: 7
-CPU variant	: 0x3
-CPU part	: 0xc08
-CPU revision	: 2
-
-Hardware	: am335xevm
-Revision	: 0000
-Serial		: 0000000000000000
-
-So no real way to get the actual SoC name, TI AM3359, but a lot better than 'Unknown'
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
-
-Upstream-Status: submitted
-
- svg.c |    4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/svg.c b/svg.c
-index 80e0292..53724b2 100644
---- a/svg.c
-+++ b/svg.c
-@@ -178,6 +178,10 @@ void svg_title(void)
- 				strncpy(cpu, &buf[13], 255);
- 				break;
- 			}
-+			if (strstr(buf, "Processor")) {
-+				strncpy(cpu, &buf[12], 255);
-+				break;
-+			}
- 		}
- 		fclose(f);
- 	}
--- 
-1.7.10
-
diff --git a/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch b/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
deleted file mode 100644
index f63d98aee51..00000000000
--- a/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e3adb4c312c6ba3491b7c173559efac7a53e5abc Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 20 May 2012 22:12:29 +0200
-Subject: [PATCH 2/2] svg: open /etc/os-release and use PRETTY_NAME for the
- 'Build' name
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
-
-Upstream-Status: Submitted
-
- svg.c |   11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/svg.c b/svg.c
-index 53724b2..c675d84 100644
---- a/svg.c
-+++ b/svg.c
-@@ -194,6 +194,17 @@ void svg_title(void)
- 		fclose(f);
- 	}
- 
-+	f = fopen("/etc/os-release", "r");
-+	if(f) {
-+		while (fgets(buf, 255, f)) {
-+			if (strstr(buf, "PRETTY_NAME=")) {
-+				strncpy(build, &buf[12], 255);
-+				break;
-+			}
-+		}
-+		fclose(f);
-+	}
-+
- 	svg("<text class=\"t1\" x=\"0\" y=\"30\">Bootchart for %s - %s</text>\n",
- 	    uts.nodename, date);
- 	svg("<text class=\"t2\" x=\"20\" y=\"50\">System: %s %s %s %s</text>\n",
--- 
-1.7.10
-
diff --git a/meta-oe/recipes-devtools/bootchart/bootchart_git.bb b/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
deleted file mode 100644
index 2b75eaac9d8..00000000000
--- a/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Monitors where the system spends its time at start, creating a graph of all processes, disk utilization, and wait time."
-HOMEPAGE = "http://meego.gitorious.org/meego-developer-tools/bootchart"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
-
-PV = "1.17"
-PR = "r1"
-PE = "1"
-
-SRC_URI = "git://gitorious.org/meego-developer-tools/bootchart.git;protocol=https \
-           file://0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch \
-           file://0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch \
-"
-
-SRCREV = "a2c7561d4060a9f075339bda89e793c76f2ff6dd"
-
-S = "${WORKDIR}/git"
-
-inherit autotools
-
-- 
2.30.2

