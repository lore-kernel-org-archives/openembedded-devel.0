Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2962.1794165995765309915
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so138066f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165994; x=1794770794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrfnXC3+VA1zFSVkbdnJoGg40DatGLnh1bILExT0y9o=;
        b=CYh0FbGftiXMrJWW7ZXn8ZDwSEJB4doLI8JErhtc09XO6o8BGxXfV2AmsUaiic2LEb
         HVJSwYUOMauQ5oPjBn7SAwKD6vIhg4V7A7nEjY+sZRE5f8ALohDcGOBUxt/t7EBW4wyS
         f0X8j2Dc1btfGIWtPk+XSglvANlwy6RnTOoxH7SCs520m0IAISk5gb9eWPPKO2qfaf/Y
         QBRwmTTohGpa67rGlInQqBbLLH40M+Bzh9OCDVcCGfEFp3/T87LrD/zW8gPBx0bBPg2D
         Y55a9s/xjNOnMoeIDcpdLPupytjwVZz3P8tFoesPkFA2+TY6sEjf5x4z2YFyqXPE9AFI
         jgGg==
X-Gm-Message-State: APuU4Z+oYwwi1YvAU1Et5vGGRxoyxoANWhhEi1Ba5PkPZ0Sm3Rxuo0S2
	Q/yUaqGEKNKumsFV+Wjm6Mw9LVNNxD1+Ws/tsonw3YjyLmRPekS2Wh+BjNEPZw==
X-Gm-Gg: AYBFou0Bx3/pI2F+L0SVu5m0+gqy10myapE06boap1Vh8H8WJ6PVxf2gmQIPTr3Dkcu
	CAdnvwruy26F0ATjlTpqSMWu6wIkVEkfRP8hfkErWH7LpsbWevzbIWNrPQmu6nfi8gar4IIJjHD
	PGfjvbH2X0y9vmwQWFVZAyKPZ2Ss/i8oMzgxnOvUpYT+J+HvAD1Avjwfe5BKaG/lKzawCSHw36d
	1c8cVqw7tg+njgpfGdhZGmv2vnyKt76/beStl/NGeLbz+1EuUn7V4gGKhKXr3521rcPrjBOyhD2
	WXZ7uhz8mCparQFJ2JXxNVWbTzTW5OLu/fjk5KEpbEE4JE7/5I0E5/FRMp/xfoi/FId4oxAEvE8
	b2YtVqyptVO37cXy1LRL4AB/2bUp4rbe9TyfkQrzHki37PU4RnwECeZytknBkTAteQUkQHMMTsk
	RhBMLlNYNt81LH7xLPeLT7uW0rZbhYZy01oYFcTapJdn29q46GytseAodj+5KNp5+fulMYHjbSy
	HHbVmhc1Xhp3ymCxbG3EWyaCIePua4fiQA7gcTXkbWrEBliKNd4CVUF+VNm8yhCOBDyeSBYMVGA
	DN8UUBo409Ddf80y0Q9gw5JpanwCRIcW06cAk+q5QbXm939Taf4MggkUA44mjApIRURdU5KxsHA
	FWUrydHxcwiuNyHEpaXM0AaguSzcrYhXOmD2ab6WAJt1NgrZc+krTflGQJg==
X-Received: by 2002:a05:6000:4028:b0:492:b5e9:4916 with SMTP id ffacd0b85a97d-4958373113fmr4928333f8f.24.1794165993845;
        Sun, 08 Nov 2026 11:26:33 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:33 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 13/13] python3-google-api-core: upgrade 2.19.1 -> 2.44.0
Date: Sun,  8 Nov 2026 20:26:18 +0100
Message-ID: <20261108192623.1082770-14-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132035
Content-Type: text/plain; charset="utf-8"

2.19.1 declares protobuf < 6, while meta-python provides 7.36, and
google-cloud-pubsub 2.39.2, which Home Assistant 2026.11 uses, requires
google-api-core >= 2.25.0.

New runtime dependencies: proto-plus and opentelemetry-api. pytz is no
longer used. The package is built with setuptools.build_meta now. The
sdist on PyPI was renamed from google-api-core-2.19.1.tar.gz to
google_api_core-2.44.0.tar.gz; the underscore form is the pypi.bbclass
default, so PYPI_PACKAGE_SDIST, which pointed at the old name, is
dropped.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 ...-core_2.19.1.bb => python3-google-api-core_2.44.0.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.19.1.bb => python3-google-api-core_2.44.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.44.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.44.0.bb
index eee2278e40..e5be0613dc 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.44.0.bb
@@ -3,11 +3,9 @@ HOMEPAGE = "https://github.com/googleapis/python-api-core"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE_SDIST = "google-api-core"
-
-SRC_URI[sha256sum] = "f4695f1e3650b316a795108a76a1c416e6afb036199d1c1f1f110916df479ffd"
+SRC_URI[sha256sum] = "5ab9a396965c1227d7dea4581e562b7018aa2bca96d2de0be5eb70dc9c8ab3a1"
 
 RDEPENDS:${PN} += "\
     python3-asyncio \
@@ -20,7 +18,8 @@ RDEPENDS:${PN} += "\
     python3-googleapis-common-protos \
     python3-google-auth \
     python3-grpcio \
+    python3-opentelemetry-api \
+    python3-proto-plus \
     python3-protobuf \
-    python3-pytz \
     python3-requests \
 "
-- 
2.56.0

