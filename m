Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5607CCD3436
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 12:09:55 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37547.1777982994063371001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 05:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jSbznzA1;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so5946205e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 05:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777982992; x=1778587792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4vNtK0uEWoDmhfJGFWWHUgRUOsClm388j7fLGXGlyU=;
        b=jSbznzA15zWV4873gphR4hoKnS1bIeotJXRCHbZy+d1mQYcP4IQ8uvRDkVp/ZRlBu8
         VsFsbmI7KtgwJvyIceWxf9sQVtRg6lc55REqZOShSlnFKxwObae1AHfst2kdA4QXkaLw
         3cOe3DPLJ90ZQv2wRsAFLhZj9RoQMvk7bjpTYAXHh3Mhe9b5E4eWrWq0r7c4QjbE7Mtx
         FCxjzzlUOqkVVJx8OFjW8HyWf38go+CzXU3KJhNSqTGKgp+osFiXr2o9/FKaB41bxVTE
         4TfJr1HwlYftmDej4vprnLWZFJYzhqbkMzgU6kdh92L7jbZ7cHA+UyYlwPC9khi020eE
         HPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777982992; x=1778587792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4vNtK0uEWoDmhfJGFWWHUgRUOsClm388j7fLGXGlyU=;
        b=jnkzFkGDnTZj5usKy7l2JhkvIxrtPnmxXjPQUH5mtDtbe0Ezs5WnOsqpX7k1r/Oysi
         KCShERkU38k6SaZQmj1lJ5tbKHbTo20z66WOzguy/+wI6fqiuclBNTXTPrwmJkghYdJt
         pN/J4ILkCnZpuZYmK6vkqCmIUok3BZGM/qHhoQdHAV+q6X5zPeGBX5pwKvoXzTgGL1lH
         XRtf/f7EOU5vGORG/JsDqUC9LBtOUpKQtUv4fJr8h2+LII0w/erQV5w78e8caIuibf1p
         /5qDm6a65xrE8uXsDOp1i/iPER454hZLlCXRIbB1FX/t1zv11GPl6vZJCqH/r/VI9F0e
         XAHQ==
X-Gm-Message-State: AOJu0YzyqHQmf1OLDBeQQtkk9mux19xLMwpG7l1fH88oseOUn716Q3Y1
	d3JaYxMbvMagEPLeaDeqelvPCFGNEtPEf/6vP8ueIMKeICjFQe0h4aIrnQYDvw==
X-Gm-Gg: AeBDiesCXBH6pG/8Zwuhb2aipyPLikKmj/vyooClW+zUBwZ4t1y6HuEUb2li1PA9WTV
	79Y7e6utwgwIPDYw+NHATiyD/krl5nhXGqWx0YmVtJ6n0nwfYkYmwKNZZX5RAyTg+kmtq+0d7Y+
	b5L2BSw/hkM9cTczHdOF+JSd4IzQXAmcvfvntPShK2bHtMs/hcd98dt4Lois/iMmbBqP+VciCGA
	FhoBdayJQrDbe5S/IBpZq1y0tofS+68sGWdp5DrQU24n1PwBC/Y5OYycDMsjneiRsvcZwD3bzCG
	DU9/n6zOT5BpUMIZ6VGI/jOazl+0Yg/0DWWn+YcKSftC94OAUYwWui1DA2iJe79i43IfiNdVP5+
	WtzjDANadZ6VMW4ttzB1aoBynQGQYOkwoLVbH/ah1xaqYCwHpmLfoilpe2Da+PiWE8Hv947OOMd
	Gu0CSoMHUCeloo7qBP9PQ7shH0AremMm+qrBIO0ltEm7NFBBHCpkaZLL/usp61MZs+8VPlAddCL
	mBWlWFVqOXe6vC/EaA4kvmM
X-Received: by 2002:a05:6512:3ca7:b0:5a8:7445:13e0 with SMTP id 2adb3069b0e04-5a874451527mr2726717e87.40.1777982991485;
        Tue, 05 May 2026 05:09:51 -0700 (PDT)
Received: from dcbuildsrv.ci.qt.io (ip-109-75-238-172.customer.as29154.net. [109.75.238.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3939952a2b2sm21969941fa.1.2026.05.05.05.09.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:09:50 -0700 (PDT)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/3] python3-py-serializable: add recipe
Date: Tue,  5 May 2026 12:09:14 +0000
Message-ID: <20260505120915.206334-2-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505120915.206334-1-samuli.piippo@qt.io>
References: <20260505120915.206334-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 12:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126782

This Pythonic library provides a framework for serializing/
deserializing Python classes to and from JSON and XML

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 .../python/python3-py-serializable_2.1.0.bb        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-py-serializable_2.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-py-serializable_2.1.0.bb b/meta-python/recipes-devtools/python/python3-py-serializable_2.1.0.bb
new file mode 100644
index 0000000000..8e2a6111d7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-py-serializable_2.1.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Library for serializing and deserializing Python Objects to and from JSON and XML."
+HOMEPAGE = "https://github.com/madpah/serializable"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[sha256sum] = "9d5db56154a867a9b897c0163b33a793c804c80cee984116d02d49e4578fc103"
+
+inherit pypi python_poetry_core
+
+PYPI_PACKAGE = "py_serializable"
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} += "python3-defusedxml"
-- 
2.43.0


