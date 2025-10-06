Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD9FCAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:10 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.37398.1759765927350493177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h0xNa3xc;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-77fac63ba26so25258127b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765926; x=1760370726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjY6iID3uhm1i5FUOJX8CzD9vIrImQ2GWo56RRLeZTQ=;
        b=h0xNa3xcYlJexyQ920Wo2RYYE54FzkJu6azVBxbr3fAJp7edfZ0c3NmDsCJoOQ8MMN
         kwhD1sZs6H92DVSoZetT+NabkRmF0BtK/CPPEM7WOQy7Mdcz4eB7ZPNjpQLKUayLK7sZ
         dl9L2GaB1XL5VVfkeggcMVbcS4H7DiKE9EaUDSwVK9laT0/g4a6NGmU76J3rOny6Nd8v
         2STP5UrsBDJnG1dHIsw3ujv4eouCUOFmrsyiVRhSRm7LxWJVFfBlYMMJT+Hrd8ie8noN
         6BcuGerzrziGHIA+GS0rX+a5o4f8pHecDNxp6ArDjueGZM+EYM+9LuQ3geKkJEtstJqo
         Nhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765926; x=1760370726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjY6iID3uhm1i5FUOJX8CzD9vIrImQ2GWo56RRLeZTQ=;
        b=lBH0HIOmUfONcPWvSFCMI3d1x0M9D/8tX/aoM0e6dbOA02z1oE8FOrj3zmGTKThPgr
         owuHziW6VxSEvOIUf72FeqFqFzkmo1JphAX2V3l6FVRGemuFInbODTe7eoSBugKFQuyA
         MlYw5jcZZwyfB8hBh7aeXP6WL3ZEWM8dnVZj/79RvDSWUxIeJojKEFUxSMk1eeCv4A+F
         uFz3hDtzsR62uiVE/QjmAsIAmzTJ1EB2M6/gSu8AsUfEPivMYaRLxnhdN1amohO3yDiJ
         9meL4r+FC+FZsX1x62H/jkgO+3uQ/mM87Ty/xbLRRhz0ex76BaEhGEs/ei6bCwJLnC65
         kX7A==
X-Gm-Message-State: AOJu0Yx5Bl8mCgjzO64qCUZde3NVxxH+RcV3Kvam0d3UV8MOA4uYseBP
	9AXeKgVUyBLWmgp7yXxM6JyocLZRdqSb1GOExaC3lYp/DwN++tlndKN2ApZ/g1tJ
X-Gm-Gg: ASbGncu5Pi4Dr7+Ev5VoCtz0KwzPgZbgYwaLRXYBDK0oUZRdkRefrcX3YtGeds8vw0x
	Ip32ZwOYjyK7yqZSCy2nzQs/6LDpDdZS1ybG9qX6bO1Rij1L3MOQSmHtlcX/YFNCR7L77Bigx+V
	qpGUUxCS0MoPEP1CGrwReNy4WoONQB+sr8EntQRYIxDs2eeId9gHLmNfltty3BRHgNovxbjS4M2
	K3muHFOlfFHQaqiRBAj/cOP7bakPFJKP64eFoXb779iLIVFkUaedwSlfKeJ0tOp1Z6FWKhL4jXA
	wGo/yrgrrjQfX5kRI2yZwbaAIlDj2YlwZfgzIMFQSrUV07rMh8TvZ3RBq2MUTx5X1tS8AocThGq
	2zT+Kfd8n3iDge/8Azsokrr+S76axID3eJf+QqfSOXT0byKJB9xwhqObJ1Biu16U=
X-Google-Smtp-Source: AGHT+IF1r2AGHHDZn+CzxWTsEY5bogjnY3Ur/lVDyycDq4FjG0vpbLWP8CSNWuN24xR73WuXd07OQA==
X-Received: by 2002:a05:690c:a87:b0:731:1bc7:7830 with SMTP id 00721157ae682-77f945d52demr171242587b3.23.1759765925903;
        Mon, 06 Oct 2025 08:52:05 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:52:05 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 04/10] xfce4-smartbookmark-plugin: upgrade 0.5.3 -> 0.6.0
Date: Mon,  6 Oct 2025 11:51:40 -0400
Message-ID: <20251006155146.416335-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006155146.416335-1-schonm@gmail.com>
References: <20251006155146.416335-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120295

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-smartbookmark-plugin/-/tags/xfce4-smartbookmark-plugin-0.6.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...rk-plugin_0.5.3.bb => xfce4-smartbookmark-plugin_0.6.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/smartbookmark/{xfce4-smartbookmark-plugin_0.5.3.bb => xfce4-smartbookmark-plugin_0.6.0.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.3.bb b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.6.0.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.3.bb
rename to meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.6.0.bb
index 18083ec697..3b32b523c2 100644
--- a/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.5.3.bb
+++ b/meta-xfce/recipes-panel-plugins/smartbookmark/xfce4-smartbookmark-plugin_0.6.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-smartbookmark-plugin/start
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "3b4db0ac198339197a7682935f0bba5a7e8dd7f35bf575ac6665afa4cecec236"
+SRC_URI[sha256sum] = "d8a619dcad703071f7fcda538cc34154f9952cf4ec0816df23a56e98e3cc05d8"
-- 
2.43.0


