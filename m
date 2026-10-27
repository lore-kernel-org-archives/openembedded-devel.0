Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14840.1793092855448996805
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=lrw0slt/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so26724165e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092854; x=1793697654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0Wo1ZXXVhXutSTCqxM4frj9pVl/aiTz5nTnmiGeBLk=;
        b=lrw0slt//71mNIrQSBfl+QS7LzHTeuTGFcr+6xlm2+1ytxQ+vVZE5UImYR1xpPiEvO
         vWLzCw8gERK9XVVvrQmGumj93yFAcSh9AK6UuNZ4BJ320YvkDBOyoONZmiINoTSRBKS8
         xTPVoO5fyqLD1ibEoxFfzqwQPfdcJz6WX2lGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092854; x=1793697654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0Wo1ZXXVhXutSTCqxM4frj9pVl/aiTz5nTnmiGeBLk=;
        b=wo/pInBsaryCQba4ZnuXbNKmJtxf9TzbzwuXBoR7geT0Ij9gVwTIuosRZZM/BVxImB
         bBgfIrJcvuQNtmUJxWqrWl9nIHUKpRuOOXrJ1MemUQyamctnFr01jaaTSu8n3KpkZOvy
         lWbvJSjN74rjlKFDih4msR5SLjzFt2qxYAR1b8HvB0pFUrITe3Sdwjej38pv7xPoZutV
         j7W4/IB2PdXNqlwLlQ1cN6I4YT7+EpbPr0Oe3GHfexTL+kY5bolOTEZt+ertee6i6nnb
         5d1FrHMdCSMBgvL/rglQZT+sOvVxkTllKqrXfHdh+Fh8ebCzvi9eepNZb39mXxI91rNf
         YTSA==
X-Gm-Message-State: AFq9FYKo55VB/RE0t1dJAesO3uDT/mO9TLtUrffssQqC9wAnz7Ys3T+I
	x8jdWDFgGxpEaYQyIUUmTPlYo2NpFw8oseZA3kiHna4ftMzKL8GsWLhdFp7Xria25YEuVY8r+Kf
	q6WRj
X-Gm-Gg: AYBFou2xdJ+2TU8wGKk3fMgiBa1xDMSqpGWLP47pRhdspGba6qzdpWLUqX5N2uj7dDg
	FobQlbVvLP4xrUPf9HUg1P7q3YZuhCIxwFhRk3a2XEloCwaHmOY7Zh0KW1+BVQrgSa9gqoP/UPX
	hO/dRoh5cyXQN3jlttbPLI9o5pRPOoJH2T7VLpDq8iB5hVanMjHI0q9H78wHuDxUGtxidW3+XCk
	YWxl4p/L0qvh/nRo5cip3bplVtXJg8dKlgbTJYhz0k7HCkFQsJ+iljdC3MOSnRggazPjkVLgN4E
	umgb+kmK4KiDkgwcUTCL8NSgH0IXHF77AZRfBY8D5PdQaeAAdJP4WXYbKQ5mnBM0t+GnCM1SZnk
	/YMx0HiWR/NfoRNO3q9c0ysfzzAJTknWADmd/zB/OBmkFBC/JfHdCO56aZIyq/TGH8yoDXwSTQy
	Iyka82Fi7Q/ekBvu2+mMOPZ8srf9yJ+fZKYjzsQDOVv2XiZipXdq6IEnKnRspIS5VbxpMEeH0JQ
	Tid2+QeLJzV0hIDzytgkGSY8TTv/AtHIi86MZSD4yl1er6Z5WGjMURuFGOavSv5Trnzxe/9Ak4u
	c7jlhPQo3QKEFaIjB0fQHfS8PTAWrKvmVT8nkqt2SEWkfUm7PRo5KI4kTulJjxPf+dq0B+ahyDq
	0UKbj
X-Received: by 2002:a05:600c:4f56:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4a5a5cae166mr146634985e9.30.1793092853742;
        Tue, 27 Oct 2026 02:20:53 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 20/61] python3-pyjwt: Upgrade 2.14.0 -> 2.15.1
Date: Tue, 27 Oct 2026 11:19:47 +0200
Message-ID: <20261027092028.782979-20-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131484
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.15.1:

- Accept trailing Base64URL = padding when decoding JWS segments,
  so tokens issued by AWS ALB and similar systems verify instead of
  raising DecodeError: Invalid crypto padding. Non-alphabet junk
  such as !!!! remains rejected

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyjwt_2.14.0.bb => python3-pyjwt_2.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.14.0.bb => python3-pyjwt_2.15.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.15.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.15.1.bb
index a2cb84587b..91de437404 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.15.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "77283c83fb56ecf566a886c757a714bc83668e38156de2cce8263302f42e0b86"
+SRC_URI[sha256sum] = "4f259e80cdfb6b3fc18a7de51fd1ef9ec79652f25019bae68975ca2468a34df8"
 
 CVE_PRODUCT = "pyjwt"
 
-- 
2.47.3

