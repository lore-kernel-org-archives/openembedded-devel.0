Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.14083.1591940053873478698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2020 22:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vQy/nIGn;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id h95so3396198pje.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2020 22:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UUudpaIYgidRcbNh5/siz98GspO7K1MitMSdU5fnwKg=;
        b=vQy/nIGnIQ3cViEYeeTSV0iasAeKRf0Ly/wEH2CFok96aYEMo5hUYRfYR7+2/k+tdB
         WWEqbzFiBfDAhdZX+/ffJc1n3js3soVDRymnRCYRUfbKJH7x6RYtl94lhQtFHGdslrTN
         dtubN2HlBnJmltZAur9++7DiNH5R4s0bJJfOZFQq/ahTlRrYFbhb2p+HFp18TGL9Glsv
         l52lq/r+s7E/NEjcW0RyqfFBPnBWq9+jknnHJz3JA6tsU/ZO3GmKU0uNPZXUl/3qwe9C
         JEWuuIujMq311H6ZEPaB0IlgCIGOy+eLg74uMmP4mT1EOh9HZ6BfYXmUdytkchuAaHz9
         9vWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UUudpaIYgidRcbNh5/siz98GspO7K1MitMSdU5fnwKg=;
        b=V71wGCcGqLZBj/tsSM16WEinLe4blH8DIuRfCVMipDmff3sC/5NG4RvnoQEOYcz302
         7Av0fkLGAYGVRe/lhbc98sFsH4wWqW9FQlmIvoW4xQobx2FoQCJM+wbT6bmLXJLH9PuP
         qq7iUBm+3re3QOSKjIQCpKiFr/6rL210QNtyC0LLU9U7To7GG0yFtwA0zVaNaceGPMBK
         lY4ViD+W3yBfO8amUmnmCff/MgUA+0DFN8X3N5Zdmp6Avp8GZH4cFj9IpxNwfufVYopi
         2N7OSBezCFXkvNJjAugD19gDP9To660LVAZVfB+Yyom5wxOPHTds6mBNMhvW5Qc8iWS6
         CU1w==
X-Gm-Message-State: AOAM532SsLev43VKADY1umL6K3nYJ3OI7HDOYkew1BDqF+Jo/qR2Fxmq
	8z3MIp5baDHYvP85em02iHlb9PyPkWU=
X-Google-Smtp-Source: ABdhPJzQPNlt8gfSv/7D4hw7Lk/Y5IgnU9xYHiCVHfB596B6e8rTa1W/yPIJwsOZGZBbiejxxZGUXw==
X-Received: by 2002:a17:902:6b49:: with SMTP id g9mr9994831plt.66.1591940052992;
        Thu, 11 Jun 2020 22:34:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::a254])
        by smtp.gmail.com with ESMTPSA id f14sm4173821pgj.62.2020.06.11.22.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 22:34:12 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] evince: Drop unused features_check inherit
Date: Thu, 11 Jun 2020 22:34:10 -0700
Message-Id: <20200612053410.629331-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612053410.629331-1-raj.khem@gmail.com>
References: <20200612053410.629331-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_3.36.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.36.3.bb b/meta-gnome/recipes-gnome/evince/evince_3.36.3.bb
index 08a20d4e0d..29e01cc23d 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.36.3.bb
@@ -18,7 +18,7 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext features_check mime-xdg gtk-doc
+inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext mime-xdg gtk-doc
 
 SRC_URI[archive.md5sum] = "9762dabdde37a804072bccbfd311d357"
 SRC_URI[archive.sha256sum] = "af2ebdf7f74e6580c4f1a12bdfe26b9ff90374d7acae061de0666d64012a9db2"
-- 
2.27.0

