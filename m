Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.15228.1604943510600211819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HSKoEzoa;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id b12so5082800plr.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pm3k86saR0270r24mOh/TUw2sMzIYJNQeYQvEqE+Qi8=;
        b=HSKoEzoaTSU3TS2tKcSA+7B8X37xOy0N2QYtTUxVMCd5kdizmiIGrQq1X0x7rhuRox
         vsKoAEa+poqIJiH1h0i0ieeUd9ke4V6z3XTXy68zItWRk16j5zUDc8NW+keq2Ds70AuY
         K+20ZX8Lhcm6gqdFhQGuemO+P97l1nF7V0yw+aJ7Yudv4fYaEbk+BcfwDR9zMOZwKXRz
         wL+epm83qfv/qmEOCnQDYO0Vc5pJp7W7a4h2p8UOV+4WThhHXyiQCgeO209PNAz1B4l/
         iE1mRtxsOSECptzrF6UQNYGA8+cya51x8OlVAzkd3uCRNDjOrJqE7wYenNtz3SW9xFFt
         WdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pm3k86saR0270r24mOh/TUw2sMzIYJNQeYQvEqE+Qi8=;
        b=PY6w1fTSwwuvpySTfa/Pd6ruQVATOhVOjD5RS3SvS13Q+1y4MUpDID0sjwarBd9ZYe
         nVTzxKplC+reZ+OOD9BsQzMB+abqCVBMBw5e91JCJr4xrgyrhvsLu9ADLTTKOp2gWepK
         bHtFWaZnIV4NTRvq82SJtV9mbyHGw0TysbyVBkc3wjL01aOrExzAGioCtrYUgue36j32
         BR/r8yR6ja2mwzKt7mX3Eu7RD5aXoTkgaQTUPG9JXDYh1NyuPohD76XR1iemyo0WTuHx
         J02SQ4jcOwMZftz5dnXBUTi8eltNd4eDkpZ1hZPAeel3/6Ddz7YPkDdD4h0V06/7aUFm
         SqYQ==
X-Gm-Message-State: AOAM5315nzud0OqL33FCbt/hwhAZ+mkzTALmr0JG94HUNotzmVpVb9Bn
	P4eZOaDMOWMTMMeZjqoydM4g0CQ+iHhdNQ==
X-Google-Smtp-Source: ABdhPJyfDbGevDs2fycm68STN2mj5W5B38Qow/BNy/6LebtArENdTKGldPqVoImLftTuJGpDUUb50g==
X-Received: by 2002:a17:902:c14b:b029:d6:ab18:108d with SMTP id 11-20020a170902c14bb02900d6ab18108dmr13989383plj.20.1604943508307;
        Mon, 09 Nov 2020 09:38:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id d7sm11198467pgh.17.2020.11.09.09.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:38:27 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/8] traceroute: Fix build with LTO
Date: Mon,  9 Nov 2020 09:38:17 -0800
Message-Id: <20201109173820.3545516-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109173820.3545516-1-raj.khem@gmail.com>
References: <20201109173820.3545516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patch needed to build when S = B, we do not use this setting
anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../filter-out-the-patches-from-subdirs.patch | 47 -------------------
 .../traceroute/traceroute_2.1.0.bb            |  5 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 meta-networking/recipes-support/traceroute/traceroute/filter-out-the-patches-from-subdirs.patch

diff --git a/meta-networking/recipes-support/traceroute/traceroute/filter-out-the-patches-from-subdirs.patch b/meta-networking/recipes-support/traceroute/traceroute/filter-out-the-patches-from-subdirs.patch
deleted file mode 100644
index 2c030b55dd..0000000000
--- a/meta-networking/recipes-support/traceroute/traceroute/filter-out-the-patches-from-subdirs.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From e273e0ebc753645555909bcc4874c72458b17891 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 17 Jan 2014 03:17:44 -0500
-Subject: [PATCH] Make.rules: filter-out the patches from subdirs
-
-The $(subdirs) contains all the dirs under the ${B}, and this one:
-
-do_unpack[cleandirs] = "${S}/patches"
-
-will create a "patches" dir, then there will be compile errors, filter
-out the patches will fix the problem.
-
-Note: poky doesn't have this problem since it separates the ${S} and
-${B}
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- Make.rules |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Make.rules b/Make.rules
-index b077cd5..0bfce2d 100644
---- a/Make.rules
-+++ b/Make.rules
-@@ -97,7 +97,7 @@ endif
- subdirs := $(filter-out $(SKIPDIRS), $(subdirs))
- endif
- 
--install install-%: subdirs := $(filter-out $(SKIPINSTALL), $(subdirs))
-+install install-%: subdirs := $(filter-out $(SKIPINSTALL) patches, $(subdirs))
- 
- 
- override MAKE += srcdir=$(srcdir) subdirs="$(subdirs)" shared=$(shared)
-@@ -106,7 +106,7 @@ override MAKE += srcdir=$(srcdir) subdirs="$(subdirs)" shared=$(shared)
- INCLUDEDIRS := $(filter $(INCLUDEDIRS), $(subdirs))
- LIBDIRS := $(filter $(LIBDIRS), $(subdirs))
- MODDIRS := $(filter $(MODDIRS), $(subdirs))
--EXEDIRS := $(filter-out $(INCLUDEDIRS) $(LIBDIRS) $(MODDIRS), $(subdirs))
-+EXEDIRS := $(filter-out $(INCLUDEDIRS) $(LIBDIRS) $(MODDIRS) patches, $(subdirs))
- MODUSERS := $(filter $(MODUSERS), $(subdirs))
- SBINUSERS := $(filter $(SBINUSERS), $(subdirs))
- 
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
index 19bbf03f1d..8cce9ea4bc 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
@@ -16,16 +16,13 @@ inherit update-alternatives
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/traceroute/files/traceroute/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
-           file://filter-out-the-patches-from-subdirs.patch \
 "
-
 SRC_URI[md5sum] = "84d329d67abc3fb83fc8cb12aeaddaba"
 SRC_URI[sha256sum] = "3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6"
 
-EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
+LTO += "-flto-partition=none"
 
 do_compile() {
-    export LDFLAGS="${TARGET_LDFLAGS} -L${S}/libsupp"
     oe_runmake "env=yes"
 }
 
-- 
2.29.2

