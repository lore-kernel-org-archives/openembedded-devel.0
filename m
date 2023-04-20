Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3599FC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 08:03:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.2928.1681977793969732886
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Apr 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=d3LUwd+8;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id bi21-20020a05600c3d9500b003f17a8eaedbso2635968wmb.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Apr 2023 01:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681977792; x=1684569792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4fNcrfy3b+3abC5h0/kW0A9dBtWGH+r9VzE9WWlrThA=;
        b=d3LUwd+8xR7v0idyneUe7sDZXThWqIr1cRrzB21EQ+uAXP9l2QMaONeBB5lc6S0Ii1
         laZ11ln6lFmx7WBJv2TGdFKTYTKVEE6JZ7TbEf1ZjfEmp+rfxOp1L/W367HuHXv0ZHIo
         UG/rmWS2eW7od4E5AdtX3tadIPLYLAqvUDG5ztvRQ/jm7CtxvDN4i7w2FxHDxRdMFme5
         WroSPU7LslyMDvKXYA/nQ/LyXzsYW+dy4tKardE7IUONdQDu9KJnCTZF2DXzMXfGStiF
         d+v58qmJA+y5OuWGDdyYQPm8LWNFnFfaEdeoIhAHp2fx3Qhf/3yv+4F1kmSvcoJv4FpD
         le3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681977792; x=1684569792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fNcrfy3b+3abC5h0/kW0A9dBtWGH+r9VzE9WWlrThA=;
        b=Mocmx71Ddv74UeHFHWwA3JjnY/mOxQ6tlImB05oAT/jnAHfr6odLXnNwd1S33X03FC
         z6BiOPhJ4F1JWAqbgB2SXmduTHdBBc4xNhSwCH6Xcox60DyT3n/YuUaK5G6n+jFxDKXT
         0QFX7Paq9lAZJUNVTPcc09gECH/bCdoyQxWyODZoALoIC6vHJ0foG7+qDr1oKDak192I
         eDkJOFZBGfuFH+thq+36OGXzj3Vn+lYDlnuLkwB+8TLM9mV0Li6Sj8R/U35ip8ke2Gi3
         nt2dvBfw02ps2APWqgX82b/Uqm4USFPKqNZmQimMML+jQH/JU+O4w7KhwcI+MQ4iJZUU
         QAZA==
X-Gm-Message-State: AAQBX9fkJnq65aCikQKOQDXaa2eSCYgwYfyZiO5LRrfe5B3TUtUVcqNO
	wCdasjBq6EgO8/4lu4Wl225TdPIzRAg=
X-Google-Smtp-Source: AKy350ZKyjfNEKryvmj7yhibwGKp1AYuRvWVzKfvR9r7mHqvXj4Geaa5sj+P7WUTTHwtLW/mtzP1zA==
X-Received: by 2002:a1c:f70b:0:b0:3f0:a3cb:c750 with SMTP id v11-20020a1cf70b000000b003f0a3cbc750mr472703wmh.40.1681977791832;
        Thu, 20 Apr 2023 01:03:11 -0700 (PDT)
Received: from Unimatrix08-Jammy.homenet.telecomitalia.it (mob-31-159-63-180.net.vodafone.it. [31.159.63.180])
        by smtp.gmail.com with ESMTPSA id r3-20020a05600c35c300b003f1836c98b7sm2262823wmq.48.2023.04.20.01.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 01:03:11 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.4 -> 7.0.8
Date: Thu, 20 Apr 2023 10:03:07 +0200
Message-Id: <20230420080307.3101106-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Apr 2023 08:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102141

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_7.0.4.bb => vboxguestdrivers_7.0.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.4.bb => vboxguestdrivers_7.0.8.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.4.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb
index 91f5ae0e0..ed3e429b3 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.4.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "58951f7d1bcda836c5e50ca0a6b13f0e61a07a904f476526a831df3d9bfe5b17"
+SRC_URI[sha256sum] = "c305fbe480f507eac7c36893ead66dffaacda944f19c3813a4533e9c39bae237"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


