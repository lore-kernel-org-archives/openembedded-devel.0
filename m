Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329DDCAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.14126.1758625608963684360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B1fL02Kr;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b2e66a300cbso301355766b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625607; x=1759230407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjPmQ50PuEld4YJdz+btLObmQrEUPOb/PZT2fqIuXdk=;
        b=B1fL02KrPQXNwLMNe1PXd3NiKkFqEZ/+Iflkq/3J782hvQRmG6nEvAhJTIHUhStdsx
         q/TBqqbXkmktJAy02/mGdOFFRQUaFrGShT1QsdtX5GDHqanNE7AfdMa5OL/7hPoYmSdA
         1gdrwHLGm1jEnIRVP0hq+eSLw4aB04qY82VgXSS2CHv+8rRPiTnHDgYb1jpaC96vqd4O
         y3+oWcW04X0IrmKiNE+20EACp2ZBB3dmAmR1/NyigZjn1Tq9KHGFRVb24r8rNC1dJyJj
         xjCxdxkTxg1gsK1L4w7SXWWh7lvS1L2kRUgKlBYkVR2qz2j4k6HaxcGRagwZemjOBdFV
         42hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625607; x=1759230407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjPmQ50PuEld4YJdz+btLObmQrEUPOb/PZT2fqIuXdk=;
        b=rO1hzFhOXVdgFvQEeZrFkZVhpIVxbDmtduyni4C8d1Hz9Hw7/MGiYUuj0j8K15wQVt
         EWWm8my8Evu0NxsQcRurkFNOlkFwuNl4CItGv5CGm/7iX8WQQUf3iqzvYEGi8UNtLMaA
         IjtZgemfBceqrvFEj7TUKRfOIgKLyvv4tHOSbFw8cmdZlEXX06lK8I4KK/lLyTe0KPYk
         ihPw0+0xS6JFcsjjDx2bYJ3IF/Bb9BtuPsy+afWaW8LLzEPHFKdNe7U94Xh3DxIfvC3c
         8hT/k2dZDBvakndiZ3J5F8yaB0pbbtuzxO8MwkDdQJMFYaJ85aJTJzCA7blqXdwC5lcL
         Xyxg==
X-Gm-Message-State: AOJu0YxrwUW5aDI2IHRIE0TvYwNm+NzfLm6CVAZzu5L7WChmHXzbRZuH
	FvBc6xlKXttAtrxtZiYpqu4d+POuNlQhk8CHjvllnmWI5gD8JTHe0qLHZgfnaA==
X-Gm-Gg: ASbGncv+ketg9PMyYqGghJNDjkRa5r6038MbSiS82FLgD3Dnvg290boHNsP0ua8/EuF
	sjjetUuHiMsOGlLWw9Njzd0DbU9gl+lmuOgeG6FpciCfeb+lZqgpojuioT1UAiMcGyCbnvE0EiT
	/Y2br0h7idVKwig7soFocX1dNrcGA7JD6eiD6xMSiPFbC/XsLD9ZgXUlhBylnRm/TfB5zcbCfws
	scfhdYIfJRK71szlKNMQtK0orD9R1afoVWVFbXfKJp21V/gNkpRXXoPF/7rn9sm0vdtV7E7NQsl
	9IwrkUpdLy2G5uo5WMn2fE0kjJ/p0/PR+yBoXP2ESxtqaV+mwMIBSfMlhhFEaP+pj79Ljdyf58U
	V+BXepQ2BjeM56PpAKUCF
X-Google-Smtp-Source: AGHT+IEz0u1T8dMUxBu/XYUGGWJaeMaR/orhQgJ2Z59lNeZmk64grtj2WJWibCHKxRjGOMz6MNwLCg==
X-Received: by 2002:a17:907:9618:b0:b07:c715:31 with SMTP id a640c23a62f3a-b302dc64158mr199872866b.65.1758625607178;
        Tue, 23 Sep 2025 04:06:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 15/22] gnome-desktop: add opengl to REQUIRED_DISTRO_FEATURES
Date: Tue, 23 Sep 2025 13:06:29 +0200
Message-ID: <20250923110636.3413021-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119679

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'evince', 'gnome-desktop', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 681bd57755004f25831ca456ee9e0177bb5fedea)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
index aae927a70b..6eeaed0e1f 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_42.0.bb
@@ -10,7 +10,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspection features_check gtk-doc
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 

