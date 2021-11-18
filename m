Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB36C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 02:59:02 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web09.233.1637204342187289179
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 18:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SOgm/nhZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 7so10926741oip.12
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 18:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sy68jA3ND1975U4xcxiWsaE/6XUyYaX3DREKcTyiuMU=;
        b=SOgm/nhZGJzBeknOVjs/rll9yIPp1PdIYgZPtHNaQfBuy7nhbHd9MbOFgOTGlEXvhE
         YA9/IdxxXiXMfcSqYA/1wJBWHcAHbMhbJ8QCtgbDTN9/GkVmzRf9zwa1iOapmfi3Gkod
         a8JbK0l5gnaszp22Cx9RfkPSW4BevFoveyjsQgnE1v8QuIZOxzE0i+o0qcZ2hGBDFPkS
         OorNpZXS8s+5CVUPpFf+EVDee/yQGTgTgbklobZNv+5Jt0pXdqEFhYXx1JFxZiZ5Ha4Z
         /5PBXMjyFw41jLklTqRT+Mj1VbMOHmPlTmRlurRE84UKEfnH8nM3tXeqQKc1mO8fyk4P
         tmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sy68jA3ND1975U4xcxiWsaE/6XUyYaX3DREKcTyiuMU=;
        b=XHtZMg7iJkqUvwP7Qvyrs7gNCf7XeEL2ehFKzqgt1Jx1fjdZFLs7JpApk/N3TtOBhm
         UMnuoqICi4WoWa9SOSr4hTNR05MMapVPgkMzpdwppwM/aoTlx9JxnyvdDJwgrz4uUZlc
         3A/Xl2bOEsFLW5c3iZJKL+PxbrvxWo+BlTwp3HNp/krHXK7gK0v824sHArxctw4Bulvh
         Z+TCtelWPdZ23vjFvqT5tTAHi8CLULq+gvrIegb2xdwep/+Olgav4bfJZMHhD+CLXTLJ
         vJGz3xIJK14AhKoaFBTh6TNQitofQMymuQY2AGSenRjKO5Hh53bi6VzImdr9b12IyIrK
         rpAQ==
X-Gm-Message-State: AOAM533yTLdUxMORzrJbPOsamAvcPGZ4Chx8LelviwlFPjsz1kCXv2Sr
	zzIySZJ2u27lA4CZ+cylp74kFC9jNIk=
X-Google-Smtp-Source: 
 ABdhPJyhiN/ZpI56Z21rAViZR/gsmp3/xUznwHXcm+kSbGVW0Rtb+uCvzNTJWdCWe8QYI/jjy34aXw==
X-Received: by 2002:a05:6808:2216:: with SMTP id
 bd22mr4575495oib.27.1637204341268;
        Wed, 17 Nov 2021 18:59:01 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id 3sm428921oif.12.2021.11.17.18.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 18:59:00 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] gnome-shell: introspection is not valid meson
 option
Date: Wed, 17 Nov 2021 20:58:56 -0600
Message-Id: <20211118025856.478690-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 02:59:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94015

meson 0.60+ errors out on unknown options and -Dintrospection
is not a valid option

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.0.bb
index 6ac2973b9..8378e9478 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.0.bb
@@ -25,10 +25,10 @@ DEPENDS = " \
 "
 
 GTKDOC_MESON_OPTION = "gtk_doc"
+GIR_MESON_OPTION = ""
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST:append = " introspection"
 
 SRC_URI[archive.sha256sum] = "52f971e85140e5de74b9369ef6656e49ce95af1f232fc1e0df1f046129ab4f65"
 SRC_URI += "file://0001-Introduce-options-gjs_path-to-optionally-set-path-to.patch"
-- 
2.33.0


