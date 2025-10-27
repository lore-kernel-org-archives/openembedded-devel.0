Return-Path: <koen@dominion.thruhere.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53CACCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:47:45 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.34936.1761576455549531501
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dominion-thruhere-net.20230601.gappssmtp.com header.s=20230601 header.b=fdufApPk;
 spf=none, err=permanent DNS error (domain: dominion.thruhere.net, ip: 209.85.218.52, mailfrom: koen@dominion.thruhere.net)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b6d5b756284so1002098566b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dominion-thruhere-net.20230601.gappssmtp.com; s=20230601; t=1761576453; x=1762181253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aRGmi9RnG/TvzrM6QP6zYO3mcwJz32UQvfaBcWKpX5A=;
        b=fdufApPkJqXakmCz6AWEYOW2lwMGsBa5P1LPlGpjBDsTa3uVoWme+ytVBO9A0CrUx4
         FechA4+D8iiaTeRXoJ9vpSq/UskpmAT5pyboqxQPUGkzR74et/hRfTtb3Q7gsYwwAlXl
         ZeWquOMhmLTl5v90pwIn98zEs8klxxgDuvYi4OnXiaWcD1WhLXwiY9IDpVBCa2MiqM04
         OP1yT0wRllsypqgnDKUu102/3XN5OToNflRp1fjqTs0AAm7rfbY2DSPJrp0Xz0o6oayw
         8F5E7d6FcKfpT0W6bPaYj8wFx+rBNoVrY3idyI/2yOYzx/JKhNF4D/Z0rDlUMGc/lFNY
         8X3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761576453; x=1762181253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRGmi9RnG/TvzrM6QP6zYO3mcwJz32UQvfaBcWKpX5A=;
        b=Iu8vTA+nuYmlb9gOOUURlThlZvJbt73CEjmxEDkFty7aiqDC0Y/bF2CD50vkmToxzK
         dZACxXYi3uaJ3QS434hrDEGC4VKg4eoRxxBkSNtl4OfT9Gs1DWpNHNMnWQx0rqrbBRsr
         eAIMIGbUribngkc9yO2xT6dzSXWKozR9HxhNWiobqdh7OU2Q2VNnbbE4o7+VH26tOKSY
         PJRN89jMV6zsK4bjlnDkD7QqUz0l3NL8pxUm9W/J1Hql0NjfbOf/xbS+RJZERiZZy2hr
         v44+VzmXUHS7ML4v7LHuF9XxTwF8DQQpU4RGjSV57U3h90hjKp4IjrmD8N+iIS8BUWLx
         z2Zw==
X-Gm-Message-State: AOJu0YxcB3yl+qGU2H/BMtbXYYWLJPQ61nsSObcxk+CPlKhRNXXxgT5h
	U9I1/pucOwoouuFcNUsyID2ik6wLSvblpIuIi0+PRxmI211dgtAN0jERJuk+BX05GOPY8J8BzVx
	U9CY69Q==
X-Gm-Gg: ASbGncv00eA72z1gmrUAgfC+CxEppxAb4hg/NbIqzJMAur0m8mXfkXdO0ZnWEg0L+Tp
	uEbl0e4Ovbsxti80gjJlm9tbovLbr1uoGqdJS9BKNqPYV9xrzLqCeLkHIV0uaa1RPiNG4fQGe1z
	97+ohbOTLDHOhRAISNavUtvnikQ0xO5Z/mAuZzEMfBnE9JJGhYV60ut3EubDCiGUb2aU2KcI/R7
	bvQDBQTnU3U9uhr4lW4Ucl4vQMLdz7JKlCEhk13Np1cWK4gFrkBvUGuZpNa6MUASonjEdUTGOJl
	IsZTzz5yzbAJSDqIsohMx83pq9g2ctRLAeRAhiYWdghqpNWwnWKMCVi/X5O/2E+N3EKD0edo5qk
	vG4bXzGin2TAs/3ZqMxdNNJHrqC16JEbdnsDP6i44QVswewkTQfC+2g7lMlLZozoe6fk2km5yQb
	6O+XURk/lnttggfHwOlFLYito7erUhVM5/ZevN0pFbaZ+cgw==
X-Google-Smtp-Source: AGHT+IECugFg5RiNWzZZMb5c1SatMhHyWsMVaNsjMCVmdNt35wfvT1Z12VBQdSNS4/14/g0L/s9/ww==
X-Received: by 2002:a17:907:9455:b0:b3f:f207:b748 with SMTP id a640c23a62f3a-b6dba44668cmr20320066b.10.1761576453357;
        Mon, 27 Oct 2025 07:47:33 -0700 (PDT)
Received: from localhost.localdomain (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85372e5asm773413966b.32.2025.10.27.07.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:47:32 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] gpsd: update to 3.26.1
Date: Mon, 27 Oct 2025 15:42:00 +0100
Message-ID: <20251027144201.2754511-1-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121051

