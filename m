Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4CEC982FD
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:34:15 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.743.1790224450974303533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Nb8/WKM3;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f204f6so829406b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224450; x=1790829250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sziH8+UsrCrq7HRSzs0iSTQTQXRGh5t9uyqdZUe91VI=;
        b=Nb8/WKM3y32usA06VdHcWWwKhwrWgNhk94z/L5xNxBdC55vskRxsiCig8PfHnb+AE5
         d7IAtS16da8z+QZXIulNl/l4StFqDMvWAMEIFNbSxIx0nsPHHy/Ldejatosat//Jib70
         iG2JdaeyTytaVWxbVXBbC674aTwTVZZo4yW8L9lBC3id2of94nFDOLI2qBvplvmz7IV1
         uGxSMBbxCC39xdgiZSP5I9nXAmHUn5b4LvKbwYa5S+nGCRiDaTAMYUbVmB+NJKUm4ssh
         Dw+G3wvSyN1CU/DPPhvdlDvVvfxz30+hTVXejLIWQIHBlmaTJSX7AOWanwmjq/q+RhcK
         yrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224450; x=1790829250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sziH8+UsrCrq7HRSzs0iSTQTQXRGh5t9uyqdZUe91VI=;
        b=Du5JDnqoXquBR2Z9z/AOdVbLVTndhDACN59daYhrDwxRwfW9/aRrG+oS7vmQoBYLHH
         QtALesVFBu6z4gh2i5+bC0Ef14zEQrrSo+pYRlWBUb0ABzONfI1MUEk4POwuafbKb02i
         0YhCFYBN9UlIwHEB00xe+rjG9OUoiyeRBuepAlYXr74PjaS4J1kcf2n5Wcjewcymcit5
         jzCdMXIBD4959zbHzuz6y5aPifEajy+JJOb44ANX4WyuqE/dG+yXgTgFoLJ5M5Gva+5L
         oZSRL6QFzpSfef0DJmSnNhu67aj+Xw3kHVW6A3K23Mprk17UN0OCSgxVhDlatUnuCBD8
         q61w==
X-Gm-Message-State: AFuF++lua0t9gy+uI71YGKMcNERJgFU1P9oJtoGckIEsr4swn0e+El1p
	zRCDsFPPjYmFGSf2nDvzOwT3YtplP5IXHKIAW4ivPLLJ+V+i/iQ/Um19jVZW3Q==
X-Gm-Gg: AYBFou3tG1ZYB+++t58x3OcTlEXG0s97qBw4RiaNhFhn/1EGCh5RXv/654EMIOdcjWz
	VPYv74d2b3WN/GF5OTNwbzakIyo5S1xz8QWSQiyZWwRCIt2r4c9qJx9pOLgYrmVvHBI7gZSBM5B
	upDJNxMw6TrQUO5pm05/yOYhAxGKJgd1uwns7oDmAr0PwtQKNGbxpu91+hhp6cdgyf3oKMlmlrW
	84GU/93T8m5GsLdzk6XCtxQ/sbpSaJsD8/oU8R8RdtcPJvx2RaEJ1EbQy9wUY8u9wmk/tjZEnDW
	VpSuI9uiqMgpy2G4RLetrzOgb6NsYRtT/8TVUbs7woH0wgM3nZAdeKY3PH6DYX/w8UNmMpTtIIj
	LVl40XP0vfoIZQR5OLQI55Hvv2hi9LMXXc7W4ng+TlaLvYZdIy+PxEXK7PJqZ7GRVik0BcEuvPT
	Fx+x6goTyvZQTmejeNiU2FsahlGZVbCLwSnktyB7E5bwiEpS2MBUPUW90iz4QLwLWprclSFeple
	phaDLaw2w+yubV94eKUr9SGwa9q+JA04w==
X-Received: by 2002:a05:6a00:2d99:b0:874:708d:b61f with SMTP id d2e1a72fcca58-87e9b69f768mr985148b3a.29.1790224450278;
        Wed, 23 Sep 2026 21:34:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:34:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 23/24] valkey: upgrade 9.0.5 -> 9.0.6
Date: Thu, 24 Sep 2026 16:33:13 +1200
Message-ID: <20260924043315.1663186-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130271

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/valkey-io/valkey/releases/tag/9.0.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../valkey/{valkey_9.0.5.bb => valkey_9.0.6.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.5.bb => valkey_9.0.6.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.5.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.6.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.5.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.6.bb
index d7ce19ce72..7b20612130 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.5.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.6.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=$
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "a253513ac7ff5790ca119053f3c7fbca4fdaad44"
+SRCREV = "a100149d56208209c03f8af9840afe2efa7fb8d1"
 
 RPROVIDES:${PN} = "virtual-redis"
 

