Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.80682.1629435245794874847
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 21:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MELdTsJP;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id w6so5269099plg.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 21:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jfli/SP1dP/eJG1lc6Ub2RUuoHLlpVkZHePW/V+RKvg=;
        b=MELdTsJPP9oVYHuuKVyYazvlxDvKnaum+GAOfTP1vqR9MkbYI7BPP0Uih9xGSKPO67
         GyyMJW5b7r5oJfgRaTyvIG1nuRoTb7DukZfQq3OozZgpwdw5xzr9/yyqKBuz0BFR7Mal
         rh8DaYwpvD7PqIpD7XyXOKbSQpbiydGdqjQ3iWNgIBEhjxwgeKudnhfIU313lGcfoN+o
         t95Zqllw3DGWA71vhosDFXCI31fr328SBTYZ8nOi92Ec1TpR70zZFSP+VW6to/1vqgKG
         fJ7azXETxcD3j5vl3biAEEhKFeEnujzx6/URiyjPlXBENfzwQqwbgDlN/E0xgQDGANQf
         p3pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jfli/SP1dP/eJG1lc6Ub2RUuoHLlpVkZHePW/V+RKvg=;
        b=MyR9B67jt4ZV8lTw3UcV6uCw4TsYD+YNm6LZmjM0wYU122FUzh5sHSTEZhiuAZJDbX
         1988Rvky5Ddbf+QA0IbPt7QmOXjWZ0o9+/E4VCxY+vqCdoTYOL68CMdPfO3JqcWThsAZ
         yON9Wwk2mQNnsVZjZlGnAhcD4BwI2rawcv/JmfCu88if0kLemneHm864AWUfQ0HrRahS
         ArnD4YX/kmcGEbo81FyRYmAtUpbR1wLv/Y0UL0jrCGx+U53sLuhoNDdlgttPVlhdDfup
         K6YVmPO/CJe41lw7Ixa2ugJTHDSbfTFtMXlYvzvsAfQbSF9dBIKWnW41BSLUbEoP3zlH
         8OOg==
X-Gm-Message-State: AOAM531Buai4RosIxm51oCa26+jwDVpAjtD7ogDK1ZlQ75jzpAWF7Wds
	olxTLFXbnKcqydOS9qCmvDZitEJq1X0=
X-Google-Smtp-Source: ABdhPJwoi4kLe1dDqMqTkuwEP90BphacrGyIxlA5pkFqebSFVA/U9YFGY3GTJna5tVEMOfExjYB61Q==
X-Received: by 2002:a17:90a:af8f:: with SMTP id w15mr2628025pjq.90.1629435244922;
        Thu, 19 Aug 2021 21:54:04 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:bd83:4d24:dd3e:4962])
        by smtp.gmail.com with ESMTPSA id c2sm5351740pfp.138.2021.08.19.21.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 21:54:04 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-oe][PATCH v3] bootchart: drop; unfetchable
Date: Thu, 19 Aug 2021 21:52:51 -0700
Message-Id: <20210820045250.3620987-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was replaced by bootchart2 long ago in oe-core.
gitorious.org no longer exists, so this is unfetchable.

Also, this has seen no development since bootchart2 was
created.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
Changes since v2:
  also drop from packagegroup-meta-oe

Changes since v1:
  add meta-oe subject prefix

 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 ...-rudimentary-support-for-ARM-cpuinfo.patch | 49 -------------------
 ...release-and-use-PRETTY_NAME-for-the-.patch | 39 ---------------
 .../bootchart/bootchart_git.bb                | 21 --------
 4 files changed, 110 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
 delete mode 100644 meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
 delete mode 100644 meta-oe/recipes-devtools/bootchart/bootchart_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0e58d9b653d..c3f48670715 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -227,7 +227,6 @@ RDEPENDS:packagegroup-meta-oe-dbs-python2 ="\
 RDEPENDS:packagegroup-meta-oe-devtools ="\
     abseil-cpp \
     breakpad \
-    bootchart \
     android-tools-conf \
     android-tools \
     concurrencykit \
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

