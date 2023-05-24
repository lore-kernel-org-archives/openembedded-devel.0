Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F31AC77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 23:27:35 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.415.1684970847224758729
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 16:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bPg3tzI+;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64d2ca9ef0cso1169142b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 16:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684970846; x=1687562846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydQMj7bmwc8O/SpDC1MbtvnrzjKeWYXzibfiJvd46hE=;
        b=bPg3tzI+dQAAyHDu515dHVv974XjQ5QR0+OxPAtgoBfM2XbaoNre0oxBYgQ/40d5Ia
         P3SKs1gtEvgBV/nMzpf6TMkIBClV0exDELMRce9m0Vo33TdtEqM9m6nTKhR/iOITw3jk
         FaX7r7aD9a+23pOgGzLF3MVibUzc2yiWUJpdJUY6rBqpovdI5v3Y2Lo7W2IuUoF1pQhW
         RgSDimJR+N1bkRiFCpPLs5AofUikmdhe2fCH+S7h7OgNF4E5HFQZIlc2ryqw/AS+K3oc
         1XV12qq1j6w6kcc25DhuOAb7O2FgAafVG1W2QYhtybElfeYQ43LBen+TaPRGR54eNxb+
         MJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684970846; x=1687562846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydQMj7bmwc8O/SpDC1MbtvnrzjKeWYXzibfiJvd46hE=;
        b=MeaA86t3mFoY7kuznEYmEldytDMdcg2ZWFlkrOdCN5N54ZWQf5QPHwq6bDK2zYIbhJ
         abWKX3CANM5KpU3uAXi0tsuG2CDJRr1ty0E21mJty+A4eF6e8rqJ0iWRxWJDLTZAXTAp
         1VYTyPIymX1FK21L/Tn1Mft12sgYcS2oId9S6Vj2tdCc4mgcueI6e1d1y/MjoRD+n5Pl
         2RdlhUejxIwMvBELWxmbOrD2oO5mtBVLfqtI8TCZCjN43vV0+phA0mMGH7UwYuWQLl//
         c1BYPCE4u5dGMl3O5lRcd4KZFIJz4gbgXBF6Q8gbL4GPcVm8KeN8Phjvd03Lea6/ETpA
         D0JQ==
X-Gm-Message-State: AC+VfDynOo7n8IjQ1Izn5Bfm0ilRAXTZCsasJPKLLm1mfWmUC6VB4ZyM
	w1evgcSfUONfmBgSlPrMp/dGbC50Uvk=
X-Google-Smtp-Source: ACHHUZ7kA7IR5t7fmF0P2M3/1KkpRv3W6vfYwhgYJXGeH32GXovmToAESkjomzlLvZqkAPt8ApVFbg==
X-Received: by 2002:a05:6a20:d80d:b0:103:ee82:dcb0 with SMTP id iv13-20020a056a20d80d00b00103ee82dcb0mr20969165pzb.13.1684970846321;
        Wed, 24 May 2023 16:27:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id h22-20020a17090aa89600b0025315f7fef7sm1806013pjq.33.2023.05.24.16.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 16:27:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] system-config-printer: Check for gobject-introspection as well in distro features
Date: Wed, 24 May 2023 16:27:22 -0700
Message-Id: <20230524232723.869580-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524232723.869580-1-raj.khem@gmail.com>
References: <20230524232723.869580-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 23:27:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102797

firewalld is only enabled when gobject-introspection is in distro
features which is required package to build system-config-printer

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../system-config-printer/system-config-printer_1.5.18.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
index f0ff24f376..b636ad079a 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-config-printer/system-config-printer_1.5.18.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools gettext pkgconfig python3native features_check
 
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data gobject-introspection"
 
 DEPENDS = "cups glib-2.0 libusb xmlto-native desktop-file-utils-native autoconf-archive-native"
 
-- 
2.40.1


