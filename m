Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23238.1794814552488864468
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=VnhUzgSD;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b467581b98so24617905e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814551; x=1795419351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zEJWfLA8ibJWNZPrQ34STZsoaDLoB3UltXcJ0QJ7zlM=;
        b=VnhUzgSDlWlUttMbAQwwS6cevRyXRhiXaLX+bNm7WNSyHgc490o+XB35QYwYmBI7dU
         v7uHT6vDVZqL9vFYkmmt9SiiME0PXKRLwKtoyYS5h+8r7Dy/d6+d2AKRQjdiwVzcwR9z
         CTNAdBrZ7LF7RNTw6eIHGI5eSsk1ajuKwaTSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814551; x=1795419351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zEJWfLA8ibJWNZPrQ34STZsoaDLoB3UltXcJ0QJ7zlM=;
        b=xMfDvqJl9SELgfF4ezm3+cc1dh4AwKbaddEz/Sgn2K1O0FjEtGY/PSifd1FZQ9BH6/
         nA5qZRT7uwWdsJQ7UWBOv2k2T9ybtfehhd6wsyp+EJjQCJPb1n7mxY9GQzsT/TEA76I8
         33EJDfbN3IEZV0pZfebAWergkIbVQE8TPfVKmdu2coMj1X3mPytHNHmfrvFaekxoKNxq
         2nmUJ79cjdvXbeI+vUgb3vYagjFxkFa5TxT6teLWiTI43KWEIb3Xo6vAf1bRQquNWmj2
         iv3iIP1R3ygF+XMjKgdOJNefGWODj4rMPBl3Ux+sP0H0unPPolqY2eCRWrm9/ymi9xaD
         Iq1g==
X-Gm-Message-State: APuU4Z+hvXeHIpUcJpQYaYDhsrKWt63gFyNjDSgyDHwcIgpKj/G2c28o
	Tqy6pRGZ7NC0GFD42vEo1hB8gQ9NkOT8+gNQ3sE0eiBaiWVlE0QxVNdZEsGsGYxV0BwySgTPtKj
	kr7rj
X-Gm-Gg: AYBFou2U0iBS2ES7dLB31zKL8CtJ8flASmbFD6HFSEVpH44l7+2dO1iuT0rbgl7V0pe
	AiBYkd9JHZrli1cQkZadrsJAuS6B5JiBy9qUQP39Kk5BbB5a/QjSsXWbckn8dto291wZjhRHwxO
	B3TyZoARwdiHW/aHyS4zbaZvHhlgwPRZqFyDGoV06OiuHZ5KDo+bTrd+8UUafvH+FqQp/2pKXHq
	qTo81iKhlQmBM96shpnCfSocRPdfnFM4FbHC4IeC0aTGDlAeP7DKS70wikWZ1p+JN+Cp6TAjoG+
	nxX6OfoZ+bAlzxze5B8p3RO77Se9+P+yf2zAhi1KwTLpNjSqZfFHQFkbhtykfsSWBeCstgPykED
	lnsX+pGV44T3rg80CvHrOFXD0W2rQX/LSvCqYkKhuTdIK3MoULpTPYX+QD1wasxlyb4CeeyNIwj
	ZXMMThPwFhsWs0D2ThLKphjmhM2gPa4NFfy2t1otkwBysS38UdWHdmHpKsibJSGcsc5G41sKaxV
	EzmQLD6NsMI6ZRfbkdkHfUDIHN1jDx66vi4p1tNXTNPXtKQlIMAVf57f99SXxnMBuj0hHttuOcm
	91a+++4ExhrMnJelZqEmvMglBg9xiztib5JeNRAoaiIgojYlr39J/sxUc3WDxxob8ncrbx8YNmQ
	jbNNljMY5yi9BXeE1+boeXUjLTY335aTcK0Nh65ktCH/QScOPNmladkSBH1JT996BVPrhFun94r
	k=
X-Received: by 2002:a05:600c:3494:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb6c71c232mr63761405e9.6.1794814550824;
        Sun, 15 Nov 2026 23:35:50 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:50 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 19/24] python3-stevedore: Upgrade 5.9.1 -> 5.10.0
Date: Mon, 16 Nov 2026 09:35:26 +0200
Message-ID: <20261116073532.880420-19-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132447
Content-Type: text/plain; charset="utf-8"

Upgrade to release 5.10.0:

- reno: Update master for unmaintained/2025.1
- Write the entry point cache atomically
- doc: Remove tested python versions
- Simplify coverage command options
- Do not generate bytecode in tests
- Reuse test commands in cover target
- Add cover target
- Ensure recursive detection of package files
- Replace repository link
- Update master for stable/2026.2
- docs: Add example for dispatch managers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-stevedore_5.9.1.bb => python3-stevedore_5.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.9.1.bb => python3-stevedore_5.10.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.9.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.10.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.9.1.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.10.0.bb
index 7355edc349..8f4a305084 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "e97a2667923efda926e8713fde6a73616df68210a3cbc6f02b48967b676fd8bf"
+SRC_URI[sha256sum] = "6005f32c09dc3159802a61c04862770e439e32db22f6da78ba56e8a735466882"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.47.3

