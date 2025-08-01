Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0ADC87FDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 23:13:48 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.100912.1754090019184206997
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 16:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RHRVdDfE;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b423036a317so1339849a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 16:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754090018; x=1754694818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lr6/gqYZRhPB/pfiX+2tM2zx9zwsfkFRSf7K3xu/e8=;
        b=RHRVdDfE1dy0+LdpexiGO1E3JBiplof9cyD3vCgYCqCxgWc3050tXAHBk+xkW676p9
         KZ6QuZV6BfSqFyDL8cbhgDzp3MvZHdoa11PKeH5t8zByA/NShxMugK90ed2KIZcvMlxa
         vkTOGwwsYkdt7wI8lEyTBC3iJu6ySsyrSULH4C3LsWrJ1riiPWEEJTsD0eYQc8eDNgDM
         b+fjfho9IZNihL5kAarOEK+e64hkScMjIhpI/LGird8WcPATC20lG1f1BGvU45Ktgk98
         P/Q5gpqf/2jBZbKvEXxrAovRXRWV8uH8fRKE4cUysrsJKCIYCShtSmxMrdO+IeMnLblj
         2Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754090018; x=1754694818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lr6/gqYZRhPB/pfiX+2tM2zx9zwsfkFRSf7K3xu/e8=;
        b=iVSnnHXZ+xbWG8MgMCeBMJ63/WaztUygUc+tJ40Ni1Rkf+te3VZp40wTJ4lGcmd1Gp
         Ul4WBEUAqj8MTJQxpSKjpUaQMgMi2wf2bysr8iXJY6CxKUntv5dN2wet9sARqRPpneWs
         70qzgxLVD664MdNd0Z8D/NjzFbZP1KpdZVJgjywzhlC+hGQARzIlw2G9AV9MYcRiweWS
         iQW5QnrW1mSiB59HL92oha8IXSHjJmvhUTYtl8jDV9gX63OYJxaB4RA3iRI1yAs0ylc0
         4CuGQGu5H8VDpl4nnWMXj7ivC0BBUGp43RnZN9g4bG0SFMlI355XTkq3xmP5iOKz7HTB
         TNlQ==
X-Gm-Message-State: AOJu0YyZVDI3amgJHOOjrqS8prMQ1u7mjIRs5iPOoAUFakzS02tBsi2x
	mRVlIpPGaABypI1OrwBzZw2GCO+Lrr8ebaAPwE6TbtQgWRr0F9YOjG2C9NKAY1BYM+4=
X-Gm-Gg: ASbGncvCl38/uRBJiYWGlWItbiGJ6EzsOjUCIbl7dwqgVerY89OQ+7ScRULNiFzgt5h
	Vl7Nujmk1EilEs8TimgCsHjVw5I4LlMLdH1jTrDWgvo2fmP/PZ4ySL+PJmdqm8AFdBz/wq4stRi
	oXPsCGxRp17EY2IDEg12gaDIzBmGj/GtQ+O7FLXAecrBX9QedXLxi+z5tx3XgHGO5f5h3zxE1ED
	S+Dp3Qj/zAXNmMc7pv4NbsYN97LtMY+nBxDZRy2rbi4g/qacVwUCKyBGHbwPfrkmA3ZtHiNwxMr
	RtQwqAUpl7ByCB/L1oC0pGJ9DVYMV+jHdgcqguhwdzy5QnjSlDXYozD0pYzP7ggOImlJk5nAlo8
	beHOIZCHZwuf4Dw==
X-Google-Smtp-Source: AGHT+IG3QK2535K5hQy171q+c1m8Bi8ihl164hGqlcZjN2Fx3+lU1rf6/PYeUYUE6IoEoy1RmvavWA==
X-Received: by 2002:a17:90b:1fd0:b0:315:9cae:bd8 with SMTP id 98e67ed59e1d1-321162b6c7emr1981972a91.23.1754090018234;
        Fri, 01 Aug 2025 16:13:38 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b423d2f4fcesm2141884a12.33.2025.08.01.16.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 16:13:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/4] python3-kivy: Set KIVY_NO_ARGS=1
Date: Fri,  1 Aug 2025 16:13:31 -0700
Message-ID: <20250801231332.4167568-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801231332.4167568-1-raj.khem@gmail.com>
References: <20250801231332.4167568-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 23:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118826

This fails to compile with latest setuptools3

[ERROR  ] [Core        ] option --verbose not recognized
Kivy Usage: setup.py [KIVY OPTION...] [-- PROGRAM OPTIONS]::

    Options placed after a '-- ' separator, will not be touched by kivy,
    and instead passed to your program.

    Set KIVY_NO_ARGS=1 in your environment or before you import Kivy to
    disable Kivy's argument parser.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
index 4cdc773ba6..a2602a9a81 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.1.bb
@@ -39,6 +39,9 @@ export KIVY_GRAPHICS
 KIVY_CROSS_SYSROOT = "${RECIPE_SYSROOT}"
 export KIVY_CROSS_SYSROOT
 
+KIVY_NO_ARGS = "1"
+export KIVY_NO_ARGS
+
 REQUIRED_DISTRO_FEATURES += "opengl gobject-introspection-data"
 
 ANY_OF_DISTRO_FEATURES = "x11 wayland"

