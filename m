Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D782B10A88E1
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:32:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51229.1774539159093213458
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NU5a1Oiv;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso12403895e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539156; x=1775143956; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0SC/+CDHilaKdsJNBNWwhs7T++L+oKaOjcLl9oPyXY=;
        b=NU5a1OivoDfz3LagjFZcRbTczLLxM4jJWZmaQwV8k7pwAxIcRXnV6/Zjg4B6QHO1wv
         R4Qawjd0yshGEcaxrYxCpvrItB2o5ko02IPftfAaa+RbiFQuboQgrj/JGXfOOrvkT+lH
         4+I4ptzEJjejWzHprdVUPvgzauaqloH0flcEIy9OjMkyOlkHTK6GIds5wFOxa8+Iooqx
         txGWDFTJq2hST/d2RfCINN8XOkHqk1IDtMsDwKVzyI6ijODrpG/vEm6tVx4CEoVmawyd
         YNBxbpali5GTimcwDVDRBS0ed5k4SvW8476xKcfiX9E40Katam10oudIwW97HA4Xxo4L
         imiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539156; x=1775143956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q0SC/+CDHilaKdsJNBNWwhs7T++L+oKaOjcLl9oPyXY=;
        b=LFkEgpl/4eaEy3/eRwwUejEoIEhQxpLNkTxwH5xewUIqB+a8FJfvwEvojAzg5NLrW9
         gba8jrT/B6nZ/F1aCqdEjIW3+PALPSyIPaJ3SjZCy+v6/sWbQxfnMuz9hhz61nQXAE/S
         d+fJwFRYwzSW6EFbJ7BfagSqFsJB8OvX4cfG+9kMnKaPT4yW6dpVewxny3BwsyrqGOHK
         E9DOrGcec6YquN9TSHh45qMLqWIh1FP+/YOD2fBl8jPchimJlKC2Y+XD9lcHv0PaP1Dq
         js6OSxpGeUFrwx4b7FpwQGT5FsVlqjVgJW54JNv5GRO+OptBtPE3aG//fObnbPyEpKqc
         8XJw==
X-Gm-Message-State: AOJu0YwNoMT/vXmAzch1EOvu8Q8KVcpGk2asORP5DRBqs0cusWdIb9E8
	beaTqYdt6L7990whV5u1EtHvo9zfMLbGKBULZ14VlK5NWc9ON1kqaz1TAI4I/Q==
X-Gm-Gg: ATEYQzy2ohyzSoCMq7jChWrzT5x3EQrthxOVm6tybIH2Ywi45mdytqHy7/Pnosa7n0Y
	Q0sozXfu7/CUvr8jVlYlUNZL2Vz8kQeV5untN4+RQaI5hxMxYTH58u4ENHoqTKXEiHCnNgt+E6N
	W9Q3PLhtaihDLxQ4t+PIQIQ2wBEIVwFxE9KSRxBVdaFXAup+ltQ3QL8YB2amZNwosNAF5zZ1wT4
	rqpOsHRAEpYKGouAC9Ut3LmseXt1EZ+016ME3FZV4KXyhI4GLpccsfUNYUgZ3JN2adyFVe1iToj
	ZAF++pnukXb9eybfmUuIAJANhTWcwtrHatZfqUwIjcbXyQmJo/iP3GXhyde6+zBo217nROxFy5P
	4sE2Kwan3viSyDrDpiJJy4lwjWPmOiiTxiGLrAToMELf0qgCgdnQdBf418CntLUnlzkDi1P0xhT
	QXGB8ouCyULMCt9w==
X-Received: by 2002:a05:600c:1913:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-48716071753mr119976425e9.25.1774539155687;
        Thu, 26 Mar 2026 08:32:35 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm66936295e9.1.2026.03.26.08.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:32:33 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][meta-oe][PATCH 6/6] opencv: Support Python free-threading
Date: Thu, 26 Mar 2026 16:25:10 +0100
Message-ID: <20260326153210.2245962-7-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326153210.2245962-1-zboszor@gmail.com>
References: <20260326153210.2245962-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125759

opencv installs its python module into the ABI-less
site-packages directory.

Move the installed site-packages directory to the correct
location if needed.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.13.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
index 70ff7b2c4b..206159876d 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.13.0.bb
@@ -224,6 +224,10 @@ do_install:append() {
         # mesa-demos /usr/bin/shape file.
         mv ${D}/${bindir}/shape ${D}/${bindir}/opencv_shape
     fi
+
+    if [ ! -d ${D}${libdir}/${PYTHON_DIR} ]; then
+        mv ${D}${libdir}/python${PYTHON_BASEVERSION} ${D}${libdir}/${PYTHON_DIR}
+    fi
 }
 
 do_install:append:class-target() {
-- 
2.53.0


