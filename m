Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70551C83F24
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 17:26:57 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.40755.1752341216000288267
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 10:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JtpcxB+d;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so2562548a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 10:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752341215; x=1752946015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUx4Qx/wjjbV7F4o03V3vJGd30v2X77lE5HCjX3mDuo=;
        b=JtpcxB+dJXUy0/VVpUxAWBDkwwNqe1I+gJPLuoQIsBArYT6YKJNQ/uO/Kkw2gOKy0y
         TAT0Fi8AaSrqYl6QYxl3JqacqrpkCcMdNZa37t6M10S2E3pYZQE8mZavMRkdqjNzTHPw
         TfrNSREGLqXWuRQcQDVvJDq0LyF8Z5DqYC/eu0UBYdBD79WnBTPz5SOG+jnuJBTvjPEP
         6TlQXi6gF7YTAYurPPHzeqAQHT82ZCHZ8878/1PRcg2+VVW27y5WnqEUBTF+HquWaqzu
         xvOD9qYCLEhV6foXSVlsM+Q+0MewQLPnh9vBEecXy8tAjCajuDy5IgqaNXr1IVHrk/2i
         y/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752341215; x=1752946015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUx4Qx/wjjbV7F4o03V3vJGd30v2X77lE5HCjX3mDuo=;
        b=Lnjr90JLvyFIePoPxv+X6lhfYpZS7rWaX+IbsxZeYAbnqVkYZkX83LSqrBJc+eDXRu
         sAvAUqYwIi/aTO3fFO4EegUb9eN3TXW0MG38FwUzrpGgt6eqiLhs/QqDhlclNJPKCab5
         yBeNEQpuTw1zFgYKmTTnkEu39dEIs0fPf8X8fud2B9i+OW1d2+UgCnHLxISWrOAX8Bnf
         esLr0hrfix2Sz4+oOejZlboz+rrmwYre4B5ktHfdNhXjnIMLPs6uIWV4W3IsQ5N0RHLb
         PTRIShRMINMMHK0BEG5U1xmiSk8/nfVTIJr0ZKwAooeFlLuHykMRSrYbttYOTzLpxuta
         1RRg==
X-Gm-Message-State: AOJu0YyblWzT1WUBHPgrlqd/t63PHoC+rEmU82DikABCZ4Hzw3VXpo6C
	cSCAQRKpVXrPYfn9fRwfUqF7b62MQ4bpofnQswOgLH5MB+l2ThqX3PG7/4dLd1EF
X-Gm-Gg: ASbGncv03FJMTdWP9wQBdkWE5QR9VK8FCG/3EqcadpjjizE+5N/I/gVZLMJba8WKbEa
	7L+9t9HKwghL4fyP+XevBDzv9dwp5y6Fh2iugaEdnrFZirPs3QN9mxhTyrOe1wljXMwQ/zz9L4H
	42PixY2u1Sy87E+ccxhIekELgJ7+qTNCQXZQ/7KLfWo0b2FlT7Ka0MND3z5wENUicM5RSD31r1N
	ry4Hy0RBz4a0QU093+AIfN4QGwPNYdJbmITd3MJhorErOD7i1fKTk35RGxlWzmeq/OICImzJt0O
	kKCHOgM2SLYRAF7HfBrlAZIOjec2U4PkrZNvecF4lrk4WAqahueGmPavTlaJx/01Mil5N7ex+oJ
	9n3USHGWj8Nn5DA==
X-Google-Smtp-Source: AGHT+IG27XFTf+/HUzFlT7LqOHgkz2EZltgXo7b1MH42196gLMQCpgBRMOeDrwHWs8OZ7l1jjk9hlA==
X-Received: by 2002:a17:90b:1643:b0:311:9c9a:58d7 with SMTP id 98e67ed59e1d1-31c4ccdcce7mr11266530a91.19.1752341215018;
        Sat, 12 Jul 2025 10:26:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435c2e3sm67021875ad.226.2025.07.12.10.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 10:26:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH v2 6/6] xfce4-whiskermenu-plugin: Upgrade to 2.10.1 release
Date: Sat, 12 Jul 2025 10:26:46 -0700
Message-ID: <20250712172646.3899204-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712172646.3899204-1-raj.khem@gmail.com>
References: <20250712172646.3899204-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 17:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118484

Use meson for building

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nu-plugin_2.7.1.bb => xfce4-whiskermenu-plugin_2.10.0.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.7.1.bb => xfce4-whiskermenu-plugin_2.10.0.bb} (63%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.10.0.bb
similarity index 63%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.10.0.bb
index 3dfc76f246..59f4bc9203 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.7.1.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.10.0.bb
@@ -3,6 +3,9 @@ HOMEPAGE = "http://gottcode.org/xfce4-whiskermenu-plugin/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce-panel-plugin cmake
 
-SRC_URI[sha256sum] = "04ae0c1764a0d5ec70f18a760d998a2109bb6724f048554d7d6999d9072ca63e"
+SRC_URI[sha256sum] = "c2efb3782816d44d421dcbee2900b9513bdb2469b695b776641f495601f33a10"

