Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7527EC636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 14:48:50 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.12101.1677163725883340684
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 06:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QrfKPfty;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id t7-20020a9d7487000000b00693d565b852so300169otk.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 06:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVeT8ozt4Q59ZaewISU2YvGGl9jw0MtvKWw367qAhLE=;
        b=QrfKPftyfW4ZOnV0ETAfX9+eP+/EcKmt6mpwC6sg5VXxEvh6ZWoy8qODfeW4K0gcFo
         vSy+MfQ++KoKzkixCLeKRHN6nn+hPTw876Vl+Yh4W0QMSiTcr3Suj84i2InC+nk/DIKI
         rLby/micncPQ5PvkGOwlLbAydDfGC6+zHUTlZndJKKEPiihsT7Bp6bSgC79hZBJH+bsG
         DoKjo2+wC3Np+qJBOPJjLnw4wgMPnuat3/o79cJdf07oK/5wrq6/QRArMnQI4QeMYjXj
         YzlAkXKcLrdBmi6GD6hJX/Xwf2BfTcUObsfwEWwhiXetKq+4yrN4m87xBnNBd8O53iVc
         zptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVeT8ozt4Q59ZaewISU2YvGGl9jw0MtvKWw367qAhLE=;
        b=2EqMylYLnlqRV6sZaNF4cp57rK8ey20WsGoegZrJUJDI1CKAueIQAekGLWOHwTeFbC
         gy6iJVPLpprCzYGE+xpEk31dWGkbq8O2gI8yET3xhpHpAS0mFoiOhICf+LLj05e4skc4
         Vdr4Z6c+ati4oLwKsqb1m6XqFW2GHrZevB/VwcGdCvFI8HGoAAB+Gu+73z/dcPYZICZ4
         fnet2wDIsrDqfqRMfkz1J4oP+MPmjUtITuo3l18PLNGDpVJ+auJWiDxDC6JyVvDZ9bbH
         kvnnw2VHvuYHsVcIX6mSYSAdMAcjx8dEtdEQQbyeCW4THrYKZhUgczrBF7KCU8jQxlh4
         ktOQ==
X-Gm-Message-State: AO0yUKXw8ezeyk4lMeqCjnmlnzq3QVEHFKOGDh3pxU6BU4XHInLlTiO/
	8deR7bpS+6yZOFmH7/sbAsUlyntQZ8A=
X-Google-Smtp-Source: AK7set/xSI0LqGXhxwWJALZhdZoHCZbudZ2deYtwz1MZIXEf9yiBdM6I7dvW+j6Ik6Fva3HOaYW3Pg==
X-Received: by 2002:a9d:19c1:0:b0:693:c7e4:ddb3 with SMTP id k59-20020a9d19c1000000b00693c7e4ddb3mr3950966otk.4.1677163724546;
        Thu, 23 Feb 2023 06:48:44 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y10-20020a9d714a000000b0068bb6043362sm2641277otj.11.2023.02.23.06.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 06:48:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH v2] libvpx: Explicitly link with pthread support
Date: Thu, 23 Feb 2023 08:48:39 -0600
Message-Id: <20230223144839.1843181-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230222165122.1489645-1-JPEWhacker@gmail.com>
References: <20230222165122.1489645-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 14:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101233

When building for the native build host, explicitly add the -pthread
option to link against the pthread libraries. This errors like:

  vp9_encoder.c:(.text+0x2073): undefined reference to `pthread_once'

when building the native variant

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
index 066d7cc81..9c04c2a34 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
@@ -19,6 +19,7 @@ S = "${WORKDIR}/git"
 ARM_INSTRUCTION_SET = "arm"
 
 CFLAGS += "-fPIC"
+BUILD_LDFLAGS += "-pthread"
 
 export CC
 export LD = "${CC}"
-- 
2.33.0


