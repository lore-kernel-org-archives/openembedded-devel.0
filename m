Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9EACCA485
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:23:13 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.3230.1657182188138834602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J0nWdbe5;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id d2so31156240ejy.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZB+2y5Xp0Mjt21AaqJ8LdYXzYnEp6TmksesmIIoOhI=;
        b=J0nWdbe5OQFXtjNpFbUq+WxSHjUv/a4wxuHzlpyIYNggK2z9Euu+h35vjPuONOCL6e
         8reDV2XYzBe+htfKZuxvjueMsc37U5dx6suBferpX/fAjs6Ixu/AobfUYOy0A1R2R/k8
         NLMQn9ZBZV7pyTFvKbxxCyQPbggCBXB4zD+NRAsUyg+UUH6p+eJRa705E0AUhVpzh4vb
         wtuJQQ9L6hzBo0G9n1D8G08hok34H+bm08UwFDBa5RmXRqN+FbydVHWFpNPThvcza4qw
         cjxCuxfr/TYq8PAhX3mXZh226i18GRn4u1dAMShD+hiLIiTWYI4ngJOkJOOFFOwf+zqs
         6Hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZB+2y5Xp0Mjt21AaqJ8LdYXzYnEp6TmksesmIIoOhI=;
        b=H+ZMu6m+CccNQa+0kLPu+zG1QoN95xAxctcYpFH7xJyUDf8306EK373uJUAKdMl3yl
         LAHHMPT3vIDB904Qcr9BS0bPvk3F0Lpd8xVslCct/Ah+tSjJADLqxLkdzKXipeCNPYSn
         3lZqMT/gYOxfIOdjYq5brNb7XfNGOE46dpOaTd3D60EQpjQQx6o80idv5Uh9Cemb+Zlx
         0sRpGe66bLLXkvKIB4ixU5IxM9iPBWYhnkMw0HzKk1H8Z2QyuIDddxaHfpPH2OPVWrZw
         Xjjc/1Q4GPdMoXCg5HcmIVbIZgEzYxaqsiDXQPARgVxh1mOj+O6BtPhAbdsoLNvSFhlb
         BefQ==
X-Gm-Message-State: AJIora9wuszmp/nFwoVXbjNYQYvx94oKxEWnQv/5ex4k0IG0RtVfG0o+
	/N40/tzEv9/d5QxT4c05h884zbsJJ8hHLOSR
X-Google-Smtp-Source: 
 AGRyM1sXAf41a7UpfaJfYdto2xHqXoH3fJ3hiotZt8w5JCbKsNf552FTNY8MDOYhPWOBP2qx74DcHg==
X-Received: by 2002:a17:907:94d2:b0:722:e4fa:89f7 with SMTP id
 dn18-20020a17090794d200b00722e4fa89f7mr40894574ejc.603.1657182186451;
        Thu, 07 Jul 2022 01:23:06 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 o15-20020a056402038f00b0043a67dbbb4csm8545025edv.83.2022.07.07.01.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:23:06 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH 1/2] libqmi: upgrade 1.30.4 -> 1.30.8
Date: Thu,  7 Jul 2022 10:21:59 +0200
Message-Id: <20220707082200.2497308-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220707082200.2497308-1-adrian.freihofer@siemens.com>
References: <20220707082200.2497308-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 08:23:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97760

Update to latest stable version:

1.30.8
* New request/response/indications:
  ** dms: new 'Foxconn FCC authentication v2' request/response.

1.30.6
* build:
  ** meson: fix 'export_packages' in GIR setup.
* libqmi-glib:
  ** net-port-manager: use unaligned netlink attribute length.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.30.4.bb => libqmi_1.30.8.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.8.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.30.8.bb
index 4807244a5..a1cfe29cc 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.4.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.8.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native"
 
 inherit meson pkgconfig bash-completion gobject-introspection
 
-SRCREV ?= "f6c2feaf199e0f129a0bde8c5e6cba5f2117b564"
+SRCREV ?= "95108b6eebfefa6621a1c34565f562eeca9308b9"
 # patch 0001 is on main branch upstream
 SRC_URI = "\
     git://gitlab.freedesktop.org/mobile-broadband/libqmi.git;protocol=https;branch=qmi-1-30 \
-- 
2.35.3


