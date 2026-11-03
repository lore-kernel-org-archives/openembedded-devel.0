Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1467.1793731018361384769
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 10:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mqbd4Jeq;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3550c917fd3so6197840eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731018; x=1794335818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lS8UdBoNilMZ4KQVMGCCZW5EiVhEUS7SbEpTjGioFZ8=;
        b=mqbd4JeqjIMLOoi7X5X46mXDnDMa5iRdkA83M9hNFIkcfxi7aVF75KsXvjhJ2gAznv
         05SRqyX8ArAGVmNWbY3pD7PYd6m/kkYTousr8NTTrLx64aA6U7TBs7NJd3KuZxKiDEuX
         Z/LPUDd/5+cdo1xEdSh/AirqqpE6lr9aCbJv2MY07VONikU8mXyCU5yFayjon2IrQ96f
         unSf4fQDQ0N4vypncP8aq231q1meeyFH0AC7aR0UtwLve/74kucYXZ28wAXJ0tQ9LBMM
         J9jUX/h7xmCc6+OWeXrqlNrj84ywMYyvsMpwvMLuZiomF1enUmyM3WvCc37GxdGEElFT
         ZGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731018; x=1794335818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lS8UdBoNilMZ4KQVMGCCZW5EiVhEUS7SbEpTjGioFZ8=;
        b=HLnYKgwfQFK6CbuzIZHnzJTVkZOGV82G7dIAhaTytxHYu7dkhvThSjQcrhBBH25rYh
         WoJ3XkO7eP3S5ro2+8u5DZAF9Wedc17tapnT7czgEB4a7nmaXgAzakHjVRNLLvULUBxp
         +Jn4fxNAji95Jaf8ijbX6AbrnVYfwjnFpeLKI+I0ncjSz9TBlXqzYdorYxxpFhdIsBhn
         m/Cz4svhLxGIzi4gRnQoNluulfJyN+UuwpsJkXFooarYvNro0mA2BpQg3dih6FEE/XwW
         sczBAed9vsLDn46e4OnAHz5GNPXr+MMCcbFGL4vz6J4HCZ2XY3ur580pakuGHuppXPXy
         gX8g==
X-Gm-Message-State: APuU4Z9915AMyM9UKTQxe6J02ixLkgMfA19TkblodnH+CUqigTRT6rV/
	4SuX1UuH6/g095izVAirszHhvZLUZfTZLj+0rs3W9Dw4km3is/Y8gtMorCXYtA==
X-Gm-Gg: AYBFou0VeWEfbm3AiD0Db6OaMptBYG9xdmRw4althINWOjlGx0hJ0hhngDLh6dN6zXV
	UG9HD29O45+geospaLPCjwTQPmpkBbmvHqMWPnvSraXVOvFwdodyFkHM8++wHq8RYZJXkxa9NwD
	9R2M42pl3+5ZlElpblQ3TWCqGMXKF9WR14a8preyEd6ysQkAtHaNHfsWIG2cL2hNIgRotC8HiwC
	dHKLXz1oPIL+itaUET5HYrwQk5FMlediAPGlLag9UpeI1LKKKzU0RMvvqgQB0ZmjgnGJnaiXlJb
	daxEIFXAWyiYTIFYa/HOorq++T/cdapFGkzuFmCa/CmMWcDewGfl4Q31JETfM7ABlO15z/iHiUq
	5ehs0qbGeMZZUuGVMBTNCRGHtFdEcPeIdZfFfqszgla/4QLcEe8ps3QNwRUJanSh5nqp6HuOXe+
	BshFbIHJ9R3rMD4SxCacI5urMwxnzUlah88ygfiwq2O+1K6b/CCIMEr6+QgYRkxgVdmAWBb4+rt
	rltzxDpSYB8ykJzTPOAiwdSA7sY3xx3TbYe0VpHhFiOG4iAfQcRxo6Jo9Zk6c+C5jLtgQtGVxB8
	ZjKzPldobULy0J331Ckgs6K44TvLG/Gby6jfxjlze0pY9zyHigNFrhPC4lc3qA==
X-Received: by 2002:a05:701b:4194:20b0:136:b50c:c0e9 with SMTP id a92af1059eb24-1ac5ae39645mr21057757c88.21.1793731017655;
        Tue, 03 Nov 2026 10:36:57 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4f83fsm1192887c88.17.2026.11.03.10.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:36:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 6/20] nghttp3: upgrade 1.18.0 -> 1.19.0
Date: Wed,  4 Nov 2026 07:36:26 +1300
Message-ID: <20261103183640.919438-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
References: <20261103183640.919438-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 18:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131804
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ngtcp2/nghttp3/releases/tag/v1.19.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nghttp3/{nghttp3_1.18.0.bb => nghttp3_1.19.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/nghttp3/{nghttp3_1.18.0.bb => nghttp3_1.19.0.bb} (93%)

diff --git a/meta-networking/recipes-protocols/nghttp3/nghttp3_1.18.0.bb b/meta-networking/recipes-protocols/nghttp3/nghttp3_1.19.0.bb
similarity index 93%
rename from meta-networking/recipes-protocols/nghttp3/nghttp3_1.18.0.bb
rename to meta-networking/recipes-protocols/nghttp3/nghttp3_1.19.0.bb
index a0d1b97d93..e39a05a755 100644
--- a/meta-networking/recipes-protocols/nghttp3/nghttp3_1.18.0.bb
+++ b/meta-networking/recipes-protocols/nghttp3/nghttp3_1.19.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/ngtcp2/nghttp3;protocol=https;branch=main;tag=v${PV}
            git://github.com/ngtcp2/sfparse;protocol=https;branch=main;name=sfparse;subdir=${S}/lib/sfparse \
 "
 
-SRCREV_nghttp3 = "dbfc24286138cb0b6490160e7ca87fe1ce6722a0"
+SRCREV_nghttp3 = "dc83309ca5fd2beb91cc5c030a2d30525e9f2a00"
 SRCREV_munit = "11e8e3466b2d6a8bdfd4b05a3d1ee7805c5d3442"
 SRCREV_sfparse = "4b313cfd2e1b389ae632b36dcd50402307289af2"
 
