Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C256C5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:58:33 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.35604.1749221908600396161
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hDOHAieK;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70e78e04e48so18255777b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749221907; x=1749826707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/awvXgNguwZpm8IC2cBB5hcdEbrsISot0HWyU8e+kXo=;
        b=hDOHAieKym0AHPkgFx2GRT3/jJiC5+A6Nnht+49oQXHvNCi1P77L0Ut5yFVNwhnF/N
         09L4oi01/NYN8iqohfIJ6uhGtPgYwZgiO5LxmDH/PKeLVk8ud1Oz2hm3zZrtZPt6Basx
         cJGJBN4xxCduhBBFGFkpd6q8bio2ABEpYmdk43X2Xi/dtqDx/tJExbP/64twbMJe+7gH
         IwF/x4yYiy1nlfk8GpN2G2Ca+XstT9MIBibrBveDXxKvUu47wblmeaZKFDzchuPZNrRD
         uenFQgGeAU1JbtqnHvCI9aqLu1uYDKfSKK66y1kAWcaK3x09vHtp6ilxdDx4lvkPRyG6
         pZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749221907; x=1749826707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/awvXgNguwZpm8IC2cBB5hcdEbrsISot0HWyU8e+kXo=;
        b=tqg4UgJ0qQ3Y2SMQlX2JdV19kJXQzabwi7A0yl2ZF3fH+Gpft8n0JqswFkDX9+Iy/q
         twoX/YZMlKCub5oDvE1PR0f4GpJ1/WZqVoBHiDfl3sGKlSHbpuZFKqxE+cVCyz1kZqh5
         v4bK1pBY1Op1uQVavf6KaMDic6LkjbLINSBdDnFUZawlvqJLs3Dd2MvZz0F9ZyjWiIz0
         ZzQWMwD2EiFOYBvySS0+4RVfROwkW1kUguZ262swINmMCTm95+dTvq2QXyi1jA7aDvZe
         dGUjunUKRsx7qNoWFUprL1kWYhhQf5TpYnWXQ2f3USgo39OFLXQG849iNyJqFyHON7v8
         KHIw==
X-Gm-Message-State: AOJu0Yxw9M8ds8X1dazK7MNJ8beCYJNfLJNzYlwoYo4w+k3HnAjbahhb
	RL4+FyV6fQMwz3ZuGgH2zDHf/adwuyWU2OzqkpGwKMzGwPZnIfvc15VOKoENgtop
X-Gm-Gg: ASbGncuN05rmov9/Q+oHqixzPYRM+0eV2DzCpwOQWmsZeNXmwzaPkf8JeONY7puSgsX
	3gI2UxLJBCQU4/DLrr+IQ2EIgR4qL3ifkYb7dO1ESAKyu7ySm0BBxo34BBPfYTiaZ1tPGwMueZT
	mNTxrPZLAy5bs66+Jb+uIvSo7wYAPc7Kl61sgTNKHvr2SKPXZhfFUUL1bon0BHJwfPhlL13nf+h
	dx6kTyRkQwJMKYiE50cQt3vDYJCr84dXA4LoT4kOhDQkDdU25boWcUmIwTAqkQ0p2rEYXbEgoR9
	Mkgft8QZ46JDf0nNCQlnGCatsmEKq773jH1+cmW5Mh4+za/+U012uYKu73tMxGwRb4Rg2/aHcNd
	mbDW4w3oZJA==
X-Google-Smtp-Source: AGHT+IHTX2jixxBDaxMIZYYo5VoeerEbq0ZPzBuu9508DhS0UoJTc8JDR9Nx+DB9Aexifj3L3Mp0iQ==
X-Received: by 2002:a05:690c:6485:b0:70e:7503:1181 with SMTP id 00721157ae682-710f76a5674mr54495277b3.18.1749221907033;
        Fri, 06 Jun 2025 07:58:27 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99e80dfsm2831417b3.62.2025.06.06.07.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:58:26 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/6] xfce4-netload-plugin: upgrade 1.4.1 -> 1.4.2
Date: Fri,  6 Jun 2025 10:58:01 -0400
Message-ID: <20250606145805.164173-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606145805.164173-1-schonm@gmail.com>
References: <20250606145805.164173-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 14:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117766

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-netload-plugin/-/tags/xfce4-netload-plugin-1.4.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-netload-plugin_1.4.1.bb => xfce4-netload-plugin_1.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.4.1.bb => xfce4-netload-plugin_1.4.2.bb} (81%)

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.2.bb
similarity index 81%
rename from meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
rename to meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.2.bb
index 6ed4747565..3c113290fd 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.1.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.2.bb
@@ -6,4 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2b6065ae7d3696cdad6869dd8627a9fe"
 inherit xfce-panel-plugin
 
 SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "9fac3a3ad52e18584bfb127cd1721d56de1004b9fdd140915fded89704ccb44e"
+SRC_URI[sha256sum] = "a2041338408b2670f8debe57fcec6af539f704659eba853943c1524936ebabeb"
-- 
2.43.0


