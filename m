Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8936.1793358205493694391
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iFykG8Gd;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso91429766b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358204; x=1793963004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vroZcVprGiaP6ewyHBy9rspEEUU0WNRGO5gjrOyd2wg=;
        b=iFykG8GdQaJZlv0JJh3oT4Cm5g7DP7C3ad+ReYBJQ1OGjOQCvsn5uMh3eZTV/pqVVI
         TiljpzkvxEZNSAM0mZSeBQnAK0JPQ5tmbxYghE8cAAaUqAwtV1rsFr0Qj1LAouf97k4Q
         uy333RyWSdr0/jQKFDFAjwHqZ5dgH4RgpCUv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358204; x=1793963004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vroZcVprGiaP6ewyHBy9rspEEUU0WNRGO5gjrOyd2wg=;
        b=Dg8JclAdGovVmQfYUm2BYBZWFa14/vou8tw3hPZ/weoRBYi7EW0nB1vgPc8ANQuzXu
         MSrahxyMj+OCxa3FbCdOjtpPXrA0GN5j4MlX+RCGHB5qh82YwXfVD/syMX+YVA9gGcp2
         EDWUJVEVVZI5fsI/fXEy5xLPQClE0G0zINioOeYEjPuNbR5+9mgt+UXD8zZbsSEQEm/+
         LhXiSSW3XppNP72JvdJY9NcqAmw/c5BbZjYGy8Bg+u210KBNfw2qGk0cS5SxqbMetuGe
         /+Z7aRDs4MeLFd9TvauKuqys/WlkEXSxLimNk12xTRpwjAN2h4ucwywAH9ccS9xf2d9B
         wWYQ==
X-Gm-Message-State: AFq9FYI4UvhTm2RzuJR5CM9Io8YG0SPnb0VXrgPlPWP8HohyUH4d0/Cx
	JMk53/gE1OfUYA1DQvTkBhxIelNE0gfK0neUp2UlJXxeASX66ESQ+XTKCXeerNO6wwkLtV825kF
	NtR/E
X-Gm-Gg: AYBFou3FNYI4S9oXJ77xwA0SFbEvDsCQXT8ToaD2bkvhSRILdMC5CWvNN046GtSKeVW
	N5b6iw1v6G8JtX9iLn/UWQspHqYtzqbdn8I9Upb9zJJH7pJwcRu7FONs5ggnwlngLCU9hnu10Se
	fVE0ra57/jysoS5+QIGiDTRqs4ujMGlpHxmetl3UWxNnmy+MNEijDZD/GVFymRohrIevyPCL9HH
	GZuzoFG6E/pNak2Co3iV/YBfMJMxUECM3jvqzTCFtCzVwopjI7BuEMYv7xME/OGhHFc6U6OeuHq
	txI1SrSwM6ABdrjACNnn3iRlrhFxLX/FfBxfW1pEQVWgF1EwOaNGZ94R0RyX9VdbwUHqSTmzTy+
	I4jMNzO6JWX/Fe/yijQWNtmGKkXr7YC5DzjXbigi4SdDvZ+UogPvmzslN41CXMYvbOLRdCX2q8K
	ula5RRBKP0XPEKzyZJMseK1F55X7Jw6GIKIvvOcI1d40+LSuS5+h8jTQJY86I2D/BshvwDcWFjM
	8j8n3wVEL5JJORnYDvjldRu1N1dDctAfsysHrrjHgQP8imwxP4yzchb4VxIia3G9gGk3IRN2Gtc
	1vnklPHBC73Pbz5cs1S4A8/GpMAWSEkU2eDgAUvEKxRk8zaVAGHS250OrVhzpv5XIz/bKiG70q8
	nnRsNkdZkepbwt/w4lekOr25FD0H+gUwfpr8/fmHTYuxBqRC/zCXwizI=
X-Received: by 2002:a17:907:980c:b0:c49:903e:1e19 with SMTP id a640c23a62f3a-c4ca7a82557mr182873166b.26.1793358203539;
        Fri, 30 Oct 2026 04:03:23 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:22 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/25] python3-jsonpatch: Upgrade 1.37 -> 1.38
Date: Fri, 30 Oct 2026 13:02:53 +0200
Message-ID: <20261030110309.1124614-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131691
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.38:

- Document whole-document results and root replacement
- Preserve one-shot operation iterators during patch validation
- Clean temporary output after fdopen setup failure
- Extend CI: lint, package build, docs build, PyPy, Windows/macOS

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.37.bb => python3-jsonpatch_1.38.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.37.bb => python3-jsonpatch_1.38.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.38.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.38.bb
index 2b782d2eab..7de7f8cb94 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.38.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "04288ef93e60084bcb118101cd9d53424e627b91bb47ec5a95c02ec3795f6d23"
+SRC_URI[sha256sum] = "debc3e7bdc3d446468d64987f51a0e7a9deea42987ff90a6d1005a489b471c19"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

