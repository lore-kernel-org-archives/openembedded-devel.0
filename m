Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA8DC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 07:10:37 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.3705.1637133035535171232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 23:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Pp/+HX3X;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id f18so4669812lfv.6
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 23:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=luW+lcFZKM81uSFYE20M8F1ZVz1pBS8NLdGVjA3PYWY=;
        b=Pp/+HX3XFhGn4tXCBVNlM3Tg7XIkbbK7G8Be8OqX0MV/KIjep3r43rSUOjiRZ6p2N4
         C4iSR1PAjhmzm3AzZEAZDQpi3yzeuwKQolnWMNhKxXJF8DCpIl6siv/LPumzrfzlOctW
         L6qDO3dHX2p5RUeQ53BB6ThSeg/iDxcK4GE1A6TfJ/vdFfqRk79Bmhlc5bhznyWqyPi2
         tDjt19YqW1SFz2FrmbKfocDig6KZfjmmvZ6JFzdXwuCrYmNvLlIoJPEsqXkLIzmliYKZ
         5YiCuVQsa2xr24di+2npB8a64Vrr8jD9vc+qrFCi9z7cAruhzSmQu18qhN7ieKWPU0KN
         gcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=luW+lcFZKM81uSFYE20M8F1ZVz1pBS8NLdGVjA3PYWY=;
        b=rRcJBtdDlHQJf+wIgIHxiEHKBOGrPLYKwG5RbK0EiEgcdE7mLEHASEnd3a/WQ5YMN3
         FpAsvRUVS/zluYyT7QUbiAvcxxgt04v/+AzLyuuNyWqKJqmbXy1AdLSJdPqXrpUMFQL0
         pXcZbJwLbA3HkxEb8Qb9BJ9jFOJISM3NnY5+ZTKYviFkH2JSTqBAUnvSBabTew+7bfVr
         /Yfo/M2jFTMgetb61YNa6OOeYF8eQgQ7FlWhkfU0lFYi+VjpaJT7FqTrPfvXrkxi5kty
         Cz0ZH1HUUAGHaDGUguFeIa6qHCN0YD8zOGeqdMFdY63Ocbt+u5hYefhYhwQvA3dJ6gSj
         /UQA==
X-Gm-Message-State: AOAM532+XLklJgIyG2KBhuBMZueIOai60U8n/m2FD3EKIa0arf0IjXmi
	pNPiOB+GOvQlxcZgtqEL07Wvy1QUvrZY0w==
X-Google-Smtp-Source: 
 ABdhPJygrPy2NLW/3qLoUWXC5A1l9hhqudJhpL6gG9bu8DuXjWPjohwTtT2alH7R1RXMdRJ4zz07eg==
X-Received: by 2002:a05:6512:32ca:: with SMTP id
 f10mr13639022lfg.364.1637133033936;
        Tue, 16 Nov 2021 23:10:33 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 bq3sm2025322lfb.173.2021.11.16.23.10.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 23:10:33 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH 2/2] jikes: Avoid append override together with +=
 operator
Date: Wed, 17 Nov 2021 08:09:58 +0100
Message-Id: <20211117070958.64782-2-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211117070958.64782-1-jacob.kroon@gmail.com>
References: <20211117070958.64782-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 07:10:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93987

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/jikes/jikes_1.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jikes/jikes_1.22.bb b/recipes-core/jikes/jikes_1.22.bb
index 5e6e470..3e83ff8 100644
--- a/recipes-core/jikes/jikes_1.22.bb
+++ b/recipes-core/jikes/jikes_1.22.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN}:class-native = ""
 EXTRA_OECONF = "--disable-fp-emulation --enable-source15"
 
 # configure script incorrectly defines these when cross compiling for ARM
-CXXFLAGS:append:arm += "-UHAVE_64BIT_TYPES -DWORDS_BIGENDIAN=1"
+CXXFLAGS:append:arm = " -UHAVE_64BIT_TYPES -DWORDS_BIGENDIAN=1"
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install

