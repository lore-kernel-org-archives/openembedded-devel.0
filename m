Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23239.1794814553268164191
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 23:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KdrbEI2x;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so32943965e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 23:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794814551; x=1795419351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tToWDALefZWRiaY4M8g7r3T9B/FmYdO1hy7RqMMybv0=;
        b=KdrbEI2xCnt/TB8Hv7rUttP/30NH/xFIMT8rar0XHowvUozW4+Ta7alqaec7Tbp+de
         +2a8eWDY02gveQcfFRs2gsx7oiV6Sf2tZGt1dkg+H4jHMUx5ag6/fZmvejJT5ybb3UA3
         Uz84ciRPW++yXneAXa4+5JAJDR7eMQFgyaPuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814551; x=1795419351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tToWDALefZWRiaY4M8g7r3T9B/FmYdO1hy7RqMMybv0=;
        b=061uvsgucSkqrn1vME3gTZimwEiIi2PKDFWNKHvu7ycw/Mf1f3YUkIg86ByI/GN8eY
         BnaiVAglGAXUBBaeI9ZnUtbaxH1Q902mi3YLcXo3cSF63pXmdgTQULYbUIc1ekVjsjro
         jWswwQCtm+fxlMB4sy8ym4yjYe6scVJQPYgN515SBSowT8w/FWj+SdMqXPlisb1ZTNsL
         NDxtOjmakak+QUOLyV5e/sXJkglAHUgQ6pyVIcJ/+43paalNicSwCj81EKfmlISzGyxd
         e0MLOF2iMcZjs9EHA0nGika+YH8x88oxNXiEMH163s4s1PXKzvRCBhS2tCe8wDn5ekuw
         Al/Q==
X-Gm-Message-State: APuU4Z8SK+Lw5CGquN6k6WuZecmkrHOuTBvh9fXnEc6S7yZY5T+9APLJ
	186xRVpwqSD2wFP736ToaKmSeQ0u5rk4JksBgyWl+VnCYH+pac+OTq/1Fcdprs7ZleR/X22UZyD
	T/ieI
X-Gm-Gg: AYBFou1ISfmQxHHIkFge0mMCExA/zADLLAXYSD3bZO/rtfsvqTVgpFmOGu/QPlE62zJ
	WGXpm9QqzNq3XQJyznVEmkQH9YFlnhtMNTziMXdPPyDVc2q+aFOKqSQhCd/P7xxA4qFeTM1oKKg
	SNRJ4mSlDID9lRyQdbknh637KoLtTHntRMqYUYm83Yz35S+Xmh1P1smN4g2AtYpmdzVn4cqSyEi
	0xx2V5loIErFirST0thFCIkU2puarvcusNTiwggLCRhMz5rwE3zsj97ftvRM/ryMFJWVLRIvRFO
	nxbYQxo7PrUPbXzvIeyTUJM3Jz1BTRPxE9j3wGLDbFCBsEVdCfB+CzWWvz6g3nmSzibFMp24gUy
	bKmivZQz4/SRvd8SDpkKANYxJENqbwVfVl1sZl3wh3r9JkP5nH4u2tIu7p0MnDNhjsiL3MtK/nO
	kGmd0gqKCnSK6+P87nOdhsb4wEMVtUHDkkdPpGw6DQ+I9+eEFjDOhjKalM4li0ck0MZecjdRKKd
	uvYEYhRkQ6eRVIeK5cSUFQiPQmL5jiVLW1SJPsljYuWjSgGLopIEcJk40R5LkEWtk1aSPXeNUri
	RKz2YDnBXPe+FmDkVViz9sl0mh/82afrSNzkBovcPEq5vqWdddIiKkoBIpNcnrrvW4cpRiu4DJb
	L1eROOJadK4XEwd7GdVLFaWz8LkPBpyJ0GpNmMEBW7TW4e7bFI0XpHw==
X-Received: by 2002:a05:600c:840c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb5599bda8mr211777685e9.0.1794814551622;
        Sun, 15 Nov 2026 23:35:51 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm289781975e9.10.2026.11.15.23.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:35:51 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 20/24] python3-texttable: Upgrade 1.7.2 -> 1.7.3
Date: Mon, 16 Nov 2026 09:35:27 +0200
Message-ID: <20261116073532.880420-20-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261116073532.880420-1-leon.anavi@konsulko.com>
References: <20261116073532.880420-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 07:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132448
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.7.3:

- Preserve precision of integer strings in integer columns

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-texttable_1.7.2.bb => python3-texttable_1.7.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-texttable_1.7.2.bb => python3-texttable_1.7.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-texttable_1.7.2.bb b/meta-python/recipes-devtools/python/python3-texttable_1.7.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-texttable_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-texttable_1.7.3.bb
index 6815554d00..b892ca6876 100644
--- a/meta-python/recipes-devtools/python/python3-texttable_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-texttable_1.7.3.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7a97cdac2d9679ffdcfef3dc036d24f6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "dc16ea6b35fbf5291ba6ef79d79e37d9b3ca6acd7bae3ca3450488d7c2e19c99"
+SRC_URI[sha256sum] = "ff99aa7562c6cbcd0982cb6fae9145126b19878182496cdc46b8d6816721c5da"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

