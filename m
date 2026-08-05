Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81462C56205
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:56:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37735.1785927385528148873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yc3U9pYz;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so10327895ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 03:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927385; x=1786532185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fvwqVb0NRZWdUDZsFC6QvKLasWt5QWWY34kcrTNrq30=;
        b=Yc3U9pYzcxknvi8mj9RaOy70MtEA/0E+H7eqUcW2qgIkmQVyrvqLrNjWO1eBtyWcjB
         q5qVpT7WVuTXWTk1LDKtoiJZnxJANQqREmw9565t4JsCIJrNUeQn+KWOQtrXCpe79WTd
         DDEEnHxC+NH1vGS0qi9iDd7/wFaNaxXt2uK0gJ2ZBNAc4earnHYO9oe7R4mUZjZ8QDwm
         ooj01QBRRukr3lL0k/5RGs8b/vUifw1Vh3frMtRA5Q79WusLSwafFVupA9QtNNvbZXc0
         L3UnK7NqxXQbCJi2l/v9nrtvf0JmL3KDXlU/1Mb08dJv6mFxrvVlR+/MywqKyiKvd5Mf
         Jpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927385; x=1786532185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fvwqVb0NRZWdUDZsFC6QvKLasWt5QWWY34kcrTNrq30=;
        b=JbCBOz95nzLNY59B1GM1VmMeuMYmLr39sEXw56vZLGG1z9HH2cx4C3N65KJkuAOwu7
         Yg1dZ+yVX3fJIc+oELWw7k3hRv8B1rpscIST9hpDoSKRU9FCH4lFZ+bABlNQygir53yy
         RFkQ1kyaOLJfrZHdh+Mc7TOxq7y6ioS9vhA3MehF96iRUkbhkzdLlUFnQ27X5jrlEP5X
         yjZfeC3ePRoJNxJeXM9XZiEIFvk8yBMCezH07Wz+Pv5iOODFA1NWWlvltZlOsOHG3le8
         q97NOnJHAfVYrq7sTQH32pbRzY79Yh0ugGEpHv0WWDCDK6/Lrh6hyGhJVtQDMG8vYlYK
         00uw==
X-Gm-Message-State: AOJu0YxGQNY+xk2yZgYMmx8n44cjxG3325CXaJULFpE1Cec61OyD9Vta
	UzXGAo75CLdMJSLzH/5lHmQicMGRtUW18yW784SElEAZLc6pMRek5K89PMjr2Q==
X-Gm-Gg: AR+sD12UlwtwaMTvsQhOKSClGZzzYAQCCJ4zPasJiuZ0Ya8dgNK9+oNuAxkgxheBwN6
	ea1Sz+K5rF3nwN5eGgxrPZbl7+wgRvSKYaDENnxix/VtOzh01Y82lvPfO9Dao9owCoiq/prmM9V
	UR+ivG58X4i9z8hLT+FqGNx1+6ugwLwTTRtt9jUk0ixRMBjZQNR20xP0ainsH/xndQCmitNJ7Tb
	GMmSlsWBgVP+mek0H6pEm0zoUQA/jMHtZ+esurVUcgL93bZzoA2bDa6zRFsv5FyVwHe4LkKO4F4
	Hrho/psy/yJeQ+VYLBYMGRy83biZTEx3fMYPX0sQI28VU2f+OjhoFWocH0sjh5rycffre6d91we
	N5zfhcYjTAlTKPOUizeIG1dOxh1Dl3rVVVT1Xgjb0Evm4ridNnYcdHTcNF/5XQu4W0159vVMfk6
	M9Tbo/zQPbEo2P6kN7LgPWooIeFapv78MFt8u0QtPecF+lGZDZcAZq3zOBDqnm9TIGwKekkXTWc
	Q==
X-Received: by 2002:a17:903:3b84:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2d0ca712d68mr72286375ad.2.1785927384926;
        Wed, 05 Aug 2026 03:56:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm16407166eec.24.2026.08.05.03.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:56:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 3/8] libdvdcss: upgrade 1.5.0 -> 1.6.0
Date: Wed,  5 Aug 2026 22:56:06 +1200
Message-ID: <20260805105612.1648951-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
References: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128812

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://code.videolan.org/videolan/libdvdcss/blob/1.6.0/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../vlc/{libdvdcss_1.5.0.bb => libdvdcss_1.6.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/vlc/{libdvdcss_1.5.0.bb => libdvdcss_1.6.0.bb} (85%)

diff --git a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.5.0.bb b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.6.0.bb
similarity index 85%
rename from meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.5.0.bb
rename to meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.6.0.bb
index 4ea679a208..4c1d0f4fc7 100644
--- a/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.5.0.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/libdvdcss_1.6.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-${PV}.tar.xz"
-SRC_URI[sha256sum] = "529463e4d1befef82e5c6e470db7661a2db0343e092a2fb0d6c037cab8a5c399"
+SRC_URI[sha256sum] = "7ea556c846b7bfc32d47b41cae56d1863a6b6d5f706bb162778d6f298490977c"
 
 inherit meson pkgconfig manpages
 

