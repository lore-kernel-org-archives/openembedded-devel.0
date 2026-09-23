Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678F9C98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:46 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4290.1790160104187289327
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jqPGB+9B;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so585000b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160103; x=1790764903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1860Bo3u/KAWbijMeeUKDnuPGDUaoqOvM0dGu1vMVmU=;
        b=jqPGB+9BKcoUbqKTOmUQevJOqZhnDEc6sOcRPmOZO3cIfrbJrS/XYgpXa2uiMsD+7N
         TX2NOwSfnQoNdzw3caAdfWVrIeXWLvljtcIJ6TeYoQsO2fmdVAtzycZ0YS+uIqYhe5Ad
         bcYI+zBYxrMGtcm2TnNbEa2nDaRAFZpERqqjRZNV6L0hU5KGEBnzhQQ7h+32QjBy0bmk
         dNu7MPY8TaV/47f6PUDU3utSn87tpdWWkZ+Z5CvSYrdwvBmbSIRFZGyYYl+01VHa38bU
         ou1vGL0rG3aUMFXvSVWcwQwdAGQ075EigsBfYT3jRB0jgp7/4sqBZ+OhbnljcMwrZgAs
         86VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160103; x=1790764903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1860Bo3u/KAWbijMeeUKDnuPGDUaoqOvM0dGu1vMVmU=;
        b=AwWtwuZnkVyrbV3MPWcdTTmu/abH45nOI4d/XbxCVMk8wflKciwFk3b3hRxSBWiA2K
         xeaSsUlxlIIXBD41sC5NDULprgPhjWs52ZjOJM3D/X0pR1ivYDSYJITFI6bFZQW7/UMJ
         RXmkeyvNDfy7lLvZjg2oKzvrycMuVsiHW5u7W9cMa/rFrcWS0t9eTF8EvRS8DFCWi/Cp
         CeocxipbXTpaTFuOFdrg/aHT7roWg/qCE8VKWxxCrRRYVaVArWr7jTWquimg35AMPr5j
         nQVq6kqD0ChDYJyew32lrpC33n+LICu8p+R/KZhv9zSyuEiDnhdpRbz5evT+WfQws6Os
         DR6Q==
X-Gm-Message-State: AFuF++lvZPFRt4Zg654BHl84AgcLTVVnrS4xC22CLZIZ3puAOyO+07XB
	v5VjsZ9wopGOlEkLnaB5oZU3vi/btRg+2HtFSrfHTmm8lq+dYydgs96s+v2fEw==
X-Gm-Gg: AYBFou2qp0u6ElmRku2a3cepJLOwH9YJI8zZQWtJ8sPPsXkn9fM7PmDy8D562fBkKkR
	aso1qKvO5BKj+H3h1vXFuB3uHZKeCmhxv63wX+4Pv5KotwfKrSy5ZcsztT7dP1j6qwLFfeQHULS
	QbiskNgsi58rYw+cpNQYk0tag9FIgVPSRvQ/dgAUUABha/oH4sZXAokoIlcjPnTywWcSZT2FWVM
	6Ir3NcB4ZeEpUgHtoTe0a31k3tvC4wVEkQ+g7CUzCIoHuZ7jiG0z0sF0IwT2xaNblpAgjc2epXJ
	exLSJjKbCptfyueX/czA/3EGyPsWnw12bzodlZuJ18HDOj8ZRJkqzNMZV/vgSF6T18m9sZBDdEP
	d9BxsVFK6qWr8PKrjVwsEmG8WQ/Kqvas2MPz42u7bi6kcJlkj5+B+ClVzH5MSF/vEDXF2p3Huzi
	FHGjrRLNTCtUUuGXAu012bO18TLJSmrYMbegdbg77i05cRmhRBeutraogM1mjm0YNQEYImnoFWc
	4fc2y4l6lyTTGgCQhJhqZ0fAIpTmflIzH5Y
X-Received: by 2002:a05:6a00:2d94:b0:878:34d7:6a26 with SMTP id d2e1a72fcca58-87d1c9c6e36mr1748939b3a.40.1790160103471;
        Wed, 23 Sep 2026 03:41:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 21/42] libopenmpt: upgrade 0.8.4 -> 0.8.6
Date: Wed, 23 Sep 2026 22:40:35 +1200
Message-ID: <20260923104056.457360-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130208

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: copyright year updated[1]

Changelog:
https://lib.openmpt.org/libopenmpt/2026/03/22/security-updates-0.8.5-0.7.18-0.6.27-0.5.41-0.4.53/
https://lib.openmpt.org/libopenmpt/2026/03/24/security-updates-0.8.6-0.7.19-0.6.28-0.5.42-0.4.54/

[1]https://github.com/OpenMPT/openmpt/commit/3d93be10ca24e4b953fe6adb960ccfb9e30f88fa

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libopenmpt/{libopenmpt_0.8.4.bb => libopenmpt_0.8.6.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.8.4.bb => libopenmpt_0.8.6.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.4.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.6.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.4.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.6.bb
index 37264423c4..bf563b8be1 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.4.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.6.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "https://lib.openmpt.org/libopenmpt/"
 SECTION = "libs"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=979c86485a65d11403e9bf083b9a0812"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f801f6aa19d904b2b8fa8383a34f771b"
 
 DEPENDS = "virtual/libiconv"
 
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "627f9bf11aacae615a1f2c982c7e88cb21f11b2d6f0267946f7c82c5eae4943b"
+SRC_URI[sha256sum] = "caa2fa959e389f4374d9e2df3af5c633452c12dd80442cba2e89cb7ff2b93c5b"
 
 S = "${UNPACKDIR}/libopenmpt-${PV}+release.autotools"
 

