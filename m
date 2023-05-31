Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B8CC7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:53 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.11460.1685531626110547861
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SRJyNPZ7;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-bad041bf313so7933657276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531625; x=1688123625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lidv/ACSByHsVGai/XnvY4YcDOmmkF2dgjmVdcQa8Kg=;
        b=SRJyNPZ7q9DMegiAZenQEior1RqXqUAx5MnQso+s7n5dkN0xZrex8tNhkLaX+Qs+41
         DlGy5FHLhLL5ji/PZOyDVwW4cJjuj9xRcqA9E24YWNIyIpELz4RsZYD5H4uosF3yFQ+A
         /EzLJ8jfWEbn6ApKjk4v8Umorkz/Zg9uyHus4pCyv+NbNtPouFUPus73+wmjwKi2jwIj
         /yldJ17T1O/QJyHCsb93ZgWtyhCg8bygqu5dWVLONVCcEfelBEVjriKGojvooheJp6hC
         BGlxrftJhKQ5RdjJo3VKbK8G+iH2aUJRov5Ihd3s+Kd64pOLmYa2jTi040u7QsiK3RaM
         1iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531625; x=1688123625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lidv/ACSByHsVGai/XnvY4YcDOmmkF2dgjmVdcQa8Kg=;
        b=C+shVevoaiy2lE3+jsM16W2trDQkVB3bezGyc6k3+csIAYtwPir5MeP+bLifTd6pVk
         iOSpnWdQYK2e06RFiYsiADugzqLmk5xnW8PY9dpiPkfwB/rOan1XdER3W55wTt0ddgxv
         7rNzU+plUU/pnEPaXWFMXZhjqkfo11td1cYwm+d6UwwbJaKAKHM5LGOZ1LxvIqigpLpO
         cgvCZQTqMmEPMB3YR3MCSqnS3YdffCawajvHob+WJB5f7Kc6Wmop0LIE1nwUaXkgrK3l
         VH7USMVOonkQ/eiCrf8eOWgCdnW9Jz7l+X1vkurhjwdW2GXahsgqWvP2bcfPrnHmWVhv
         dmsg==
X-Gm-Message-State: AC+VfDyePBvkXG3pWmebT6q3owHgUUV7qs2Sum5IN6GuCwKOjIDXDiVY
	B5j2vDwIgjBe+fqtZw2VwKZCph/+ICo=
X-Google-Smtp-Source: ACHHUZ7QgjUKdlOOO+rR/DoVYK2JVS0Rza9MbLbINw2Pzc0iW+1OTyRp8HQtoyxXVHi3Cjnp7cyAQw==
X-Received: by 2002:a0d:e647:0:b0:568:bca8:de50 with SMTP id p68-20020a0de647000000b00568bca8de50mr5362560ywe.17.1685531625087;
        Wed, 31 May 2023 04:13:45 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 35/36] sgpio: Pass CFLAGS to make
Date: Wed, 31 May 2023 07:13:08 -0400
Message-Id: <20230531111309.2454603-35-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103063

From: Khem Raj <raj.khem@gmail.com>

Ensures all compiler options are passed to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit eb0878eccffa9e644c5e5a9563353ab1007b5ecd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
index fe2ebe4ff7..9b25745ed6 100644
--- a/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
+++ b/meta-oe/recipes-extended/sgpio/sgpio_1.2.0.10.bb
@@ -14,6 +14,7 @@ S = "${WORKDIR}/${BPN}"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE_GPL;md5=393a5ca445f6965873eca0259a17f833"
 
+EXTRA_OEMAKE = "CFLAGS='${CFLAGS}'"
 do_compile:prepend() {
     oe_runmake clean
 }
-- 
2.25.1


