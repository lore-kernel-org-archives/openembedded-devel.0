Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21591C433FE
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:46:14 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.400.1636825573098967456
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BSH5cT2D;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 188so10796188pgb.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EdBqhEvgffXvaZdBspbc/wKypaLvJysvRvlkf1t4O3g=;
        b=BSH5cT2D5Ih3VrhIj7YsnyY57gY/t2oQ7FPWeVKOu9itvDdJSI1qwHS18d3iBiUgKo
         TMmrDtViwRGwI224YedDRX8YzB4sKyGqIGFDur+mI6NaqZkb5WAeuhlWTUOY//pChlSJ
         3tbyPp6K7eH6FcrhEOVABNz7G7Qik4mrSNh/5Yckhvz4QZ/VAv5qcxF+oQirSvqsu2jz
         nAgRxC64qNoiBifzbJ7Jf2TUnd62vdsBvE5NoKEd7F/bwa7We9dBYRPLRj4Ke+QRdpwt
         IbtGZi73STFH/+z7Jy8iCmxv66tcyePbKx9qBJ1uJgg+aAmTEwp/wmkemHkyoi2PV1o8
         6agQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EdBqhEvgffXvaZdBspbc/wKypaLvJysvRvlkf1t4O3g=;
        b=KIKxs95l2WfPLLM1vlA/IfDGFJ1cwV2kWnbTp7rfdZlXHNZWOpnwGInilp7Amgh+BO
         riIiVFChtfFr7Lp6Dw5chnABhhPw+cfO6ChYsW0ioSrnhzoX/ZThwEphXkpTmSz5yFlE
         BLQBv3qX8XBbILMvruPDq3Tgk10azt3bZvuGeGxBPlrjw2nam1gvW4uOTDR3tH/7IQld
         p2JFk1hgu6g2Eya/sdQWpBNZn6/Ec9An7uy1mrmbDiIy/NgWXtnz4xbIjP5MeEJKhoa2
         MXRvclJcGIL8B5BNXNqEFFBvvz8MFdq7ywXBtOvnfi1f6HRuF2U0l56AYmfg+/2Qy27w
         iqJg==
X-Gm-Message-State: AOAM5320BrBu6OHa40CORbMadAEMzrEc7b0SODE8Mv4NiQPtPp4hbXkv
	vJTytPVYtitr/v9m0B44hXlrDBi800c=
X-Google-Smtp-Source: 
 ABdhPJxc5cVlC/XEYxNiC7QpViK88JfF/c4SnuMMTGFZg8qrIMzOSKsvF2P4NE5cK50VKPPALMkQoA==
X-Received: by 2002:a65:6388:: with SMTP id h8mr13262861pgv.94.1636825572499;
        Sat, 13 Nov 2021 09:46:12 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 d13sm10649107pfu.196.2021.11.13.09.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 09:46:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 6/9] gjs: introspection is not valid meson option
Date: Sat, 13 Nov 2021 09:46:03 -0800
Message-Id: <20211113174606.2044137-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211113174606.2044137-1-raj.khem@gmail.com>
References: <20211113174606.2044137-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Nov 2021 17:46:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93935

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
index 92f14e0846..f6878d1f22 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
+GIR_MESON_OPTION = ""
 
 EXTRA_OEMESON = " \
     -Dinstalled_tests=false \
-- 
2.33.1


