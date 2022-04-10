Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33F2C38A2B
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.21959.1649623492170426189
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=PnhwqP18;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id h14so18249628lfl.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/Nz6ku2DO1SiLgCoTpHcTHsdnYcKJPmQaubuKKphXk=;
        b=PnhwqP18UJMxuxmthqx3J/wqogsgM8O8wA1hQrBu1cPW7uXb7Uba61cLTrUArrZaL6
         Z6JZGccjxsA7GWYC60OnN/CfBQ4I4HOA346DbAxuj01EF5+R4VKGQP9Yzl3zpG0ZjO87
         k0nRoxBNOZaPAVNOHIst9rVgXGRkzdVP8klCGDV3nCcCjy/FvnCIQbH83CGn3moqO9vv
         co/39QaMc4LdZuRrf7I48WJM2iSOEhghrfLbFzVG6d16h/WmS2PfkvL/XKrjwRcBXYZs
         fhbkatHq4I+TVxBZAr54RSV7+sAV7IddBh635+zV2IUkn9AlRuTvOH8uLh0KOsHsJ0rm
         gcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M/Nz6ku2DO1SiLgCoTpHcTHsdnYcKJPmQaubuKKphXk=;
        b=aQBLYuf9qOOc/4S95NeHUXONhtTqMF1c9tVhVdHkgZ5IvTs47HBFaKqfQktrnF21G7
         CJapXPpT9MC+HNiuIJvoyC1SEc5gut1ED+KpBTHi93IINLG6Euu1+hzL5beLbWx08d9Z
         3WzgmnL/pu9E/Ou1GTta18qohFwzqKXPLeCFL006nM3nQALV1CPASznwXclH6SwLAXsS
         WnsZT3nBbZQ90EN+XVlyyKjvjbImfiVGNuXpUWGE4vDD5MOJnCnj79xNXphqVjIVMwAi
         joXkS1LrhM4foIrznY/bkMJ5K6aOSMnhLXvslGLUoJa3z/0azxVR81XEc7PGbmOYzuu+
         rRAg==
X-Gm-Message-State: AOAM532X2FXGZsAcyT4cU9mv3mp5iWpTkZWand2Hvofhho2F97HBcmuA
	EgBjFFa4yzs2qv3rleJ/V9+BIe/AauxaBR/r
X-Google-Smtp-Source: 
 ABdhPJwAlBrO9lu8lPxUfT0/DIAQmQnsu1LPItehha05kN0Q4/JjzUUFufNP8JOdzrQXp7R/GV90aw==
X-Received: by 2002:a05:6512:220b:b0:44a:58c3:71b with SMTP id
 h11-20020a056512220b00b0044a58c3071bmr20067234lfu.280.1649623489998;
        Sun, 10 Apr 2022 13:44:49 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 s22-20020a195e16000000b00464f9daf7f0sm1045453lfb.277.2022.04.10.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:44:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-flask-login: update to 0.6.0
Date: Sun, 10 Apr 2022 22:44:47 +0200
Message-Id: <20220410204447.4047666-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96530

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...thon3-flask-login_0.5.0.bb => python3-flask-login_0.6.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-login_0.5.0.bb => python3-flask-login_0.6.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.6.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-login_0.6.0.bb
index b03929104..dd295cf2d 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.0.bb
@@ -6,8 +6,7 @@ HOMEPAGE = " https://github.com/maxcountryman/flask-login"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 
-SRC_URI[md5sum] = "a2d94aa6ae935345ebc68eb3cbb5fccd"
-SRC_URI[sha256sum] = "6d33aef15b5bcead780acc339464aae8a6e28f13c90d8b1cf9de8b549d1c0b4b"
+SRC_URI[sha256sum] = "aa84fcfb4c3cf09ca58c08e816b7bce73f1349ba1cf13d00d8dffc5872d5fcf6"
 
 PYPI_PACKAGE = "Flask-Login"
 
-- 
2.25.1


