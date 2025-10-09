Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E9BCCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 23:40:19 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.4414.1760053211308757531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 16:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YmuAzwGp;
 spf=pass (domain: smile.fr, ip: 209.85.218.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b2e0513433bso243825666b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 16:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1760053209; x=1760658009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VeTRldCPGq0XjZgMioCfHf9czVqpeAQGXuCe/59D0c=;
        b=YmuAzwGpJXRq2PUU+PE0QNVPYrGdJFaIBQE3SfaBJKjIUP3nAnQndUiin9AsUC4FUW
         7n3w5yyPsW07ou6ZmqfTidYeyvMKT2ltpse5y5YKoFuxiwHPE3S7vRjhuzYsqdpO61fy
         C9sufA5iHXa5LQre3yNpPrsqKt6Q0t8YJ9TUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760053209; x=1760658009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VeTRldCPGq0XjZgMioCfHf9czVqpeAQGXuCe/59D0c=;
        b=K6Fpallpoj5CRqmM0tJspTcw7KsHtAq6wVo09thFBCzy44Wl6HhHdxFA1m86odTBUg
         cgYVsal5DXoYffodE3tV+XvcoCJZnLGKZLXX5rXS6YLAWdIBMkyyVQsVRma8MXqjyd3q
         Nz0lvUCFjk04Tf6ZDjpdZ3QooJGTIGTHP+mtnM8jEEXiRuPJVjGysuekKM4ORiGImv6q
         FjyqVcXOQcSQnSNbjeFVCrdIpdbWSruBDhr8//6Ir6DPw/CNR4eHm+ts+Kjd56wtyY9D
         thmnIzmO4KtDmYz4t8jDou3OvbdBYKjdiReCD5V8OVQL1ArF+sRrAxOSpJXR7+n2dCtG
         dWGA==
X-Gm-Message-State: AOJu0Yz3jMBlPq62SDhU7QHuiX6UZaunpqtphUDA5bCKftkPmWtObtOc
	A4NmLtlS1bcFEckZjnX7SSkO+UKmPJ/JjICOLJ5XvoFUnZcSig/eWI8zLBc3D/FfA4Wi5CvxbzG
	YBAq3LNw=
X-Gm-Gg: ASbGncuwow1X7W7mJBzsXttPIhx4vUg5bNiirS+9rcLVC+RAIVMIbNWYdYiiw0WuLEQ
	n7K68To8ai4roRmQmXUyVfxZhCXUOeqQYJDiZPenMBLkaO2XHQInLhkTVAgi3kQaE5Q98ocpxPt
	ft9rDXQngFHaOcimCn5xbTGP8Cw3mZkX6Ob/fpVOplFgtWe/28CiAKo9ES2j01g7FrjnKzDnZay
	Fyl/n5UbJKkJgbvx8gyME9N7wytug6po3BXmfiTb7GwhPcvDI7luDOjC9JxNJkI1MACL6OuGhps
	LAvJvHSPA9tsYlfM6mBgeteNqJailEdzcnAQ6+/LNfd1dZR4jldTWGp52pxMae6E2OTLmOvwfJz
	+QSFKI6rFqif/ZGrMjBnLzzEVc98O/gipK6asnX+nQf9I436F7oukBb/nT+jaryUki89EvTSgfw
	NJDJbhBF60O9rUHHj32UKJ4O8vZJLWI/APbYPsgfJ8QdWvgkfu0JFDeLoFw77YJdGwpQ==
X-Google-Smtp-Source: AGHT+IHD0Vdd1VMrajdj8JlUs1Dv9ztOdMZvjgUbsVpFVTCXeRJrq8KCNwobCs60kd4Xv0KEC6hbXw==
X-Received: by 2002:a17:906:40b:b0:b4f:f6ff:a82f with SMTP id a640c23a62f3a-b50ac0cc335mr770878266b.32.1760053209474;
        Thu, 09 Oct 2025 16:40:09 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d951cfe7sm84802866b.73.2025.10.09.16.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 16:40:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] monocypher: prepend MIRRORS instead of overwriting
Date: Fri, 10 Oct 2025 01:39:58 +0200
Message-Id: <20251009233958.2664554-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 23:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120460

From: Yoann Congal <yoann.congal@smile.fr>

Overwriting (instead of extending) MIRRORS in a recipe prevent user from
using default Yocto Project mirrors (https://downloads.yoctoproject.org/mirror/sources/)

As a side-effect, it might fix meta-oe-mirror build for monocypher [0].

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/469

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
index a601d88e7c..178f273ae6 100644
--- a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.md;md5=ff30a1c41dfd9e6fa559a9e45ee98302"
 SRC_URI = "https://monocypher.org/download/${BPN}-${PV}.tar.gz"
 SRC_URI[sha512sum] = "bf275d4c53ff94af6cdc723a4e002e9f080f4d1436c86c76bb37870b34807f1d7b32331d8ff8a1aeb369e946f3769021e03e63efac25b82efc5abf54dc084714"
 
-MIRRORS = "https://.*/.* https://github.com/LoupVaillant/Monocypher/releases/download/${PV}/${BPN}-${PV}.tar.gz "
+MIRRORS =+ "https://.*/.* https://github.com/LoupVaillant/Monocypher/releases/download/${PV}/${BPN}-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/${BPN}-${PV}"
 

