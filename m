Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1880.1795113440298095221
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wRjryUlE;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso62725b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113440; x=1795718240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sL6jp6oobL0n3Id1ovdt4wIIWLuB+ajXLjT/CZYSoD0=;
        b=wRjryUlEbXZFKDaAA0YXSZOFX0uCmZl3G3ReIVlNphbgUvLMeyDs8RQHpP6zCgBpxX
         QxDihsitAG8x9cUDWxeKPcOyfK/ZuqXsFeap3oKAxifw0ix/qrYCopJmF4eTcopy1xVM
         8/gQCdfU9+vEq6o58EhgYaW25m8HCBgDZJiB1fKOWFztBPVETc0KFuzF5nCGQazKaURg
         ttdAQO1c9YUlByibuYKs2SUkHti+9PsZdHeXieDZEgHJKwlHPMy/we+LP40TtiV8sdTL
         xF1AfreVzTbG5td6F7XefjqPBtSXtWlt1hGAfwSInvEtv1t6S48JeJfswEE9UK6CydSI
         L9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113440; x=1795718240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sL6jp6oobL0n3Id1ovdt4wIIWLuB+ajXLjT/CZYSoD0=;
        b=agLb3ynX2Fcdqg6Fd/DU+auC/5a7wvRLk47rHTuV1Sh3d7fICtwAz6PJHVQpP23GEz
         BnQpd/pYsfaRHchRU65ewZehglriR5jAM22kzh+B9IIr3Nv+cT+tI0oAdHOZ4lqg/G22
         M73legGzrNUk8jPduR06gOnw+DzQNPja2kBI6/zU74ATnFAuKBFkLCOcIM3XdgeLJHZ9
         SX3SGLRNH/1q+sxn05nSffqsuL9LAa2MawV/o7v0Zu+nYTCAZi6no4iVSXHNFyRyMfAs
         kD+zqN5V1WO8WV2ocjCKveAbkKbufq0YB4s8IQw3hHvzyAg81Mrd43qTxQsRm183AgKf
         v+qw==
X-Gm-Message-State: APuU4Z/KTYVaLPQ5HT1YetmULeKIqTZFb3ijLBR5o8xWnkQSBtHnCCbk
	1mdbZnz5Nw2WMzJigcOhpa1ufjRhb5ldrqNHnzEZDHInUplhN99VtGb4yfOSrw==
X-Gm-Gg: AYBFou2MusBW09vNTyIGOhjzM4ijhUkUcT28bJMrosSQ/npPhuKHQuoHVm9qBo3xazt
	kZiACFFSxUFm04akMuc8Smkb5DU+/WKFNXS7V2iHwJI0t/4Kqc6mPmLcagfhKihkX9mwvGqfAaY
	OvW1ZVsRaCuKdc69ZZ7WQ03M9G8gm68WFay33ix8QYBtb9MoZU/5fUajbVvv2XPFwcLyYtn9e4M
	NLzQsTuzAh4ULZKSanBO4baCoy8mPZKMTZyYF0KbxCXtTR0/msDIvJ3P7HBkYFEHoRUQdDM0hTu
	d3DHWnfCJ/6O+8Dh/P5oExvIOi6xkikzPJZXa675zQa6laOYcADlVVL6G7SdVYF5DQ6zGcu71Kr
	jeGabzpNLun1PQfwmON80kW9jAEZC8gkCGstg2UU5IbvgtOwWhz7PSMhtGU/OYTMIS1OtHqhDTP
	1X4eY4eLoDNXFuIEbu/atnH+nmPUvDXKdZ56df5oyaR6L2YL1wzExRMx3A3N8ogk4C48SWgQxeL
	1apbdEgfBWUp/XH1ywd0uu++2fCVkCtfLsMG8lEDYzSDouDJRRFdLiwVv96PsAKsnP+Bm0y5cZM
	oDF24lFw3GnSYp8cAPkhY84ZBZnwe58YZsRBzZ4XWlKmgGGDdY+L/fBcN3fEbw==
X-Received: by 2002:a05:6a00:1786:b0:886:a737:e0fe with SMTP id d2e1a72fcca58-8c87c197705mr428535b3a.23.1795113439688;
        Thu, 19 Nov 2026 10:37:19 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 33/64] libmikmod: Upgrade 3.3.15 -> 3.3.16
Date: Fri, 20 Nov 2026 07:33:01 +1300
Message-ID: <33aa89552df6f71bd0375dbff396754cb2f5df62.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132723
Content-Type: text/plain; charset="utf-8"

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.3.16:

- Fix out-of-bounds reads in MTM loader (CVE-2026-111165.)
- Fix out-of-bounds reads in IMF loader (CVE-2026-111166.)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 35b8bd0c0bd118f612107cedff4f563bb008c649)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mikmod/{libmikmod_3.3.15.bb => libmikmod_3.3.16.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.3.15.bb => libmikmod_3.3.16.bb} (90%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.16.bb
similarity index 90%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.16.bb
index bfd15cabe1..54e92721a8 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.15.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.16.bb
@@ -8,7 +8,7 @@ DEPENDS = "alsa-lib texinfo"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "dc27b338154b8f88dc9e6317196d42c6abc13bf63c4e055257a18d4e38e1afa2"
+SRC_URI[sha256sum] = "7b24e41468b0dfe7fae1104ae6a0d7c52e04a65e1851b268c7074e4d06685a53"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mikmod/files/libmikmod/"
 UPSTREAM_CHECK_REGEX = "/(?P<pver>\d+(\.\d+)+)/"
 
