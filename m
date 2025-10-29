Return-Path: <koen@dominion.thruhere.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9973CCCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 09:53:16 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.3141.1761731587547606479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 02:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dominion-thruhere-net.20230601.gappssmtp.com header.s=20230601 header.b=xivLDvdJ;
 spf=none, err=permanent DNS error (domain: dominion.thruhere.net, ip: 209.85.218.52, mailfrom: koen@dominion.thruhere.net)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b6d6c11f39aso272562866b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 02:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dominion-thruhere-net.20230601.gappssmtp.com; s=20230601; t=1761731586; x=1762336386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FVYAlml+Yf+GhmfKFHSv8jfQbgQQRnjroG8hgiWduw=;
        b=xivLDvdJtDvnyWFEA6NRnkaiSWwBm2EkmPwKhIQhr6b0gT2G6pRcDH5uf6mkPMynB8
         ZJBCVXJAGTmfC/ax1eJUX725TQQckMF7O6USl79zhZfbsmQYksTLnnphQAYbWD8dTJq4
         JND59Ya4xIomTjw6hvXbX3nf/66SwrvozWk89hO5gQdDmGApjvbXhDSeeDJLY0lhnhsh
         LcSi7JNzkNQWJmt3ixQCHgXRYlomccfqUPAG8QIgG4nw7BpN8IGNo5DT2ga2Lff6a/rU
         n/hgHCoYYtxYm7UIcbUS7fAv+ytcQOD9CQoZpYg416amCBnbiPWtVFSsRr6zt7VZHmhE
         r2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731586; x=1762336386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FVYAlml+Yf+GhmfKFHSv8jfQbgQQRnjroG8hgiWduw=;
        b=ZDnWaH4t1KbGTRxaIPcPEDct0QuFJac+NgipLrEF/NpTgS3IJF3Z2aFUhcNsBPmW4N
         g9v934XHAuXvx2TiMtbM67XOoCUeD31fG9pe98sTZNPjjAOsxF5PEFl3TyKotvWWh/kA
         q/Y54bHPmmkNoCVvZ63FMjJNdnMEfJ2sxdNHup6axWziGvpgArpOTBgYX/74KdW22qv+
         BFxTkj385jMw+d8bydm3JUxaiTT3ZHFHvSpfxiZE5uKpkduT1O7V2TR+6esK7vlUuMNH
         v2Hnca6lGDj/6MRUfv1nCCLkvRapM/WRoFlAqTeukaP0ACmNgO0e9ZIolqZJVjLIGivX
         LckA==
X-Gm-Message-State: AOJu0YyGM7oqnU1DQcYpckL7ps8GrY93sfmv+/0/k4bzQJY4q7Rs+Gro
	G8+JBEZyPxRECobGYtQqg8im6JYl7GOhY8arYV+gXM3T8ZU7X3vI1I90sjgfxZiULl09Xy2oBPN
	7V13ZTQ==
X-Gm-Gg: ASbGncs1Wvt+b/RZktOvG++jPI1eNA0bVTnAg1k03uVACW5vXHGxTU1GTmS1UqtYnsO
	dBZTUTqp41erJYYOp035VUh9afi9fLbxGGf6UYoGYZt/oiNS90+lTcUWmVt9R0RamlsIL9NLNR/
	zfp5aPXYyqAqjGDEnJj3/2Q39D5XE2txRfazL8NV8MbEhwvH5IpjA8Z/OIB7lgUBD0E84+L/Bvb
	YVh4JQVs0bX5i58cg5WmzVLtRmgivh2CeCswkz0KZqVPsv5synrOq3UGCxBgF/s2IzspQqwXgmV
	wpgWYP2oeh9RiageAe7bk+9AFCcTVDLlNBPXZB3a4n2tnusdqzGZk9w/ghndAttje15tXP6aLHD
	VPaVOsVNdt5yfVHy77rOLxENqnaZOpfQiQ0rPyX2KW6zcaHkmKUqGLJS0gi2xTFjKTNljmc7veP
	k28IiICtm1NLSpbEkw6W/2lqwtZLVKnResvibmY6yDiaVjHQ==
X-Google-Smtp-Source: AGHT+IENwZqnPj+a24yMsw2BAQn8JkNxd9AREatL47KaWH1Q0juaA7r2w8XyUS5SL+kEtc/anjpKIw==
X-Received: by 2002:a17:907:869f:b0:b3c:896:abf5 with SMTP id a640c23a62f3a-b703d3929dcmr216399266b.25.1761731585450;
        Wed, 29 Oct 2025 02:53:05 -0700 (PDT)
Received: from localhost.localdomain (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6db1c84813sm726848466b.19.2025.10.29.02.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 02:53:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH v2] gpsd: update to 3.26.1
Date: Wed, 29 Oct 2025 10:52:05 +0100
Message-ID: <20251029095205.127442-1-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 09:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121144

The `gpsmon` tool is really deprecated now, after years of its use being
discouraged. The `cgps` tool can be used as a replacement, with the
added benefit that it's more power-efficient because it doesn't reparse
with a slightly different parses like `gpsmon` did.

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


