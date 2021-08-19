Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.72762.1629394350625982583
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 10:32:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A18/mYKm;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so5284823pjb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 10:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s9RBzH9GF0cgUXxhyHTH6k+Ma20daDDwdlDDrZQxfeg=;
        b=A18/mYKmhzInFftZYR2Tl6mklfFJqK/xdrxrNDPR03ncVKiGxmbFLPWqxFRuBPTUG2
         MDhaEUSP9Zv9oUWOQahsDYFO5GBDitgn4Rvll+edi0Xs8FQrDffhEBouYtAJgC7aXIiQ
         4BHXSFWtr74x1J7Vxvtr3vweFH+Xx7TgF522+sA0fSuY+oPFO4Eb9QpX5yOEBeNAzd6w
         Qy4Ptu2stci8giJEWytGxxgBYaPf88LoFOiXwmYEZRYEBdk/+W38HmC3AQg1RILhnJyb
         rMFp/Cx+Q4jTNZjFUswNh8DAEjstljZD2z62OzoEbPok4vdh0ULNxbSvvIITqdrSJfG+
         d/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s9RBzH9GF0cgUXxhyHTH6k+Ma20daDDwdlDDrZQxfeg=;
        b=TRJfqlIC8wbwFRvd+0P737Ix2mTcysNDNsQFM+w6ZY+oaKf6dfnOCJJJG9vwTZgggS
         nTaC22HKYeV7NnSbDKaii2HK/saFQY5L3UvY/IXjQE9zpN113tGxwTCzhWUlpMhi2s9p
         989wjM9clrhcD83V1790KbDF2/EFpjGfTOccIuGar1nmpMrc/Sfjr8M97fnKR1Arb67T
         P6GEm70VkoFxi5nxSxiO7MiqUNhVhzkkLRL1TKwJ1z2Si73JZwMqWrhXDxVCKKtvZiuC
         wMO/O5XtnoX/5v7eaVSoJYQ8/CfjUThrm4LAH7f6nqY3a7zREONcivkpbF1z91I56Ejd
         xVEQ==
X-Gm-Message-State: AOAM5318hM+Ztg2gW9VX3K9Dc65fC9HRyYXmZqWFMnm9+MhAEJRSNiPY
	4cckz9ku/IMj77phiI+ygutdgWw7stE=
X-Google-Smtp-Source: ABdhPJzd7aNg6jZem4HoOK4LyaVfIOHHf/97Tqm5ncJlIpn78X/dc5rAdDiqtVt0X8vbW+gk8pPY1w==
X-Received: by 2002:a17:90a:bd02:: with SMTP id y2mr15848881pjr.202.1629394349760;
        Thu, 19 Aug 2021 10:32:29 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:bd83:4d24:dd3e:4962])
        by smtp.gmail.com with ESMTPSA id k22sm4047726pff.154.2021.08.19.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 10:32:29 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-oe][PATCH v2] bootchart: drop; unfetchable
Date: Thu, 19 Aug 2021 10:31:51 -0700
Message-Id: <20210819173150.3607310-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was replaced by bootchart2 long ago in oe-core.
gitorious.org no longer exists, so this is unfetchable.

Also, this has seen no development since bootchart2 was
created.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---

Changes since v1: add meta-oe to subject prefix

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

