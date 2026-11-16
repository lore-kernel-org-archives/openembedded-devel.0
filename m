Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22036.1794808939875997535
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=MV6ukOZa;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso4512313eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808939; x=1795413739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pH1C5W6gB5h+RZdRUhfs6LWDwYxQ7Opd/x2aPFoNuG0=;
        b=MV6ukOZaSVDSF0J5Y0ws0xe8Z1KIK0c8vOt/0ZlzJMWtPUtRA+gyiIuao78ZoNEr2B
         RCW0AFtQc4xkDD3dUwQVFpunRv5e451a/BUtCHhgW8lXGvpc1n5iAJ5LN08o9GNyXapk
         fECtDzcE7n1vIOMvZi5CKrStxO8vyewiPkjUuCktFF4wiXRNaex+KDdGj+lt6ueBLMN2
         +prSPX96sGrMKt/F4HeEuly4gBtYDwg9LswJHTsVEA5E5g4z8oF34cWmfFJRWHVr8Y3O
         JlQAY6+z1J7FnFtfs5F0n7hfZbTN0SGdTjZmfJ0zuY22ENl5pRMD74AMoym9ALTD1xd8
         M/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808939; x=1795413739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pH1C5W6gB5h+RZdRUhfs6LWDwYxQ7Opd/x2aPFoNuG0=;
        b=Bw1cyt96vPlFDDJUaVTAk0PjfroLD6QNQeFzCXH4JYFJAKLa1rEJ2Gk0QfPKdniftX
         Mc7E5HmTy3ZJu9T9bULmHdsHTXO3jItMvaNTrk2BZlNsXXOCuH3eV5z2tu9mcNmN/878
         iFkNaqE8lBDiE+2zCPaOWlpeXUMZgpGnhXSmjMyMOMvI31qooCi+Q/8wsTlvKHkB7Bav
         y8S40W6MT4C2RjUrwuNGvkA8l7/ZtgwWY1c7zjNdZEDSjaFdrrNkP7hd4k7/c5HCf9YI
         1A1iLGQXJ3hRqPeS32mo12waUc4To/f0voZ/62z0z1aagSKrL9FnQ90BLhZRKqeCrOKN
         VBbg==
X-Gm-Message-State: APuU4Z+mF77d1qGU7FO30bkqO3Uwf3f4YXuMk6s3vBpHYXX1lZxL7GXU
	7Qa3dgKTgrd2wp6jCckIclyMaxVj5X33Wbwk+3jWrmw4CDX9OdhMPGCCgH7nvmyU
X-Gm-Gg: AYBFou0gqK+xWDnX9fmsAerG02zUusHnZLD5YIDddfxNqiW/xWb+fzlLjEVAtX0gbaa
	6Vd0AJBAKoKrE6SsCfMYYKqqmIfJ5qkOGnNmTrUb5+/GipDW/sf84jws/iwyxGqPJC5+psmr03f
	8tJ/0sQpVfWQjWTd4uQcG4ERfVDPlgzT4ymSoOCuF0KdMC3ZQh8bUZrchWSPpZ63iNsy99jGxn1
	CcLdPn903roIauYJVupVvZNckwoB8LZUsvg6DfFjQrDYyJf4BHrWJAlwfLwKMxcu+ZWJlDAYY71
	QH7tsQ0fSU/gTs2Xn+lGuR/3ZupXKhLgl72sINAcQE3tWgmf7P3c5mUGIYh5vwp//u2bOEiG6PH
	s2k+rdS7eQIGaUPcRAoHqkWf42BcYkfxX0yw56QgCTsFDKnyoV0NVbt8aoV9MzHgP3x4TYQi/C3
	shSFX1xPox4HCXlghwpY1MhsfY5K9Gza3N89UfdZ/iJoNQB//9D3vGaC0YcaGYfw3lSHdfe/F1T
	CxtLwF1cWvhQpydlipaaeu1Mb3/QSG3lSlKbKUkkGt33gSXrZaOvz3Fao/9XepV1n9zfdA7ox25
	zxteks/58WkD8FnxSShdhAqstMTB+DVa76vkv38cv/u+/djQt1ZzhD8OC+gA9yK/ZPoXvNArrvH
	FWtJKGm8OZyYShA4r7Cq6otIaKU9e4QNxUNx9Wgw43Y92tGITo9PfqqOR4UP92fXMLfAmftOK87
	NMIQq43msabWh92SEr3WgQCF12R6iDBnCBvoxPE29TLVSvsQMsORm3FJe/mA7N/12OyWefxIa8W
	CjhMuz5Anr1+jQcrPPuTfioW8pKt+iIGPmvLiNrAW8UwDonb9I6eRfafTQ4A5L4os3wAOIufEmp
	ClWl
X-Received: by 2002:a05:7301:f87:b0:36a:1e0a:accb with SMTP id 5a478bee46e88-379687a6ec3mr10304166eec.35.1794808939174;
        Sun, 15 Nov 2026 22:02:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 07/30] libcompress-raw-zlib-perl: upgrade 2.222 -> 2.226
Date: Sun, 15 Nov 2026 22:01:45 -0800
Message-ID: <20261116060209.2916444-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
References: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132405
Content-Type: text/plain; charset="utf-8"

License-Update: README now says the bundled sources are from zlib 1.4.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-zlib-perl_2.222.bb => libcompress-raw-zlib-perl_2.226.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-zlib-perl_2.222.bb => libcompress-raw-zlib-perl_2.226.bb} (78%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.226.bb
similarity index 78%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.226.bb
index 8a4e309691..4920f28faa 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.222.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.226.bb
@@ -6,11 +6,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=ef65cee670356670f1663558bb46f16e"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=9de8ad2929a6aa38a8c1f3950764d522"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "1dfd7d511a655627c81815d30d3babc28fa5b88455ff03f8b04099dcb51286b8"
+SRC_URI[sha256sum] = "80dc104a733976eba40dbe9272cd32ebf183195204e0bdd30e214a37d2ac42cb"
 
 DEPENDS += "zlib"
 
