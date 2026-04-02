Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A451112250
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:04:31 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6911.1775095461419708656
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ub62JNlL;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64eee7b83cfso311509d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 19:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775095460; x=1775700260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sW1px/SRFTSgijVEkRvEnF23kGszHRB8f74aS98SdoM=;
        b=Ub62JNlL8hBneWqKqFO+GRhqAF1pxjQ78g4/Vhul2TXJk/i5vfAx71kSZ+Wa84+IjW
         MK74snkULcaz6OvOmyt1yGv3T49lklwVK2gs9siQ5qQ033pscLQooDaA1mckQr0t/+v2
         hDZmSQnfO0sJlA68SSWOe00wIgwU4t6pAUxtaUZEPNwDNRf6pmSFb892WtZSX+Q3MfQg
         Y+kLjwdsNbVBFe82rxJPKYBghyrOZXgGewAe8krWQS6W1F+Jur/M2wxviNsrNd6Qk3uH
         QgK2TlU+zpy+tkK3hqMCH0fhjxWq8poFkG6G7Q4TirS4COWGRB41IrP5twIZPq2AFUlT
         YS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775095460; x=1775700260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW1px/SRFTSgijVEkRvEnF23kGszHRB8f74aS98SdoM=;
        b=TlWXUt98hYL6yw04SMRgLjY9j/eTSIHSKk9UKrXLkfl2KfWUf4yEZPdpYhnhf5tJNb
         irLN1DBuCVksnpSeH0BOQJBby+yklcrnFG5d7az16zXtfNN8JKfSNAdewxWvgT+xu4AJ
         aWSnH2rMPmq3Rp27qJCn3wkl+ZuyoLaHABkWjZ6+LpbCKlwJkZT8a8F/TrIPM2hrnHks
         c2+MYG4xUrpljeZHG3TjbaigtVgkhujrhQ4jcUoKY+gXuj7/fL+SwiKOTso+ieexFii8
         aS0ywe2Y9DP3cuaSvCtH/BD8WVMQN9Vt59Hz2FSm2zhGMY3OU8MtK5obi54L1EdJQQ1N
         Pt+w==
X-Gm-Message-State: AOJu0Yyw0w0LKNSvzBxxkwG5GSrmZcpCfPWgjaOAy1R8xtBEV0OXIsiZ
	p7YiE+nPP/k8drW4H2trBHtKwXiuYrDjlGDflqxieFUFzOghIEIAM8gmi1se4QMs
X-Gm-Gg: AeBDiet8JmRs0v7HDa+j+s19ISleLr0wEgALx9VMZ5/DMDc0nTQvjpkAV+/NVtY8j5M
	RhEkQOVFAFjaYhpOrD1YJks8UlSoY68azvZTRillK05yshnsgeDMQx1hnYFtSyF5cNSum4HpWxi
	j+ZdycHCRmBUqoSIrXAyqLc4F5gFaaGv3zc6QV6vb7cjSqFrI9cdfvXkXLgfbA+nyVQqISdq0kl
	Jc+CIsf7dpCXLB/+rt4xAKKqzOIcnFOYhbyb6tQG33zKe4L3konfg7H3dniOEYaAwPU0GpeBww2
	L80j0eLUOWrn66/N7V4DQAeVi1J2KK5FkJhXsQynAwF81o1kHfJ5XkuxFQNZzcQV1XQiSbF+MZO
	v/87itOeYlDuAedcORJ6t3Vyku/5YFKT72GSvcz0R38guUWzfzensgSmshHSSMRTbz8N6nnU4OG
	9i0JrdoOr5uhryl/1Zvnx/CvF64zceDNE8svy1mSjBDUzrKM5i9HLnLdwRMfwU7qO/4X2hldhjS
	CEqlFS84kI85RNe6Hh+WDD99PVYaL2d393m5C0Bv6VqQijG42f3
X-Received: by 2002:a05:690c:6709:b0:79e:68d1:3209 with SMTP id 00721157ae682-7a21263a0cfmr61525037b3.33.1775095459973;
        Wed, 01 Apr 2026 19:04:19 -0700 (PDT)
Received: from localhost.localdomain ([67.233.60.136])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370df155csm5284117b3.36.2026.04.01.19.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:04:18 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nss: upgrade 3.121 -> 3.122
Date: Wed,  1 Apr 2026 22:04:15 -0400
Message-ID: <20260402020415.71477-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125915

Changelog: https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_122.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/nss/{nss_3.121.bb => nss_3.122.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.121.bb => nss_3.122.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.121.bb b/meta-oe/recipes-support/nss/nss_3.122.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.121.bb
rename to meta-oe/recipes-support/nss/nss_3.122.bb
index 99f54c948a..70aee3d9db 100644
--- a/meta-oe/recipes-support/nss/nss_3.121.bb
+++ b/meta-oe/recipes-support/nss/nss_3.122.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "cb3a8f8781bea78b7b8edd3afb7a2cb58e4881bb0160d189a39b98216ba7632e"
+SRC_URI[sha256sum] = "2699478b843b9f09c61f85341578df514463a0069447c816bef0d59bd800d777"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


