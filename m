Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF0BE77188
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 17:11:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.110766.1734541873671872354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Dec 2024 09:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WlsjNoub;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so878531a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Dec 2024 09:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734541873; x=1735146673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbQvVkH/58QDutZ21LsLW6k1apHzV+h4r+aBRshzTIM=;
        b=WlsjNoubXy1+DFtzBBQJt3eKhr+qf2WYa3Q3KJsQ11Ijh4dB+gTBG4KEJuvnqFx6lH
         b69m34Nf/18ouPDp7U4ohYF5BMOUFbyVlJbC0LDU8mTFtwMnEDr2eIJ6ThINAJ/5F77c
         Y5MrD73z7MTa6U7VuxD1eXf1Jf7aYzpgUcO98c7PsEhw4hYTKi9LAjxuC2S3ByLXn2LA
         7ermQvn2vftjcy6JzxRsnU7Q4fPdceW/p768bq3aN5cyYGOQ7KQ5q+KY/k6MF2sDjId4
         ymC+nZ0F2c4tGUgWQszayi55/OyibuYgGgsLgxpoUjFUIKevcifc6J1viCIdl2UwYutY
         e+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734541873; x=1735146673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbQvVkH/58QDutZ21LsLW6k1apHzV+h4r+aBRshzTIM=;
        b=J73hy7hzqleBrr1111/vNiy88XZxOy/U9UgvY7Xcg1XtIn6BJPS1GzENrJVONHX/Oc
         nmA2XgSw/EnkPmvGx5aY6Zr282jx0mcxm7X70sA02GNzx6/ZHaj2Sddb7aItw8bWWcve
         CtSt7/vHztyfKRRXuT7a5EiFHlycxA7IH5q0kp+q2lisJv6SDosc7jJmBM3Mk7q9/oNA
         BxLOkT9jjSHlqc8yvEa6JyzRVARsPjpYcHKrf/7P1e/m9Zw1enxfNNueT1ZFloU5fluB
         3RRX65ScAmXbLx2qj2nrQLVHh7vxpMorHOKiuHE0gyLdtlYNRaXTgfd+nz3aCzaL9CdN
         xODA==
X-Gm-Message-State: AOJu0YzXalvHCb+UrVG8LJeBHRbhAH5zKWK8F1zqOD+g9ae30QmqwQhq
	ewesMLEZo/Mo9VZgxGLDDaEftnG7AaRIba/U7OJj8JZjkO4Nxy4GNCXpMkkz
X-Gm-Gg: ASbGncuQ5wpUoMea2Jci1sjML7BJ9BP5CiC/5Cv8ht/sKWC5j5h4MbkHgkKMURgs8T0
	IWHwptXB6fnLeRkV2I2Htd/VLWzlOAW4gYNcS2SW6sSkEWgAqgXaTT1UEhsqcB3VJRfIcgIuakZ
	PzPwoK91MwgtfDwt71LNfU49NR5LjX6QCjXrdhc46WaBPSu3cr0QjTpduRqgVlJK3A+ak8DdEbb
	Lc2pcsgEmp3wyCPRP7671XVcu5oulf6vgw8QoGkVgkrlr7wLW9Q2jRuydE=
X-Google-Smtp-Source: AGHT+IERZ0lFZ7ULnNZWs4vHMvc8932+f1da/eiOF61QRomBvFas4BQPxi9oMEMabGZJi95lnawMmg==
X-Received: by 2002:a17:90b:3a4c:b0:2ee:cbd0:4910 with SMTP id 98e67ed59e1d1-2f443553188mr104355a91.1.1734541872882;
        Wed, 18 Dec 2024 09:11:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::5877])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee06dd77sm1816697a91.33.2024.12.18.09.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 09:11:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] libpeas: Disable lua support on architectures without luajit port
Date: Wed, 18 Dec 2024 09:11:09 -0800
Message-ID: <20241218171110.680112-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Dec 2024 17:11:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114374

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb b/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb
index 8c7d364765..557831da6e 100644
--- a/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb
+++ b/meta-gnome/recipes-gnome/libpeas/libpeas_2.0.5.bb
@@ -11,6 +11,11 @@ SRC_URI += "file://disable-lgi-check.patch"
 SRC_URI[archive.sha256sum] = "376f2f73d731b54e13ddbab1d91b6382cf6a980524def44df62add15489de6dd"
 
 PACKAGECONFIG ?= "python3 gjs lua51 ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection', 'vala', '', d)}"
+PACKAGECONFIG:remove:riscv32 = "lua51"
+PACKAGECONFIG:remove:riscv64 = "lua51"
+PACKAGECONFIG:remove:powerpc64 = "lua51"
+PACKAGECONFIG:remove:powerpc64le = "lua51"
+
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject,python3-pygobject"
 PACKAGECONFIG[gjs] = "-Dgjs=true,-Dgjs=false,gjs mozjs-128"
 PACKAGECONFIG[lua51] = "-Dlua51=true,-Dlua51=false,luajit luajit-native,lua-lgi"

