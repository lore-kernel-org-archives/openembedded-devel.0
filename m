Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA612FC980C
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:06 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37386.1774820336526019454
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WYsdqtx/;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b97f9587e6eso585794366b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820335; x=1775425135; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fh2y9fdrfWzgZxALxZt5b7jHmm3xvOGBYbY7VMf9Y5E=;
        b=WYsdqtx/NsnaLWVDseG3IoiFFm0xlEbRzbc4QwPIAhk2kLOmYsdSBgY9kzeqSdR9eI
         brEbzDDqdeBlz2x1MNMKnMutaWLXm2ChBoPVaD7gYNKwJtiFZQ5yjFFiJ0u6TZODYVtT
         f54HV7kdSe0e+9iZgEkVFGFeGIngBuadhbtvWJJmfFd2jh03/MNWYsTLadMNZ4H57ga8
         MfzxOWW7C2j02Keq1pCFsKYgteCkgAJulUtALb76Kpo6m3a57MBrnVUKlODMSceEo/4G
         1CIZe/wqxvGQ4UMO5u/mqxVAP40jBl0IFaZlNVoHsQH0vusuGIq7FMobZHOXqawv6bG1
         DgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820335; x=1775425135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fh2y9fdrfWzgZxALxZt5b7jHmm3xvOGBYbY7VMf9Y5E=;
        b=XKLdr1/UNXmm5m5HVUPdjU78QQAsx8fqqa82JYZ1M1Chi8RchntjdY43jQdEduiu/4
         CYmvfVNqzVdBS4xsy1h0GZfLWY/d8le9HYwzK9ogzQYuyce/QAIJE0X057z/XmOFx/JU
         G/3rwxlR0mpD1jMvcjxmg6AK8of3hE4vhtx09kVFJT0Iem8Rpup+f8XBGgVbiyIevGZG
         I0uDxBLx2MB7NX1RcRTIoaxFI7VEgoB8gTNS8yd74CK70fqPIZjKEAkacO22ipKcac4x
         DhYUJWPZThiogl/nyd8KRshvUMMNyk9qeWmPVOe9W8bhy1Ra/yv9AX0eIKVGLefWh88G
         2Muw==
X-Gm-Message-State: AOJu0Yy1sDIAP90/MhXwSKptL12eKU62Q1KYwVZpSYMvQY5HSUsl5AbD
	x2stgk9Zs9m5crb77a89CBQSu3SLcUj58QS8QM30e8W038MnOsR6MDSAhI44ZQ==
X-Gm-Gg: ATEYQzzCfeAmdl7lndONsPtn0mZf2gACg5kQC2UjchbsR6vkqWBIrr5yl1hHyTqB+6r
	dRzr8U2d2p05lekVqQfCsWPXCFvOdPFNHuikRV4ajFca8+WKfhKOJ9eB72Qu8R8SR2WojpddvBb
	SLO0uwswEHB/hARmUqarUlCM9b+hi6xI28IZbPKsJ+lZIAfaUxAo1NKmcpneyIjIIdGS0TeMWck
	UulY8RNurvutCcGPFBhyQbs8tvQ8pJ20skRCYFmx2PoM58iJAviaLIg1mSjr3GF4962/egmU/l4
	hR24+vuWbKzkoMwULkOW/P6qkYz038z/14m86khpx0sFQZku9tmFntlqy7oM0SH+WqKwKB5gzor
	shHHJhZrxZxTci0/F+ZGzEvSAAyH1T79ad9RXTVZnRHCfKLHI4pIIU5LuSwd+kJCk0PgymkkYrg
	2gi/WkqkOKgT+aRse0fJ0FVr7r0kbtVaTDN93PzfNee5ubzJx2yjU1qQnr0S+6
X-Received: by 2002:a17:907:1c9e:b0:b98:40f3:47fc with SMTP id a640c23a62f3a-b9b50169017mr631592966b.1.1774820334794;
        Sun, 29 Mar 2026 14:38:54 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:54 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:04 +0200
Subject: [PATCH 03/13] aufs-util: Convert confusing append to override
 syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-3-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125812

While in this case `RRECOMMENDS:class-target +=` wouldn't result in any
unwanted override, there is no guarantee there won't be a change, which
would be hidden by this override. To avoid any surprises in the future
let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
index 61ec508b43..0abbc9ef50 100644
--- a/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
+++ b/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb
@@ -63,6 +63,6 @@ do_install:class-native () {
     done
 }
 
-RRECOMMENDS:${PN}:class-target += "kernel-module-aufs"
+RRECOMMENDS:${PN}:append:class-target = " kernel-module-aufs"
 
 BBCLASSEXTEND = "native"

-- 
2.53.0


