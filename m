Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CEAC43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:05 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69130.1782634322083572274
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sv2rvgq5;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30e18c3e0b8so832914eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634321; x=1783239121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OK7PT+AjCn446C05nUr54XUMKVLuQTtUgPbjVMkcvrg=;
        b=sv2rvgq5bV2eLCvO4YpISa8JV28v2v1C6IQ4vGNPxmV5tKWanIYDYVzwSwQeI9rFvF
         K1QMI1afPBr9MfuoQavetrdhCE8vzUu5/VZ31G6YeGxwO4ecvhEmtomGuyAsVeqA9bkp
         wp/VKzqawyuhiPTvr8DErHLQVKohlOcx8T5O3X+YH8jfRoKE6ZdoBKOOPhaT0i55shUf
         SUOahELQhDcG+VeWwU2HtQzvOXJ/+D3Damm8iWthN03WcfAT+Ffkwke7fq8EZsDE8bqa
         v6Xz+fz5nxu3jUplaQzRtIY9qfQStDdwnrIBjhznR+EqKbmnMQV0DMWtv7HEJnBfVXsa
         u3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634321; x=1783239121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OK7PT+AjCn446C05nUr54XUMKVLuQTtUgPbjVMkcvrg=;
        b=D4xF/FGKkb/UlmSGwtQKTQb8t7a7pXUqQ+FdyGLRmqXFb26TQ2tmcvUx+EtloviLGw
         kKTlMevJjGCpJH5bHyDQWa4MSzqDjQ1fzZc0t8Jdt7DpHqztlJYE49dwLUwNDblMs4Dy
         jic3Sq0A2YVFw+CX+9gn46ZHhOu6iwsHRnjVuvGU2yuqB3iDSayv0KI5sKA1Ci+2e8rN
         FeyUvJbpqScqdrhM7IyA0j4Munass8IyP0s6TraFu3QjGEXgPaZTDodtWT0gLGt80W/U
         9ohslAvQ+PhQzVen3J86nlNdlF2txmkSm5VY4+9+QDwIgjLAQc44iYGsHHqI7bz8GX8b
         P7KQ==
X-Gm-Message-State: AOJu0Yx6jEJD/CqZ0Pr104NPPq9M6QrC8XXWmjubanjmw/v19f+IeCZG
	zV/NUatFdf3JimzYo1MNZmew/TRsUym24QdRg431MkHrGiHpArV7f6JeKGY4548pzne8zQ==
X-Gm-Gg: AfdE7cnyE4FDg/Zh2ImWrzH0NlE4G1a2uZDgOjYTRjtm5oX96ETrgwtlJcsUOYc7XkE
	20B3qT9tpny2GyiOXRcrjheMwQMxcRiY95tds04mracNUOBdGb1Fk0mYcmVEmVa0KnKvrnNzpnZ
	tmB7Ha+M7SiJ2bnB8fDz5BPt92WCpo0/cDKpxeq1d/Y7Det2MiZcYupKgTX/dhIEEWOiI+1vf16
	CUhc5f1dMti37lu0g7c+FPwgjBvm/ryjuHRIs3fpyu5E+zNaJUi7gBWxzsyGDBAq500F36daEyU
	E6kLt7jEGh+TTecAm0Zy7boHwZW3GfMpgWjukO9NlZvgIvbwOzp3C5vCL/r1DMabNPALwWCdlGe
	e9O8vZPHJ9vf6EPBXSVT70zQtYP6p46ydHQLLJTYmODmSvgJCr1WrK25MKDM0wwN/cD9SnQ7BrL
	LzUT24Ay/yX/qU3LtyHCj0fJV29FSre9EoHdH/d86QTLFnMhQXmXiesvi5h+Q/nobcFfDkXIrjz
	Sd3q0zI0WIUbKYRvsKrEJN8d7sL9UC20aiVGRa23m+OBt2Sn6vAVyeWJExa9rYCV8E33mAElHoi
	TpXv/LRwNzyxZIB9mVhZDMMtzICaeQ==
X-Received: by 2002:a05:7301:1930:b0:30c:639f:ff8f with SMTP id 5a478bee46e88-30c84d75564mr13096607eec.8.1782634321402;
        Sun, 28 Jun 2026 01:12:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 039/128] gst-editing-services: upgrade 1.22.7 -> 1.22.12
Date: Sun, 28 Jun 2026 01:09:50 -0700
Message-ID: <20260628081122.178348-39-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127849

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...iting-services_1.22.7.bb => gst-editing-services_1.22.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/gst-editing-services/{gst-editing-services_1.22.7.bb => gst-editing-services_1.22.12.bb} (92%)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb
similarity index 92%
rename from meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
rename to meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb
index 50d45ef57b..2d65ef6622 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.12.bb
@@ -18,7 +18,7 @@ inherit meson pkgconfig upstream-version-is-even gobject-introspection features_
 EXTRA_OEMESON = "-Dvalidate=disabled"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
-SRC_URI[sha256sum] = "fec56a2c37a253cd048d288d4c7eda6eff191022b09db975e07a2c105d1b521e"
+SRC_URI[sha256sum] = "792339135ce713088663cc5d44e0aea8217793e88fabfd11571e7abf4a429f2c"
 
 PACKAGES += "gst-validate-launcher libges"
 

