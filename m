Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A868C54736
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 11:27:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.76089.1724758017405769562
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Aug 2024 04:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YaKMsD8c;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53343bf5eddso7089455e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724758015; x=1725362815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4Vzj3ItbcRJ04KmfJlRehKcHwT9Uj1t5j9jSXIFp0o=;
        b=YaKMsD8c5qZvWZIqtQIJsGoeO75DeED9N9KeykqsxUltDVG9V6B69TNu3YJBGn1+jX
         Che00Vs39ef754W2iOcC64sE+BTOU110C4B0CJuvwAl7s1HcjcvMhQvg0CezVNHHpRMv
         iLQkBT+Upwjs2xn+u+6BFEqPPrqTwyd6vgS1ltCjjNekIFcmiabz4Yrt2Snq37Dx1Qh8
         91C+AXSlipO5rHt/lt82xs0ACEJzHBYQNrsNyXy2//mDpQlBk7XXawecDJENc+IFzKoU
         N2hccxfM7G7FbEYFQ9orMNTxbVoWrS7hK0Pq0t4gVJQBU6NnqjLV24S2wgp67Z+faHCY
         Know==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724758015; x=1725362815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4Vzj3ItbcRJ04KmfJlRehKcHwT9Uj1t5j9jSXIFp0o=;
        b=LfuTfrLackdeBVRFqN+Zhb8MxoNbLgdZa/xPneMxSUcl5lmZzIPyN3hye6sU+34dqS
         tQ3skp/fqQJOUF19ri/M8kSECVJGOh9cXeFTHT9jgWdBKcaWwlc9nAe+BMyJz3DqLeEh
         /mrUhbMNPqYo1ypLsxD2qqtb23CmM7coedcG+YorPe48pqLpPR0wN496kz71SIlR4cfh
         j/R5jCkA0ka4tQ4xDO1dU4zH+Sydoi5mgf55L/5AN8r/bte2ukH2sJQE91/tD49zzV1x
         Gj+RsCUDR6SYlOTCYug4BiZnak+jp+myUl5GQMF3EO94NshTM/3OA/jZwKvUjFa/6bYo
         ffrQ==
X-Gm-Message-State: AOJu0YyqP+EELUINWEfe6NBcFyIzKNKeJTc6s6I1jJjfEqCjrP93u5OS
	ySUin39pB9ggTIFonsaVIZfhN4nmZzVgNHSLAOwnTSy01vF04D52fu4jMZwhA8z7zhADBYJK9fx
	c
X-Google-Smtp-Source: AGHT+IFVcsfRABZWwwpeL3iiOAZYkqcRLIX3gy/qr1EYwNjJAgs3WeqBV688gUw+Y4oFGLemZnlrQA==
X-Received: by 2002:a05:6512:2310:b0:530:c239:6fad with SMTP id 2adb3069b0e04-5344e270a4fmr1567660e87.0.1724758014909;
        Tue, 27 Aug 2024 04:26:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea88994sm1774732e87.247.2024.08.27.04.26.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 04:26:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] packagegroup-meta-oe: include deqp-runner into packagegroup-meta-oe-graphics
Date: Tue, 27 Aug 2024 14:26:53 +0300
Message-Id: <20240827112653.216012-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827112653.216012-1-dmitry.baryshkov@linaro.org>
References: <20240827112653.216012-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Aug 2024 11:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111974

Include deqp-runner into the graphics packagegroup.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index d6d8cfd32bc7..d13a8980d0cf 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -612,6 +612,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     yad \
     ydotool \
     parallel-deqp-runner \
+    deqp-runner \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts", "", d)} \
 "
-- 
2.39.2


