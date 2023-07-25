Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6235FC0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 14:16:14 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.21445.1690294564914860410
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 07:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Ti0x/uJk;
 spf=pass (domain: baylibre.com, ip: 209.85.160.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1b449890ef5so4304484fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690294564; x=1690899364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPVRjnnCACOpWEX8aP4uLCUylnn+wrVg0wXT0+uSqas=;
        b=Ti0x/uJkvV2Dprpsqw9Hb1G31zcj+IGPCBeRJY+5GzEV/zs3oIkjB8zUuMnthA/H7a
         spnjR9CN0u56bxLuL62mEMUV5V0gxmaKTsdA717XEfGDHw2eRY3rjkcsO+7Rp4ke6IcH
         Ja3MiGm4HynIGGmFCQCaGbmnaasKMO4uN18DDVRL0gd132Jm2w6davfWqsk7/bWRlHSz
         lVdgqhe55avEF+TeHJRt7xcwlDck3FuGjSVXzUheZscnW0EKMvbbpf9PwA/7U7qFxci6
         +aX2q01aMvmTl4+uRPotvx/SI+KaqmtTEQgk+MKhVoN2qHsVqfAM/TzVwbwfnCbAcWoj
         KXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690294564; x=1690899364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BPVRjnnCACOpWEX8aP4uLCUylnn+wrVg0wXT0+uSqas=;
        b=NdEnHuGktONgBB9JQ/G+1pbMMqb8wfNCranAurTtPzQcEvviGN6NocPtkgsOU57qtw
         Iuybdx92tCCG481j4rv9OCspGg1bCLxZNHQ52f3+qS+hmm1qCmlxtkw/OKavuEJj7G13
         6qdBLa9mvKN3hGd/I5h9+JnnzKevd3p65h3mSkcikq6Ixps9jCq9sh5Z26hjAB4ra4cl
         UbzF1ggEk/Wd0sz3jiN7VywVbL0OivnZtigtEFivsKooOj3k/Smpj/E9AxiIW8jenGll
         SN2QvX1k7xvFLW6JqB8hmIObwUe87122aURuh47GR0aYElCUuOhR0+sv+XME/CYc0bCX
         omkA==
X-Gm-Message-State: ABy/qLaYTGuxw6QOPQgf7QKBH4kN2XMgOrpHeVaywT0kcI7fuhXhDaaP
	H8v+CQ83QOgY/ThYVZw1CCe5+29XuOTlpkQ0+H4=
X-Google-Smtp-Source: APBJJlFl7Ueb+eKkwWyfL3S/mLS0imbiVHu/wLMvIdjLFzPMk3DwSHmCeopq8COckAroYIt1dB31NA==
X-Received: by 2002:a05:6870:330a:b0:1b0:7661:dd18 with SMTP id x10-20020a056870330a00b001b07661dd18mr16299216oae.23.1690294563972;
        Tue, 25 Jul 2023 07:16:03 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z27-20020a05620a101b00b0075b168fcde9sm3707399qkj.77.2023.07.25.07.16.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:16:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/5] python3-snagboot: upgrade 1.0 -> 1.1
Date: Tue, 25 Jul 2023 10:15:58 -0400
Message-ID: <20230725141600.118138-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725141600.118138-1-tgamblin@baylibre.com>
References: <20230725141600.118138-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 14:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104015

The udev file was updated and renamed in 1.1 to 50-snagboot.rules.

Changelog (https://github.com/bootlin/snagboot/releases/tag/v1.1):

- udev: use uaccess tags instead of group assignments
- fix and test i.MX8QM and i.MX93 supports
- homogenize i.MX firmware configuration interfaces
- don't require contributors to modify license headers
- fix README links on PyPI

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-snagboot_1.0.bb => python3-snagboot_1.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_1.0.bb => python3-snagboot_1.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_1.0.bb b/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-snagboot_1.0.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
index 1853596b46..e6f3148ce0 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_1.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "c2d21cadddecfd97dd62a8b66b6f88bd56272627b9b71272e9dda6f868ee8715"
+SRC_URI[sha256sum] = "40b045e6225f3544080558e4bd604d116d4cffceea80cb84307579d914e4e498"
 
 inherit pypi python_setuptools_build_meta
 
@@ -17,5 +17,5 @@ RDEPENDS:${PN} += " \
 "
 
 do_install:append() {
-    install -D -m 0644 ${S}/src/snagrecover/80-snagboot.rules ${D}${sysconfdir}/udev/rules.d/80-snagboot.rules
+    install -D -m 0644 ${S}/src/snagrecover/50-snagboot.rules ${D}${sysconfdir}/udev/rules.d/50-snagboot.rules
 }
-- 
2.41.0


