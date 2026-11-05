Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6644.1793913804194742942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=CHNDlMM1;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so3138497eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913803; x=1794518603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w95POYmQZEf0KpMriEhmkm8OvcFFA0SoZ3QLQ9rWgTA=;
        b=CHNDlMM1lo6MyJ5w0BUTrbKXvJ5z/ttP9sFS0sXv9N/ppJXq6hAI6JQzyXkAVbR3pX
         CBl0u7EobxOITzbHb8voJ4scSpD28GMJ4g7O51wwbj/7u06+AYRLhUF+4UX80QTM6i3j
         pKBzvY2ivkJTK9+DlMzToFI8CAZCBQ7bx9Gj37S5jWC/j7GXz2DGCFadaKEZM/I8m9E2
         pnQ4ZZcU8TAYBu3un+UbXcaijPtsH0WQbuPYaE8/DDlW7KhHcEgWyT+5EtJsLoW+0+h5
         0L+Dm0s3PxcGpYcNAJVn5/nGKnGC+Wngb0RG3/GbHePFbpTkLzq2Q+NMF92qAEy3EsqV
         asxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913803; x=1794518603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w95POYmQZEf0KpMriEhmkm8OvcFFA0SoZ3QLQ9rWgTA=;
        b=UlW3hw1pCg623S0rcAvhCinVgnu/GpFJkoxAkyxRu2fOGeArYIzCQAwt4r86VC+GxZ
         DPgnNlVjs02f7rAO7EcsvZs/7laIZbdbGYnGwLyqDc24ntybH+A4fBVwb+JLc8fht0R5
         Gd11FfqIZwjsMGGRdCu0l3mLfy4GLAX4NjLiHtIab5x7HLNjTFodKUV+I7Xq+9wkkb02
         P42mskwt3MSFUtvRKy+BrzBPNRv8TVAVKK8Xt5cn2CO/tDdIGj1jd9lfZnyPWnbg37rO
         kEykipvCq48I6XwSpwoefKwMJy5m1jHQ7ejDWI/fAl0MjKSHbuLTmOv6D79arh/oMowC
         u6tg==
X-Gm-Message-State: APuU4Z89tpuvzfilkhs+sdE3LPyyf57U26DEifmzmDyAnfF2STQzHey1
	5OwnRepMcDrO4vfXxs9OvsH0e3UOVND+uv5K3lsNbg7iELahKRZuh//T8fQpZw==
X-Gm-Gg: AYBFou3+OE17AiHPykRuxpcPHVrVa9iZCg9M7/43+wzUgLpK94SMFb54HTZ90L8Xfxt
	P0tfXKr9KM7+7SfcyyAEijv6/7Wl+2EU4VAFE8MY7hQ38ndPK98UTb7FFzbROaLUTyKPJ31OuLM
	w0HxEZ4f/c2BB/93NKHw1nR/wR1pPMn+M9P7MvaTttD+xaiyno/vA2oFsteQGtb0QY2ozGuxjF4
	1usg8/v8jIfmU9pZ+EpWksu9jWEeKzhfBrmSSElw7d+zreEc9U68BpMDTVw/18bHTYWf14qrSuf
	3lbv+5tTFRn8W2E8W8VMp8541kMm1o2jfUPz0V95JMCoPAovcKdprwcbW0ovH5dXIdOYDcEK2dr
	7vq+4aU3dFVEk9el1se8wUgaTDinmIwq2voDlCHI8fwiBNcWnxDr9uiL9OPXCvGdwQ1ZzozXtBH
	8PPvZpmB5YL/yB5yywBUqXG8Ni+/t6w8eKwo/H5VcFl+Iv8WJiN133d7v1bEQryltDKZk+62c6U
	q/DuqibxDOaDW62E9TcgL4nScGOX6ldxvH/XpDKlY1WT/D6EmKXlaWxN77zui3OhfOyZygiLz0E
	ITr8YJhLuv2TIGrzBKIjmu8+p3shJz1pF0/l2rKRBs49ufUGzOtIlkDjU2GCgQ==
X-Received: by 2002:a05:7301:db88:b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36f773fb044mr460924eec.41.1793913803303;
        Thu, 05 Nov 2026 13:23:23 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 14/14] python3-django: upgrade 5.2.18 -> 5.2.19
Date: Fri,  6 Nov 2026 10:22:50 +1300
Message-ID: <20261105212250.490188-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131951
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/5.2.19/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_5.2.18.bb => python3-django_5.2.19.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.18.bb => python3-django_5.2.19.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.18.bb b/meta-python/recipes-devtools/python/python3-django_5.2.19.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-django_5.2.18.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.19.bb
index 4e3d0b431d..46c1cca1fa 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.18.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.19.bb
@@ -3,4 +3,4 @@ inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
             file://0001-pyproject-lower-setuptools-requirement.patch"
-SRC_URI[sha256sum] = "461c5dd06d2ea16bd5ca37d3f46e4def1d6b0fe7588c6f4e2119517bb0af8b2d"
+SRC_URI[sha256sum] = "ad03d8abc51dbff95ebf34b27123cf0c26a3b62db7ba0cd520783686362533d1"
