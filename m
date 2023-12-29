Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006EDC4707B
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:50 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.155473.1703876566954965320
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=imfFmeTK;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5e7467eb93aso45847607b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876566; x=1704481366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4mhP/OP/4NcIU90mh8o08mYbzVC5hUUJ0Qg8zJa5RA=;
        b=imfFmeTKr+UiG1Z8PPmPc4+nPhcpW29Abf9TEVq1zWnXoQJ+l3dLA9qDBR53tmGWao
         VcI0mDjfdiDLmZH+cSQJdp0UgCvyVZb2p4cw6ZCM4uhd6yIhCKfRs0gaFXOkA1hF9Khc
         6rwttxBbQuPRvqlG8JWCBtKH7QCLhQDKUCm32QLfXp55FnMZeQAp+BdEg+Xpp2oR7/hb
         e4gYEgzdgK8M/x/fFrCcwxP2ZxjrXS0BeRalK5y4yjC1W0CNliKAFN6biiEu8qiYamBC
         RhMGMXe/bEcm0nFnHuG7brTWFi0Fpas7hbc4wsBOZ5IeMb8HHw6Kf6bkqRsa1Atw9HcZ
         OCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876566; x=1704481366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4mhP/OP/4NcIU90mh8o08mYbzVC5hUUJ0Qg8zJa5RA=;
        b=CozDJp+4rZgGDjRFmIxkYMfJnBaoNCFDQiBEv0Tm6a0WyZWlSinv20URhfEVFkMggc
         CFa0c9brk3MDmg61osHhaZqP+QgD1lI/12wcVwtuCCrgr1PyBRz/7Abp2cF6pYNKw3Uj
         qdl2v8VobdNwzRlVou74Y7REPSr3ycQaUIc6G8TJ9FCVOmIiEyQiJRNlwYKwt3WQjwwl
         lUol2fsVYxdpI4gS54Q5F6H4ucMS7tv8afQpALEPrOWfwYeEKE4XT4tSoR/Jzqlxzlnp
         xMOj1fOy1cqJrVLbnK9QdIH0bHGoW+Av7hPn5Jb01/uwRcdiLGuWmN/NIuZg/0EiaZe7
         5lxw==
X-Gm-Message-State: AOJu0YwCsVvVVXUso0jWGskItGegfJiiRAlhfoG7gZF4EIEr6yoZ3Q0M
	t7+EF7N2Vx7I/7AtGl8mDN4BsBN3/IplbQ==
X-Google-Smtp-Source: AGHT+IEVBHP7TYYgd+62rdZaLO6dLl+pv4K3HBH8bjg2TnUR91YdtweP/N4L+vjHOBhDMZ+qsKVxvQ==
X-Received: by 2002:a0d:ec48:0:b0:5ef:4a7d:2426 with SMTP id r8-20020a0dec48000000b005ef4a7d2426mr1230013ywn.31.1703876565982;
        Fri, 29 Dec 2023 11:02:45 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 13/17] geos: Fix packaging
Date: Fri, 29 Dec 2023 14:02:26 -0500
Message-Id: <20231229190230.135480-14-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107895

From: Zoltán Böszörményi <zboszor@gmail.com>

Due to the library file name change, the subpackage "geoslib"
does not get generated, and the main geos package has unsatisfied
dependencies.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 405ee461078cfed493bd6ca06f922860be5081d0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-navigation/geos/geos_3.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
index 95cb29775a..0382e6bdfe 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.12.0.bb
@@ -13,7 +13,7 @@ inherit cmake pkgconfig binconfig
 PACKAGES =+ "geoslib ${PN}-c1"
 
 DESCRIPTION:${PN}lib = "Geometry engine for Geographic Information Systems - C++ Library"
-FILES:${PN}lib += "${libdir}/libgeos-${PV}.so"
+FILES:${PN}lib += "${libdir}/libgeos.so.*"
 
 DESCRIPTION:${PN}-c1 = "Geometry engine for Geographic Information Systems - C Library"
 FILES:${PN}-c1 += "${libdir}/libgeos_c.so.*"
-- 
2.34.1


