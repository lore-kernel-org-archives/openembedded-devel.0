Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10357.1795753060002614779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=tLxx8lOx;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b563e5cbc3so650984c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753059; x=1796357859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNTFfvrGNw3/Ei7gs0uelfZa6hpDUMBtzPnBvumYs5E=;
        b=tLxx8lOxPpUH4I7PQG6Uxr906YjW4uJ4QRFx9DstHbh3UQEiQWbCB3qr6S3EzU7/yl
         Ytx0q2gNZaMw083b6Dyb6Db0LmtRmyBR9EZqb+iCfpaX9WTwOuVOjchREGeE3GkGxPmB
         k2nr6hKHExviyxQ+tGTwcjS+umO7BW3S0wMMOLf2TvYlI/C/pkg2llNjtr3/zOxpJh1q
         SjWUfFQzYT1qd4TFvZPxuYnpYBx7BMJFjaZSTUNm4MXJL6JXOOQsTwWDoJsHtNFJm3UG
         gHhnFUJ3sfisinhAGd7qusxcah7wmKlj5ZqH1OvYxAdTM0FpCinqir9yfY89Msa0rSVa
         Ylzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753059; x=1796357859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNTFfvrGNw3/Ei7gs0uelfZa6hpDUMBtzPnBvumYs5E=;
        b=napRUevm8+7nDePXIecHnGfITHxqU6fBLSOijvAhCW6YScP+Z0WvJaDfp7q8piMUOh
         Y+7oq2ebCJpNKn+CUT7IIEz/jWiePX3J+1eedvUlTSFt6sg8uax6ZpW2scctGGqRXDGB
         fj+qluoE51/DlSe8EtESXQ50urAFIJHMtbEh17FToiGSbY3oLib6IprvgU3R3BcfTOs5
         JWq6xMyercOsYdGhJw4lOfUVgniaQiz75yaVjGDmy4/Ref3oJALbwJpAoVpPUaXoLrsW
         FFznpgY7saWH8gC1YIS2Khcl2GHR9ZR+zj9sD3+R7pSBrJoa+l0meMG8XPImjrSWRcHU
         184g==
X-Gm-Message-State: APuU4Z/xDQ2eXDjqanyBsK7TLLb4K5JYd5SYMnpm3wK66CymQOPgVK+M
	ocbbH9WFJP98Spy+PLfwdWG7g4Y8O4CWHoygSSIng2r6VnJj6umI8geZ2b6tdPyR
X-Gm-Gg: AZFdTZd/2GgCTFBfLT5dDGWXvI/9wfUnIBso2CFyFPfSu5KIVdr209ox395tA+BZQSF
	AN21k1gpUgVfIDjZRGtuJVerI/yjHe8KzGkh0Sbl/czg1OiKKrl8A01X+TBIBU94RI/xOVHjQUe
	aVPuGayxqLB59rZ+myBQtHD/Nq2nxKuEGm2SkXHlE3zZi6UJvsEd1b43M1oIROlJy4PZbJ7IlTl
	G4UMPx7r4UX+sm3nt7tGzPJ8Ltp2k1atVqDQGL1pRxK3DWd5B71yjSae/usadUDJt0huSYP1uif
	eDBBIy9oLIUrA6A5INVghm8LNBLvUyszt9G8Vdh5guEQYnbf7mDB99RpnyCM3J776+p2bXigCmY
	MWCAOI+2JDjQQ/4NpaxbUhTvIa/0PNbjmXPAk0GWKoNbZDK0HsJRTpV+Y2PnPbMRQA+NwLfrbWH
	1tkzXbidCV3FycyF5gY4Cr+j/CYdVDSCQqq5/qYZjsZcO4VHtjln0HVr7zN4eMVojMC9Ug+vsTR
	Lu0NEvliq+LBxJbNIbNGzOK6WLAUZF61DZrkhKscC2JMnElmEqwa7JklNL6gDReoCDiXWOqSiHq
	10NBS4oa7zQTz+VQt1Y73zb5kNfJsmCyz2pcgbA/qtUBl1ov46cqKFxXReHNWad2c9ghnFuSBB9
	UI+21BeB4BNp1+A8pjjVlV9bJn+9mFUQiP+ImVVIKoyrhLS0lXLfiEBNH9md/etgFcqOkAc8P23
	hy3184S7ziAcVCewMeYZ4LCJrKQMJ6p15PdQnCOelkvK3hviMBJnr1khzRe/32V56XcwPDoUbBp
	62Q4fKmUfvaxD8nv5utI0xndOBEgLKQVmVGm+yspvS+rDehNBSRycsFvRezr999EfXnsKe+Xfzn
	JiVp
X-Received: by 2002:a05:7022:ea4f:b0:1b5:31ed:e23b with SMTP id a92af1059eb24-1b5568aac99mr19329674c88.6.1795753059217;
        Thu, 26 Nov 2026 20:17:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 19/35] openl2tp: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:59 -0800
Message-ID: <20261127041715.1776485-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133271
Content-Type: text/plain; charset="utf-8"

The downloads.sourceforge.net directory is not a listing, so nothing was
found. Check the openl2tp folder on SourceForge for version directories.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 0d3953d35c..84e321f98d 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -41,6 +41,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
 SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/openl2tp/files/openl2tp/"
+UPSTREAM_CHECK_REGEX = "/openl2tp/(?P<pver>\d+(\.\d+)+)/"
+
 inherit pkgconfig systemd ptest
 
 SYSTEMD_SERVICE:${PN} = "openl2tpd.service"
