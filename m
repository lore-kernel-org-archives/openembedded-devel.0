Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14851.1793092871915482036
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ONB/wif6;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so540022f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092870; x=1793697670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibBq09MXQ1Vstp0JQmpimUoChQKb4f7uQG4l13PjkD8=;
        b=ONB/wif6vumGmJ3vSvFQbUumHcFqH8+ubPKc91ZNNueiq2c1DrLHtd25b0zLjV/lqa
         Hy+d3T1vfAyqViMJJDOrFhDfctgBoQ+Kbkm5BPvUC6O/79slFAJMbgSBHY11IdF8nyTD
         XpsER4pIsRKkFwmdYVhyaOwoyxD3BpXr0CPX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092870; x=1793697670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibBq09MXQ1Vstp0JQmpimUoChQKb4f7uQG4l13PjkD8=;
        b=iCBOkD9pQ9D6PBDQUCKvkxI84LRsQFugUKDtUEneTuwFXW0Lav+PnDVHMt6l/8FEzp
         n/jNVdKj/hUFzNutVfaRRzsBL5SCdDYZz3LEEkryI6ytVrHcxjniTZbIQXbhjHpf3v70
         fc4gLGhD5CIK/63oTh6QIKipblTmNKaOly9WMnPjM9DqVIJr2UAVXEumtkCxFX6U/KWl
         PQQPhe21cyNdq3v3xIJyMZMJrJtkkU1eiJHiu845oekjsStOlsOVC8qHhCwPssGAIcim
         aA/sVC6WzykAB0Fn/WZsSHygXBqQKlmjVurnNi0p3rvYGsyiIZ0fQ3lfrwvOlKzp+Xzi
         mlUw==
X-Gm-Message-State: AFq9FYIfYNu0WEjb7rGXxhAO9K4VKNZM4x6OxgFyTPsYm0zMEYpjbKfo
	9GgBNepXhG+iV6ucCmlp7CzsEmwUGIYumuqZ9V1h/QIIVK2XTdb56/vfGrJPzahBN71TXob0Foy
	bem9u
X-Gm-Gg: AYBFou30ZY111aiDSca+CS0Lq9zs90NGIZGFPWYFR6r0ICTP0EnW+dHK769Yevpmtnc
	nawlKCxpgT46r7CoVGL9q/sR+q7LcCtu2WpDe+luV3dmJyng89P/u+ufnQ4614XBpUry8s/2lfM
	5iXLLnjKYlyBa0Es7mjMcb0DXtTqrJkdTj50OeFdvtCkpORqSIjRibIpz1o8E9ZcJs/DlmiSeG2
	vZx2A+nUb+S8YvUwB4KlEYKeI3CCMyXq5J7IzBf+HSyBBk80jzRgpn47m7RPBXJn10pkNBEewXQ
	llA1/oYQdGFmf7NF+KW/Ejav98biNkFL1BUZ6cpkIQ+A831eIV5a4/azmIu60FqcKpdueWF/P5t
	W9cei4N6/yJN8v85MfpstFASGgk5AA/jq3JGUNxIn/NKO6Jz81MMP21dAwjbvL5VMN5fJdM3dPF
	5IhFuM/SsI1rdUisS6HfNNDe1z65bkL+4bH0Ua1DHAAEKekfwAapHJS/OxYoH+XLzJD1bluGtFW
	8PQLfyxcWOGSE+3ku/f2l8SjaRjgMhNuK0GDcyglrAh0p0VbPqpRA+T0EGd1biUPUOESYrVYmSd
	A3nsJenbNZBWb6jn5HosMaP5c/W6UwBCLxXg/XM1naoUN/uz6Odvm2ZzCW0d8kPn3+CW1ap8NhG
	/riBkNz6vdzrMccJl/tGhWB0fiQ==
X-Received: by 2002:a05:600c:4e01:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4a7c16c4554mr43348385e9.12.1793092870143;
        Tue, 27 Oct 2026 02:21:10 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:09 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 34/61] python3-reportlab: Upgrade 5.0.1 -> 5.1.0
Date: Tue, 27 Oct 2026 11:20:01 +0200
Message-ID: <20261027092028.782979-34-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131498
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.1.0:

- Allow for bool values in rl_config.py
- Fix some file issues and download afmfer in setup.py
- Special case ListFloables in PTOContainer
- Require 3.10 at least (3.9 is now EOL)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-reportlab_5.0.1.bb => python3-reportlab_5.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-reportlab_5.0.1.bb => python3-reportlab_5.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_5.0.1.bb b/meta-python/recipes-devtools/python/python3-reportlab_5.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-reportlab_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-reportlab_5.1.0.bb
index 07d0467696..367c9527cc 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_5.1.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
-SRC_URI[sha256sum] = "ebd13154be1c8515e665de70bd2d303ae9ddc3ef47e44afd5116441ca0283a26"
+SRC_URI[sha256sum] = "6878200464527e87672d19e9f7cfc6bb890e3a6931e74ac6a1a8d1754aa55671"
 
 CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
-- 
2.47.3