Drop patch that was applied upstream in https://gitlab.com/gpsd/gpsd/-/merge_requests/406

Upstream changelog:

3.26.1: 17 May 2025
  Increment libgps version
  Update Debian Trixie in build.adoc
  Fix buffer overrun in cgps.
  Make gpsmon deprecation slightly more obvious.
  Fix some *BSD compiler warnings
  Fix numerous typos.

3.26: 11 May 2025
  Handle NTRIPv2 that comes in "chunks".
  Add many UBX decodes.  Mostly in ubxtool, some in gpsd.
  Improve TSIP and UBX initialization.
  Gather Antenna Status (ant_stat) and Jamming (jam) and send to JSON.
  Always build u-blox, RTCM104V2, RTCM104V3 drivers.
  Add partial support for badly documented ALLYSTAR GNSS messages.
  Add minimal support for Unicore GNSS messages.
  Add minimal support for CASIC GNSS messages.
  Add minimal support for buggy Inertial Sense GNSS messages.
  Try to work better as non-root using non-standard "capabilities".
  Add SUBSYSTEM=gnss rule to gpsd.rules
  Moved ntploggps from NTPSec to GPSD and renamed to gpslogntp.
  Fix many build, Coverity, and Codacy warnings.
  Improved Python interface for the lexer.
  Add support for new BeiDou PRNs and subframes.
  Officially deprecate gpsmon.
  Improve support for NMEA 4.11 (a stealthy moving target).
  Remove Oceanserver IMU support.  Never worked well.
  Always with  build ubx, NMEA 103, rtcm104v2 and rtcm104v3 support.
  Add support for jamming detection.
  Add Go client example.
  Add support for RTCM3.2

  Note: The new "chunk" code led to a short lived bug that led to
        CVE-2023-43628, a buffer overrun.  That bug never appeared in
        any gpsd release.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gpsd/gpsd/fix-pps_strerror_r.patch        | 51 -------------------
 .../gpsd/{gpsd_3.25.bb => gpsd_3.26.1.bb}     |  3 +-
 2 files changed, 1 insertion(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.25.bb => gpsd_3.26.1.bb} (97%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch b/meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch
deleted file mode 100644
index 8942b39524..0000000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c72a489e2eb13296c7b514b7341033114abf430a Mon Sep 17 00:00:00 2001
-From: Miroslav Lichvar <mlichvar@redhat.com>
-Date: Mon, 22 Apr 2024 11:31:24 +0200
-Subject: [PATCH 1/2] SConscript: provide variable names to MergeFlags
-
-If the scons MergeFlags() function is provided with a list of
-compiler/linker options, it needs to guess what options belong where. If
-it doesn't recognize an option, it is silently ignored. There are also
-ambiguous options that could be both in CFLAGS and LINKFLAGS (e.g. -spec).
-
-Provide MergeFlags() with a dict instead of list to avoid the guesswork
-in order to pass all options, even if some are not recognized by scons.
-Switch LDFLAGS to LINKFLAGS for better compatibility with existing
-scripts.
-
-Upstream-Status: Submitted [https://gitlab.com/gpsd/gpsd/-/merge_requests/406]
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-
----
- SConscript | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/SConscript b/SConscript
-index dab481654..ee90d87c4 100644
---- a/SConscript
-+++ b/SConscript
-@@ -585,8 +585,8 @@ env['SC_PYTHON'] = sys.executable  # Path to SCons Python
- # explicitly quote them or (better yet) use the "=" form of GNU option
- # settings.
- #
--# Scons also uses different internal names than most other build-systems.
--# So we rely on MergeFlags/ParseFlags to do the right thing for us.
-+# Scons also uses different internal names than most other build-systems,
-+# e.g. it uses LINKFLAGS instead of LDFLAGS.
- #
- # scons uses gcc, or clang, to link. Thus LDFLAGS does not serve its
- # traditional function of providing arguments to ln. LDFLAGS set in the
-@@ -618,7 +618,10 @@ for i in ["ARFLAGS",
-           "SHLINKFLAGS",
-           ]:
-     if i in os.environ:
--        env.MergeFlags(Split(os.getenv(i)))
-+        t = i
-+        if t == "LDFLAGS":
-+            t = "LINKFLAGS"
-+        env.MergeFlags({t: Split(os.getenv(i))})
- 
- 
- # Keep scan-build options in the environment
--- 
-GitLab
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
similarity index 97%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
index 0d5232c88c..e4a571daa6 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
@@ -9,9 +9,8 @@ HOMEPAGE = "https://gpsd.io/"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
-           file://fix-pps_strerror_r.patch \
            "
-SRC_URI[sha256sum] = "b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf7987a73c7b4a9afc2"
+SRC_URI[sha256sum] = "dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
-- 
2.47.3


