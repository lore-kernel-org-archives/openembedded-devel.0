Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84CEC4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 22:35:21 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.19951.1646606121376593934
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XDBoRWMP;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id bc27so12070525pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Mar 2022 14:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pQI9bdN1g2JoaQkr8K3D+HL+V8zw0yXprj95djUxgSY=;
        b=XDBoRWMPJAHUIN47fp17e1svcwoiI1OEFYwiAFOy40b2AhdEXoG3C9aryJ79+rnOgX
         pR0sJ9SeXvM1Ey6F0vc0RW3CWpgYMFX0xWH/dVFFN0DOXXVYZ/qnBAoNNRhGtYs6D2Cj
         SfMMZ1cfPQATHPmB73nWSnGvwHHISsajtto0ooNS4IcgtJOVZ9dTmpco0VTTutA/RkPE
         52Kok284/zddAf3TaTkS8GvYiBAsmPD5yk+gownq+C/Y+AIiqQpt3Je6z8o2oOWZjoYx
         xw8XhK5soBR3cWrJN056YwSh5SF0CrYCaxxi2lRXbMEtcDshjOe1bdwhKcDPo7KCqlDA
         zscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pQI9bdN1g2JoaQkr8K3D+HL+V8zw0yXprj95djUxgSY=;
        b=1rGP9eLkcp52+jakoyCQvedCmMvcJU1fophF0qniriUXaSF5+Qd0EcDkJH5EP/vddc
         xWDzpmTUVsOurRhCuquJpt5HeVjYK2LNJLjV2uLQAaezLZqwAReLzcLcTbvfkTgY1w6L
         f1miNuGDZDkfBybhS5jsPoYWq2kkII6+PGNr+a+Ug/zjZD1bnUfTj+T4hEGRlXrh4gS8
         04gJu1j3WexZpFskBq0URjGzqGt9uuCn1c26FL++LAtCpUU41/sniUgiDcLax6M4W/zI
         jaYXIHxfNXZwjzZkMSaLOJoyysQcDGM0v6zwfRKbpm3vxEARGueq/euPh8z2jP2BV2aY
         CGiQ==
X-Gm-Message-State: AOAM530eYRbWr1hmUft9ZAUhocXLjJJz897+ocEmoJuU3MAPib8/1ZAC
	u0/kX25bKMqMVMY2Y8yu6fH0FX6si7+w6w==
X-Google-Smtp-Source: 
 ABdhPJxB/Baw1gqlVO4KVSsx59Xnyy9YhrUejty2XGJFseUou4EOJvFVV5LlpsX7RjmdgiFW3eU9dw==
X-Received: by 2002:a05:6a00:148d:b0:4cc:cb62:8e6f with SMTP id
 v13-20020a056a00148d00b004cccb628e6fmr10083650pfu.73.1646606120657;
        Sun, 06 Mar 2022 14:35:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm13502369pfh.83.2022.03.06.14.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 14:35:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/6] tepl: Check for x11 in distro features
Date: Sun,  6 Mar 2022 14:35:13 -0800
Message-Id: <20220306223516.504947-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306223516.504947-1-raj.khem@gmail.com>
References: <20220306223516.504947-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Mar 2022 22:35:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95824

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
index 0ac7e3693d..aa1f88655c 100644
--- a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
+++ b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
@@ -15,6 +15,9 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gettext features_check
 
+# for gtksourceview4
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[archive.sha256sum] = "a86397a895dca9c0de7a5ccb063bda8f7ef691cccb950ce2cfdee367903e7a63"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.35.1


