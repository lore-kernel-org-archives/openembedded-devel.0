Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14837.1793092848540113931
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Q93W7RVh;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so26928965e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092847; x=1793697647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgEMlFSEUwYSQAdyJ5vpMqUWFaSl7Y+j8QqfXIXKRyk=;
        b=Q93W7RVhKickEQeOIVYMTjVkAbJKogK8hGghNFpxPMUvpfB8qhpfZ5W7OuK9N7o6m9
         ZUefm5ih0bWOlsKJ6/9zyKtJstOSI9fdjhbng9TQrOzbLCnolcEogciKTA7gi7HvZFhe
         jBYgdeUwqoAELl7RG0PYBpYK5ORw7wMXVPcW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092847; x=1793697647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgEMlFSEUwYSQAdyJ5vpMqUWFaSl7Y+j8QqfXIXKRyk=;
        b=fiwc/tRemAUiQ6CDsSpQm16ck4vGo1FkGcUlo9wdS0ey/tyKKm5/V8KfMB3vSxPYzK
         1BWmvyK1rkWEpF5MiB6hs9Cd1sxNPqKI30cB9ue1nK7c/BxjEFTFRPzblzeCS8sJOBqy
         X/erkqls+cN4S8TtdjfjQebMtVnVRjMQBeZwwa2SxBBZDw+oTc+bmAxp4nm+Aeo96VWw
         xInXhbhik3DYsdd2qGBiAY5UkvHOF365c1DS+wZAsSBXMiX9On62oC5FhbncgdjXFjuu
         0JSLk+ulHpYNmUsl9zgHA99rLF6b2drBOfqn5VMPWpC4KbjbX7POtL/kBBdG3g9UrjS2
         7SJA==
X-Gm-Message-State: AFq9FYLJbiRq3tTArXNX91FZ7wZp18yvIJsi1bbsQ36n/C/oXuCaEmvJ
	T+94MwoOkhe8pXLHIvYpGR84KbH2IPYYxrDGS0emYKGmAfd6vFwLXSmTiE6kJivtMv9tyqJFpym
	u1Qzo
X-Gm-Gg: AYBFou2O2K5mBapDOZ9yKQV95jLCtU5oXX07fQadTgh7Tg18z67ZW6jBpP1N9Iv4Ve5
	tw+HMrfTVVS2IsEAuIijhbjQmJ1jNofFL+AFWCf3p6ZcIrm1Z/WK7Yi27CKv22YxOljky/H5NTd
	7rgibsxAvkLPVRu1pJwzA7qZkjffq+t/dKBFKT/fShJxFWQPhGSxGYAHOf+2NKVZ+EV3Ad1AyRS
	EBNZXhHo7ONeI60jAFdVrFk39uyZblXeLIVxGu6s64aWX52sdG13ha/TcxMF8EIY381guob+QD1
	xYQ5gZF8e6pFv2Tt/IdQBPGWDDpQUK168DwXXaDWRtmf03T4Qo9rOz/q+3ix/Q+qbS4Wc441IY0
	2wu3eSBlrZ7I4D3A3InQxFpFpvBXVWKdeXTe8ewrJWySKG+k/YKPJQw+HNCPbXu+jgNPARHuvpz
	mEouhGKTqEeuVNLGeY6VOOomiBhwuw9RZO/cqE6aXNv8A7a3QysXGUSsLLLVs/i1/kBtli3viXq
	q/xzi9dztTOMT1a5QwLmHQQ+uaSxjxo+iDQEBJnEoddr3/+IDySpyFEnQl29NyON/qFDAhAMg8p
	gBfRU/yKj79PacQHpBBLA0LRnnchkjcLOivHhM2TjJqS/j5DuNVdHsNvL5eTOxYmvEPl/gd8AMx
	7k8aW
X-Received: by 2002:a05:600c:1909:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a35ac95fa0mr163866345e9.16.1793092846393;
        Tue, 27 Oct 2026 02:20:46 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:45 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 14/61] python3-protobuf: Upgrade 6.33.6 -> 7.36.2
Date: Tue, 27 Oct 2026 11:19:41 +0200
Message-ID: <20261027092028.782979-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131478
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.36.2:

- Detects single-crate cross-file symbol collisions and
  conditionally emits crate-root re-exports.
- Prepend the file module name to Rust type paths to use canonical
  paths.
- Expose generated per-file Rust proto modules as public.
- Include .c files in the source_files glob in upb/port/BUILD

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-protobuf_6.33.6.bb => python3-protobuf_7.36.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.6.bb => python3-protobuf_7.36.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb b/meta-python/recipes-devtools/python/python3-protobuf_7.36.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_7.36.2.bb
index f9aa69e9c5..7f3dbd1ec9 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.6.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_7.36.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "a6768d25248312c297558af96a9f9c929e8c4cee0659cb07e780731095f38135"
+SRC_URI[sha256sum] = "497d0463ff3316681da6c0b9e8d06cb465d61abce00b613ab42226175644d1bb"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 CVE_STATUS[CVE-2026-0994] = "fixed-version: it is fixed in 6.33.5"
-- 
2.47.3

