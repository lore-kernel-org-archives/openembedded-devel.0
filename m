Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADE7D3C911
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 14:16:53 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16654.1765376210447871445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 06:16:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICahGo7x;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b75e366866so3037302b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765376210; x=1765981010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPyss7oSP19t1/BdwhRT2ZhOaVZAq0KD7Lg/+ZwSg84=;
        b=ICahGo7xER42BiZmgXuCAZ2/Wp9veSO34IV3x/Y8fuE8VDpfA7bH92Fu7P3pAZn8nZ
         qWtjqfBfhNfj5yJJclCtYNN47zbLkVvY/pVbqgUwK4jMQFKyUZvOnH/TVana4guB5GYB
         TPy6dtzPRMysOOIGEoucSCcGUSTG1QfaPNj0CTlc1cTaEpS5hReyWb+IfhY/4tWexmMC
         yFaJeDMHFJWg952pekQXz5qnlsDlS3xrG2azu44mpDAr1NJWOZZ2wm4JuYP0/XTGbQEG
         fJIJn3wy39J8rUAutR3DC6qoLukFJ7W+dwzra77WBu625xoZXnJ2D8fd1tNcyqM77XKb
         Qi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765376210; x=1765981010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPyss7oSP19t1/BdwhRT2ZhOaVZAq0KD7Lg/+ZwSg84=;
        b=FksvCZeWpSs2p5+N3cIo+0Q+yl284eB7jns266yv/hrVnmmQEalpChqC3521Xfwn+X
         OtpEIFkl1FAXfYH7tpxA4sbXVGDHX4Pv0IlZz/1qgyzbfpDvtyeM1+2+vyuiF0byk7IB
         gtHedvP4/adI/DXbDX885h53N3LNQu3Pp8ROAjtlwWYXLi1mRvFgHjOI8OpOmyyVDSs8
         WzWHQOMG3R1jaOJeC2l4Jzjwi76UdwJcz1gvqNab6SAuCK2IqVWi/kA7mX2QlIeVlb1x
         xos2UB299/IPNv7K3kycYyi2hKpPqHg1jJoLW3PvtHLBuRXBeLSEJIBbEJDbMbplx6Fu
         qZ+Q==
X-Gm-Message-State: AOJu0YxhsdZuCUvlCUNq8begaPxNVib8AuLkrQY3qJ0wuXAs/vWRJuAS
	8N4TQX8VWTFGzWYG25ua0tRuqgm38FsxmUApUtOS7oePMrBD+MQMoXXf5yxReA==
X-Gm-Gg: ASbGncu6cdhBoWkGoUOECSOdZPZeFuZ1Z8o/mcHNiEmyK4Lv0fRAxASOoEopV3Gffo9
	xY+2A9jN0TXrYaxywEM97b5isYlPAF4JCBcHpiEZsJdm/rH9kkUf47++PNyd5GMT1EAdupIAKCX
	tFMsnD7PxANWI+Nb18NId+odJsX+009hwwCeVDSBB26slkZYXEfzXWq+SlJoI1XSbBqX2uCZMpW
	qp+QkmDc+LUz5YbaJC9HLzgWPxHOWGONzfcDdc+EHzdZYo3q22ywkcDtqdzY3pT94H2MzrYIGcU
	dAzv2BgAZFCb5Hx5na98x5Gf8daL0n3VXeUX8KCmn7pI76RgBRFQndejcC6INSivSTq/z2l1Gh2
	2IuwaapGqm0tquS8oIRTYUrmi87yEiH6cB+8qlp5Feg1fhez1P+1fuFI1yayuOiUDyUnKqSEDb4
	e582BX9FYcEINnw7z8xavfswEJzou58yEB1w==
X-Google-Smtp-Source: AGHT+IHsQcvN69N7W1XE40e4INjunIGgHjOjdB/yHDsJt3491U9HnYd3izoStjcBjRQYuIN24+XToQ==
X-Received: by 2002:a05:6a20:748b:b0:360:b941:9907 with SMTP id adf61e73a8af0-366e07dabd1mr2818808637.24.1765376209462;
        Wed, 10 Dec 2025 06:16:49 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bfa0ad20207sm15955166a12.11.2025.12.10.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 06:16:49 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 2/7] fcgi: upgrade 2.4.6 -> 2.4.7
Date: Wed, 10 Dec 2025 19:46:34 +0530
Message-ID: <20251210141639.1397030-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
References: <20251210141639.1397030-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 14:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122550

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 39f1d58d2bdc189b65f7752122490c37898a52d8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/fcgi/{fcgi_2.4.6.bb => fcgi_2.4.7.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-support/fcgi/{fcgi_2.4.6.bb => fcgi_2.4.7.bb} (87%)

diff --git a/meta-webserver/recipes-support/fcgi/fcgi_2.4.6.bb b/meta-webserver/recipes-support/fcgi/fcgi_2.4.7.bb
similarity index 87%
rename from meta-webserver/recipes-support/fcgi/fcgi_2.4.6.bb
rename to meta-webserver/recipes-support/fcgi/fcgi_2.4.7.bb
index 691274578d..1e8ad9e496 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_2.4.6.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_2.4.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.fastcgi.com"
 LICENSE = "OML"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3aacac3a647af6e7e31f181cda0a06a"
 
-SRCREV = "1ad48735cdf86d918936b53739348356daaa486d"
+SRCREV = "47f2c03b7771f0ef61d887734ef91e6fa747f837"
 
 SRC_URI = "git://github.com/FastCGI-Archives/fcgi2.git;protocol=https;branch=master;tag=${PV} \
           "

