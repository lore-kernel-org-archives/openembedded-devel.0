Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20.1794324469076863821
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=A8srKCUD;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso16828005e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324467; x=1794929267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqfVf7zKIZN00k+il8GvGTc3SQDQvDCZIm1UXDsZ5c8=;
        b=A8srKCUD3TterZeLHUY5glOLYnkIU9hdwFWCBevut0z1abKt1ILhD73YzEnnXVVD7S
         /xu+udn5AMhqSM8/PmKI7ZSWWdaeRr33PvgW9JoySJvX5LLW6anzCLKCbEwPe+b7U8uj
         bUoGRERd1pocgjp73DpMXeSs3wq3LxB1KMTuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324467; x=1794929267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqfVf7zKIZN00k+il8GvGTc3SQDQvDCZIm1UXDsZ5c8=;
        b=AsBJsLpLIFfQmegzTeFjnmm6GXYLMiGZQq2a2RLY4e0Rdn58vehQAsxPwUQTH7Ch9q
         PC8bO8jN1PsxP7di4Db00pStLmT3hrXV15XHAY9xp2h3MSyDcU07WPkfg2BUmkUkgcCx
         3J/3A6CcGjfUQyPQrw/u156Ae8dju7OOdaPo0AYHe0njzBuFImn/tg4m//JEPdqljBZa
         qfi+ykU6gcfRQjAuxfNKzX2pON4FfgBetFcyCPIUlJtN1KLDvRaStpDm8AO/MEFcaILt
         hwnt8CAEbTrbiQmiJujkWC+ZpN4d0MszbIu0W615oVVe6D+wOhyA6hniuK/PauKHXO73
         4yfA==
X-Gm-Message-State: APuU4Z/z49MaaNWnqF9u5isKhivOZiUz23bp2kyPMMrigJ6niMTyKmum
	+7iCndX71UC9M/RJQev5/ZCrTGOoztrapAARe4kIC0ScPT1zt9O6MBLEWGn6viq8o+zjk8d7N84
	T9B+C
X-Gm-Gg: AYBFou1Yy+va8HER1FEp1MVkH7MO9lp4htJED9x7QHFiSL4VhODDq/aGGPwaM61Mtdm
	jQeveP/YLzdLUvKYut7GvD+d1tktwuMCZTKLAnp0ffmnismf9bH/9kddBSBbbWDgMN0WM58TaQV
	xLSuL4P9cQSZ5wDckr+7+BPR3sbZzOvAcSWUpxqEzv35TysWKI4/7DOTrc7lhvdFYRrN0fY46Lk
	DDFsKQ36p340vL8kSK8tTG42divM/Dq+f1dgtRz2Iy/ZPb5HRs1Ia3kcJGwO7lfQIbbbqUjSkTj
	tu3cwhcT225L19++GN/6aP9jhQ6SNPc+NqkHNVDqkw2s0ah8qjAQ5hbgOVIe0tLJkpH+jDlNfPe
	DRsXUeAAX1HxdMSlbg0fG9uJjd4ibcm99vdgoMcl4db7NiU2ZW+G+MNeE7Y+c5msL9lqRylmwRL
	YhtWsUz4CXj/DRkKnVKmZYKfB8JhIObTNC74+aZl4BcN2XlFXYyGFvw9B0f/JNSyM81e0vr/dsf
	mtuYKBtLz8eA9EEg8tZi+VLTAC0fosquS0LxXD2VaNTd6puvXekHQC6ToLQkw10dvmat9cxNzKy
	6h/MIerLgJVUW/N8aXCy5zTDpF8KwjohKaQpF8IKxs3O3HnYpnWxG3GTQR5jFUqRRb69/LVaann
	TH+FvsA0I5e+dl/QtoOXDzTZ/RtoLUFdoHJolrxeGX5xw3Vl0CGvfeg==
X-Received: by 2002:a05:600c:3b85:b0:4a1:fb23:68f0 with SMTP id 5b1f17b1804b1-4ba0230c856mr65708765e9.3.1794324467264;
        Tue, 10 Nov 2026 07:27:47 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 16/19] python3-telnetlib3: Upgrade 5.0.1 -> 5.0.2
Date: Tue, 10 Nov 2026 17:27:26 +0200
Message-ID: <20261110152729.1065911-16-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132090
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.0.2:

- fixes of decoding in read() functions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-telnetlib3_5.0.1.bb => python3-telnetlib3_5.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-telnetlib3_5.0.1.bb => python3-telnetlib3_5.0.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.1.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-telnetlib3_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-telnetlib3_5.0.2.bb
index 2642f08c88..bfa49f14d5 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jquast/telnetlib3"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15abe157ad6f0b483975cc34bcc1aa99"
 
-SRC_URI[sha256sum] = "6fde197ffb71cf26ad27fe2c88694d8364f4b1cc962a37762e0cf7e79b9afaed"
+SRC_URI[sha256sum] = "30bee6ccbacc5c7540ae1a4fb990809eb81993d98900597c0795a5d1ad45e40f"
 
 
 inherit pypi python_setuptools_build_meta python_hatchling
-- 
2.47.3

