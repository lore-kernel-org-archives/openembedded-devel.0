Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEA8D5B17E
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.128.1730140094212024739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N0ER25Sk;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e28fe3b02ffso4331216276.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140093; x=1730744893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMh6yeh2XEab3M0l8OLohj/YvEIUDemtq7v7t400Udo=;
        b=N0ER25Sk7CWzXCmjiizcsK7mn8fqlo7DKoXCMOF0Lb4eXGD6L4k7ZE7PSrIujzeY8n
         R96FKb2QkX33x/YykbtLm1ngr4YzF3IjEUCrvAYJhLeCScaLzhqgMxIVT3iEgZNN33H/
         fEtkYQnTNA6N5Q4itbaMZfpoQ5DZNqqE9pVqgIrRARMf71h9xE3DeeCn0CjMX16ZgJDK
         mVbC4zNjyLRQWLCsqhrVXs/DXMp7eIDQM8dG89R3vEkcfpMLK7VaxXVO+zWppJ5W5V0y
         /rxcfOydxOc72K/6bVMoZyXrK3ut5nvEfCR3muVrrSzuF2TYAtABCTBhKrJwBzKN06Y/
         EGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140093; x=1730744893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMh6yeh2XEab3M0l8OLohj/YvEIUDemtq7v7t400Udo=;
        b=dqOROuR8JrV0/tiLbE0iHrrjrGIzSgLR1bawzOxiK9+tsEFV+9rogWput7xFicL2c3
         afZK6uqPN6nyjPoXMeAljtQr42AiUPem71ncrnkpfIkJb/FBAPLotFTYABI2vMFp/waU
         zAlx8JeQ6nF9MLDowlAqrDBDEwXVvbvrl+uhZz+ip4qOvBDLXKh4FVwRS1xV5ss7qVKz
         eOYxQFYyIWry2+IBGUON91olmdExzhiWFoz58F9/cECCPDjbr7eq/Q26M10AtrSQNDdp
         ZM343mJ3P130SNaEGfZNRPn8FcNsdO2CqJnqM/rbllMxxNsHShlL7T2aG5Glw6mWeYlv
         fQNQ==
X-Gm-Message-State: AOJu0YxWxUmM29s3T06Z4zaBG6yPcbx6lRm1GUnH6wvC+wbnVBl8/vsE
	168RcTHSBMTD/SHxz1up5xi5sh4A2JYAic9BVru4yr8bSO8peM2lT49Xfw==
X-Google-Smtp-Source: AGHT+IH1K1599csMCNIbHipsloqkNIkWxHz5ylS6QlLOw4Qs1RQ52+oBfqTzFYEcsluodHKHlL50mg==
X-Received: by 2002:a05:690c:fc2:b0:6e5:de2d:39b1 with SMTP id 00721157ae682-6e9d88d02cdmr80407907b3.5.1730140092541;
        Mon, 28 Oct 2024 11:28:12 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:12 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 03/22] libconfig-tiny-perl: Use
Date: Mon, 28 Oct 2024 14:20:19 -0400
Message-ID: <20241028182749.5058-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113271

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
index 620659abd..f232c3585 100644
--- a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
+++ b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += "perl"
 
 S = "${WORKDIR}/Config-Tiny-${PV}"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tgz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tgz"
 
 SRC_URI[sha256sum] = "b2f7345619b3b8e636dd39ea010731c9dc2bfb8f022bcbd86ae6ad17866e110d"
 
-- 
2.43.0


