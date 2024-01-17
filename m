Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9B7C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 19:42:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.13598.1705520562244800068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 11:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cVH6aJ3j;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-336990fb8fbso9014575f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 11:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705520560; x=1706125360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BEWkuyeown3BRi/8U8YxwG/U2xQB6Dy2LIbevws5MRw=;
        b=cVH6aJ3jcWIcIHEWw5LWQfpIA3fkF1vwynSDGtwcc1SU/kRPdoPVlizjQzPzUNacdJ
         sZLW8o1gsmGfp/rB2VaaxIa+Q/Zq2I5o4fspUqkT2n05qDa8y1RQAYWXZlFuNdzu3FSm
         6CmA/Ls/95CWLUtkE6y8SgBMHBfBgFZriGEhcC0eYF3kC3I4Ht0Gm9qJlZsnJ9MxQq9+
         wagG6Y8s8b/+r0NGlIf9DbkO9dqailfZCND8Sl1r8rI4yAhgGBtvtjSOAZrJct8Aiyr9
         np4MXTdwlrfMMewIfhl3HP6OEKBrZfHAqLaEpKPmFF9gcazV06scn2eAMoIJ7FPuZZ1d
         yIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705520560; x=1706125360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEWkuyeown3BRi/8U8YxwG/U2xQB6Dy2LIbevws5MRw=;
        b=tNDcqAJCow0k34Ekf1I9eBBR1c7UG8a+NCbC7ol7dNTviTBfIfU1NUn4hNNV6JvW0O
         wmGVAlYXXI/I5mXo8oRQGJqSoFevu1k5Ul/8GlTV2rnfTEg9qYd5H/vAARtYcwdy2n36
         uH9Wjg4VSaYIED1zpJ514o/b2j72Nxw6+DzjBwdbRYoF8nTKo/6ZMkSlRoyutK9MTE69
         OwpsauOMzkc3j5Ln4UdkHoxe7A9EdjGYVzXDp9V5VwJWmktrOP9EWpP7S0nL8GgEyNMn
         uC7E1fx8J0rR4BBTBKyjOI6+YO20XzE0SmDvsRQ7E0PhSveyOURov6k9N+FgtcB+kLxa
         dHyg==
X-Gm-Message-State: AOJu0YwVMPppb6Nf+zouL1I+A+U6YovYZRGU9XiS01spgcBgIsjx3Z6W
	z1zvqNXpbyb9PKviiuu5l8gfJlo2oIk=
X-Google-Smtp-Source: AGHT+IGpWNFGOtPBJci43/sbNiJBFVJog0rgRwtQP3zaB/UMkmZKmbVIkbA2RiHT+CwkYyc7umHEGw==
X-Received: by 2002:a5d:4242:0:b0:337:be12:3261 with SMTP id s2-20020a5d4242000000b00337be123261mr1466807wrr.68.1705520559922;
        Wed, 17 Jan 2024 11:42:39 -0800 (PST)
Received: from Unimatrix08-Jammy.marelli.com (mob-5-90-42-240.net.vodafone.it. [5.90.42.240])
        by smtp.gmail.com with ESMTPSA id h5-20020adf9cc5000000b003368849129dsm2332124wre.15.2024.01.17.11.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 11:42:39 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vbxguestdrivers: upgrade 7.0.12 -> 7.0.14
Date: Wed, 17 Jan 2024 20:42:35 +0100
Message-Id: <20240117194235.3862263-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 19:42:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108338

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../{vboxguestdrivers_7.0.12.bb => vboxguestdrivers_7.0.14.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.0.12.bb => vboxguestdrivers_7.0.14.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.12.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.14.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.12.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.14.bb
index 6b493de7c..208b1bb6e 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.12.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.0.14.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-SRC_URI[sha256sum] = "d76634c6ccf62503726a5aeae6c78a3462474c51a0ebe4942591ccc2d939890a"
+SRC_URI[sha256sum] = "45860d834804a24a163c1bb264a6b1cb802a5bc7ce7e01128072f8d6a4617ca9"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.34.1


