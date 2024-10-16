Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4DBD2A54B
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:35:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.32580.1729107319574169072
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gq415Gmd;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso1893605e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 12:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107318; x=1729712118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6D4X9PEF4CIKaMYbZYtawdbV6eUgHNzMRl+Kt2naqvI=;
        b=gq415GmdM0pRmZ5t5xolNau9in2Ewtbl5En0Kl0TimOgd+/5dyjoNxOoJ18dDuTIbk
         AxHiMjtDnFHY7mmJ/k/tY+cw1B47hW3mD/QnBFCzE+neiPjLyCtSZDRCarUaY8I/lUz+
         swQ4dEDQ6x/8sX0Z2yhn44AzyrF0jotXWdAsosFZjDLZwLsb/xH+XXY/XzTvC1K8ZtU9
         OU1XPmvAizLA+a+caJVgVmuIvBqdRy1Z+K9Kh5ZavirWkUfATC/zLTx4PtiWe/0Nogk/
         9CCzSBri04qN1gRSA1NM9w7HAudI7N0FE4jneGw310CieGOpEFWjTm29EnHevrkLn8AC
         XbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107318; x=1729712118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6D4X9PEF4CIKaMYbZYtawdbV6eUgHNzMRl+Kt2naqvI=;
        b=MSj8xHhP5ccXWPon7npon4C15w4nmR3oxuJXOcB0Kk5wNHwtThsZWk4v0NpsGi0K9C
         EkyvYuAAMDo+QYQHOC3MTjcHWEJcY7kxJhkCYy91Y6oyX+73N1alaPoX6ONkqJWSEDcD
         uhLCc/ucobJSHupnjnEALXjBaYBfn5fFfMaOFZm6doES9zDluuJ6j5akke4aZuAXGbE6
         VfPYiglSKlV2FxgIf3/t9pexEwV/SUsQugZL2t6AmRDLNCSE5DAMwX4UDN5chgcptNjS
         vzU8B7K/WP2DTjEO3lhIIplRVwp55KIHzFSh5Q5Ce/muXX7b0U6PmwaXV3HHWuONtm/p
         1Rwg==
X-Gm-Message-State: AOJu0YzXVWf/sdTeCDrRA2crJO/YbbrgJ0ha4UafuQYQdi+3Mfx0DKao
	l37JTtVrhQ9qCPXBNTWWi8BWQkXy+xtLh/aEMYcxILVcnt831IbuD1m30Q==
X-Google-Smtp-Source: AGHT+IH1IVJEzbkVVxX4pdyukD9+OEq1LItGcRGw76UsWy0aEK/zBA4jxDr0nc/BEcbYuVzZ8AWANg==
X-Received: by 2002:a05:6000:4388:b0:37d:614e:2bc8 with SMTP id ffacd0b85a97d-37d614e2cd5mr9916365f8f.35.1729107317807;
        Wed, 16 Oct 2024 12:35:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf838dsm5120724f8f.78.2024.10.16.12.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 12:35:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/13] libcec: disable python wrapper
Date: Wed, 16 Oct 2024 21:35:02 +0200
Message-Id: <20241016193505.3459828-10-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241016193505.3459828-1-alex@linutronix.de>
References: <20241016193505.3459828-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 19:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112951

No longer python 3.13 compatible:
https://github.com/Pulse-Eight/libcec/issues/664

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/libcec/libcec_6.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
index 599416cb2..22155e534 100644
--- a/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
+++ b/meta-oe/recipes-extended/libcec/libcec_6.0.2.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 inherit cmake pkgconfig
 
 # default config is for RaspberryPi API, use the Linux 4.10+ API by default
-PLATFORM_CMAKE_FLAGS ?= "-DHAVE_LINUX_API=1 -DHAVE_RPI_API=0"
+PLATFORM_CMAKE_FLAGS ?= "-DHAVE_LINUX_API=1 -DHAVE_RPI_API=0 -DSKIP_PYTHON_WRAPPER=1"
 EXTRA_OECMAKE += "${PLATFORM_CMAKE_FLAGS}"
 
 # Put client examples into separate packages
-- 
2.39.5


