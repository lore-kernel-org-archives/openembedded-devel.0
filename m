Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157EECAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:00 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.37389.1759765919426926518
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j/UWeMEw;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d60501806so56603507b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765918; x=1760370718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nh1zMLoec0Ehxr0eB34G//efTn+Tf4f6Sde2Sre8oec=;
        b=j/UWeMEwt0JOPjQoh1vK3oBhhk4p1QKq7iNSj6p77K3yeVtz1vmSctal5nLeJ6RRBu
         0iD40g7r7+HDfD+wNPkV1DxMLozU70aVJR3OdBYeew2miyjGBiLdXzSw4CYdLJZxn0UZ
         1rSW0XLIeJnin4+0LlOzz9yH3QSLlRmSjbl4oOrjotIJFbE7qOIyalmEQMcSl80RKrY3
         KiCVCdP+a77YUNn26cBJ+DTfFkS5A6I2iEYX3X+9tkgDQXTlSbNmx9KNIKh4KVt0o4sb
         YzalDkmaw5OMPZ7rWGTtmX4PgXWqq3Iaur9mKhQ8XyxQmbM/1TELv3IRfDzXykp73xJ6
         /c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765918; x=1760370718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nh1zMLoec0Ehxr0eB34G//efTn+Tf4f6Sde2Sre8oec=;
        b=nANVUldTUwphTfa8s5PxYc3gJ50cLyd11Pww29ZiNqxmbc5FeYWUWWMqAfTEn3h2qB
         EDlw4RybDekl057CO267FXYQG/I40CIdZgIMsi+dfFuvv/lx1VxKqQHT0jXhHKwQgfSo
         LulcjCj79uTkGAbwuqCFeiE/juxUAYyqgi6uedZYh5rGzFqrukSBoWjjyrRIjpomS/5z
         jbVzWanXUh4GAkmvY6CNhAJv1S+VDw8OqdIIFF0hP1miqwFUXi7ANcjIhRuXH2BPCahp
         chjN4ywG7bnxuovZjQseXwDq39V7vA50DSJP2aFYE+1DScrclo2gKAqlTWKC/WbdsQuJ
         HVqw==
X-Gm-Message-State: AOJu0Yy2FVxy5aGu8zJXEVGTfeccatf5KoKeQFrsePmkJ9SDk5hQmpSw
	tj6IpW9aTlWU25tEsHLkm0590PmTb6SRb+vCbRS9Dn6Ur9mTOUgYuFRSjN4ydRYk
X-Gm-Gg: ASbGncscQ0IchH2hw2SI8i1V6zwTr987AImKHc1RspTdt6PnAfDuLCofwbMDhQjMCBC
	VABsFkpYsaSeQhrpCEB2FrPYCchYybbcPSDzEgw7pXTsPbqV7bpJa7DCKaWuSuQzu6NCfgC/5sl
	7KG1fpdsYIp5bnq+EW00gRFm7ENdIGkl3lGkIlzKEaI+icX82V0l94lm2r/iaaWFyAtbtwgDrX2
	tWb7u5OlgJlzseqHrzH6XLS+v5yz65zX9xsyBDfRJHIS2DUaMG8Xu0vhKkCkk/hFy5Tz9gTXpi0
	zMIJkxuv2uqFK+lx/wPENtTJ0Y1ReL4Zsrp71WgovSFLlcl3T1hoEVxdGhPGjm1+Gpr1X/juCv9
	+PSEd2/eS+oy3AdNkLEQZG8SDSVvLXOD3IUDEohJXzv7MvNN94M18dwpnl0ku+uE=
X-Google-Smtp-Source: AGHT+IG74SThiYNXbKyZcPeDi8KYppRE2Qouwg2axs+dMEpEq8erlp7Xy/FslgHdZ83eW+lTWJ/QwQ==
X-Received: by 2002:a05:690c:4508:b0:77f:77fe:fb33 with SMTP id 00721157ae682-77f945ffe51mr154285347b3.17.1759765917992;
        Mon, 06 Oct 2025 08:51:57 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:51:57 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 01/10] xfce4-netload-plugin: upgrade 1.4.2 -> 1.5.0
Date: Mon,  6 Oct 2025 11:51:37 -0400
Message-ID: <20251006155146.416335-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120292

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-netload-plugin/-/tags/xfce4-netload-plugin-1.5.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...etload-plugin_1.4.2.bb => xfce4-netload-plugin_1.5.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.4.2.bb => xfce4-netload-plugin_1.5.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.2.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.5.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.2.bb
rename to meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.5.0.bb
index 3c113290fd..d54e3b1bd1 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.5.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-netload-plugin/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b6065ae7d3696cdad6869dd8627a9fe"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "a2041338408b2670f8debe57fcec6af539f704659eba853943c1524936ebabeb"
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
+SRC_URI[sha256sum] = "a868be8f73e8396c2d61903d46646993c5130d16ded71ddb5da9088abf7cb7ba"
-- 
2.43.0


