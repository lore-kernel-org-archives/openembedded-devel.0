Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5118AC44503
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:44 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69114.1782634298523046712
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jENNW62M;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3619062eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634298; x=1783239098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo8+9TRlojs21dhSYDXIi9ed6qM6U70DiI0bZCJVVls=;
        b=jENNW62Mr2/DnrsAaGWevT6WRdv2PYVAwdXYO+kMD9Y7Xg6czwptGaCGJ+SG5CgjYB
         gGExy9BmvCzTdu3FQ99vJOjT+w4GNOyP/HVfwNYqjNI8JqL5tW5zPEJQ4nBTUjzbDrJg
         51u1dSCG0EIeaEB0GqKjOX/YwPDRK3vMG8U1AjKNtWvlbmHnm839IWXsIE+XViA6Ti2f
         uul9kOV+dI0TTBmJaam0DYclDRa9+IIEh6h6Tlk26pXlartZz1kE502XWqB6GLi6DhhA
         BI10E2bqhRNfQdcI+t9Xfet/azVr30FwL0mzmyv+dAYoFxXxJFXcy9OUJ5Y3Qa9RZqvi
         xCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634298; x=1783239098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uo8+9TRlojs21dhSYDXIi9ed6qM6U70DiI0bZCJVVls=;
        b=U+S9hXvnx0kziMpm+y2i1eBTMY8/anhjvw0RuZiQmGxYpkd0qYN4/exHGGarMeA8s4
         3WIfuFHm/c4/VGnZclVVQam6NpZBWMfI0vfXw3Yc7ZTldTPWNwLimfNdOEwJdSnlxRfD
         ccKcPhdswqQWLToeHeCWSwoSykg4S7IwQLvm29ULlR0pttNx82l4TGbTBtBjBtE8XZ1e
         6i7wExCyeHQBLWdFE7hjdgF0Clr1yKbHbknNFwYreBWRz3lhugDBRti/1bL7sqityysJ
         mPqvyJ4LbLF4PaDaOYsSJBjq9lmDH8I6Jg7JWT90jw4mA3HlMq97Qz2Hoksd0AV1nUor
         lx2Q==
X-Gm-Message-State: AOJu0YyI9fI4bJmPOiYVnCgGHd7HZPlV2HZ3VrfW1MhwgSAypKsZDekJ
	XzcQtfnIW/pL6+C2FtN7crNdG+eEEpv9JBS5JXRpmQteKxuI/szveZvzWlMEiMmtM7yDRw==
X-Gm-Gg: AfdE7cmsmtfzVtucu+XJb3CY+INThOaL31WBc5R2DVc4LOqdbOoyPCItpj2pE9xV6Em
	t2fBptbyO9DqiKorhNfWfrTNJfMHV1TAjxgkmKgIobWnEhWo/lgTq9HmvyZ7mrhJEVUc6s0kbaE
	aE9midjxfwFBVvmeU0ptmbW4lxGuQ6DhtSQ/wjWRmn0YVMPU/pZum8bmuEY3gZnhS/LocL2iU9l
	Eb9+oZ7qnwZIXo6ysxkF1nHdwtiFLSQzy7qLdoVynCOgrkUjrbg7jz2NMFo6utULFvMgu5ZVunp
	wUUfFMPMrJZ9CxWazbHMBPj9JtdOVw+guD+XvJTflyQC9+6efEhrBmch+uzbXhv1GZkB8AQ33hJ
	jPH0nXQIc+Tt9MSkyHvM1fcOmlZ8Ev5RIZgKRuFr/FYNKubKJGvd2trw+yswmnonlofQuqE+Tic
	iKlKPg+5P0Po0INB+ogbMDVGflwY5ber/3gqkmlv+e/X/NJxeKJXwEBTviSF/qTPc7ZzBO1kC1y
	4J9lKjlzATZHazH+O8siF0TujecjQHOg+QZb7n2U1x6AcS3m3KcOqk0zkorna0NiuvtIQ89WI1Y
	NLWKfmWGqRi19xAdQ38wc+yDPHvZYwZB/fxpDV/C
X-Received: by 2002:a05:7300:724c:b0:30c:ab4d:381c with SMTP id 5a478bee46e88-30cab4d3c02mr6442500eec.40.1782634297809;
        Sun, 28 Jun 2026 01:11:37 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 014/128] libopenmpt: upgrade 0.8.4 -> 0.8.7
Date: Sun, 28 Jun 2026 01:09:25 -0700
Message-ID: <20260628081122.178348-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127824

License-Update: copyright year updated 2025 -> 2026

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libopenmpt/{libopenmpt_0.8.4.bb => libopenmpt_0.8.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.8.4.bb => libopenmpt_0.8.7.bb} (95%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.4.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.7.bb
similarity index 95%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.4.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.7.bb
index 37264423c4..3d25697c23 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.4.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.8.7.bb
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
+SRC_URI[sha256sum] = "275c29ef47be9992f62a35fcc96f7ca05c06d2fd05c9298b8dee9f743f75b089"
 
 S = "${UNPACKDIR}/libopenmpt-${PV}+release.autotools"
 

