Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2911.1794165994667516511
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b001cd92bso87414f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165993; x=1794770793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1/+23Qm2YOfQ9HkyDcbZ1IMauDYjJBHaoM4cm7wbS4=;
        b=2kS/4yP+XIRpqlbJccOLtj2voHycFNxKiNNl+39KR51EeC2cbjBF2rkoPteJX1BLwq
         W2lBJVNm7s98Ygp//LooxdhQiICNbDRnyuKIBv7OhBqohMPlOXGASehLsdtxOtFPW2MX
         L4vErXq2xcT4McE+MGjkykPsoW5jB+dyvtF6tRWN9QezQWnZjboc5c5aRCCwpxuJf3Vc
         S16TdruSIelKzPRVyAGR+0oZvToM/BNmPSKH1Njx288qLoFt94upaLEfZRAKXiPwKBad
         moGtX92GmHO0KojPmsct6iMwgskv5HTmX0cODIxyfpr3tIGFtN+8MTxEgOEiyX06ubb/
         BbEA==
X-Gm-Message-State: APuU4Z/8j0sTOQVeH2wZXQd+wiT1IvAIY8kbVSLLwH9gs4P4sAKgn99T
	aG5mmOZ3owK4SuwaC+Hhe7jz6YOIRwuCheqZEv/rwDQHrNEh3gC6GKi28FzdOA==
X-Gm-Gg: AYBFou382AD66p+Izsnyfq7dRFeWRiQIilXllj07AVdFKK2TIrU9B39sFckDiZWmN7J
	d0vGNo/xX/0C4riGrjM+vNhbmuGEJnTBbwi5p9QTXjyUt3YldyTuIlkdz7gIzP9Wi7zGm/TYx3b
	fzkUNF3v78qi4DxHQx9c/UJrI4rG7K56K7AHknm39+adtEIO8W7FnlvEvD3eM9MvRpbYUe18iR0
	6eb6dD1BTRyFfmxxvWBR2gBRxUKJGoW4s9ncq9iAgrJ2gE602PU+cVOdW1vcsvqmEWpKtQ9u7Ph
	oB8ZdufaPTVu6QUyKusm/tDRjYQ/G6YKFaa19TkXJSfOkXlb2qxJqk8M00ERw1l6oU6cNfqIOY2
	JuTagIVG/Wb1AOxYP3dWxihuT/1fzPklMe/7r2+sVbHLM1h75Un0hE1Voo5RpxIhR5Lbp4/GnxL
	nXsevyEOa+EK6RtQ3gU2ajNJvw784VkdySOx38f12A4IK1Rjg/oRyE9+zC88RUahM493F4YIeGx
	5NDYEodYin7nZskHjFa04+3GxW+7x6m7fWTpjSv5tg7lO0rcn+ZAI3tP4e0J0gPSSLB10mvBZfx
	RMj99/Ec6JmDURiZya1OtHAw9o6qcH+KORIyB70iwFEvs7DEsbnPk1nhZqL8oCin7apSEbknEWM
	p06wOm+6Yqy5nTvrgKAO1GMVPrtZXiXbsHOQzijjHPfnJYBlBBzdO15rqmUfWbqpH3d5Hhc9p9Y
	OFnu0=
X-Received: by 2002:a05:6000:4b14:b0:48e:752b:9f90 with SMTP id ffacd0b85a97d-4958b62dc21mr4054397f8f.38.1794165992827;
        Sun, 08 Nov 2026 11:26:32 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:32 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 11/13] python3-proto-plus: add recipe
Date: Sun,  8 Nov 2026 20:26:16 +0100
Message-ID: <20261108192623.1082770-12-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132033
Content-Type: text/plain; charset="utf-8"

python3-google-api-core 2.x requires proto-plus. A recipe for 1.27.1
exists in meta-python-ai, but meta-python cannot depend on that layer.

Only protobuf is a runtime dependency; google-api-core is needed by the
test suite only.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 .../python/python3-proto-plus_1.29.0.bb           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-proto-plus_1.29.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-proto-plus_1.29.0.bb b/meta-python/recipes-devtools/python/python3-proto-plus_1.29.0.bb
new file mode 100644
index 0000000000..da31e423e7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-proto-plus_1.29.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Beautiful, Pythonic protocol buffers"
+DESCRIPTION = "Proto Plus provides a Pythonic wrapper around protocol buffers. \
+    Messages behave like native Python types, which makes them easier to \
+    construct, read and serialize."
+HOMEPAGE = "https://github.com/googleapis/google-cloud-python/tree/main/packages/proto-plus"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "cfb4e62ad7e13dd18f346cabbda00cab39930d36a05791fd81ddb074d6ee884f"
+
+RDEPENDS:${PN} += "python3-protobuf"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.56.0

