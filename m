Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC60C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.44854.1674653498449648384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=btzFkxFW;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id i18-20020a4a2b12000000b00510ebea37bfso557635ooa.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6a2pQBRHvKRArzjqqgMa/YO+bY6QhYnDRbNQjOgbWZA=;
        b=btzFkxFWS74X0JlXFbjG4A8Y+xO4HWyO8qeZtczpkF4URIDBLU/2ss0VJRbrEb0Scs
         qTTAhDM9JLfxDGCJhwLA36azez4RdBi3pn9xNIY6PkCV4WxedJ5OB25UPYThplhNbfL8
         m1jN5NgQGhFuny6ctuKk4Cel9CnEzb3UXbLbbSngBuAiovKNMNRAx6CIxMjR0pcSruQg
         6NUAt7SZGrOF16RGGyq3eYPTsKiPBJYNZRdWqv3A5XvubpLOuxjmhCFrFhCNSjlwo39u
         hrlPV05FMd/GhwrG7C9F+dwFPaoVlEd9OgmEkMZOpatFgN2iHmU7/9sDlpNt3rgkCkjD
         f3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6a2pQBRHvKRArzjqqgMa/YO+bY6QhYnDRbNQjOgbWZA=;
        b=IxMJ1h7rZpn4y04rd5DqoBJs7ZZpxDacHKW/NvqsKNONmQZjae/rAxng/ROdeD/DKP
         yI+cizWs9yBes2UhLy0f6N8d/I2+1UzO3aumiZCLF/pYCYUjdx4bv/GZASRtivOkv5R6
         LOzZ+gh3HJPhOtyg+lMitTZ/oo98B0UYkhRI2Mh6Yl/fKBNfRXGQOta771ZmYl7krFWv
         6ajKRZqaKM1M4O7Gzu7atXv/vQanNOn3dOftP/B0awAVwddl03IQ+VZZMxvbMLdYwDel
         YT7EL+j1wPEggyQdURYsPCKRDGwsLHpouI3om8FG9MK09wO9yLesDSwuPjrbTBLQb6Ba
         0LBw==
X-Gm-Message-State: AO0yUKWExCfqcIMNC5RSHZhcqweMqgrXqhyBy58JbL7nlE1E0GNC3rFZ
	F5ayh62GlEyAbUVKjFeM/GACWQ+Dvq4=
X-Google-Smtp-Source: AK7set9AZQSmo4jjekKEVbuwAofivxZI17jwMppQjalR2/PXuOig5YruwwCDtBjuxIzTKgWywrGdzw==
X-Received: by 2002:a05:6820:34f:b0:511:f838:c7bb with SMTP id m15-20020a056820034f00b00511f838c7bbmr190612ooe.3.1674653524649;
        Wed, 25 Jan 2023 05:32:04 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.32.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:32:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 39/41] strongswan: upgrade 5.9.8 -> 5.9.9
Date: Wed, 25 Jan 2023 08:31:21 -0500
Message-Id: <f9ea77c5ab4c922da97e19fc34d4af18ff5ba1a1.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100774

From: Yi Zhao <yi.zhao@windriver.com>

Changelog:
https://github.com/strongswan/strongswan/releases/tag/5.9.9

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6cca42d726c333b5955c6f4e46395b9578efce2e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../strongswan/{strongswan_5.9.8.bb => strongswan_5.9.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.8.bb => strongswan_5.9.9.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
index 266d43aa6f..a11cd5a6cc 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.8.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.9.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            "
 
-SRC_URI[sha256sum] = "d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c"
+SRC_URI[sha256sum] = "5e16580998834658c17cebfb31dd637e728669cf2fdd325460234a4643b8d81d"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


