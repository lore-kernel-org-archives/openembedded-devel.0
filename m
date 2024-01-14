Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657E0C47077
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 07:20:26 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.34969.1705216822458323049
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Jan 2024 23:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HmWEH0Et;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so5983252a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Jan 2024 23:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705216821; x=1705821621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvKwggVmF9kk8k8FfGIUSgrB4BNZU3doYQMdO8OSRA8=;
        b=HmWEH0EtPDV+T0IHH+S22c3asf2fUUN1KLdq1LPFoEt4DZ1KZd59R00DNrjxNhweZd
         Cl8bloULB4OJLMA9efgHhrDxod0ilEQ85XZy3fpEAeCwlrWRvk5fYzIYWTRGRGBXBz5f
         M4HRMz3/BqYcLhVBkr3tELwIRqmoUfO3K8rD3IuLJ2hTiH4rwONMnZsW5VAmojGACzN+
         NlbI+1mOTacfGARXihEYwfWDTvPpRBPkTemHT78MXoQdGiseM39Ut7FEuFn9s3mep1W6
         Zp/XOuDHenxETxxzEa9WvNS2a1RywY20H7XKqqzO73L8PYD6z5835chhmnS1JvhwQKYH
         u2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705216821; x=1705821621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvKwggVmF9kk8k8FfGIUSgrB4BNZU3doYQMdO8OSRA8=;
        b=ElE6tOZ7GbVz3/dd4CctMsczePf0a/LoC+PH5hegHiAAnvgRavrtebW49eKXToiGnX
         aWbIB0m7mvu4I86DQwR0bOJflyqOokAMPCggNImPaqCovhI3eB1OA3OTaoAUKs69yeWN
         Fykys5fmOlBTd7AjnDpeurUDbfwteTwU9IWa8PO7xu/XYyq53CZ1otSaAUetilrQtusH
         9Sf8JlJ9m/tzD2i7FnSwd/vxdXDkIXg5J637gZWqgmznjTDlcr0/g7J2pFljrFafYO87
         PvFT2SPfx+jS/NYX88qBhvEMFvmaLTmppcHON7KxyBW9yrGbFwU8Y66LeEUCKD9VReyF
         S5oA==
X-Gm-Message-State: AOJu0YwCX/4dIScHXwSk7qP/vGlJ44MLwx68n+nBl7nlOuCgacayLJLw
	IxLRVoVgUgOZwfTQR2TUOhHKsSyxWszK/g==
X-Google-Smtp-Source: AGHT+IGmPdKVfhMTGtzI/DZ+tbHO5xKTje7tzm4LA5jVgT3n480+NJATgyAIUlKAwgpmpaAZevIF7g==
X-Received: by 2002:a05:6a20:9386:b0:199:a9b8:efee with SMTP id x6-20020a056a20938600b00199a9b8efeemr4667490pzh.82.1705216821589;
        Sat, 13 Jan 2024 23:20:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3648])
        by smtp.gmail.com with ESMTPSA id i63-20020a638742000000b005b458aa0541sm5864020pge.15.2024.01.13.23.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 23:20:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 5/5] gst-shark: inherit gtk-doc
Date: Sat, 13 Jan 2024 23:20:14 -0800
Message-ID: <20240114072014.601505-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240114072014.601505-1-raj.khem@gmail.com>
References: <20240114072014.601505-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 07:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108273

Recent changes to oe-core[1] mean that if a configure.ac uses gtk-doc
then gtkdocize will be called. This means that recipes that don't
inherit gtk-doc (to depend on gtk-doc-native) but don't explicitly
disable the use of gtkdocize will fail to configure.

Inheriting gtk-doc both solves the configure failure, and allows us to
build the API documentation.

[1] oe-core 891ec38d4c5cc5ac7bc34938276261ebd6f6d54e

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
index 8a839e0d10..dc43bed63b 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_0.8.1.bb
@@ -31,4 +31,4 @@ FILES:${PN} += "\
     ${libdir}/gstreamer-1.0/libgstsharktracers.la \
 "
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig gtk-doc
-- 
2.43.0


