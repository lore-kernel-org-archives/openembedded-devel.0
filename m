Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.9019.1605292854508273355
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2020 10:40:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GSogWYds;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: toertel@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id e18so11891330edy.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2020 10:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fIx62wsXU6tKR4AD93cn0e2MkO5BUV2v3Jei885RM1o=;
        b=GSogWYdsEQI/HNDQSH9GSkTyfWDDjpW7Q32X0aXV3UcQYtmhVO90WwbaSzABoVytK7
         isjGjJmnh+v0EUu+urjehunPEuJj/OO5WD2e1DU+gq/jzdJCpxGyU1ZWBN/dTcq3NsgM
         JDeAXotcQhyIYOCuaIR92zu8FR21G78rbRcxWdr3YpzJGYhnjr27NaEifBFjjuMWQ97I
         vipcsL4CCCydBqRyULNqB5aq+xyiPkeESDJiS5NUjBAw0qJQM+VFljrcuqiFxnz16/EK
         SSFI8g+0GG564qHfxTe0LCXmisBWd6AVRi0/+NwlhIt5Vnbi1zjPEs0rxQ4oA/hBHath
         Qn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fIx62wsXU6tKR4AD93cn0e2MkO5BUV2v3Jei885RM1o=;
        b=f3HNZwP7eY6fkXeTcNF1y1FqAUMq8LghOTqmYTLyv/Ke0KIBvkUqyuTVfpiB4JtSci
         HIcuNr2Dyaoo+cICjAkVzUE1NrGjNrpjQsup6FlqDv37bRbrgX3HTfcCokgU+eTnzSNR
         frTRQn86FfQRKFu8aZqrF0o30GnlhsvPVgbLVsQmKyHQag5OvUgDOu8TlN9Nohg1/QZg
         KUmSY6BsdSIQtyetpGGCLg4Fp8yzDDDit4FnyJ56Mrs7qQDqaBA0y/n1v9ce6PUks4cx
         GxzrQlKl0HTw76tBaGDXCetksfbiP3+cmWnFPMNbBdGIfAV426TA02CXQwHveQ+EZm30
         of3w==
X-Gm-Message-State: AOAM533iKmr1kVwm3g7tPkdSGr2QlSEMZgVPT4F3fgB5WZcypYLjr/SU
	0T9z4b3v86VAhsBtotXPeuxUj67YYFzypQ==
X-Google-Smtp-Source: ABdhPJxUPzyrggXS4Mt+QEAs6mymPH8KrdmW5SvMrPBSzSJoFRgmn/kpbJcqiCVlBYTQmY4o2LOPvQ==
X-Received: by 2002:a50:9fcb:: with SMTP id c69mr3808709edf.289.1605292852451;
        Fri, 13 Nov 2020 10:40:52 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf2d6b000513dc97cf055ec0.dip0.t-ipconnect.de. [2003:cf:af2d:6b00:513:dc97:cf05:5ec0])
        by smtp.gmail.com with ESMTPSA id 64sm4792310eda.63.2020.11.13.10.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 10:40:51 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [meta-oe][PATCH] libsocketcan: Add PACKAGECONFIG options
Date: Fri, 13 Nov 2020 19:40:45 +0100
Message-Id: <20201113184045.44235-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

libsocketcan offers two configuration options.

debug: Compile for debugging. Off by default.
error-log: Logging of error events to stderr. On by default.

Because error-log is on by default the package config option is
no-error-log to retain existing recipe behavior.

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
index 0debe47e0..917f5e684 100644
--- a/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
+++ b/meta-oe/recipes-extended/socketcan/libsocketcan_0.0.11.bb
@@ -12,3 +12,7 @@ SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
+PACKAGECONFIG[no-error-log] = "--disable-error-log,--enable-error-log"
-- 
2.25.1

