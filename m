Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7045BC433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 02:38:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.71476.1638239885070664644
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 18:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j9c+QuLV;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so17124534pja.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Nov 2021 18:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w/zbYQUknZnWO0m82oNnoSS8sJu96CwRGQY5iMiLpL8=;
        b=j9c+QuLV4Ac5PaNXZn7XuqoAZrQUa+l4YZyssj3ykeHIo75MkOF3UEQirsce66LceV
         YNoV3TMTxcFfjNqH0npY7HqkhkK+/WVAtZHsjqf17PLdD9YHWH7ETPP38E2l5VTqOmhL
         ZzyclO3iXAWjLV4WoiSdzN1fAoo7YBsdaWU/kYBjnbu2AVWP+9OQSxYAvMjBUnfDsy+L
         WUn3PTYk/wtoFO8wwTaEEOj4Ycp8EgDf++8D/cw7A+mlG3CVU+e6UCtadSMapqeFoCuI
         vo8uRT7ZP+aaTwn+JpIw3sovybPwpga5EudW+bf/Vd4k9EnUUzILm5gni2R4kLt+Oe3g
         gr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w/zbYQUknZnWO0m82oNnoSS8sJu96CwRGQY5iMiLpL8=;
        b=oToPQUepJwSi8q6Vc2m4H6WJuKPUviKld9OtQYIDEGf53Z9S8KtYfQ24fYLj+eKtYR
         enWF/MaoVtr6HMoI92Ix5CAwfaMKIDYzdcNUrzZRS+6yX01DT7swPQJavKtLMIqIuYF6
         cgGpCrbtW8AwyUVoZ700SmJ1E1rV+0yF2N1d7D3zBnKDMznPK72RziFjI2v+ESIrx5uX
         mJwr9a9ZbO3dZLp23oRx8JsfRnXJRWv+k9ezJsaJmUh5Yp+iZnMOrYeTb4fTdY5B/SGz
         LMqwF2D/wxvYMLuSRPtk0gbZI9ino4DZnuG14n3CYX0RTsiOyP2GQO6CghgPaRKt+4cc
         Md5g==
X-Gm-Message-State: AOAM530beo4w7wNZY03Y0qbjHRKjVFF4+xnfXAwECEQKCGK5zcsCkAZl
	izWfbpfoH4lWaGJ8mN/o7oWk5/N2ZmL97Q==
X-Google-Smtp-Source: 
 ABdhPJxfW7m7fdgodkfjAY+mCkSiMo1UTJSJ8rd//lVMEdIis+1urUQ7OGnYqRn3NKGKp0kEXtu49A==
X-Received: by 2002:a17:902:7d96:b0:142:87dc:7dd3 with SMTP id
 a22-20020a1709027d9600b0014287dc7dd3mr63117358plm.11.1638239884401;
        Mon, 29 Nov 2021 18:38:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 t8sm15009760pfj.26.2021.11.29.18.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 18:38:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/2] packagegroup-xfce-base: Mark TUNE_PKGARCH
 specific
Date: Mon, 29 Nov 2021 18:38:00 -0800
Message-Id: <20211130023800.2910556-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211130023800.2910556-1-raj.khem@gmail.com>
References: <20211130023800.2910556-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 02:38:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94145

librsvg is direct dependency which gets debian renamed so this does
not qualify to be allarch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 9545ad1a81..c56af6f382 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -2,6 +2,9 @@ SUMMARY = "All packages required for a base installation of XFCE"
 SECTION = "x11/wm"
 PR = "r5"
 
+# librsvg-gtk gets debian renamed to librsvg-2-gtk
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit packagegroup features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.34.1


