Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63DCE6918A
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 19:01:37 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.32257.1732302094571672005
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 11:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mg9yyOo+;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ea2dd09971so2095880a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 11:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732302094; x=1732906894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YKG5AZI/SC5T8tVoXd+7sUZ66QZFBOdDanGcV4fazyY=;
        b=mg9yyOo+WpUp22yLKUB9WYy6zzPFt5zEAxYHN2v10yOwJQVTjS0vJ+DUZQ54kQWtkw
         mXpsAy5Lpls79MqTl5rkGA9OF044j/zvcuEmRjOASjXl5YCezH67Ri0zduK4GW++MaUh
         OHh+YinUoCAFftXT1Ag97WXV0fD3Rt+xIi9AssVhwmPSM+zAz92HWWnYQhv6vYGgJb3m
         FB1u1S5CJQYvcl1yGYmNqMPzzRiaakPhwoKFnFPkE6kGFy9+6qm4bi7+C3Gl06/5OVcg
         VX+im6ovgADNqENbgp94To2Nw+UpwjduJe0wosk+AZ2AxhvjnpEuvxolaVYxP7wIHiMd
         Z12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732302094; x=1732906894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YKG5AZI/SC5T8tVoXd+7sUZ66QZFBOdDanGcV4fazyY=;
        b=eMTpCGzzU0qqd+3Czjc43opqMk2p5YtlQAUwD6oOu5XBXbd9e4r4cjtfufBpMHNyNA
         VpRX11wCPZZCLUgZda2N89y0GHUVMdYVXHyFHTmx/gPGFVseF4MO6SLK1qVnH5uZOxei
         qRlUG6VnxFXGYgYG2Z9yaRXK5ZF6ErCgZxj0lakXWXuPvnLTLGg+IZUYitVs6hF2dlJe
         tQ0EGwoJ8hChxqRnlpkghhM04sntRhNqHI354SY5YKpXGw3xn/F0osfOoQFjLW54bU3b
         6n28n74wjv009Wi16mykgQAEeGl9eT94B5j5DtCIwQkNB2C8PXcpabQQ1MxadkWFh7x1
         QODg==
X-Gm-Message-State: AOJu0Yy+OPOp2fxYQeuu0mx/Uznn6XAx8IMECgCHcnbP3cZEt6I+mB9/
	LP1O8dBPEMNnfPmEq4eVPXrvJqcVkRMlLeNfrEA418Woim1DLm5bkdGMtw==
X-Gm-Gg: ASbGnct5z0ImLeJ8VMGOjT98A5WYdUwlBuR1lYFFrmzrOyrdHqB+pwGSIr9tshKy7QK
	LqIYqZXkAfgz8X/t84QzpcefAifCbsjp69weVbpjAHa69k01wJD3NbPAVCynHJRKEQngT/nf5Xv
	NLsCSMaQ9945iykmb2pmcWYywYp4UkW5cEEQ4Bx2rMZU+HTI8cm4vo3rHkQxttuY2Wx4OByWY4+
	tuY6zjAj/C8xZv74iUIZUje3oS+0bG3uM6DQIb5hwuPuYI3IGI=
X-Google-Smtp-Source: AGHT+IED1Q2jwNiORk8TikyoF0v19ZlPmF3nf4NeMg/UG0ohtzS9XD0x54Foh2UqchueDF6T3L97qA==
X-Received: by 2002:a17:90b:1b46:b0:2ea:5fed:4a2b with SMTP id 98e67ed59e1d1-2eb0e2303e4mr5049188a91.15.1732302093720;
        Fri, 22 Nov 2024 11:01:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead04d2cf6sm5500166a91.37.2024.11.22.11.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 11:01:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/4] libdex: Link with libucontext on musl
Date: Fri, 22 Nov 2024 11:01:28 -0800
Message-ID: <20241122190131.2810521-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 19:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114006

Fixes errors like below

x86_64-yoe-linux-musl-ld.lld: error: undefined symbol: getcontext

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb b/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb
index 1648639c3e..3ed2f6ccb3 100644
--- a/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb
+++ b/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb
@@ -7,6 +7,9 @@ inherit features_check gnomebase upstream-version-is-even gobject-introspection
 DEPENDS += " \
     glib-2.0 \
 "
+DEPENDS:append:libc-musl = " libucontext"
+
+LDFLAGS:append:libc-musl = " -lucontext"
 
 SRC_URI[archive.sha256sum] = "955475ad3e43aabd6f6f70435264b5ee77bd265bd95545211fee026b08d378a0"
 

