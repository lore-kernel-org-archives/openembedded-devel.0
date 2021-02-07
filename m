Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.27015.1612734903729191195
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 13:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G/gwAYsZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id x23so6971818pfn.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 13:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MnVmNM/3vssWIvIjIo5TQdn1NRmo3fVSBowVjlpYUGI=;
        b=G/gwAYsZ8YsErTP0NCz2SWes4Cmr5O2yoE0Kee7egu7xg54/3srubSx9x0i1YZ6k5S
         5DcnJCoK3zcQC5EwUa/dyTd5V+u7iz2o5pZdMffYZRv/OvB9DZSi4WEt5Nxt6McNucFC
         GLUm99Nri+uxVWLA1CNVXe2AlzQJn7kq+HyMcXjttx/+1/t433Tfv2aTc4aXnTsq8SkO
         Rcj/VssHJ+OrU6E5TQ6RK+aBMk7ycum1Jx0CXq1GxiKqStVFHSmAum9faY8/PYI7w2L1
         sk6dgmcJLmhKAIdBcV9ITlTYm0TnaCkoYko0qdvoOL78i4s9ZXEQcYjxh7IhWBCg6XSH
         pZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MnVmNM/3vssWIvIjIo5TQdn1NRmo3fVSBowVjlpYUGI=;
        b=CULyaDYD0S+JaeluvpDYeP+/29pc0Qm3EQsPXkL9WaL4S90JhK9s00+Pi+ENlaftDt
         oNIa2M9H+U6acVY7YKciyym2OGgV29dBN6f1GQXgUlkvIMFPKuIWBdWh2r05beXR4ODu
         SEf4rlCv6cchlZYcXqF6wUf8KinYK8gGJhSXIyGh29DUwoIrW4sM34pA5gapBpgN76jb
         sKQP85/punOLp7paRNOrLQFgto4Tfke6cdT131ICvq+Uk3yXA5rRFPyOarpKySgKx/KD
         I4eLrf+97pmOSCKTlWjLXW72Jg/jSodr/1FBireCwCPHTRh9RZbuG7cClctHamaPOb3C
         SvQw==
X-Gm-Message-State: AOAM532svKeeir8rGuYctlZ8JaM3ChD+VZBsaldE7oX0U8HS6Sb+qvfj
	nDg/OKPwOEvDOeaS6wb7pH4qCSZWMc8yzQ==
X-Google-Smtp-Source: ABdhPJyNpeodhiwejCXQr7cjbyuzRSV+TcDOtimUi0XYnq7CMvcy4eLJ9b31Tzx6WeHBHW1Us8NeMA==
X-Received: by 2002:a63:fc1c:: with SMTP id j28mr4758695pgi.281.1612734902757;
        Sun, 07 Feb 2021 13:55:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id z16sm16805145pgj.51.2021.02.07.13.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 13:55:02 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pavucontrol: Depend on libxml-parser-perl-native
Date: Sun,  7 Feb 2021 13:54:59 -0800
Message-Id: <20210207215459.442793-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also use native perl instead of build host perl

Fixes
checking for XML::Parser... configure: error: XML::Parser perl module is required for intltool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
index 51d7e2a2ed..6c07eff764 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 # AM_GLIB_GNU_GETTEXT macro in configure.ac. That macro is deprecated, so the
 # glib-2.0-native dependency may go away at some point (something to keep in
 # mind when doing version upgrades).
-DEPENDS = "intltool-native glib-2.0-native gtkmm3 libcanberra pulseaudio"
+DEPENDS = "libxml-parser-perl-native intltool-native glib-2.0-native gtkmm3 libcanberra pulseaudio"
 
-inherit autotools features_check
+inherit autotools features_check perlnative
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.30.0

