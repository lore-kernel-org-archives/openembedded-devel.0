Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D2DC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:53 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web12.4344.1634338672307541168
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=L27mf/Cw;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id z11so46387596lfj.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwwzLcenFfz25alsro2mU7/a4Iy2feTRBnYRNJOfhX8=;
        b=L27mf/CwGJdSnSj0MO84dOjXLfvAnZ4w3sp9VFhLnFkqYJk7xKSDU5rytWfchO6D2W
         ywpZxZ9Dpf+Q145TCyN+paw+E+uEEe6jIrhWKUTRb/ucODjafMRxVpIdxAx/eHiN/6fG
         D5BiUEDWNq1EtpBu7EyJWHgvYMLJ2f+T7kC4gPMTPV2fnXLY2OQl4WlTlFBuAXoRPqU0
         iJD6hruUir6xlFLD2iWPNL/19TAaryZbrrEyh4rbwKO4fWPNdSgunLj1UKk5z9JyXXzZ
         gyV/Juf27yfCvaCtgc/6Mg3kLqyODJLPZEZxcxqWX5WSvK0WJw3XK6KYFM4rJFJjz/9A
         765w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hwwzLcenFfz25alsro2mU7/a4Iy2feTRBnYRNJOfhX8=;
        b=sNRanbvcJtXhFD2A35kEEFCwr0GZQiTjLnvUTsqLdbWngT7pxI9RXDePqH/B1q7V79
         8zDIAJhj7xaiLtguraw6Gogdj2KqY1yA5LiKHspYuyVZL8E4W3Tcpj8Rs12KxqlDn7wo
         NxTjBloSYE2e4MHZ4rt2nLidraf3HINQrjkEtDdtYl7X3CJQjjKa0h5TYBza4sxHgTvo
         rJ2MNGH3xwXf0UVmGu+VQyngbQ92sUccVYVH9DLYyFt5sJquWbAN25Ej/GKQs2pzaWPM
         SuS7q0Rv7OUl7T4yDuG9+6tdT3Kpv8dShNwBUd7wuD20OqQU/ReMYSrcexeXlCf8/Y1K
         TbNQ==
X-Gm-Message-State: AOAM5323q6W310e2wwp2LzN7f2/Kcq6+elheYAsRZBxms1n84i8wsgVY
	E8BL0vY2bOF3qN0rlFRb1LWeZaDh4Mx0h1il
X-Google-Smtp-Source: 
 ABdhPJzMyV/5r/n2qbqjfT+00P0tm8eRP2luGWVRRbQyE3cI3qGBaKSlCSP5egYOGH9DwmHva+BTZw==
X-Received: by 2002:a19:fc09:: with SMTP id a9mr13385794lfi.302.1634338670223;
        Fri, 15 Oct 2021 15:57:50 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 m27sm656019lfo.48.2021.10.15.15.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-google-auth: update to 2.3.0
Date: Sat, 16 Oct 2021 00:57:48 +0200
Message-Id: <20211015225748.4164082-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93372

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...thon3-google-auth_1.34.0.bb => python3-google-auth_2.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_1.34.0.bb => python3-google-auth_2.3.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_1.34.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.3.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_1.34.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.3.0.bb
index 92ad24800..9d192c15e 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_1.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f1094088bae046fb06f3d1a3d7df14717e8d959e9105b79c57725bd4e17597a2"
+SRC_URI[sha256sum] = "2800f6dfad29c6ced5faf9ca0c38ea8ba1ebe2559b10c029bd021e3de3301627"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


