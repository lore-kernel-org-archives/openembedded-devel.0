Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F5010A62ED
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49224.1774534344072736896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=APN2qDki;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so8588425e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534342; x=1775139142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=APN2qDkiVz5nM5OkPZtGH1/lrQ+2CG9/FaQydoTgHISp8j8Bjaae9WZ/LKbkfGqJv0
         nbw7GIxGdFo5aMkULJJAbhuYw2rzxZsDzrDj9DbkLnSCp+zTgb/WPps1iksg8SWwT4xd
         w8biPHYTiQJQkjFhH+1C8bEsEOj1qTwvmi68gwOfzlnsxNzwcvbQ6s1Uw1KMGPoHhsP/
         wKari+V5WRQ1DKVqTkCMU0DSjkG9y1RPnDNd9lbd1FxrxOI9QxmKXCCm0unjl4mxT44r
         M4rsKeyEE3J92K7x4e6s/h2qJ49hd6YCy8HzdPjvNnyzBPhbcxvfZxpMZyWybrrP9b4a
         6Xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534342; x=1775139142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=IoILWkJloZXvdHEPimzRZ1A0mvanpDefXrlNEHTjLzxCGTAipWWQsbyLlD4le7jTIH
         HK1OlCWzdUnuKotKmG3eZywutKR+kbS1LdlfH4bdNbYcKERQulLAsQJ9IgkI0GhaFbIq
         ihAmHB/CjBxXnz5F+QAv7FoYzb1+tNoyub9tp4DJ39WHi3RvpEPCopL6gUYL2K7Yv0Zl
         YWhLy38N4I0gaB3yVwbH3lgy6DPsJGUGWOj+KPLdfNuWO4EUIXZk1g0mZ9d7dWL4+Hll
         aA/cc+V69DBwfcbrYWgEFkZTTLTE/tKXL+XVeyMdfZ3sqH+Uo5GcTTc4waAnUXrf5BVY
         jvCg==
X-Gm-Message-State: AOJu0Yxkm6FtI4ERAa8/ebL4/4NSY9Qiv4zNxmPCXotO/mIa0ZlqUTf9
	v0Abl9sn8XBFX7ZgWezaCcUGf0USzPgT/YHijahtl5Kh6zgEMNunxtmNRvpOeg==
X-Gm-Gg: ATEYQzxKFw6I9N7I21ZBaONZQJxDWkQmIYMvVB8+LfTmd5MnRTzQ/KPuEWdv1TEqDRz
	fz5y14Faf9n248PlpnGLuUk304efN9xj7wZms1kWW15EMNH2Vb4nEAqoELbIoknYjw6ZwGFMy/5
	jrEIkh4ATYM02drLM10f5d3n2buRwsc0TPr3lLbKVvSmeW0t5oY031qIZVvbr65jRZiKCXIdr/4
	sI3QJwEQs9Uoq65rwi3j8uDtCSmrKFPskR8Em/kZ3IvrcJAzy+3bcuNIMZjSmP0CJaUSN7zYPMb
	Xtoqs8NQerwjTyXNm1sogFGR90OJjvCd4roPKuzXZSw9kE1iNVfeTyE7MUy00WmGe0DxPIE4t1p
	n4+DK8T8pSP0L385wuF9KoOYhTARRfSBWEX4/vupkTcipkwHgj8zL8GSpcX+cdHfi6zFxiXXhM+
	/nF/KDDb/AcLx+sQ==
X-Received: by 2002:a05:6000:4310:b0:43b:436d:782c with SMTP id ffacd0b85a97d-43b8896cdb0mr12739972f8f.4.1774534342044;
        Thu, 26 Mar 2026 07:12:22 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:21 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 05/12] python_pyo3.bbclass: Pass ABI flag and use PYTHON_MAINVERSION
Date: Thu, 26 Mar 2026 15:12:05 +0100
Message-ID: <20260326141213.2081121-6-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326141213.2081121-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125727

Setting the ABI flag correctly is necessary for modules using
python_maturin.bbclass and others based on pyo3.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python_pyo3.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_pyo3.bbclass b/meta/classes-recipe/python_pyo3.bbclass
index 7f5a00f584..c618d711ac 100644
--- a/meta/classes-recipe/python_pyo3.bbclass
+++ b/meta/classes-recipe/python_pyo3.bbclass
@@ -12,7 +12,8 @@
 inherit cargo python3-dir siteinfo
 
 export PYO3_CROSS = "1"
-export PYO3_CROSS_PYTHON_VERSION = "${PYTHON_BASEVERSION}"
+export PYO3_CROSS_PYTHON_VERSION = "${PYTHON_MAINVERSION}"
+export ABIFLAGS = "${PYTHON_ABI}"
 export PYO3_CROSS_LIB_DIR = "${STAGING_LIBDIR}"
 export CARGO_BUILD_TARGET = "${RUST_HOST_SYS}"
 export RUSTFLAGS
@@ -25,6 +26,7 @@ implementation=CPython
 version=${PYTHON_BASEVERSION}
 shared=true
 abi3=false
+abiflags=${PYTHON_ABI}
 lib_name=${PYTHON_DIR}
 lib_dir=${STAGING_LIBDIR}
 pointer_width=${SITEINFO_BITS}
-- 
2.53.0


