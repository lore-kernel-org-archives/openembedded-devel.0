Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36957.1793167104467011515
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 22:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yFSSmHMV;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso1358989c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 22:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793167104; x=1793771904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/4IlpTrqxPvTRZy01/MDu8Aq1iJ8AxuxTayQmbdoU8=;
        b=yFSSmHMV6EsOrhpo6sBV+pfG+SIw9hOVTlYTJbkd3sR1i1uVqB4p5Q5DxfIthEWasx
         gfyGGwu+cSWRM+1x2sjP0I75qGBC4ssVq8snALwMq/VKPWqHi2mJErIUEtNCsu1Qehza
         DHBHQC8mVFu26bH+QngeGCw1MLTo1GfiTM8SwOOV+ZaWsscXWY3Mps0CEOifpY68mIpx
         qMFIQPvhrcpW5tRaoKEeUawMcY1c7i92nETEWqGxOex+Awp0J5uuJSnAf/NEXU19t8Ns
         Ft69fHfymegnTf6ExhLkVJKfGzqq/bws4DgaQ2//c2YV/V5IQDksRFABhS2WGaip6BaB
         lB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793167104; x=1793771904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/4IlpTrqxPvTRZy01/MDu8Aq1iJ8AxuxTayQmbdoU8=;
        b=Y2N7CKZ6K/2uNItsF50ZzK0jCKgsMe1DFCHkZ5l9zsWce7SC8nvvyxdgXCfQDVhm0p
         FPhhWSmmBNqAGltVtvauFltFRPkTzLGlfbS/UeNE8YBTVMbtbDAdbmbxYdZCPHK4X1Sr
         bjy1UNxCeWU6zxpOj8LCoUAyJ5M/gcFzRA/OgQXdZBul+fl1Uz7OGLlY558OR0bOvs6Q
         FxlhUSRgpd5JxPyztk4VnEciTMvwYzV4EhvMdVndDbP3V+YK6B1WGPbvLYrvS9zZEis/
         C+iZ0zCedE7D73mYEnST4mAuaeArgfzmJn3GMIffaFNdWARnnuZaX2RKgq/bZeKleBLv
         4MBA==
X-Gm-Message-State: AFq9FYL0DM1RiVk27Q9sU5I3EwyoVKavmmPN0vJEaEYdCnr9Wz0mSipu
	LqOXfZgJvwQsHiWTPU1wIZrtHFsjLKD/X/H9C6rWafECqL++AVdmKqd3zgDpTSb0+BE=
X-Gm-Gg: AYBFou03dv38nD46/QB+a40CFLWrg4ZVK/MHojJGtwTzvWMDFl4+JE2o4oJld706VTC
	na7/3KaDiH79+p8oF1jGMmlodOpRXJAKblzo5t0WYzQo2KLxd0wqDIfsh55zgg0b7sUdZ8FH0PY
	7IfXRQ7qfwzBWrTAYKzXEnAZOmPU22CUp+/xY7MCjxcQEsfzSYvnTBSG87WzwqIWdB0p9X7+z7C
	O1aeKIz1zkC/gL/NdrOBjqebxtwHTW9F4v73s6IVE7vc25VSXxIZ9UOHshdLnW8WMC7PHavrEpJ
	LJiECYX113aWFzrsfzcBZL/MgDrTLvmTXHDmb0lxYV6mzb4+208DmWOJAGvgq1qZHUSr83poIKm
	oavv/NVX5us5CSgc7ZDeMMzZ+3RATfPJd7AJ8CJBFYgCesdgc+veNmDW3qJOF4UcQ9v7Fu+fGnz
	3cBooWc4UWkQJdhxKE98dURH52rxfztnBSBzc4OtHmbU0ZB9xEe/DWOwvCRhfYTdZtFg+a7W8qA
	xAhYKATV2rpcc8N489Rd8hUN8IlTnexWtLwjLGLqvSVFWysZb9+liy8BKmQK9tUDjzQGXxpQRYg
	wfOy7+1wrzKrDTN2vVW0rJBa281wjL8Nl9rZmbdjvYwjJIFOIZxUTuWEkI2RN0FCRue3jPxsRl+
	fSv0QlIr5Q7gxko4I6hmzXy6Z5W7+8gkJEB/08qbxQ5U4oPdKoenekT6Ke+Z3M0bvmddukuVtbT
	WzELo57gas+RpWUKZ9Ok73UCDV8fA2KnEX9rgp2RPtsrcrtZ8Aub2zrNIOgOlCVvr2k7Wgco+b/
	Y2uIlgaPYVwARnXRigWOWG1qZX/fFkGF2uVsakn3kwWpV5NsR/hVBYPA+ZPB80b3vQK1aM+P7TW
	W+nYRqMItVKKzpo2Gq07crC+0A==
X-Received: by 2002:a05:7022:408a:b0:187:7514:47f4 with SMTP id a92af1059eb24-1a6cfb04000mr1987442c88.46.1793167103578;
        Tue, 27 Oct 2026 22:58:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75a37093esm2181914c88.3.2026.10.27.22.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:58:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 4/4] tvheadend: Stop using gitpkgv
Date: Tue, 27 Oct 2026 22:58:17 -0700
Message-ID: <20261028055817.4055253-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028055817.4055253-1-khem.raj@oss.qualcomm.com>
References: <20261028055817.4055253-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 05:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131621
Content-Type: text/plain; charset="utf-8"

PKGV = "4.3+git${GITPKGV}" counts the commits up to SRCREV, which is
always 1 with shallow clones, so successive SRCREVs only compare by hash
and gitpkgv warns:

  WARNING: tvheadend: Shallow cloning enabled - gitpkgv.bbclass will not
  generate sortable versions

Drop gitpkgv and let PKGV default to PV, to which the fetcher appends the
PR server AUTOINC and the revision (4.3+git0+cc60283368). The AUTOINC
starts below the commit count used so far, so bump PE to keep the upgrade
path from existing packages.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 6a7f6c3f5d..4752e30e13 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Tvheadend: TV streaming server and recorder"
 HOMEPAGE = "https://tvheadend.org/"

-inherit autotools-brokensep gettext gitpkgv pkgconfig
+inherit autotools-brokensep gettext pkgconfig

 DEPENDS = "avahi cmake-native dvb-apps libdvbcsa libpcre2 openssl uriparser zlib"

@@ -14,7 +14,10 @@ SRC_URI = "git://github.com/tvheadend/tvheadend.git;branch=master;protocol=https

 SRCREV = "cc602833684953fc3e6f1c89d4f08f6dfef179e3"
 PV = "4.3+git"
-PKGV = "4.3+git${GITPKGV}"
+# PKGV used to be 4.3+git<commit count>+<hash> from gitpkgv; the PR
+# server AUTOINC that replaces the count starts lower, so bump PE to keep
+# the upgrade path.
+PE = "1"


 EXTRA_OECONF += "--arch=${TARGET_ARCH} \
