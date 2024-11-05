Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD6FD2C139
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.19644.1730817435257345224
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HxSAgX/l;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e5e5c43497so44350277b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817434; x=1731422234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIlNNgBRocgotBiUEKVgP9T/nAqrdCMtK9K7U7tdgjs=;
        b=HxSAgX/lwC9HoTrcsLwmde9B7oJASBB5Sl38jyG34qteFV9VcafyhZq3BvvhTF49Rr
         Wbikzv+BsnYl9vuPSTAk4/CwDBsMI3FDnELXeaYb6+8x3wJgp9S+qb/hAGGEw4ZoqvEa
         HT3LjcUozOPT8c57FZFMBtTR1Nn1kT3ntwmsefTDEWJ58KhuHUpWi0qIUQadg73HdxZF
         wLB5QE0djCx5k/MZKeGHkFwNb/Owg6+5p9/c1sfJbxkQYKijdXeHN4Y4HxVPTx6rZKiS
         7C4eUtsoTuvl0wVsDTLYLoTKIIWp1x545vqa3aV7M51YMvH24yNhJQoAtLFqpdAjY6Oe
         Wpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817434; x=1731422234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIlNNgBRocgotBiUEKVgP9T/nAqrdCMtK9K7U7tdgjs=;
        b=M3G0Qw8T6ComhmUpNpVShWom3U881x1LkfTNu/nd2/Q2wi9AnN1uJxkv4yhn2ukwhY
         W4YFhz5ZDxKX3BxDHjE/fJTK/+ZI39qQjH2nmZhUxRN9rKhdbDxQRpIkzZi47t+uwK1y
         4I0vYUYHNkruEb8FVCa83mWJtHvb/G4TAxSmF+MQmxLvBjl5JU4BQCFo+SZESnhTokfz
         hwVz8o/XMqnO8AWzPUwwjtnpgsogcImWlkZ8fa+VIecbRFRSn3b2RXnw7WR/GlNIK+tW
         BcMKRSYQDDi3tIzi0MSv5HrTkvjL0WExIWIxdnCGJl+Pc6sRnRURtWWIHtEkbf2j1tgS
         +vyA==
X-Gm-Message-State: AOJu0YyVK/g77NTJ5MaYjLf4twOM6uPgAp0ajP6ruFCXB10gLAr9e4F1
	7HzC8k9qvm1Qj13vQcLVStD19VRxQDqJ1iNnP6D4+i3q2SToxkesUrMonQ==
X-Google-Smtp-Source: AGHT+IGqdeBxfqg4Bb8Lp4/6RhpiRTU5qx6/ZDxUQZgxEsMSSUytgPlxmqG/jrORwGmwfn894Xfw7w==
X-Received: by 2002:a05:690c:c94:b0:6ea:9d16:929a with SMTP id 00721157ae682-6ea9d172301mr77297667b3.4.1730817434220;
        Tue, 05 Nov 2024 06:37:14 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Valeria Petrov <valeria.petrov@spinetix.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 75/90] apache2: do not depend on zlib header and libs from host
Date: Tue,  5 Nov 2024 09:35:40 -0500
Message-ID: <20241105143638.2301245-76-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113493

From: Valeria Petrov <valeria.petrov@spinetix.com>

This commit modifies the PACKAGECONFIG entry for zlib to ensure that the
mod_deflate module is enabled with the appropriate zlib configuration.
By adding the --with-zlib=${STAGING_LIBDIR}/../ option, we direct the
configure script to use the zlib library from the staging directory
instead of relying on the host system's zlib installation.

Without that configure will search the host for zlib headers and lib.

This change resolves build failures related to zlib dependency when
mod_deflate is enabled and ensures a consistent build environment across
different host configurations.

Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ac5855c74d1cb2252efdb347969c450637f95c58)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index 364b4c674b..7d6ea27e7e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -50,7 +50,7 @@ SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
 PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
-PACKAGECONFIG[zlib] = "--enable-deflate,,zlib,zlib"
+PACKAGECONFIG[zlib] = "--enable-deflate --with-zlib=${STAGING_LIBDIR}/../,,zlib,zlib"
 
 CFLAGS:append = " -DPATH_MAX=4096"
 
-- 
2.43.0


