Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25BDC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Oct 2022 06:30:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.2704.1665037848423486969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 23:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=FaW4QqlV;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.50,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f50.google.com with SMTP id u10so1087965wrq.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 23:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi5OcRe4grGpfYN5j7MTwivt8GKjfzkHeKXOh7z3qRk=;
        b=FaW4QqlVlxq772ruI++A/5nofUgJCt4pYrQnDQ8Zekyu/KyI+L6LTmLktCaSW1FQRX
         RsvmRXk1gkdlVqT3d5mpsPOsMmSFC2l2O9Dx3H/hBuZErnvGRBE1rGO8SBfJOIvSFN+l
         qT4vqVpiLSt5dz1CemUZhySkpaoIwsx81L3P8IFNtk2796XkqByaWyeBTnXTEZ0r2/Q+
         GkUKgskOu4xIsO9DSnVICr6Fag2pTS2tQyVN8lY91nn27Ntern0bvUyCX6PWToQSjJX0
         96DG+wlZBuGPQjj0ODaJRST+cM2suDgnmvH6pW4G73v1cP1OfOQuLqgAx5Ow8lM028tw
         UKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xi5OcRe4grGpfYN5j7MTwivt8GKjfzkHeKXOh7z3qRk=;
        b=wABqTza03WM3vOKglfjjhHvV6Aq+v5OU3w4wELjVqiPPOdli9jHb7GvTNPfgx3PhRl
         i7GPsJh7D7TwuHv4FQ1ZfyneMJn2MgjxJ0S9QtX1V5MhJW9l3OJX32dKeGBsNNKGSor8
         CYH0ziLUDyVEHaHW18PovJG5Iva+sHTl501h1unTjEk9mNUqHEe5lFQxwupqQM7+M03D
         fE8g/bDb2e1ygsjhkU3Pkj7VbOh2IlJXGMn3/9KY1D99nlFl/3qBit43uGSNK4rbxdNm
         Ju8UxJ1J2jyDjHnQdNOek+BDXb6A3TZHHZhIuAjlk5Bim+Cllcj9j9VZsTTDoDgir3QM
         aMRg==
X-Gm-Message-State: ACrzQf3bUKNH7iP4nz2KFJ6n5TpyWbpKM3HrbeHaM4lmm2W1Q/5suStY
	UaIrs+WPyIomi9S3fCydGdV1raq6J20u7y+jexI=
X-Google-Smtp-Source: 
 AMsMyM4OVLuWClQt3B8pzeChC8F8F3PpRqhGitKFxGZJWf0GzJB4J2G9apGHgaYMLvh76cs/6o0g8w==
X-Received: by 2002:adf:e491:0:b0:22e:4483:a8b5 with SMTP id
 i17-20020adfe491000000b0022e4483a8b5mr1947203wrm.497.1665037846528;
        Wed, 05 Oct 2022 23:30:46 -0700 (PDT)
Received: from WIPC21110265.. ([2a01:e0a:9a8:8b40:213:826e:4a1f:8fcd])
        by smtp.gmail.com with ESMTPSA id
 j13-20020a5d452d000000b00228a6ce17b4sm16692091wra.37.2022.10.05.23.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 23:30:45 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [meta-networking][dunfell][PATCH] networkmanager: Update to 1.22.16
Date: Thu,  6 Oct 2022 08:30:12 +0200
Message-Id: <20221006063011.403521-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <171B66FE8D4A9B62.3545@lists.openembedded.org>
References: <171B66FE8D4A9B62.3545@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Oct 2022 06:30:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99075

Update network manager stable branch to last version, allowing to fix
CVE-2020-10754.

Signed-off-by: Mathieu Dubois-Briand <mbriand@witekio.com>
---
 .../{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
index 33a2b7c0ce93..a28372dd1f9e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
@@ -33,11 +33,12 @@ SRC_URI_append_libc-musl = " \
     file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
     file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
 "
-SRC_URI[sha256sum] = "2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77"
+SRC_URI[sha256sum] = "377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd4ad72425a68982cffc6"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
 EXTRA_OECONF = " \
+    --disable-firewalld-zone \
     --disable-ifcfg-rh \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
-- 
2.34.1


