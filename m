Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F731E6817C
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 12:24:06 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10705.1771331038311454969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 04:23:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A9DOoHmR;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7964f1405a0so42573017b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771331037; x=1771935837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qn/fYDdLPEoMFWhzdDE2Z59Ti4Zjks98K3P/M5u1UE=;
        b=A9DOoHmR2P25gyoGWzY1e+Q5BtRyKryQOf3Ad9wYpA+xCgPZ88Ug7yRCZBP8ou/3+x
         idbcoWzOXC/yXv0SPsqSXA7DiFvNqNL82uwhwrLHfipSK3VzaFjrb5FJI5n2oBNttYm6
         u4KyNnphRWCIA38kYZmPLR7Mb6bL1+zxHWOYMwZdnBfk/cP63TAmYJWkvxH5yHMjBe78
         iCszGWvvnAPTlVZfYm3WNyyci/8u16y8bhO4tqIGxe4a/aNSwsPen7NpBVJuZNdhiX4A
         1QaIv4po+S4Z3Wk4e3ymUgRBGFYBjyObnTbpdeQQebAFAtjTE7/PwMaRpDvQZMWsSRN8
         1SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771331037; x=1771935837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Qn/fYDdLPEoMFWhzdDE2Z59Ti4Zjks98K3P/M5u1UE=;
        b=F254MUHCNxQQNlagk1g4EduNy9XwlERNnj52ZKhzdLNj0WfsAL0FWCB/ALnQduSFoD
         8Be3pWtt61AO9eSfDc9zOnKgkQx9h/jb0sztG7riRc7aRoLF5sPBduxSI+M/Lj6bo8UB
         qypZMwundAwdgqQGrRlM2wbpmwuocyHl1+YAClRq6nee1N6M24pYgob30spW5zzehOae
         NlBhwPpZ/ojFPucCU/ZEu1xA031O+bGmo2SOyec/GXDXzPcbbJZUTcxhYeuWWlWH7szP
         9aCCDe3OEteDmxh0pXSeKxlTnvY4i3V7Vg4F3LL0IzWcwTN3LBWFCMoUPBypYXDN2cIO
         AnUA==
X-Gm-Message-State: AOJu0YyHNqalZYNs7/VWfHz2YRLca4xgWKYVTjDrojOeRxtf/G/3++zR
	2oiFX0NsNdqLHMDht9siyd9b6TQ2Hxm/N/cSR3M5pklDD0877VS0fn3OGJl4n8Vh
X-Gm-Gg: AZuq6aLf8Drpu/QJjpLYa7KO1kd2Yb088NoMOhqotRato5dOjMnWxuEipm03IQbvmLu
	ax8n/AHRhGiLGJO8XebwD2KJGviv/qwXttJF1CbruwxktRHqShe5GkqzPhmJmrVHMsDTzZTRskY
	7VD7cJYYPhDZptfAuXQ0LbbFsSKqygO2r/z/wfGIOeIPpYB0jmwGuXNC2stIL/w91E69poUw76+
	7oArD1ObhBCAFljnqo6+mPtf4j2rvibjcySqJ3bFD+8wUFn0ZTTgh7qvrsUqNPv/MS2cStj64S8
	N3SuQ0URxIXl+1T7yFVIjIu4BWtLkxWbxVREDPX8UvoA5ItkFceqbr5ZO1lc8gQbk/COGgyfITM
	VLeV0uqomPw1owHx45VFB2+51WQU7b5vSbbR++e+yxupr9uLGbo2CYHIyof0cOcxd9Ho1ME4Azi
	BSTx3GNnz1wShImroICf//1lT9iY+JhFhVQ7ZbsV0z83KvuJb0dsylEHTmY2BzxJZIKV5axZ1dw
	lbXLiaV2mYurLu2306ZXV2ZEfN4/QBWRuulGIyomcjWyFClcMM=
X-Received: by 2002:a05:690c:c512:b0:794:f357:965a with SMTP id 00721157ae682-797ac62d03amr83738597b3.50.1771331037072;
        Tue, 17 Feb 2026 04:23:57 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c18a935sm109404487b3.12.2026.02.17.04.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:23:56 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] thunar: upgrade 4.20.5 -> 4.20.7
Date: Tue, 17 Feb 2026 07:23:45 -0500
Message-ID: <20260217122345.433768-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 12:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124450

Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.20.7
Changelog: https://gitlab.xfce.org/xfce/thunar/-/tags/thunar-4.20.6

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-xfce/thunar/{thunar_4.20.5.bb => thunar_4.20.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.20.5.bb => thunar_4.20.7.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.20.5.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.20.5.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb
index e72eb8b33f..a9b04de13e 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.20.5.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.20.7.bb
@@ -11,7 +11,7 @@ inherit xfce gobject-introspection features_check mime-xdg perlnative gtk-doc
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[sha256sum] = "da299babd233a079a443e527fa38cba3899b6131ef056593de9451178d812f2a"
+SRC_URI[sha256sum] = "e0dfbb732c3d7c9174d1c0216dd6177f1d4e9297e623dbced32efd3f3e8682e5"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "--enable-pcre2,--disable-pcre2,libpcre2"
-- 
2.43.0


