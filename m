Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8082C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:58:42 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.35579.1749221916844629273
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CuJvv3p4;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70df67e1b17so20329397b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749221916; x=1749826716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRhBJ89V+iXSuZzyHs+z+Ps5NnJrV4w/+g+/S1+S8hk=;
        b=CuJvv3p4SR+l8jN7V13sOB7xkDUlQKXc70wwkK3ElKSURdMh2z5p1SwVt0JFOGsvhf
         jf4A6DpBMvgDTtLcPbMm97jsTsPq7Jl2osJk0B1fYWQsWZ2meUzcXBuUrHV4ffcK6V/R
         urUQe+zt8WMFCCa+mzC4qguV8y1GjP2zLFni/XZ+0P1nTX44g7qI1YvtIzctbT2VdAzV
         XBSKhxQ4v3iHgQXh6shCEB6osZhZ3MB+sDTYOW7Eg1Fzy6rE4oduXQ56rFtp4sjZlL9A
         aX0V0QMom1s/nXcD7Dgq08CGOisF7fosy40eTzt48Gp8QHIjMQ9TraIeaewoQe+BnpfE
         dlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749221916; x=1749826716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRhBJ89V+iXSuZzyHs+z+Ps5NnJrV4w/+g+/S1+S8hk=;
        b=Uin5kjVqK7Z3o9WPH5c3YL4KB2SmGxY+P3tC6B8u7s8n/hRSGCPeIs0mwiSfOS3TXf
         4KI+4XyCk4oBpwGCR4WWQTVRKAj69KDN3fWHl6eD+rmsIRbGME8zxKYLRP6WQ4bPsnY8
         roiNRzptP0oDSZFqGj/06XtjTaydvBUinyDpzcXLFy6RMnUlddYPMShk+czW1Chk08fa
         xMXleC/nGn6g5nYLJ7jh0qP8bocu6x7TuC0BVjWQkJfS4jsPwz8mRbNkYg+hRTqLRgRE
         i52p6KZ5nS7w0m4Kh2XxpE8HhyAR6oklntjcJYjrwHsYsTfsFSQNaUXmqOkKx8/miC+C
         MdFg==
X-Gm-Message-State: AOJu0YySISLRgvA0hY719NVnt1aaeKW7EstnB6WKjGPg0D8jJGenw5uP
	WVqqTcTv0dtGLO6RkthCBvUi6sRsE4yI4ZAaxRoz8FW2O4NR7CRNglU34PnERome
X-Gm-Gg: ASbGncteZrnDXR4S0Xc4gDtMJSj2+a0MAOmO2aIA+bOr4l2kPx4TWQQcjigN3XSoMsS
	yPXbomGmBMjYTSwfjkE5avo4kqhecAjnTtGUk3bT7ahqxgcMPos4Qap8HGByyEBqLbLxSHmmnzE
	JsfrZ7ZUTc/ybC/vwYbeFGngkBqLkBF0HX6WUjYPmUOvNlFOTlDRS4XZbM3Goqr0pxicDyNEvQf
	FIKKUfuUPb2GUie3YVFn2mM7ADpONI8PEIgM2BcWWqnAhGFmBjVpc40MfXkQuQ9V1fGMJa+dhp+
	MU9h7wkMvKQgudHoKR06a1C4NyqtO0r4/M9LReF04dHIY2ssW/Nz4Y+eZLj5LX/++ASfelF76gF
	SANrm2cmsUA==
X-Google-Smtp-Source: AGHT+IFMSKc7SRQe9F1l2D9Q5WDbpWnJAK5XaieEX712gkYcJYVc7GJAvNKUtVnEUUhZzdPXY7U7nA==
X-Received: by 2002:a05:690c:f0f:b0:70d:f47a:7e21 with SMTP id 00721157ae682-710f76300bamr52176877b3.1.1749221915425;
        Fri, 06 Jun 2025 07:58:35 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99e80dfsm2831417b3.62.2025.06.06.07.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:58:35 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 5/6] xfce4-smartbookmark-plugin: upgrade 0.5.2 -> 0.5.3
Date: Fri,  6 Jun 2025 10:58:04 -0400
Message-ID: <20250606145805.164173-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606145805.164173-1-schonm@gmail.com>
References: <20250606145805.164173-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 14:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117769

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-smartbookmark-plugin/-/tags/xfce4-smartbookmark-plugin-0.5.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...mark-plugin_0.5.2.bb => xfce4-smartbookmark-plugin_0.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/smartbookmark/{xfce4-smartbookmark-plugin_0.5.2.bb => xfce4-smartbookmark-plugin_0.5.3.bb} (76%)

diff --git a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.3.bb
similarity index 76%
rename from meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
rename to meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.3.bb
index 68e9cbd3a3..18083ec697 100644
--- a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.2.bb
+++ b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.3.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "2a279e2f5a54518684e62ad1f3cd8ef950826505b39725f1b5d8f0c43031cdd3"
+SRC_URI[sha256sum] = "3b4db0ac198339197a7682935f0bba5a7e8dd7f35bf575ac6665afa4cecec236"
-- 
2.43.0


