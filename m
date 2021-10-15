Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E578EC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 23:01:51 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.4377.1634338911189100690
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=lVYHfkIJ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id u21so44600687lff.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 16:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7O31fypelRyudWkbRFk2VU/gwI9kWImKHspe4BCTug=;
        b=lVYHfkIJ/16EFuGLTh0Ggeieq4YMTptN0rh7LNgK21+LYwylZLA9/hFY1N9v9JTYCA
         iSOq2US7PXXgmf/6h7rIO5oNKwEkYwoiOhfAACmQAatQmOQ7egH7U7b53zQ8YJNU3NgK
         dGx7DWp3uHstAm0z5UY7ZzNwuqlCZcx0qSeUzqjEqMiBLb6WHDbNPuotyq3YQwSbqZNC
         y0hkZWytoPYlDGYedx/3yAlcDKM8V9XCSwJ+5XFLMeeN1PlEUqm8iVjPmORUA3VCa2Un
         rfS9rNT8jKp7d6R87kT6inW2CcZK6RtK9qY/qnS5hxYiNOSv8QvPRNm8TIDmq8wB6+7B
         abVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7O31fypelRyudWkbRFk2VU/gwI9kWImKHspe4BCTug=;
        b=E5nCK8FmVscVpVQTGAB9f65RfcemCt1EbkVfmI0Fjg5qmgqgbiuZqRt3ljvThJCcVV
         6P5nPY3+/Nued4277/VLWyVNq6ded/nYUfLuqqFw1lXyAfBfv81NLeJr9y4vmBFDkvyF
         X4tHEGyvv6EHRvfANjREpUbfJsY9szpJfKGEZnR2naKP6GIXh41fpw9S9hpbVJMcIvQj
         0rXoyLn2fTuGVLbeHYcON/ZvJQsXq9mnk64k1zITgkkprLntqxsBCd/tnoJV5SYy3/bQ
         UI43d6RiI3Nvx92AyQubQTB1qTJFQAeVpjf9ArJJkpcPlPwVYpwciqWViLoqyrFPyqLH
         TLrQ==
X-Gm-Message-State: AOAM531ZekZ1x4AusSBRxbrAtjYFzFhhVEVKP+jPQ/Yn/c/nUuzExpqg
	NejVIVXvArNcLYbp/x5BeFJlPZ3sM4pF9Obp
X-Google-Smtp-Source: 
 ABdhPJze4kggKTuSssszg8Oca9NZ3vzJsHcDxEBTk5n756XeP5kTPFjnQfqSon6ejFgOXjEs4KhctQ==
X-Received: by 2002:a2e:7819:: with SMTP id
 t25mr15431260ljc.213.1634338909276;
        Fri, 15 Oct 2021 16:01:49 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 p18sm703110ljc.114.2021.10.15.16.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 16:01:48 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-elementpath: update to 2.3.2
Date: Sat, 16 Oct 2021 01:01:47 +0200
Message-Id: <20211015230147.4165485-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 23:01:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93377

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-elementpath_2.2.3.bb => python3-elementpath_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.2.3.bb => python3-elementpath_2.3.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.2.3.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.3.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.3.2.bb
index 1801fc26b..4c94d9378 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "60139b91ef9646e27381fd62b8c38f1fc8ebc78dc4bc231c08c51240062e58e6"
+SRC_URI[sha256sum] = "392f32a5efdf15c14f3f56ef8422364f8b0a74a12f51a66d9c903c172fe3594b"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.25.1


