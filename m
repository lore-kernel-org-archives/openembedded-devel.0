Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2575.1794961617464823283
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=sTMSbNAp;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-382f4710a17so6359eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961617; x=1795566417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CiQFy9fNp3rOTJbLVpTyuZscbjbJhaVvFPXh4HATLpE=;
        b=sTMSbNAp8Br9qwx/mZgLNkDjvPxct0p0MN9NKhEdEEUppOU5Gsmhrm/ZSqMPhi+2R1
         88sBeCFACQs2IwokeGRD54ZhdeOd+YGc0k6NJOuSNpMV5taWnkyst9oftkKmaxl9OagV
         LPGTlT4ua/RXNEb+/ZhxIilIpdg6sNH9A3YO1oJYzoLRi+6gnolu00xyW+v8FYrV+lhU
         ECOm2yTiweR4uJqHgXxJ6B92XO6XmPphdp8tBrjVBEWJvAhgBdEz2Ri7ru2TxgDzICbc
         Gmq1W9/Q/AR73dgnWlrpP+hRaaz5OfpH+ap2uPRjck/J6UqRPp+r41fdgXxaMBybDRJz
         FGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961617; x=1795566417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CiQFy9fNp3rOTJbLVpTyuZscbjbJhaVvFPXh4HATLpE=;
        b=WNxtLCArclJBsxA7klJszvxsux0kLmI4FyAPdYSHDSR9kimBiGrWGPQ/YbvTyWdf3D
         FCIWR67cekSCDff6Sp7nWStbmOHZZdJxlYMt3XiBGVqrk+ymjPr86079WCN+oL+0qD3O
         Fmg2Buw9fecEuwYN3eYFMRBRxeL05nC8ZNGNj68xSeVZcOwpQfy9lf9gkbyi/S83/CDO
         24bs/ALifmg02pds9S4nKRh0XyFXgszayqOnqTwnSusd8gFOzdJLwSouqzCySRPvBz0l
         cgfB7R+hjumw19I6vf1QEFQ/E2jDMny7p1b9XPBfJ1GwKHVUrYwtRGoYfcV/+KyQSbtV
         8YRQ==
X-Gm-Message-State: APuU4Z/UrJfXznPL+dT1KPOoBz7z19BDdZF1mcVhrUi4ZfEQjA/tfmrj
	MkD6gVp5K1+U0tIctzlJQk8MBfX8zMxhgR1ipv66x3TmtbBAV6R3uAnyM7h1rO0l
X-Gm-Gg: AZFdTZcBXbHZ7+A6lcTBAJB1qSoz2ZkEzr480mg8vrpjPIJDn0bFJNtw1ZR4gpICrOi
	79yoZQRGky+A25wITKEtUIBEzneDR+u0POgGHc525gDtMrn8Q6yBh21C+t15nyRofdqtchd5wdE
	C8YDRRdDhvKSmcO9siDSBUR3p71TLxiH/EUZF2/HrM58N/sL7STsy5QTUvde5cRFrA4NbUk6Eto
	ha9xXK9hosBh9BHwsQ8aD80WOM49S1S50T3IYB+aQ7/Segu4oNprTG83Pr95xzsRyApMw/xLIRr
	eKoiCVFAHePS0Zs1WOq0wvFbcuth3H89rwMUrvZC2kNR1PtQbyYMHgm1JpQHUVrI67txVUTMD2u
	rJEg5s2EcXezAf3urxuYnbCLE16nfJwOQYNcsSpe1ragHzqrQ4gABsAIOFvxdSCM5yazvSZY4Z7
	yx5paCmzNeNoQMltAxUhP4/bz67YCasIz7BfiIpvAmzH7PjvSw9uDS02ARorstjD+Yk8XdVGZ9A
	xMf4SGBb4yboeuN+pBZacirMzQOsShdNywVatn+AK8kxoFktPv7SR++QP+97poUEpdz+JWldBRM
	PNoyORB7teLKOiwe7gLeoKqQBw3ztGQQ4YsOBJepZPe/yt+P2jc/JrT+cWcqQgDNhSkjWM8RJY1
	E9zbDHg5UhEGRGM07EOjtz58wits/3h4vJRuOqf5UV7cTVI0Mm9d0N486S2CiBRtBnkWJbiRyud
	f6KtT7+43XkoT2+4uhjeLJL7DesO197JzxlTcn/WeYLfrT6/rn8M15NPB4OpRQLHFCzk9x6xOwJ
	8b4gp9NQbD1vGSRgWFMbA14s/lelan/5YiR6X1lh+jlMfhEe2FeZJrYKCjrCsxjcmTyQzFg+ynV
	orLF
X-Received: by 2002:a05:7300:cd90:b0:36c:a154:db1d with SMTP id 5a478bee46e88-3827d8222b6mr1523887eec.4.1794961616594;
        Tue, 17 Nov 2026 16:26:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 10/14] libpcsc-perl: Fix LICENSE to GPL-2.0-or-later
Date: Tue, 17 Nov 2026 16:26:38 -0800
Message-ID: <20261118002643.29829-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132611
Content-Type: text/plain; charset="utf-8"

pcsc-perl is not under the Perl terms; README and PCSC.pm say GPL
version 2 or (at your option) any later version, and LICENCE is the
GPL-2.0 text.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
index d6b1773640..363d49afd2 100644
--- a/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
+++ b/meta-oe/recipes-devtools/perl/libpcsc-perl_1.4.15.bb
@@ -4,7 +4,7 @@ together with some small examples. \
 The provided modules are Chipcard::PCSC and Chipcard::PCSC::Card."
 HOMEPAGE = "https://metacpan.org/dist/pcsc-perl"
 SECTION = "libs"
-LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/W/WH/WHOM/pcsc-perl-${PV}.tar.bz2"
