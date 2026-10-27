Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14666.1793092870258982592
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=X6dRQPCj;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14663815e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092868; x=1793697668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfOgOanx5IjKUuzFoTAASZUeK0AabiNJTlzJhz8ODqs=;
        b=X6dRQPCjxXzcUShfflvkB8ny7Ep/bWsSiI4T0fRGAeXa7E8Vtz0L54UMuyQUqlSfxT
         TqPWheH1npf0DTS2F1Nr7LZtMIiRoBOEJgKh7XAZHJ1Djv/bMqAYKbYn7kDJQy6Yixrf
         gsAn7s1QKWSherwQ3qr8p7wGB2OOxf4b4Iwxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092868; x=1793697668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GfOgOanx5IjKUuzFoTAASZUeK0AabiNJTlzJhz8ODqs=;
        b=ZggaexAXgS30ANwJVeAtzLmlzD7KqyFVCPLxleuaJFj20l4jps2OY75ecoKIw0sVxF
         iF8MiiD1RmhCaLZxlYQrdR/KQ/T9pl7amnhqAxeypvzSxz++2IATONFrAIFf54Z2mmIw
         4UE4ZlqeceqtKLu6BVZTpzx+XL6tky6nvZRZjT/B1rq6dh3UgTptRD0oPOXnAVU7a4T0
         fB96Fg3/ortMz6h4lgY1PHN369u8yeuCnxxFFDcuDIL6dC+2lQfF/+nof09xc3TUgXNK
         j+9md6NneH2hTow8bCTDKMEZVkINk4EwiccTojQeEtRc2o3ZqzyELDfnZtNUKd1+ecjY
         kTrg==
X-Gm-Message-State: AFq9FYI89i9WGLoB8HrLnKdx6l84y291F4jo/+/UqVXY2ktfWsNYQuou
	yNcwMF2i3YBa4086qpzwRbGwkk8Kg4AXid9hWwm7zGIYUSnLOqbPcIehUXRZghjjDHVAWxt/CFA
	nCPto
X-Gm-Gg: AYBFou2DMC/xK/3lJV2s83UJtKeZ/5OWbx3NLFmEjuDpMncHX8CU0jQnu0kbFot08JU
	uqyjqVZxEJC1BEFq2uw22ZFjINcIRzMmeIsQu6NBl8HNUQ5j+BJlTZcrBacr5mm6UYCffmJz2av
	n8KV1Sxj4tFmOrfW2Yboz/IE6Kw5D2NIiOl0W/EqsOjbWDsS3su3nKgtRXkvD6lqPLq4rOJ6Aco
	wyJgEnSN8d2xPecai/DUhE1VCuzVAB2eypfmxsDbRqkVPmfLXvr+pwCgmTYp6WvZBm0cthjjVdz
	bHo6sNmWXEQO+utKZxnYoKw/gtBOIrf6UbMhFawOp2rp1/jIq73u02WSQmxDOl+tH1A0V/Uv4h0
	7d+s0ovwgTniV7mkn2z1A/LniPndJbKNeV0OFA+dRDeODPFkT4O+npDLYvAsKTc3/yJ02h+HLJv
	dTXBQ2EPWy9Ij+xnf6VmTkla0tjeeMwDkHrbNliw1+s5i9OIlpzhXrtejo92Sk72Mau+0s2kP7I
	AjEmC51r8i3NZdJ/CkuF81zwVvHulcxVD6r1dUM1epV1ULbVyiSonU2+S83POUC5d1qmp6I+f2C
	ZUTh6olxBQ8gegP2xMHQxKP3b3ub9ZQgVKKzVIRxx3PiOh7WpoVzr7bg3WpmB36GnS1NKKleX5Z
	fyI9Y
X-Received: by 2002:a05:600c:474a:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4a35ac91f2amr186468425e9.16.1793092868547;
        Tue, 27 Oct 2026 02:21:08 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:07 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 33/61] python3-regex: Upgrade 2026.8.31 -> 2026.9.29
Date: Tue, 27 Oct 2026 11:20:00 +0200
Message-ID: <20261027092028.782979-33-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131497
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.9.29:

- Updated to Unicode 18.0.0.
- Switched to using stdbool.h and stdint.h.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-regex_2026.8.31.bb => python3-regex_2026.9.29.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.8.31.bb => python3-regex_2026.9.29.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.8.31.bb b/meta-python/recipes-devtools/python/python3-regex_2026.9.29.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.8.31.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.9.29.bb
index 2889b14fd0..238ec46751 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.8.31.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.9.29.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9350fd448a6442ae27853ab9d4b8d5a0bcb6d7774923a4fdfddd104c4458b35f"
+SRC_URI[sha256sum] = "8b5fcc4771732191b2b7d1dd68d8f0353f47f8d90b6150f6dce58bf1112442cb"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.47.3

