Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6641.1793913802275835547
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qZT48VFb;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso44183c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793913802; x=1794518602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wu64f+fIPEqDX7N2tuAJghxYWBq+Kh019JW4Y+0CK1Q=;
        b=qZT48VFbm+JcsIj2iIF0iDoa4ieRjCpzeoojh+o+ORFH8rXoikvFT03fIV8cul27CF
         4Ndltul7sUOhaH5wDMq8H/vjq5gpiDICcKblLe0ujnsiMp/xv7Y7p1s5SCE2qyphr6yL
         N168npcUa2kYdNxtCLGp5ulbYNT2iOP/cwUDYeC29tQRC4oRVVHoh1I3W/82qGJ4UFVk
         r2ewVglobon1hAPFsr/gCPfC+5XObE7uHI0L2X9s6f0q0pElmD/IzKVTe7hhbBQgWS+l
         pDBpWG6q/Ug0Ima4ZGNoWdl3KlhyzOxeaj+/D8D9o0gUXNEihmJEbXn3dhgmuEUV3vci
         Fgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793913802; x=1794518602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wu64f+fIPEqDX7N2tuAJghxYWBq+Kh019JW4Y+0CK1Q=;
        b=k8ad+aGZEU0Zjq15WH2cLjO+dc+0uImUZ1zlRoiz2l8ve5WdBMx+z6gch5NQtJwe4c
         qu/OK9PKcC21+jtVaDamdPrXsR0eVvBX0gtREfQRm1t50b7UrnoCobaapVxtkf/l9b9+
         pcJdl3gD3CtliemxuYR+IR6xT8AbGubTr2iMW9QbCAt2FYMb/mOzBjbiVcoXsdt5mbKn
         XZfvqCBAkZUXaUKGNkAVCROidLMm1n3v6f5ozskZ99PK7Jw/y87Fd6KyOZQ/saVIX2Mf
         NqEpdoxr0ai591KXm+bi2kuOddNlbDR+tQS3APsAyLdmqnU5f86tXnR0o8ENJp4zeitS
         MXuw==
X-Gm-Message-State: APuU4Z8PVJWvPUT1eukchNg+1WepoD6LL/GZaEzHVmlFOYUCse7htuRy
	z4Gu0DIs5pOhq7wXQL7z/wUX7Y/ZOdnBnGmyuV5du8oe+PZyqKhieF6DmXhUpw==
X-Gm-Gg: AYBFou3RzxUaz+pHbMnzE/CDINF05jSD+U4VUP2d6rH78ES0qpuFZj8662FOYgfcQAw
	4GlAnB9spsvejviFlJT1Rm24oDKjmWjaP0ce5H7WW6v4k2SnvCoba3ev5ttaWEI6XJLKn5EI3G5
	k2/gVxH7ICnY4E9Ly3diIbksjK5/Ybodh/gMdHIP1PT92EbLo4BpyISghrwCs3VTgT37KlDLYdh
	NbI1QL1HGjLnrp0cTHOVPXfbC2X5+7QkJss1wQ4IJuM0652gt/Uvt1Mk9ClQtO9ffl9pQw7z8Sj
	67qnrJBN5IqJx2nJ/TXAizcsdjDcImB89pHSNIOCaG8xJfpOYRFcfyAnxqoLzp93Xi73zOzJxKo
	a63GEUSj4FACl/A2IUmjB2jKeYfXnxIz4pP2lRmDJ98+16X11jwoup49N2sJsaNkLbWor6/zQRY
	WZAHskjexCr0XrU2EybabsN2MzXrfqDsWamd8AxB7PBA//YmtkvTJFKNhlZn/kQdN81Lx1BgYEP
	dVVbz4xQusXCcT+SlZLlSuupOwrhr69OJrVF4uKj234bn718fF3fWYOvoPzMVJ+H7zDzMujbhuh
	C9TcTprg+uHrZL0mMAdfSwrA+RoOhwlvruYykCi71sAd1IWr8TrXtq7Vyye3rDfRuxh6Yg6tkwX
	ZoYlVYUU=
X-Received: by 2002:a05:701b:428c:20b0:151:2e62:fe8a with SMTP id a92af1059eb24-1b25d395b70mr301932c88.40.1793913801302;
        Thu, 05 Nov 2026 13:23:21 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f71a25da0sm1034059eec.24.2026.11.05.13.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 13:23:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 13/14] python3-django: upgrade 6.0.9 -> 6.0.10
Date: Fri,  6 Nov 2026 10:22:49 +1300
Message-ID: <20261105212250.490188-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
References: <20261105212250.490188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131950
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://docs.djangoproject.com/en/dev/releases/6.0.10/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_6.0.9.bb => python3-django_6.0.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.9.bb => python3-django_6.0.10.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.9.bb b/meta-python/recipes-devtools/python/python3-django_6.0.10.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-django_6.0.9.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.10.bb
index f4e29dc645..46b02a57ef 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.10.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8ce037c971f421cfb47d38c097ca233a8f6dd42d9e9501a37e02dd7d08c5cb3f"
+SRC_URI[sha256sum] = "6005d030df924f85088454c18bd35dcf082b058aa355ad3df520d8de9aef9f41"
 SRC_URI += "file://0001-Revert-Bumped-minimum-setuptools-version-to-83.patch"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
