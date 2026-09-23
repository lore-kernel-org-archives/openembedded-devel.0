Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72460C9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:36 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4282.1790160090735276336
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WAhb0asv;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so446125b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160090; x=1790764890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNtD4fpe/jm0FpYrQuG+XrYpmc5ErEi8i3qs3xQBZi8=;
        b=WAhb0asvD5uapzeBZlPLQtlKJWzHEcyR/j2SSob6XK0mGXEuh+cssU6y81fXRM39nW
         +nDfA6jqgqGdu1CbEZ81gprtaSqeCnlYTWQsIapJuEsOrpM/qWJg4SXoUCmsnpLy1I6s
         oE5rtFjpGplx9YVKicOH6SWVLs50lNRChBYe7IVFCpnSHKad16TeTFU9m/MRDf6+JexA
         OrylUf8whypK5zbRCJwWYwxcqEYKBEU5JVt8cpkSjIHhXstNoLW6UGJ87rpBS4Blc182
         8QHMX6IyDIhkokr2heozNhYLgFCoZfWJbgxheChJfXDuWqUHtoH8AOcSFIax7+LnUgtZ
         ocsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160090; x=1790764890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNtD4fpe/jm0FpYrQuG+XrYpmc5ErEi8i3qs3xQBZi8=;
        b=r6i+CUlZGtlxwRn2aBIW+TzKmp0mf85u8tRSoZxqe1EpcmSXXFFl7k8eRwim6OvFt6
         JKODnWdaDDwPQ6LiQ6IFMHriFAll+B9WTMaR5OatwfgO7NYCByzX7POgPBDYuJi6N3hv
         OHT/YsZgz4bInFLgXtQ3R2rFxfhWFHPvYmqabAdyv+wrUd/gqz0jpwB/e6n5LC4rprW9
         Xg8Oz2yWgNl9/xZI1tfM79DZfewH9gf9eioAzv0MtUzoSG5lWB1dVb00RLWv/hpsj92q
         Fql+QkkOafry8FyQ1Jx38CMvz34VF4waPdFdRBozTZSbVABN4JgA0QeqpBW9ZUAhXsL7
         aWAA==
X-Gm-Message-State: AFuF++njJqsAAbVA6qYK9K+6AT++vCltAuriahaQ4tX8rZtGmrLJZ16H
	6OsiSZ/NddiPbYaGSGUXystc+47yGX6y/aC5gFqL5fr68kPyzL4LjqJ0S39AZA==
X-Gm-Gg: AYBFou3IBYh74Pp/vRHayJQcobLcwmGHpjzP4RDn/owDXMqGD3oaxsMGjUG/63/kdVG
	x0tM4cwP83conPPsrQe1EOZxREjQHPnOASMsX16b/FZU7/OJnIc9fuU5nBdtVI80ozWjpAHdku9
	nrbU2eTuWbs+M2ZfeRwtR/2fTR/NU+VYWJivy6zx3mY+bJRT3es4iyrb0A/27P8k3TPWBFfhP9f
	iyYufA5Giy88W0cJ3tMB6jiOVng7tAcQtqP6ck+WlhJ8t24x2FOB1ltA6prLr7ANDkDY+gGItqz
	iB4M6y8oacfjphcOMfV8XadVybUs1pWYXTuhG1LHUW5QvYjgvfLFyBh1V2FXLA6Y5fmbIzTWZde
	+l3hHrS3nAxSG4eBX7AWpEUC/tMZE0zVdUe7EjeQPmv0AHL+//9cvVcn/jRAn/rnh6+V0/Qi5MO
	ppP0wZwQiTtGrME+wvIkKsA8fJypyXOv0vYC3GiFHG2mbqZuKwWzeFcDGBpc3gAq/UsTuXg1XfT
	FCkXpX6tKMlbEfNCgXWVhs=
X-Received: by 2002:a05:6a00:174c:b0:878:34b8:2325 with SMTP id d2e1a72fcca58-87d1d1c3b0dmr2133930b3a.45.1790160090092;
        Wed, 23 Sep 2026 03:41:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 15/42] libheif: ignore CVE-2026-84383
Date: Wed, 23 Sep 2026 22:40:29 +1200
Message-ID: <20260923104056.457360-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130202

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-84383

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index 165ed0ad2a..70176c7c52 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -34,3 +34,5 @@ PACKAGECONFIG[jpeg2000] = "-DWITH_OpenJPEG_ENCODER=ON -DWITH_OpenJPEG_DECODER=ON
 PACKAGECONFIG[openh264] = ",,openh264"
 
 FILES:${PN} += "${libdir}/libheif ${datadir}/thumbnailers ${libdir}/gdk-pixbuf*"
+
+CVE_STATUS[CVE-2026-84383] = "cpe-incorrect: This vulnerability was introduced in v1.22"

