Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FED0CD8CA8
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 08:18:55 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87540.1781338733750417079
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jun 2026 01:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hk9YjnWW;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0b944f6edso18313475ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 01:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781338733; x=1781943533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOmZoK049OPAr66Facrb3KPgM0oyhZTDPZoehgQa86s=;
        b=hk9YjnWWh8rzKXXunhMhWLksKG98UVNedUDlPDEsIu5lwLMAuO/qBLV2VH22kFb1Ct
         YkT439uB0Jqz641bLCRvCYtHViFjvz4PjFiROMxtSNFie89bnbjfoceA0DnmgmddzoHf
         UqljNwk5NJGBHt+7WiSAUyDj3HdjASuxQTyVzJGAtszPpgTKvPifkCok3GWVQgNe9RGP
         nsOtBu29VDE6ud4gkQ6Kp4LYXiC0k/qr/trToJkew4SGVIgmcuopwIM8a6fiNS2QWFzF
         hrTAnfo9EtXSf2H8d4vWH+AYf2RxMLf5EPAoJrHQVrmdVQyIGx2OndGo8F0pWvdZdj/4
         cu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338733; x=1781943533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOmZoK049OPAr66Facrb3KPgM0oyhZTDPZoehgQa86s=;
        b=SAE2w564SX2VGEFanRn0N/Z3fNUMgPAJMDya1Y7tioc2WpOZsA/myIn0qECH+ALN1H
         ziQz/hRRzzmItcRe2hBO1vCIcXwGhMTiZ9ZTn/NznzjjEEdjPmpIms64OoxNQwJovn6J
         4Q7/vbWS1LR5MyOF/r4Mw/dO7WbaSHApDYNbpIlnotO1OeCmdZ4gdfSQvxZJBdBtGhSK
         YC/sn/Oc32j4GhI03Zillj6LOsMij2L9sVePAxOYbqJGHK4E7v6NFmebAD4dg7+cdyA6
         IJ4iDOheRhyNc7E+78lmYndNdFlSk7RDc59vK0SSoxSlseysumLWyUEhV7SA0MUHjO4j
         XTPw==
X-Gm-Message-State: AOJu0YwUB78uuQWQQ3hhWZuoetlb46taKrFNOnpkpl8or5JK5l1a9xMN
	UhrQsI9NUwJZk/bL8jxuIprtPzlLksxhCz7mArOJ+VuHzSrwFeBWnyUwb+wp/69a
X-Gm-Gg: Acq92OFJjk5RVYd/Ljhqy3zgNx78g9cxfdDc17iWbqkPMBgbUmWOw23vvJD7P9WNjo1
	MEm/FgkI19I4WM03dvRFFT7XS02kqBgAMBfhmXMXk1TBPax+oZjs+6ThSG6Ujv1bnupCHwnod5q
	/7uJOWB8A0hUUHAybPxIlT3qUDP0IqwkFWwLF/OYOxTXj2r2LXWP+Wp2huX7CJ1AbUF0pdUEpBM
	JHVxTA3xvlaHoP7rq+MUjfaI9o2tLML7K82YSS6qAeMrP+3s2EQg2sf95qqR4Bv4TJaffYpowNX
	2R9ylH/Ki6Ryms7S++y+Y+GPW1TEwmKCoxGdMN89VOpFktHUJkPKAsCaZZUoZT7FoM3zvx4KIaS
	pqqNXZ8KEEONMi4i0N145nWGcIB6QgghMNJvSRhb+ASbXFrM4W8G92XS+Cxms7G5EfyzgKFNiAq
	EYOwWVmoU0HCveGRpZRy5KuShJl/S+We+aGS/Fpr5qvRBJSxQ=
X-Received: by 2002:a17:903:37c5:b0:2bf:2114:ecbe with SMTP id d9443c01a7336-2c664243261mr35500635ad.23.1781338733200;
        Sat, 13 Jun 2026 01:18:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42c43543asm43885095ad.0.2026.06.13.01.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:18:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Kjellerstedt <pkj@axis.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 7/16] ttf-dejavu: Use "Bitstream-Vera" instead of "BitstreamVera" as license
Date: Sat, 13 Jun 2026 20:18:15 +1200
Message-ID: <20260613081824.1223609-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
References: <20260613081824.1223609-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Jun 2026 08:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127559

From: Peter Kjellerstedt <pkj@axis.com>

"Bitstream-Vera" is the official SPDX license identifier for the
license.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 29b6cf792fbb21cd646243d0f0d93969a52a5080)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index 9dc23fc4c7..98c0660ad2 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -2,7 +2,7 @@ require ttf.inc
 
 SUMMARY = "DejaVu font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
-LICENSE = "BitstreamVera"
+LICENSE = "Bitstream-Vera"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=449b2c30bfe5fa897fe87b8b70b16cfa"
 
 # all subpackages except ${PN}-common itself rdepends on ${PN}-common

