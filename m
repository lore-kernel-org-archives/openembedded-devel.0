Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7964.1793701446892030075
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z57YU7mw;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so33721935e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701445; x=1794306245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGkFfmp+ihqZdqHj5JCS6nMTbntzkB6ZtSkwDDuS73c=;
        b=Z57YU7mwhevjPYMGrl31kf5AFUhJHB9xGrWEPbe7+jaWc59dR0WS6wYaN8W4ghfktq
         xp6aqLbFYsowaZ1fX12CzSovL//HTSNn2PWnemfEEo2vIc8DwRJKoIvU1WrwHAlVtOKO
         ZCYSXczrZ63yDbPKNennjuO0P8J+k/i2U2n3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701445; x=1794306245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGkFfmp+ihqZdqHj5JCS6nMTbntzkB6ZtSkwDDuS73c=;
        b=eFxmLNeVO0W5gKnLveA65lLPf7T2BJIU5i9wGR1vlhXX4YT4V7TNIyW18AhlgfC7iR
         cYJ0lSnMjwR1QlCQoXQEnDZaXGl47GJimLsK447WKrnf2N1cr+k50inCGyvLuMsEdJS+
         GsXV/FwnXVIhzzSacc0MkfZewh8RIosueu4fApnFkrPZfscosC5UcqZRMuFF7os/zyNj
         FcLY9dyXsTE+lw2yEnB+wuJG9RR0vJMqfICNw402mbaU9uFJ2AYUDELqUkRgobBIV5cy
         UcuLfSjPztGvJMsF/q6yErBKe0jCA6SLUXyZX7ClcZ8yroyaqW350Q78STDGJwAkr2U+
         h3Bw==
X-Gm-Message-State: APuU4Z/wTGPvxY0DuECDoqWPINbbQIFs3qsZ+fiLScdTQIm2EHvP4aYR
	wi0OYUnPscgXEvuKHAcrYrTdWIGv9hp6KtFg9Wi93nTdQOaE+HtemhTm53dTOsTnrxgogJJBR5N
	y4RZz
X-Gm-Gg: AYBFou03YPDnSfv+g0aLxbWBFE8pg5jQCXLHd3bB1pQf3oR1Xcl9F01aJuKnFxBv4D/
	w/kpGxeVfwcNEFSqJ6kHFhOo23Hw8H33Jk2MfdHLjqXwc0MPOC3/UToUHg6msHuuojInMxmrf+f
	TB3YL0hItX7o0AxhnWqnvOP+3s7ki/KAhDyGbTqCwFsyPDMftI0OVcI06z/k6Ddt+Dk4UQyEi9Y
	OJe/NtN3AjtyrtAvAtLGKo+LT0PUgUONOkdK9xQPNlsSLgYQKW+WHsi/P2ODE2BBn/to0AnG3jl
	Kt66I3OzwB2fEvcMndbRthVVF+snCejamxfs4joOvmm9rTAyriKumQkJ9pZQJ5rkbE9JpKfqrz0
	XeDMBCEV4DfAeOmTibF2MYj9ZlZHPliAP8ziyHPHK0gyGUt1hbjzGdThiC/xhm9POXecsWHhVGz
	3Rf4hMPKnkwBubD2/59FjH8rfYIrH/e32cRb3pIHjJelRVlNkC/W0taaJ/hAL9eJukqqLJ+l5bc
	s2yLfk8PCkBcf8brf04mVnhXAwNerNfIFXunc49Au8JCg6zV22+fmfa2Ya9QXJsAUb2eAD+D+UK
	Lth5njqiu9Fk9RFlaTRaWIsHem0euM8/YG8tjXwxsQU7nzeVy3aMiJRI3El0p7z6ltY2Js/Z7EK
	nyn4T88BlCgY+/+RgtH6ddfnK9snIrVr5uM0LZ5se35G9J5i23bIEDw==
X-Received: by 2002:a05:600c:a45:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ac1932b43amr295790105e9.31.1793701445031;
        Tue, 03 Nov 2026 02:24:05 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:04 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/22] python3-cachetools: Upgrade 7.2.7 -> 7.2.8
Date: Tue,  3 Nov 2026 12:23:30 +0200
Message-ID: <20261103102350.1952237-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131765
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.2.8:

- Fix type stubs for TTLCache and TLRUCache with default timer.
- Minor documentation and unit test improvements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_7.2.7.bb => python3-cachetools_7.2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_7.2.7.bb => python3-cachetools_7.2.8.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_7.2.7.bb b/meta-python/recipes-devtools/python/python3-cachetools_7.2.8.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_7.2.7.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_7.2.8.bb
index 4b564bc3f9..f5136743b9 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_7.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_7.2.8.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "e2154c809ce9e1247120258c36821467597b5663d44c3255a9790785f23c2b1e"
+SRC_URI[sha256sum] = "3f9b146b2160975da273e7c23ec882f3996b65df608150d52083c07de0682075"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

