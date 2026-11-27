Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10372.1795753111656874609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cEiJRqZQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3866a784546so10491276eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753111; x=1796357911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgZC83gBz8Hg0qH4pRB/jfMXquqzBP0qs2I7ahlgfts=;
        b=cEiJRqZQYUIRIkXL+dzGoVfI/4r8kQqL44ETI3HPsWfeybiCafwChTr/8rTCU/hR9H
         J+MSpRsfPWGVMCd631+fzWyPDqTxWmQdjddDcHTuUCvjJASn0ZoMsznBjJFxzC4jkGQq
         swUNyPNpTlwAqUPxt0LTyxNoKRn4ZLSjRjWaAgsoNH+NJb7sjKd6GebSmFZDGNmoIqqG
         zre1aA1QTjZkTb+QsstRWBZKxY2PVNnWhgA/Bn4TdZGGCPBXtNcVJDE0v2ec3HJGI0/S
         x8wmXYWBJAnCwGuY41kFSiT8T/gicJTolxIfwP0aWOigXVyx6bohIsJ5DKjeeJ673kGb
         fT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753111; x=1796357911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sgZC83gBz8Hg0qH4pRB/jfMXquqzBP0qs2I7ahlgfts=;
        b=m9NulpjXEXEzFXqL6v1bJmdQbOq1q8jGICHJK/0/Uowzf3/u4vr1fmOhxrW3irGH2j
         BdnAMTLKaW69IM0ibzUTJNImCZPysJoC/+ZD3TifitZFAt7NuLEyjoBTm0iOB7l7hqO5
         L3lr4VIilE+hVd2d4awsFlhfEPU1xlRnSxBHWDU9A+Xac5BvsN0fJTt6r30GSOL28LSS
         wpVuqVPOH6cwFux0Tv2GugkdFZs3VpOIOfgzYF4uuB/KVl7+8pEGC+tuJAME73jpc4N1
         erun6v/FyzyCJRwYL2W6ujZMW7ZxrM3Hc3XtjQ8GlIlwR3AWOAGd85RpU7ipXUcGo363
         sNeQ==
X-Gm-Message-State: APuU4Z+vz/U0ihboekcKYZgcHWCIoWpYXdTvLYzGrJWGZb3858eM5uq7
	BD/o5LOlEYt4m0DZYzy2WkNl3T4SJptakWtXVmTeUmDyKlvQ1CRcWa65cdt57tSG
X-Gm-Gg: AZFdTZe/Tx3MyrCE/YXXFM8au+rS15yrR+zcrWJujnlyTn7gR3fsh0EtqNc/JA81SI/
	PxmvclqJ5qNU4ClN4/KB/P5FQrXL6IOtIdp7lAbTd9bhib/HwzbKY920d2S1F/1nrP/Q7HPUBte
	/ACEnk8W2fmIP9j6xhIHjWa8wXetMoTiPnu89Xh0yOtAjp06RiIWpn2fRJqoSATd6LUW4pDTX3Z
	OWy59W/plvv/bs32GlJ7+V3r72T7ss9C4PrNpsU9HKLGxAbll1fy7jQk/nl7WV/+3VGxbSsD7cx
	Wrr4B5ev8P7arvpnNd7/ONFMwocErz/N7mlGJcGULNwoSXrJtHX2ABb5YoHP2SkAuAOmVhyvmHO
	d4BkNA2W83z5hB8KZb3Pyi2l8w30dFYO8X4prO9eFgU0TLlhxvZVox8qJV1YGb21IBj5+2Ob53x
	6GMecrhUS5yDQdIBs2knuT0ltI/q9Ypham4aPymXis9tZ6VJV68czZgPQDdZVLG4bN62yYi3vWW
	8GsOoSZskWioyAPj2Utx/5N5YeXJmZwaT7Hf1eERv7gHJG453o3pCxgJZZaft75CLZ7NYRrSMdc
	Rsh321ZcXtgyHiymRq7SVbsc2L1HMlp/QcVB0L1HBndHdwjHS+Q9Vh/9PBsXjMyifpNEYuvZqjr
	WGbsUd3ja/MXZ+rhmYANhNqtOmAhhom/EliPWwlSPJNN0YH2G/EIqvkGze3IygGQglRWDDDkNBJ
	3x8lufC2118NgDBQqz+WlnjbV0NpG4Wdz+0nhau9RADPGBLiM2248wLTMNvUa/Z10Zm1xSmZi2u
	RgOi3JSy3jALGe8psPFewvDLdeTAtLug8N65wdREExsXxyRkBUSawv9sKddVC+9aSf81iEheuKT
	asF/
X-Received: by 2002:a05:7300:88:b0:386:959c:11ac with SMTP id 5a478bee46e88-386959c141bmr21987333eec.6.1795753110946;
        Thu, 26 Nov 2026 20:18:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 01/15] dlm: Fetch from gitlab.com/linux-gfs2/dlm
Date: Thu, 26 Nov 2026 20:18:13 -0800
Message-ID: <20261127041827.1778052-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133289
Content-Type: text/plain; charset="utf-8"

pagure.io was shut down and its archive downloads are gone. Upstream
moved to GitLab; fetch the dlm-4.3.0 tag with git. The tree matches the
old pagure tarball apart from .gitignore. Check upstream versions from
the git tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-extended/dlm/dlm_4.3.0.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
index fab31c1b99..4741adb362 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
@@ -1,26 +1,23 @@
 DESCRIPTION = "dlm control daemon and tool"
 
 SECTION = "utils"
-HOMEPAGE = "https://fedorahosted.org/cluster/wiki/HomePage"
+HOMEPAGE = "https://gitlab.com/linux-gfs2/dlm"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "https://pagure.io/dlm/archive/dlm-${PV}/dlm-dlm-${PV}.tar.gz \
+SRC_URI = "git://gitlab.com/linux-gfs2/dlm.git;protocol=https;branch=main;tag=dlm-${PV} \
            file://0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch \
            file://0001-make-Replace-cp-a-with-mode-preserving-options.patch \
            file://0002-dlm_controld-Define-__always_inline-when-libc-does-n.patch \
            "
 
-SRC_URI[sha256sum] = "8dc23b97390236032a2fe19068c7dad23f82fb624732c9bff6898b6996c9b700"
+SRCREV = "c5929265f4c3e3f8adb0126c456424b70c9a546e"
 
-UPSTREAM_CHECK_URI = "https://releases.pagure.org/dlm/"
-UPSTREAM_CHECK_REGEX = "dlm-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+UPSTREAM_CHECK_GITTAGREGEX = "^dlm-(?P<pver>\d+(\.\d+)+)$"
 
 LICENSE = "GPL-2.0-only AND GPL-2.0-or-later AND LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.license;md5=531f5086ad0f36f6e22cb6085e1c41d5"
 
-S = "${UNPACKDIR}/dlm-dlm-${PV}"
-
 DEPENDS += "corosync"
 
 inherit pkgconfig systemd features_check
