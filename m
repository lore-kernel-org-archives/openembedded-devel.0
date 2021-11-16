Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB7EC433FE
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 15:21:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.458.1637076088950994666
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 07:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bqyUdHPZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id u1so38301199wru.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORj+1a2+BuQZ/ZNKTIs/rRJpHVO2e0F8jnfwWNXtMmQ=;
        b=bqyUdHPZt2+PluIwV/cmLuxABjYUE/mUPtpAdQem+IXvDqQ7F8GMYYoHBN9ss85Amt
         qqcIJoDLEXQUQ6nX3/U/IiNUGPAOphfl1nR7GCBW6LF13A/ZjR4vVQdrDU56bgOid9tZ
         QQMqeXh/BVkgXF+2PqyoPw/3wofDLdQVZ/dA8/2zjR1GQ4zJrzmwBiXA89aoJ76F+noo
         A7DkCIzP1xy2rQViiFVL3MjDk9xOpCMFfp8wtFvwalVAzl4HR9tt7BZGOfoWMhxKSyqb
         OnvUUU239sZi/Hl76dTtCERoZhVVdp8dzIXYWMw7S71X2BVGivsqvGD8uo1hzbQFzyZx
         moGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ORj+1a2+BuQZ/ZNKTIs/rRJpHVO2e0F8jnfwWNXtMmQ=;
        b=Fgt001Y6g8DyI8pEgFdK5uYuBPbbxeW/XzgZTq/wUsIggXzkDw4APFLpsCuwVi2+A6
         dtXkKtdSSjoiUuiBLdjIfohVqgXdg7RbykZoaYCCoUf+Xj6e/QFx/KV9GeFVi1LsQV4U
         vooVqOrVSWLwFzpZplEHa/zZWCY5SimcJQAYbHMQaSsrnY9l/fNxVTdsrlstENtWYAzl
         sAUp5CnIQu45bxDB1ZvzhJ/lk0fLXjFECcu8mVLKIEqIzjbxM78OaMlnoFTMKTbb57iK
         Y2sNd32VxgvzaGiwrImlHRBUVZZtxwPhi9aHip6mKi0wuJ3GLfNflPQIhPP9pQRJDSXV
         Y7kQ==
X-Gm-Message-State: AOAM531tJwjWnUxTZ5vUnhYrYhvyVAPpJLBxex1pASPLqADqNrTcK/BS
	0nN63bN/6qbMOZh1QITUchBat10et2c=
X-Google-Smtp-Source: 
 ABdhPJw8LyJh33+Ozi0BITMhaZbgQQnVT8Wpu0m2BT72ECTHeCmd13O9IosgIEQkTA0pVyRL1w4wDg==
X-Received: by 2002:a5d:42cc:: with SMTP id
 t12mr10200160wrr.129.1637076087343;
        Tue, 16 Nov 2021 07:21:27 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 c11sm4036330wmq.27.2021.11.16.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 07:21:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] python-pygobject: introspection is not valid
 meson option
Date: Tue, 16 Nov 2021 16:21:24 +0100
Message-Id: <20211116152124.1036680-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 15:21:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93982

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-pygobject_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-pygobject_3.34.0.bb b/recipes-devtools/python/python-pygobject_3.34.0.bb
index 2e9cacd..ac0caf2 100644
--- a/recipes-devtools/python/python-pygobject_3.34.0.bb
+++ b/recipes-devtools/python/python-pygobject_3.34.0.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "87e2c9aa785f352ef111dcc5f63df9b85cf6e05e52ff04f803ffbebdac
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-UNKNOWN_CONFIGURE_WHITELIST = "introspection"
+GIR_MESON_OPTION = ""
 
 EXTRA_OEMESON:append = " -Dpython=python2"
 
-- 
2.32.0


