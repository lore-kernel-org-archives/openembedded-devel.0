Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22796.1794814554224032621
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=esQFKts2;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so13093485e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814552; x=1795419352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nx32qwm8FTk7wwh74sJhefR+3CJTFaue7W+c+Dc51S4=;
        b=esQFKts2OGDQA8gKei2yFUi8G1XuqyJ2MGnjK+LIphXUoChqB5WPqFcknkAM0fBMeo
         902mdDbg+vVjGrkUg48MGrIszT5PheCq3rL+KXZNrZwbXNeeFz1HBjhzRZBzZq7bcZWy
         nd8xsjas4yIJTi+//CzTA1loMfWd9sIBEKBPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814552; x=1795419352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nx32qwm8FTk7wwh74sJhefR+3CJTFaue7W+c+Dc51S4=;
        b=zCAT35RUmnN5glEuTJoJ7t2zfvgEYpbU1NYLr+zEstm13vGGOy51Z6XItb2hXu9xK+
         rbKF/oWWJNpeRYZzpBlNB1nX4En9Z0VvkBVLQmhCP+hYoxK5/VxBOfEi6BBVsbQNBKjJ
         7S+SW8XQnDgzufQKuwK8TIidNxQJKg3OlgTiatcTEed8WP1UoYccNFKXjPaE19DARTSU
         iN9PiEpb55DeZ+GLJXwddPkt8hrSH0ULzPozw3fga7hAVJdMLD+UIl/EivUk3Pcyed94
         Glb+GB8EVNTFVKey4h2nC41leTygBc0a1lpM7feSgp9QvYZJz5l2kZagkq+qjnJVBUMR
         P1xw==
X-Gm-Message-State: APuU4Z/fWbnpJFlJatnZreNuIBjbzwPNVLkdpChNUxf/W1V44QVy9P4V
	BSfy6iaeRH5u1SiM6JyxNCo75TPqJMJpi8z0X/aNvWtZ2H1SAoasckXCiriyKsK8fpYzJtqPno1
	qEzfi
X-Gm-Gg: AYBFou38CJTV5dX4pYTuvp5pWxDM3kiVOVlIzLQMK33R1SuN64pZmVIef1gCWRPRN8N
	eJNHETBOckZTo6JI5NeJxeu2IlnzdCzq6xPOljFYmVh4BfbcCZ+D4vSpW2EDrmVkhd2xld/5tde
	8tjojMSOwbtOK4/KyfhccWQXhWXgYJ2vcNblKX7k0+Yd85vIC1F5A5Mb7s/sXQgTSGiuff1PVrV
	MsAj/lCZx2qz66lX8qJy3itii+YVzKSibjNwr9DpD/kf1nlgQqL2PkvNHRN35DliNckczSwPKo/
	lUVMOs10CQQtbcfKrEdGwSVof7Iucs1FtbU8EdSvPPASqSSB5vF0rL7C7IeAMID833ycYAxc5kf
	Puogn50v85JVQ0JqQNwHaoGwzmJ7hm5YkumMxCfnHou2bFoccBQDb3MI67fcYPpEak5N9DPc+FP
	OAnF16pGu68kEAcBVdX3KmvHoXq7eMrn3Jy11am0ie58rWKTbYuLvyKIvSjmhz6WrmOc8B6coQn
	OId7DgEugUallbZAEegdgcvt6zlegRwFAjAdwEgzj24ixNYoP+8UC0Bjd9V+nD194iF48tcN1eI
	U7a8qrQLlQKo3dRg+ITaitm3WS6xWazTXY56Bp/oBkPljCuZIYBpqEYARoqTqIBjxQ7eR/Dk9zP
	3bAPjKMnqbvvnDgElHEKqfD9MosjiHr+eK+E7KpG4V4lS6QHyrr0Qeg==
X-Received: by 2002:a05:600c:a596:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4bb55a86fb2mr117014075e9.11.1794814552506;
        Sun, 15 Nov 2026 23:35:52 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:52 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 21/24] python3-tornado: Upgrade 6.6 -> 6.6.1
Date: Mon, 16 Nov 2026 09:35:28 +0200
Message-ID: <20261116073532.880420-21-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132449
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.6.1:

- StaticFileHandler will no longer serve NTFS alternate data
  streams as if they were regular files on Windows.
- SimpleAsyncHTTPClient no longer hangs and leaks resources when
  processing a redirect to URL schemes other than http and https.
- Parsing of percent-encoded data in URLs is much more efficient,
  preventing potential denial-of-service attacks.
- Additional forms of open redirects in RedirectHandler have been
  fixed (in addition to the ones fixed in 6.6.0)
- Open redirects in @addslash and @removeslash have been fixed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tornado_6.6.bb => python3-tornado_6.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.6.bb => python3-tornado_6.6.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.6.bb b/meta-python/recipes-devtools/python/python3-tornado_6.6.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.6.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.6.1.bb
index 440a00ab63..342c20d8a7 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.6.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.6.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "34c4aa916d7f2b2d5cadee2c6850f5a4a7f3d688cbf58399ea9bd3057af4abd5"
+SRC_URI[sha256sum] = "28e6311402af59c8b02e3fa0f5e7d8eb465b25081381803b127d97e6a4395d5a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

