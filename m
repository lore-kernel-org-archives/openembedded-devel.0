Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2900.1794165957699906603
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: roosesweb@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso1907795e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165956; x=1794770756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmowj+eJjeoGRb9EydoTHQTqv1rb9AWJwlkqJwM+rxM=;
        b=rjcHxEekNa6AJdK29ItGIfq9GO9kgzSBszL4Zxx+0IpnlG10Twu2Log/WwmBIfTPNQ
         J6PpVz+wyWJkicDnvcL+igMDpoVf2xQjJy2q0QS5AL8x9IZEZAuZ/kj+q6bWrtaRRQez
         5dj0fyZM+n23Z26exJVgqP2v4rPZMfKo/Fdit5JltrV1V++Kz5vvWZIDTPBLI1BJLlH3
         INjhmQTh536n2rJk2cHyTrD9/+kpqSFw7WoSCGGwyO477R2xo7cpVvlqy8rn/CLWyax6
         c36sErGEFzPB5DhVtZEFG/a1VUtWRQVgt7eh0puMbqURA5atuSc/FtJvFTJDxBbxKdPu
         JP5w==
X-Gm-Message-State: APuU4Z8lE+pclAfkmGctsoqDk5eoG//IzDHm871BtzXJGt7WnkSNpEA0
	qO2DArGi31z2lh8cMiS+F5skKOYUpWPljXCBT+c3pH1c4Kgdm6ggMs5aWG6tSQ==
X-Gm-Gg: AYBFou2AhOlqf8Wqqko5t92LhgAri4xD34l8PUY4aF7teYcr1tMKU8WVNSOmJZlkpc/
	1A9G3V/Q8AQ5YenaVC83iuq7d3OwHhDLhl8OEwjrVDlie7j9Plt6R8fvUH2Egap+y05SkGsMwXb
	u6bOPQoIxBjr4wm3WPKfLTkDMyXLhbog5VOKv0gsdcfRrkprEQLXNL3OFZVnuSdaASkVedQfDlQ
	9egLhmaoTTdVgHb+qO9oK01DaBTB8nt4MEMe0DxX6HmlFo311rLjq+/MoJR8vLkL3dVW4eSRmGt
	0p547LiPDB9aG50o1ax189PFsLTLS/fymSyKNnLynJt6JAGrSfJ0qw2MhHXrw3e1EFIhvxXFnVC
	mV+oowaWn9qnJcHe6Wg41Vn89l16vpfjoShZq0wSX7/LJYRQRGUVXKJf+rWJ7ZMr8zGJmwG+mzt
	zNHczRj+l1aRVpkQCwiUhw0dgwAaRI3KuKsRNEOkX37AO/cvVtZc7zn971bGH3/71W6Jgn6uFOe
	vfcg0VtLpQKbJk8s0nofkKTFWtLDmqJG5ZWEDkq4+mOVrmbqsBZc4X8oHhfOzTDo1vdurIl2O4G
	ts1ElnbdjmnUNLwbpRzbCPpDBxun9x7e8PnjyLnDvMQuQzJHpQKbBCCvxocTv/uGBZ52jOmaRkf
	LuhUwltF+OecSzxqyC+SP2hGb3G3+FuivF/4qTU/qhDQkPT5UtnPRhowauw==
X-Received: by 2002:a05:600c:1910:b0:4a2:d99:3171 with SMTP id 5b1f17b1804b1-4b963c6d3e2mr46714965e9.23.1794165955741;
        Sun, 08 Nov 2026 11:25:55 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1a517sm160930535e9.12.2026.11.08.11.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:25:55 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 5/6] python3-httpcore2: add recipe
Date: Sun,  8 Nov 2026 20:25:48 +0100
Message-ID: <20261108192549.1082715-6-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192549.1082715-1-thomas@roosesweb.de>
References: <20261108192549.1082715-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132020
Content-Type: text/plain; charset="utf-8"

httpx2 imports httpcore2, which is released as a separate package from
the same repository and with the same version.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 .../python/python3-httpcore2_2.16.0.bb        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httpcore2_2.16.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-httpcore2_2.16.0.bb b/meta-python/recipes-devtools/python/python3-httpcore2_2.16.0.bb
new file mode 100644
index 0000000000..03718729c1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httpcore2_2.16.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "A minimal low-level HTTP client"
+DESCRIPTION = "The HTTP core package of httpx2: connection pooling, \
+    HTTP/1.1 and HTTP/2 transport and proxy support."
+HOMEPAGE = "https://github.com/pydantic/httpx2"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=77c5a523c15d4a5887b081bba41ca110"
+
+SRC_URI[sha256sum] = "c72cd0413563b17e1cd8354677dff887466f8ec2551679759e93126534428643"
+
+inherit pypi python_hatchling
+
+DEPENDS += "\
+    python3-uv-dynamic-versioning-native \
+    python3-hatch-fancy-pypi-readme-native \
+    python3-jinja2-native \
+    python3-tomlkit-native \
+    python3-dunamai-native \
+"
+
+# anyio comes from the "asyncio" extra, which httpx2 needs for its async
+# client.
+RDEPENDS:${PN} += "\
+    python3-anyio \
+    python3-h11 \
+    python3-truststore \
+"
-- 
2.56.0

