Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8A1EFCD90
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:32:34 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11124.1773052346853475838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MiSMmNTt;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8299f1ca894so1613739b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052346; x=1773657146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmux/C1WB1wVM1zcO+crcHvW9zTAZUMhvHbaVY9LbL0=;
        b=MiSMmNTtth+cjDcMlIsc8Qrf7qdkyNST38TRa9sLmmHkQO1S+fPg7vCdQKxfcTYAdg
         TYrIddmtrrayf80uuzfhF0AzygR+IMe8BJTkoFOt07gvh2T4FrFztBGX10g6oimWq5WJ
         yiDJXOP30ilx4IU/2keyN+KZOBih7V3RFeRqJ/kHZIKJTv/v+CY+2BhBBCR1PgHML4Mw
         R0kMDqoDiA/yEUZcwGRhs527Rj9381B10wpY/kS5liE551g2aLQi5q8bwEFc7B9dxs0S
         8d2lihfC0sTqub1n9XEGqNMHW+aTunuaDICI//x2W3B6ppv6OvmaYu20inJaFJlyAMGV
         oOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052346; x=1773657146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fmux/C1WB1wVM1zcO+crcHvW9zTAZUMhvHbaVY9LbL0=;
        b=pRZgvs8bBV9DGNcv4QH+Fa1ynsQDjMttwi/7kWlTMc/ydWWuySYkgYlHqKF00Y4caL
         dNhOROfjDYA6AtdYmJ3wHo50qD1AWU3JBDo839vTt5rSVaB5kQ4s7xPN8XLMGEBlNqVT
         W6sEg65Ufw6wiExksKNqzawRU4gjuIq55OstAlcrTPkJy3mxL6KYWWhetYjyS32tVpRE
         Zj5yu1cVxvU68gqn+1wQhJXY4kvKse1Foolnp2/DZEzG8zJXIaRCFqYQapEsgHzQ/sGh
         Zs3+uIpnl+AnaEp3j9SO0mcDCQXBWQK/rpWsmwBwL+IqnYBrkWrgJPf34mZJuf0MMnv/
         NSAQ==
X-Gm-Message-State: AOJu0YwulNofHthx6200+z1IBfvgvB7/xLkMknVXC0xRmIabs2K7oKvY
	iN9w0Gx+4Ku998iWKIYhveIAO79zNpMJqGbrWcucgoyWRUb15dHHWRbFD0s0eg==
X-Gm-Gg: ATEYQzwJdQZPPsFKJt38ToIE9tHs9ms64k8PNNM/D4xZMgSrs4LDW3Yi0KZE21z01xn
	sE+fTfIuWW2TKeEpVbzAxRNDOOoobNktaPm/jkRpO/daRlsESjYLgwDhJ50yC+JQAIFtGR9hzyo
	ebFxJTkZ8xlk2rn8j87yb3Ko2fJ8uh49IUTs6j//HyOjaeo7exfU4wsP4BFOKBz3qFSKIAkJxym
	AuWJDM+vMmfbqKjmGqQjaGf14Ze8BFYkEOnhlD4tL9p0N59vRx/JYGigJMqsdStXIoSpxCbBqCc
	aEE00PSA+iHRr2EWys6QBivzvmfZykg3LOmcZEws9wx+Yw/b10UreH90sd/bGLXBShj789+0lGt
	hKRYfkPeDpWvCLfTEwzXaJMmOawLg2A5V5RLt0VIZ1z3ChFyStBpFC8PAagc9D9bZTcy53qv1vz
	8oVhMsKXM1iMO0ClaJnbgm07KS/lo9aBRmRyo=
X-Received: by 2002:a05:6a00:7444:b0:829:95f6:7625 with SMTP id d2e1a72fcca58-829a2e15ab4mr7334747b3a.28.1773052346026;
        Mon, 09 Mar 2026 03:32:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a463a1adsm9877083b3a.11.2026.03.09.03.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:32:21 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 4/8] networkmanager: upgrade 1.52.0 -> 1.52.2
Date: Mon,  9 Mar 2026 23:31:49 +1300
Message-ID: <20260309103153.536284-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
References: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124990

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 14c9d10173aa57ab780bdcf83dbc8859f90291e4)

Release Notes:
https://github.com/NetworkManager/NetworkManager/blob/1.52.2/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{networkmanager_1.52.0.bb => networkmanager_1.52.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.52.0.bb => networkmanager_1.52.2.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.2.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.2.bb
index 5ff452bcf7..cafc6ce3f2 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.52.2.bb
@@ -38,14 +38,14 @@ DEPENDS:append:class-target = " bash-completion"
 inherit meson gettext update-rc.d systemd gobject-introspection update-alternatives upstream-version-is-even pkgconfig
 
 SRC_URI = " \
-    git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=main;tag=${PV} \
+    git://github.com/NetworkManager/NetworkManager.git;protocol=https;branch=nm-1-52;tag=${PV} \
     file://${BPN}.initd \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRCREV = "995a28fa1ccc54ad22e794294c3c6783cc3f30ed"
+SRCREV = "57a409441bef013f636ac8e72836c19ecb27c1b9"
 
 
 # ['auto', 'symlink', 'file', 'netconfig', 'resolvconf']

