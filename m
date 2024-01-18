Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19413C47DB3
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 16:50:56 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.18013.1705596648192085917
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 08:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=c8945tH6;
 spf=pass (domain: smile.fr, ip: 209.85.167.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50f11e3ba3aso1525747e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 08:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705596646; x=1706201446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8ltMUZVBJpXHvisTpK9CnwNqKTdKQh4JbzOcTK8FQM=;
        b=c8945tH6W65iCauHslFahoYUEYNxWluT1GQ7AVMa0WGlFOMdIBrH3ZgivC32mtyfgT
         vhgZGhI4zhq07xcF8fm+hFtPQocpG+1Nj4mg2IA/n0ECc/dkB9OgG/9Vwth2sCr7tzUG
         aKhaskYuTfyxOZJM3974KqmHJzgevHeksYQRDhNEwtv/uqEwdthrF9adM84D/+gJ3iVc
         2g6bhBUsK70bcG7MMW/6xVKx+60Mjep5S/fqV5Rp4slHH/xOkS+uK+6Ae6K74dOzNs5f
         d9uIPZy6vz2uOnp0ydcYt4BteQTomnarDAEsYjgoZ1F/E3aageWrBxPT8RjfSROXLMPQ
         7bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705596646; x=1706201446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8ltMUZVBJpXHvisTpK9CnwNqKTdKQh4JbzOcTK8FQM=;
        b=IoPidjhg3olNAUK9gkxLeLiYtemz/ICXlz0v6c0h8lbQgUA3FSRzCu50bSR/Za8Qjp
         WXPJ8wPvY342eQj0dfk7oy3jD8tdG8+WMrFEAdfqa/Yql156M5H3DYQu+6WsJ2P+ffnK
         SYnBtRmsl6j6XLW0Sgz6VTWSdkb42/s8FwPE3Fz/ns6N9/U0wM+YuXkth8ymtRFghgVV
         9SqcT0EwWAHFN8E6UmkWTENEyzPwdS0V8/8V9YJAv+9SL/Ey3ulrisHbLZ6pcsUgajBY
         nTCLNlWlLg9DoWm6+Jn2egtaZqg0JYJfjJ2Sx11N/lqq/HVPgjmORtz/mIznaqGQKlcC
         HNpw==
X-Gm-Message-State: AOJu0YwWs3qsfhOEhWkvwPf9LUTpzOUOX9+zCoz1+tAa52uDejKFTlsk
	lfGsmVSSSvvQ5DzRBb5zJ5zwi1B+GZ74IEfD+QgD3C8QpFTijMcG4ENDpX5w3hEwkarRI0hcuxz
	2QjM=
X-Google-Smtp-Source: AGHT+IFM+nNOXOR7oIRPAUAIv6iblbQhGGHEpHtNg5DUpl0s9SEPJR+YrJdVygJonoAvuW+jMLQYXA==
X-Received: by 2002:a05:6512:370b:b0:50e:936b:a466 with SMTP id z11-20020a056512370b00b0050e936ba466mr666214lfr.90.1705596645702;
        Thu, 18 Jan 2024 08:50:45 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c501200b0040e77ce8768sm14435012wmr.16.2024.01.18.08.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 08:50:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH 2/2] python3-pytest-cov: Add missing python3-pytest RDEPENDS
Date: Thu, 18 Jan 2024 17:49:59 +0100
Message-Id: <20240118164959.2797172-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240118164959.2797172-1-yoann.congal@smile.fr>
References: <20240118164959.2797172-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 16:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108347

python3-pytest-cov is a plugin of python3-pytest adding test coverage
feature. It does not seem to do anything useful by itself.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
index 3a68011f4..66375dec3 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_4.1.0.bb
@@ -10,6 +10,6 @@ SRC_URI[sha256sum] = "3904b13dfbfec47f003b8e77fd5b589cd11904a21ddf1ab38a64f204d6
 inherit pypi setuptools3
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
-RDEPENDS:${PN} += "python3-coverage"
+RDEPENDS:${PN} += "python3-coverage python3-pytest"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


