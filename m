Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13807C636F8
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:01:26 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.22818.1669838479249034746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Nov 2022 12:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PMWaABD/;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so3388453pjj.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 12:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=briOvFkrDg/gF50TJX9elWrOyNL6606tOObLCRkyrzg=;
        b=PMWaABD/KCPJh4+LUtreLu/7+4nNdWh1DcA33waEeQ0EOnmQjw4onM41My9wXwVvjH
         fS5mb9bLmDu8Y0oclvu/GyaOIaRrIHt90P4jtoh8TtMjPPaPPrAwKXcl+NINrzhrsn3Z
         sD2h/ZUb/iu0RPPinjEXh+hDWjuRWJ6/MO2z1s/D+8CUn0Sfv4+ZFkpBGuTJ8E49wl8T
         4IlzokyVLxX6SGyvPo3tCeVwClWT9EbjSLPdYWz2aAn9T27YUJNedmOjMhdIf7P1Vn9m
         qUO97i08UgeF2QbBFYByIiSffu7gIe9JUss+3+Xa1fuiZgqHkDbuaVA/75IHawD5aRqi
         ze8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=briOvFkrDg/gF50TJX9elWrOyNL6606tOObLCRkyrzg=;
        b=tsMxVYF7H+qinylzbIZWLv8GhyB9VjWD+WyARs15KkcQ9l3TdfG5shPCGB+iChClOB
         RUnzJWRlOTJBTSRCp2lDaV925YM/5WQiJ521ZNkqGVC0kuZpkf9L2CG19tkNQ44GJyEi
         tWQ4OZU93ziKV5wWv/5V45yxHdMuqTot/HbBEPNmqhqcITM3FJ939NhkW0JMZvcgPRJC
         E22Fs7MQAXXngOjL13wBDTYeqpVPg4tttDdIdvL1KHKUKzH8z9N+ca0sghWD3w4FD2kf
         kAJIIp/M50aKGpLHYgIn29mC8pL3f474dHdpYNXPZL31vUwpAACde4k+b6f6yHAa35j+
         2JkQ==
X-Gm-Message-State: ANoB5pmBlpq5zntjVfRbkbq+A8dtOVAbOxZSHsJUoUJxo1o+pPUC1kIu
	1yzkfw4DtLT7piwIzJPmn0CTVNLKuqU=
X-Google-Smtp-Source: AA0mqf6PlHmu2654JwKMIcmPehMptFx2EJDnFI6XvrYKZKsIB0+7KUNNVTk/HX/TkOAbS96FHTzdSw==
X-Received: by 2002:a17:90a:880f:b0:212:e996:704a with SMTP id s15-20020a17090a880f00b00212e996704amr70664594pjn.13.1669838478242;
        Wed, 30 Nov 2022 12:01:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id ij22-20020a170902ab5600b001893a002107sm1916026plb.0.2022.11.30.12.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:01:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/7] libreport: Inherit python3targetconfig
Date: Wed, 30 Nov 2022 12:01:10 -0800
Message-Id: <20221130200115.1954308-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130200115.1954308-1-raj.khem@gmail.com>
References: <20221130200115.1954308-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 20:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99872

So it uses cross python3-config tool instead of native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libreport/libreport_2.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb b/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
index d917a32472..35ef692617 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
@@ -26,7 +26,7 @@ S = "${WORKDIR}/git"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-inherit gettext autotools python3native pkgconfig
+inherit gettext autotools python3native python3targetconfig pkgconfig
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','x11','gtk','',d)}"
 PACKAGECONFIG[gtk] = "--with-gtk, --without-gtk, gtk+3,"
-- 
2.38.1


