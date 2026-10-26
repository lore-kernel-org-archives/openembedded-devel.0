Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7935.1793057207931450589
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cwgm+w/j;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-156cbe59524so2818114c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057207; x=1793662007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWENfJIWYpUJQxezFRk5UZdM4n+AEaWY0F/VBVlmliA=;
        b=cwgm+w/jiwW3KfFUzIgB+Vbw+uJbDvbDD4vJmsqM0gK2mFuuYATiPomgWc/ZlldOWK
         qXS+vUYWAGcU2crIkKsVSINI7HqWwlC1cNuAIE/iBkGzwUPWroF6Wfb3Z+xHz2uyPau2
         yDujNe3a70vkTcwz+/BcCan48sbMAtsYHBzbx4HftIBaz9gxVM3nlsF9dHwAgPEkCois
         3yFamtBEZGjHAvk37Bdy39yQHiXjBcpiSBz+9MvcuGKRbGPjHZhfiTOUoEdVX792Ji6k
         yhLAmm9198px+x3dK6JyM0zigyO0no3w5Unw2aKGu1pKeaVO57s/9OKZ1Bw2It1/X0rC
         Xe5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057207; x=1793662007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qWENfJIWYpUJQxezFRk5UZdM4n+AEaWY0F/VBVlmliA=;
        b=jxiz8+c7cmSiujvyLDNFe0lBOMxy1ryeefvKVt/crziONky3dPS5lASNmoQSL/Jx76
         1Jq2VOl87xwt0t14Fj9BjVwTt2ZlpwuFGxqoPG/8NXdARxGOQtpIbwUON6/6W8as4pxV
         V+UE0tDDXB8IA2aAOW20uEsKRZMh6nls7fQN0B87faCchF+7Iamt4sFhkdVIsZS9eLz9
         e9fXzYmIybbV+wC63VTIiQZa68gbht3w7A2s3bz+tBYiPFGYBmhnFKZsgpE1qwSDfZKu
         YaXUwWcYbNL2cbtFFXEczk2jdKWhiv/jieAqHw0QNqsao9Pijbpy9s/WQjvnsM4Fvv7k
         +vZQ==
X-Gm-Message-State: AFq9FYJ31IsnegxfLuIITOQSIYP9lGq8XNA1hXUH7F5CobJSv0gex7uL
	JwM2Gl9f/LYLd46oF96lBCgybdPUQGYpEIufz/Hg9fhu3dsUHuWQIAlLpjyqQQ==
X-Gm-Gg: AYBFou3MS/XxAihhpu7jY6zX5f/sOlNjDVFOv/ssKJsq3azLH51EJ0R3EKz2xkkQiIk
	NyAvLTioM8CfgvtKDlSq8Q7V4wY6c4J8haZXrVfBuHCz8RLy//Jpgh1XBejCVvCVLo8k4mNdbl8
	rjv8S7gxPVEzPAfsmV/gOlk254JibFYPReg4bj2sPHlW0c62hxYY0Gvvyn66D1lgmuUtgxiWPmN
	IPOJSmZKGqEBZXoZHGpoWN/jjBfdAoKFVJPMN2HXASUDhofnCom80tV5fBYn8ovMxOSTb6LNEDK
	Pwhx5MX1wRYIgmLMZY8MpMeg2+Z+QuMSJA+Ne83kiF2wcuNJlvwvRrDsoe25ue9vTQ+uk5uSx5x
	6HmwncaiOHRuImC5/l8F4hA4LCXLwqcl4zP4wxWLYaM39VwztpcZwc2PpnD4/0tK4pjvKAD2Hy2
	vXBiSyIhil7TKqbalLE2xP8IZmj4A6O+bG0BOTHk6G9VjPgJeorgES2EeTOOhuY4+SsOL3haHAr
	zp/jX/CPU1gWARIXx1aVUsi/eKc4ZdkbB/QjX1Xz3kD6z6zvJQKoZzWlFfUciy3dJMraYK1QmIp
	Fjdi6ntfQQaF
X-Received: by 2002:a05:701a:ca0b:b0:191:17d6:ccdf with SMTP id a92af1059eb24-19935905ba5mr12453653c88.8.1793057207027;
        Mon, 26 Oct 2026 16:26:47 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 8/13] iotop: upgrade 1.31 -> 1.33
Date: Tue, 27 Oct 2026 12:26:20 +1300
Message-ID: <20261026232625.1275411-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131448
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refer to changelog for behaviour changes and new features.

Changelog:
https://github.com/Tomas-M/iotop/releases#release-v1.33

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/iotop/{iotop_1.31.bb => iotop_1.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/iotop/{iotop_1.31.bb => iotop_1.33.bb} (93%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.31.bb b/meta-oe/recipes-extended/iotop/iotop_1.33.bb
similarity index 93%
rename from meta-oe/recipes-extended/iotop/iotop_1.31.bb
rename to meta-oe/recipes-extended/iotop/iotop_1.33.bb
index f37b5a5dd3..b39088df37 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.31.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.33.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26b36b714daebf72b11715ba73efbad4"
 DEPENDS = "ncurses"
 
 SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "57890d671ba69ebc4a619a1cfe7d76cdd3d836a8"
+SRCREV = "ef5088a660f0b112369fff7643b844fb1e98c2ea"
 
 
 inherit pkgconfig
