Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997A7D75BA1
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 02:08:39 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.1561.1732154915858887322
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 18:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hMNy6I90;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-723f37dd76cso437939b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 18:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154915; x=1732759715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYlyu2OGrnuCzGjAUVdOm8qWGcAviM/rAz8UG6FX9m0=;
        b=hMNy6I90e4YJtQRL8cNWyPviKYCGmLSfptIZj+C9KApDWUeFSoi2dqhxKUBdEX7+2z
         McKl5KXj7rvjkKLol0+QYlINtyQBGCHw1/iIcRzcdqRO7yNCZ/PDrPWQFKqhP0aPZeA0
         9omWS9wGS36sGrndBPPMflyDDt5S464kxYUb7tslD0NFgMdd+n2ub8y6W0riWC9uOTj3
         859Z+78I9+sIJcMi6uv8XhRceTiQlFJvzyITl5Yue3b/xea086Fwrb0UEVBp71M4LQVW
         XT5HUnU3ow6TnEyfbLubCisJ/PLX+dPuq6eD47SZtrqSPXYR19mSonlxZk+Q0OUXUqXm
         Noxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154915; x=1732759715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYlyu2OGrnuCzGjAUVdOm8qWGcAviM/rAz8UG6FX9m0=;
        b=chDyPN3QPIWRTgJlzX7Gd2NfwgEr+hI7s37iJfBfi0BiI95mUWdzMoWH7MpN9xihw5
         W7T6LQJLT+mz5947nbERI5yKaeROCsbm3rmMw/8ej2FpVzJj+wMYQ7w6q7QHf0r8Fzb6
         xA1qnf/O8OeLwyrCVQ6AA6RP8rxT/p6Mav+RPY86awnVHSHxI0ZNhgXInIlLzzIV0OuV
         k6ZbFrSXRZqttiPBWlEn7DOJbSYlCDH2ez7jaGZqa6Zkko7H4eE2WyKyicCJUJ2B5WCC
         duIiRHlXvdhz4JJnWcNbYIpjIY9R0fOrLWOoCc2gA0yoCQgGTptLw+NNOlM/n/5TGswp
         p4XQ==
X-Gm-Message-State: AOJu0Yx6KkR6MFEcmz6ZWz8JTiqAVGw0cs4Wt+2MSIu9LtCU2uENLmau
	aQ3cF6sKTN+6czYS9UI4VQQGdz2RTHI83BPuJWVJI9ZZPIne4Db0Bq0Lzw==
X-Google-Smtp-Source: AGHT+IFiI5t/K9b/cMJzAc2d0LmzA7I0cpUTf3xcCIOUdHpMLNBYeGEU3clcTgRqM7PRTFnxIv88sw==
X-Received: by 2002:a05:6a00:1783:b0:71e:db72:3c87 with SMTP id d2e1a72fcca58-724bed27a8bmr7647453b3a.20.1732154914666;
        Wed, 20 Nov 2024 18:08:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beef75e1sm2397550b3a.41.2024.11.20.18.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:08:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/5] python3-werkzeug: Upgrade to 3.1.3
Date: Wed, 20 Nov 2024 18:08:28 -0800
Message-ID: <20241121020831.884684-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121020831.884684-1-raj.khem@gmail.com>
References: <20241121020831.884684-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 02:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113946

https://github.com/pallets/werkzeug/releases/tag/3.1.0
https://github.com/pallets/werkzeug/releases/tag/3.1.1
https://github.com/pallets/werkzeug/releases/tag/3.1.2
https://github.com/pallets/werkzeug/releases/tag/3.1.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-werkzeug_3.0.6.bb => python3-werkzeug_3.1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.6.bb => python3-werkzeug_3.1.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.3.bb
index 5758830cb9..73029eccc7 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.3.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "a8dd59d4de28ca70471a34cba79bed5f7ef2e036a76b3ab0835474246eb41f8d"
+SRC_URI[sha256sum] = "60723ce945c19328679790e3282cc758aa4a6040e4bb330f53d30fa546d44746"
 
 inherit pypi python_flit_core
 

