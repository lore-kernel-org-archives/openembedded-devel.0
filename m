Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36045.1793161473080299024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XX80e43Z;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e987a2ba0cso2892925ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161472; x=1793766272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BFzdwDFW7wTV3svdpv55mLXc0xFJAqXCwGrZefnb60=;
        b=XX80e43Zmr5NKh+WXjtnmKEapBVJ+6ijpJB6ByIZ8/9Klf7o1HJjTHHArlApLY3geB
         60mavEHiKh/Sz6VZw3lMfM/5pEjUBQGL0CzwrHu1tzs34pOawmAiWt2ElSf/k3PoOD6d
         JzLfMJOE3DhJolbqO8AE6cernnDgo4W96+zSN5D6tY57u3IKwC+4C/8qatoPa6QceMYf
         isxdhZy5ABHT+vqLdDySZ9j333aPipNokHE9f+EsjcbHAmBWh46K31rZl2kudD8ilqKb
         9Q+jWVMaOjgLXf9/6tCEjHItNnJLJTrDSdtyZeAtjrnClaUTAfiVwc9rOkhozqph0iNl
         5cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161472; x=1793766272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3BFzdwDFW7wTV3svdpv55mLXc0xFJAqXCwGrZefnb60=;
        b=PRhVE8cQXcp9TJ905RVTLz1j97h/1KuNrXdCRICsdl27rHKA+rmqoS4IwJuoU3qUAk
         DVNVx5kHb1zj1Liz1/PnhgFWqCMCFH190Wd83ldz2LhbApgBJkusNV3Ieso5RvsOks01
         a8gQX2L3JVahNZ0X/JO6nlG/2Y+wt7hLskCRMPv5wzSXZNioccphZ9hajUsSRz5O6nL/
         owZFHmm83CFKV6SoTqQ3RW5Bl04CMWs4SOOOdwreFneTaB1mncefhKAPjyNEQjBDk+Xp
         EzTMD+7/51K3zyH9KPkY9lkijcSvLsmldxHLRWkPR0HL9l7NTMGl5yTblL6Jh2udwXwl
         s3QQ==
X-Gm-Message-State: AFq9FYJDMoc7YUyBE3YIoG9QgcP9kJ8ypxR2FqICIbGTJWAzjAkcSi8W
	53Zx5B9KGR2ukrVxId2pTamRxiltzQqm4LsTn8/uotJ+eafxTNsjb6Fod0HUJw==
X-Gm-Gg: AYBFou2K0UNZQ/5nGPvYnKb/0NzaA1jjFd2WiiX997s7+Xd99zIXyV9lA8DjCuAxO9J
	mEKngXCEHPoclMG6N4dYYr7mRhXhH3FzaZUHGuqGeCltLz+eVy4TUmIbBY9XDynEdE4wva1KnkH
	XlRnuxl28BiMyY7b51iD5D8L3M3LmLfpUHZms7U5GpUktE3bLAHXSBrUPW1Dgs4Jv3tcPB34gbv
	wvTSsPQOkXAQ4/ZeEJk9HuvEDeu4/GK8GfS22fainKFCTbJTJ5vJDRT2V0dl2k6eTRrBBoV8XKY
	uLc7YsLP5QcmigThioUNbcNgAiDQe6dOwqQA1VbFSQ14KqPIwdDVpxGWVepv9hZd59XbsfOhpFt
	Ihsqp1lFqa3YIXzpV89vA/yUZVmcbz/zfKkMzO5p3IHx7+fOgkxZ5blrMAnSoeI0tLoXDNsNv/m
	Fx7TGVIaN7wcowkz0lP0GNY4tRC/V+ZwQ0LZpfciwrpXIlwe16chH90KDzVcOB9eJgBllNOFTqO
	WeSXTm9DWGAmQHunIBmJoCNCiYsltwPY3Kn3DeQGACpM8MLjpcTu5iABqm9J+yMUl3FK9JVol9v
	a6wBzXdm++OQXaZTHUy4oMnM+ioSOFtLPNNQz56WRoZTUhbIM+3l1kRKqvvWPA==
X-Received: by 2002:a17:90b:5201:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3ae58289e21mr897472a91.65.1793161472451;
        Tue, 27 Oct 2026 21:24:32 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:32 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 11/60] libmikmod: upgrade 3.3.14 -> 3.3.15
Date: Wed, 28 Oct 2026 17:23:09 +1300
Message-ID: <3fb79999f2fcc2aa52918d418b1a1e0c53df9d34.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131563
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://sourceforge.net/p/mikmod/mikmod/ci/libmikmod-3.3.15/tree/libmikmod/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mikmod/{libmikmod_3.3.14.bb => libmikmod_3.3.15.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.14.bb => libmikmod_3.3.15.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
index 2468943349..bfd15cabe1 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.14.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
@@ -8,7 +8,7 @@ DEPENDS = "alsa-lib texinfo"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "dffd82b8f254c3489c32098da831f33eac7136843d1e7ccb802f1254ad5b4219"
+SRC_URI[sha256sum] = "dc27b338154b8f88dc9e6317196d42c6abc13bf63c4e055257a18d4e38e1afa2"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mikmod/files/libmikmod/"
 UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"
 
