Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1252BD35E4B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.27773.1730831945294355808
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YaGUmxrw;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e8063533b5so48283387b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831944; x=1731436744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPGGXi6Rk25vJ6Y+44f8O8+C1bWrEAAtuUOQxDk3zEw=;
        b=YaGUmxrwUEgSJPqnYLT0wbgX6ivlPZOvbQghMu3G+L2TwCsropdyapU+nhK/fgbGrp
         R7LP49hMdHreFBcuJGg3Mq+O5zkzzoghtMe8VdBrXJXXFyC7faL05AHS5BlF8Ilx1cj3
         k3d5gkJwQzW1ipWooVK+UwC94wVxmK3Q3D08tPame1ZX3VqkILg15H0txAGeLmi0cAd7
         0yNDpRsCsiU8oM3dTdlteWs6FwbMePWROS8wOcioGFwc7wPCID5cbKey92AhylB6Zf6s
         oveBxB4v+1s9QBo7elcCVKnSqLeTAM6m//bK5TP6xhm7BpgytfdKmIvdkcSK8vu6HKRq
         zhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831944; x=1731436744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aPGGXi6Rk25vJ6Y+44f8O8+C1bWrEAAtuUOQxDk3zEw=;
        b=aCoBvqcp1VVWO5j+jVZlNRytf70vn2P981Wymr7gA3kNVLEin1xV63HWfn8iglm9Pr
         S39m15i6cV8CpnaKhj4ANvpEfJQ6iOQalzxr6Bvrhmes2DDzsoqJVnFwJDPvFE4b6DHV
         eWvHBBIfxxVYe09TkUshiJc0cbap5NpMQYcJN8Xb5g2eT6H04s+CrXVYzV5x0DViRNhw
         9jhSVaUvRIYihF9uNKPXNYU9bnE1ECEc9/OCMQ0BCjAguipahqTftI0hjEKL6xs535Rl
         cWad3JTeTHt0MVLdOZV0ig7IjpWiKi5LMuEWy1cGWD0E6KoWeaDDgngZhcW0Ot0pbQ6F
         BZ2w==
X-Gm-Message-State: AOJu0Yxt/xLWl64eifV227M//Po50F6U98XFfa4v4mCZTstpSrZNGhaP
	nIR1c+spwAX4IJGzaKnCE4WoogD960qUII6chZXv56VC+dnB/nrXT9Tek+mT
X-Google-Smtp-Source: AGHT+IFMO+7xWwPqYLTKJzWWVPBrHSLsIuBCL0SyGLAqFN65VmbzoBN/mQDO1EmCXyRf2Ssu6Xafjw==
X-Received: by 2002:a05:690c:690c:b0:6e7:de90:3149 with SMTP id 00721157ae682-6ea64beeea7mr169225937b3.29.1730831943876;
        Tue, 05 Nov 2024 10:39:03 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:39:03 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 080/161] ttf-dejavu: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:56 -0500
Message-ID: <20241105183658.34982-82-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113595

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index 54aeb318a..90a11ca4d 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -44,7 +44,6 @@ FILES:${PN}-serif-condensed = "${datadir}/fonts/truetype/DejaVuSerifCondensed*.t
 FILES:${PN}-mathtexgyre     = "${datadir}/fonts/truetype/DejaVuMathTeXGyre.ttf"
 FILES:${PN}-common          = "${sysconfdir}"
 
-SRC_URI[md5sum] = "d0efec10b9f110a32e9b8f796e21782c"
 SRC_URI[sha256sum] = "fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


