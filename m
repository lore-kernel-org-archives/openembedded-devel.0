Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8884.1792580516085341373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oKbSwYr5;
 spf=pass (domain: konsulko.com, ip: 209.85.218.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso87857366b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580514; x=1793185314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duI09lSyFIyXgjuCxxiBxHIxRt1WCYfPFIOns0BVopY=;
        b=oKbSwYr5XeL2o1tSg9PJt5zF+UXXfnKWzWXF1ezIfobosfZP4NM7r22TLR9F/qeqo4
         VXMgIlvG52W3B63zSYhNoKgHjRaxSctZtCFNLf3UcYhsjHusHfp9wk5gaoVSMxXGvC2w
         KXTg+V9qoaNS0vkn70XrQtkPazagcMNegAnVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580514; x=1793185314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=duI09lSyFIyXgjuCxxiBxHIxRt1WCYfPFIOns0BVopY=;
        b=1tH9VO+8O92lnpE1nBPr482gYhJfxWzD6ez2/3ihWB95sw5hf7sb993mPuZxP1xlJK
         nnf0ijZMkEf3XdgK1o4Rr2evQQRN+F0JvOsA/4qcVqd8iuJuliruIdMykkUIMhdMYQji
         C5s9Ug2HO8mzlourMBEDnuHpfU9HyQzwBZqqrGXwVX3D8LNYz8GVbVeMaBAvQK/Iz4xW
         oXYeuL4ltszN2th0cwYiQWRnqjDvbX3HL6/wOam2WOblF07YlBQKMCloRS3diI6ozCub
         SlXi0NR4D5/LnV1dhoWdNn0AoVMcxLVEkJ/XpJTQ525MG37RJm1hrcXFCASuErA2Ux0Y
         28jA==
X-Gm-Message-State: AFq9FYIZFnXPUemOZHw9puO86KU7PvKoZYGpugVZyA3EZ8GthUD2/RF3
	rC0hPU/kxOJ7bpFQUzoxTwsDIA0vb4CAeVMfXNp/mwsZlafwI3fbqVXrcbMysaG8i/1hz9HMCiY
	mdqLq
X-Gm-Gg: AYBFou0TuaSa4WplT/h4xv+GGFhK1IcHj/s6GFvVzsUCmxI288jZv/y6dWkpGfwDPQJ
	OAThVLNEsek5M0l5A5WlGaqtoj+2B2drAxHesAxCetHLDYLeVnM4yjS1QmCYWOQEaJND9M1UGNU
	F1XxnOPTDpOtyESIkOaXavPKrS4VPEl2x2Ik7X6P4kjqkxIWvNF2v4poGWF3yVOoMO6zL5aEQKr
	uUNJjawtTJUpt8fb4nhSWVfEAHGgCpYisf1eUaNWJ4YAsxOzx5CEsJDyQ+/9kSFm4UNuc9R8xVj
	fcgadWK0EhyHlizaat8Unn4RnrjkKxFy0Cq1VDjYttdwdtHlX4ZUxLWwrkz04bCR0EWkPBnHza4
	sNin7BmedgybAC0pfz3XsXuTj4TROYzvIfcIuCEHH1mX0IUJ5r/sMi8JYWeiciOSvOJCHyIxZWR
	hdr3q1NbEIcAFjL4C3n/HmYLOUC3fSy6T1Wd7jfgDzLL9ncDT7mRQSfIvtp2BtGHeSdTNrHa7oR
	ZvEbI9lD0Yu10Vir/snupD1YdXEOvQ5iE/jxXAvvxg1PnTCg8HN4jOBSUIwd5Eg9OhXbHHLTdN+
	7AUYJYCHZdyhvNnxqM9uI5hIR4ng6aTHxK7+3lbYsVw8xXTqfWcSrafmvNb5BABKRwIr7+vmTN+
	UvEv2
X-Received: by 2002:a17:907:60cf:b0:c3f:d8f2:f08e with SMTP id a640c23a62f3a-c46799f0243mr154803066b.44.1792580512853;
        Wed, 21 Oct 2026 04:01:52 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 26/36] python3-luma-oled: Upgrade 3.15.0 -> 3.16.0
Date: Wed, 21 Oct 2026 14:00:50 +0300
Message-ID: <20261021110103.1943456-26-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131286
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.16.0:

- Add support for SSD1363
- Remove deprecation notice in framebuffer mixin
- Make page_address_offset configurable for SH1106 displays

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-luma-oled_3.15.0.bb => python3-luma-oled_3.16.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.15.0.bb => python3-luma-oled_3.16.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.16.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.16.0.bb
index c4d347419e..2606cdd4eb 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.16.0.bb
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "16925fe668f484803df0683add800b19e5dd7316a1d64eb06ec2ae817473901e"
+SRC_URI[sha256sum] = "9e5df928b11c4622872d0da25dd90186ca5e4c1cf1c01b562e7cda86f877f437"
 
 RDEPENDS:${PN} += " \
 	python3-luma-core \
-- 
2.47.3

