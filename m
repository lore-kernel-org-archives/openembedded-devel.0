Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E208D609DF
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 17:58:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.248.1765907928120478945
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 09:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=etWa/xwO;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so50502565e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765907926; x=1766512726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwO+Ury9QZSfYtNofXQ8rd4HI1iRqqtgTnrN3G/2JHg=;
        b=etWa/xwOJ1Pm2JLYXy2cbkXSEexmqrk40macYf5yb4DVcgwFkUXVGxfYdz/ZBCY2wW
         RCzBjQXyoce+qiP1DMuSTAPDG0taBgcEtILDYnYYkBFe23x5kFOZzUqUUiWaVJrwDlj2
         52MTmLGusRsCmCBZlMLeUGvPt5RNU/gwdndsLLaLVzOmqlvnrxJh8+31HVKsXmdcQrP5
         NVPjb+kVvyCzryV3WR1YP7zgjQU0v70+KgLaufT8Rlet25bkcmbeP3D0iMpCUfHyZs6+
         jpgyuRbjd5SMzkmiiyTqdGhq5a8akfkeuaugzeWoIRjvxcie/e6tMbr7RvBWj/9kQcj8
         TqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765907926; x=1766512726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwO+Ury9QZSfYtNofXQ8rd4HI1iRqqtgTnrN3G/2JHg=;
        b=b++MsY9bpQeinJZYquWB/HfmJ9qXwcJuTYYVZP6uVQ5h4eo3yhycnw8EVqtpNnTbNz
         C4S8CVT7sqd+y124wnXyOHv+mscfRMfXElBHbGiYkKREItxwjFnbFx1mb2Mg+QwKto9r
         uAy8tTu9726pkHAr+yf93nPhCTo5i+Yxs4RrfUom77bM5F1VTwNx/ulV7jVm1ZlJl8E9
         bS+wwXpb1g+GWC/y5ZUxeytrnfyZBJMQlxwab6h+uK03nCOQB5H+HZCf5W/RcD+8Woih
         vm5JhmNN0NNLOYrbMh03ih7fdYXNECDw7v7H93YcDKoUetS4vVQbVnfBdzOPMjIpK/nl
         04IA==
X-Gm-Message-State: AOJu0Yw9yZK0M6WLUwO6q2ufr4Xhu9qjkdN+l21LCFKSQNU0okYi8rJR
	ZdgtHnpnr99/3YL+nW1wC9q/DzXz81IgQrrMDB97UZ99eW01dWQzI0BHg3aUHA==
X-Gm-Gg: AY/fxX6XBK2JybDhrZblqPlh/H4AQzRo+NOU5H5Da1jlB7Bf7vTygru73lVlHu2AErJ
	Y3j4DOkM4VHLDr7BwTL+0WQgcq7OKw4HidIpjawy06UBWRsKd1+0mq4L3mCs4XGiRqEiikLPRlO
	7EJ+9ikzACxoDk+G1GIuJxOIAS/VG70V2a8TFAuuLYRMNKEhkLULNDhavlBPNUXc+D+cFJdyUKC
	MJwywRQXeNMENKnAzGre6LyzdSNTBr4o06ZCGUI390hdcTBjMyfxv4kO8Xz+HTHuylnPAX3BMGo
	6VQKE9OH3y+3CF6ah3R8aQE+bbGcqeDyO++NJbRkIjA10dIGbi6elsp1N0mqAZ9bZ3f4AiMLTsP
	vog7g70yJo9ozYB2MaGm0vOyW2pfbEC4maeruKOr57jzvwAUy3skjCPBNCBbAKnoeZ4XWgKPodo
	LoXmw4Tj2l
X-Google-Smtp-Source: AGHT+IFU9qpIuU2VmNK/fCW7qZIAQE6A7416/er999IoybyBiNHim9feKYT6+fhaxydMNaolgAPkKA==
X-Received: by 2002:a05:600c:1994:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47a8f905675mr138090665e9.22.1765907926391;
        Tue, 16 Dec 2025 09:58:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd992ad0csm13714525e9.9.2025.12.16.09.58.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 09:58:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 6/7] python3-pyro4: drop recipe
Date: Tue, 16 Dec 2025 18:58:39 +0100
Message-ID: <20251216175840.2939403-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216175840.2939403-1-skandigraun@gmail.com>
References: <20251216175840.2939403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 17:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122705

pyro4 is not maintained anymore, and it doesn't work with Python 3.11
fully either - and sure enough, when I tried to set up ptests with
Python 3.13, I got many failures.

Drop the recipe.

(There is an actively maintained successor, Pyro5 - new recipe should be
somewhere next to this patch.)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python-pyro4/python3-pyro4_4.82.bb           | 16 ----------------
 .../packagegroups/packagegroup-meta-python.bb    |  1 -
 2 files changed, 17 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb

diff --git a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
deleted file mode 100644
index 9f5e6d6dba..0000000000
--- a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Python Remote Objects"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc"
-
-SRC_URI[sha256sum] = "511f5b0804e92dd77dc33adf9c947787e3f9e9c5a96b12162f0557a7c4ce21fb"
-
-PYPI_PACKAGE = "Pyro4"
-UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-logging \
-    python3-serpent \
-    python3-threading \
-    "
diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d3abc0761f..37c8e868d3 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -335,7 +335,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pyperclip \
     python3-pyperf \
     python3-pyrad \
-    python3-pyro4 \
     python3-pyroute2 \
     python3-pyrsistent \
     python3-pyscaffold \

