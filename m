Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8D6C25B10
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 13:01:31 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.9563.1715259690428817431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 06:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FSxGl63y;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59c448b44aso206164466b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715259688; x=1715864488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYuIiqk8Ce5OelQvLujr3G/8AZvEqKXm1syFrvKyz/c=;
        b=FSxGl63yZvQnE1/niixYO6kmFuCwlzfIqfKwKqUd0vZsEHwi+e1u3FqDz9yyXrkAu5
         rFwkRkZD+Vj6S+3qwBARTXGjbsfHQ+eIpJGvSbG4z8NzWIwI+GL9uCp8ppLpeSk4K3Lw
         66hK3bx6yqPg3+sX+XRr4o01xGXQz1WZdkO/YrN4F87pLEWWrTKHYOKtYnNHGODNpN/I
         VD64DyQor8KgJJFCW2KOghlNSDK/8lvyf3B5y+FqiINEDiak6kmkKfRouLyw3DH/fbfZ
         +DkpxFohd0NPHiPtK2V/yiWkrzbxydRe5imUm7ztoMgeafywv+HWRqUrExY8xXkVDiIQ
         +YwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715259688; x=1715864488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYuIiqk8Ce5OelQvLujr3G/8AZvEqKXm1syFrvKyz/c=;
        b=qLY63gbpIOAsvq/YjkLnnLdVXQhelcC53IUP5rS+tLIvERa23/u9V6fOg92VyKHyEI
         5UbOYvbpRgPpdKh1/oAaSlPK8PBOgdk+LFpnQKcZPiTZEcOX0JcmKp1kbVnh95Fi9VxN
         fBKaNkwAmb1V/OYtFHjlPcG7k3QEf7QsUxEX0FeunokW/UvPdwO5OmJa0pc/VFo2Zrwx
         K4bq6g4jnCf1uTS6KU7tTg9pwS8k62p+NROC6noQ69DNlBZRFPIDug7A5xCGvGS917++
         lfb7XMKRbIpPqdIPU8Yy/ZIraRKXZUYguhs2O5G2WIqJwjMuLiS1u81jybeGG4x6LFcu
         9A8g==
X-Gm-Message-State: AOJu0YxdH/jSVU0mT0m57C0OX9c0uTieoCQ/08d9KFfUPAh23qGVSHIi
	Jtp+9B7rwUOiIpAzQDH8c5oh4WWtQvCa0NpCxmPK5MJDr969TtMN9T/+a/KG
X-Google-Smtp-Source: AGHT+IEI2inKv+RatLTDNJwkau0s3yPzo7vS02j3RiLEpPSC8vjva6QHQ5xRnGegr1XufoeHppZZPQ==
X-Received: by 2002:a50:ab56:0:b0:568:b622:f225 with SMTP id 4fb4d7f45d1cf-5731da64b11mr3880585a12.30.1715259688106;
        Thu, 09 May 2024 06:01:28 -0700 (PDT)
Received: from Unimatrix08-Jammy.marelli.com ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c34e5ccsm669856a12.95.2024.05.09.06.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 06:01:27 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.14 -> 7.0.18
Date: Thu,  9 May 2024 15:01:24 +0200
Message-Id: <20240509130124.752183-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 13:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110291

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_7.0.14.bb => vboxguestdrivers_7.0.18.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.14.bb => vboxguestdrivers_7.0.18.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.14.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.14.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
index 208b1bb6e..eebbe202f 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.14.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.18.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "45860d834804a24a163c1bb264a6b1cb802a5bc7ce7e01128072f8d6a4617ca9"
+SRC_URI[sha256sum] = "d999513533631674a024762668de999411d8197060c51e68c5faf0a2c0eea1a5"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


