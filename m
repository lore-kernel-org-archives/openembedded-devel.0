Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23AFC54E49
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 18:51:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.2982.1708714283239080873
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Feb 2024 10:51:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KXTfuSeh;
 spf=pass (domain: konsulko.com, ip: 209.85.215.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so939210a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1708714282; x=1709319082; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVjdWenm+Sz6c5vOfbHHe/DUhLUCq8wgTdSN3u61NZ0=;
        b=KXTfuSehyw3EUBc2fN6aKWLItJlo2L0IEan+x48Jn0kIL1gXjWn7qi/UVZaHtCBzkx
         UI4huVPxEx0n4yanj7YTRTNVj2NXxLnpnTShlqT9ZGZGVc+HNw2S+4KmiEQm1knv9Mwo
         WYuEoxQ9rBqhha6jJt60cmz1TPdPWOnEQZgA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708714282; x=1709319082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVjdWenm+Sz6c5vOfbHHe/DUhLUCq8wgTdSN3u61NZ0=;
        b=gi23ECAST9ueAfdxk+O8raj2tjcO7zBwhnYU7E+GprRQGQlNf8r1ljtgD/2ak68IV7
         zm48UxiYz6/1wBnPBgGGriA66XpOgjl3cO2ovMWl6fZq+JdZN9rtoN+yIHmx7ayT9gHj
         NkYnLqdfH3DT7BmNZkYjOedafoL6EPTiS/24g9l3PDM0ZoJau61tAe0P8/kIONZybS3U
         wMRsxnEFIakblNpO1DyfkK3jyoZDUW4I7dJ+o+z330eRD7QURxXHrVAxFscEFjdZicDX
         1D40w5Aw2Jw3oH4y+ef8ZcJFnc5tNO7WkxsdwwxSz6wVyA29653DSMJiUgKTr7V62I3d
         Nn1Q==
X-Gm-Message-State: AOJu0YzMk1y4g5dWxdNRcKVcBrpt8YHPAMjM5sYbWNJkOFbyyJ8+naqs
	O7CPGIHwbw7CanOnYNl5zA0UVQ4PQyNEhunuvqhQeRiIu+8J++bANwVfXf3XncyqhpGL8DyicuO
	s3Mo=
X-Google-Smtp-Source: AGHT+IEvTTbTwdrYPlq8hpDh3l08MWyLbeR8Vy68QovWWE3Cm6Pl7e2ZUJSCToOrf+j0Y6LCT73jaA==
X-Received: by 2002:a17:902:6504:b0:1d9:bf6a:cffa with SMTP id b4-20020a170902650400b001d9bf6acffamr738635plk.45.1708714281891;
        Fri, 23 Feb 2024 10:51:21 -0800 (PST)
Received: from localhost ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001d8e41b3f95sm12321765pln.51.2024.02.23.10.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 10:51:20 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH 2/2] libencode-locale-perl: drop recipe
Date: Fri, 23 Feb 2024 10:51:06 -0800
Message-Id: <20240223185106.2357468-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223185106.2357468-1-tim.orling@konsulko.com>
References: <20240223185106.2357468-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Feb 2024 18:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109017

The upstream has not been touched since 2015, when this recipe was added.
https://metacpan.org/pod/Encode::Locale

There are no other recipes in meta-openembedded which depend on this recipe
and it is the only recipe that depends on the now dropped libencode-perl
recipe.

My original reason for contributing this recipe is long gone.
If someone continues to need this recipe, please submit it again, but
refactor it to use perl-module-encode(-*) for its RDEPENDS.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../libencode/libencode-locale-perl_1.05.bb   | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb

diff --git a/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb b/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
deleted file mode 100644
index 8c31f29b63..0000000000
--- a/meta-perl/recipes-perl/libencode/libencode-locale-perl_1.05.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Encode::Locale - Determine the locale encoding"
-HOMEPAGE = "https://metacpan.org/module/Encode::Locale"
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://README;md5=14e8006c2134045725fd81292a323d24"
-
-SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/Encode-Locale-${PV}.tar.gz"
-SRC_URI[md5sum] = "fcfdb8e4ee34bcf62aed429b4a23db27"
-SRC_URI[sha256sum] = "176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1"
-
-S = "${WORKDIR}/Encode-Locale-${PV}"
-
-inherit cpan
-
-RDEPENDS:${PN} += "libencode-perl \
-                   libencode-alias-perl \
-                   perl-module-base \
-"
-
-BBCLASSEXTEND = "native"
-- 
2.34.1


