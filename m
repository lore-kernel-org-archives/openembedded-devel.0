Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FBAD63959
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 09:30:32 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.7000.1732181425670517607
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 01:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MfOfAZob;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7edb6879196so575256a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732181425; x=1732786225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G62SJK4bl5d0gaQB63MpaNEHBD7cIZWTGCIeZAiElG4=;
        b=MfOfAZobOcVQ2Ou/FhvIlgcI/T2utD885WNNRTjpCS+hCnh8Chrg782JsjkpEVEjpG
         ZAoaXW32enjCta7MPzPFok3gphvYGKW7iXQerUSh+qFzRbFR6KEs9T3JZHz/qyDqPSY0
         vD1XqZFHQsyPSUTnFq5QgnGWqK/to1x3sIGr/Vddhd3+wHjEHEDEfC0B46wsj5H3aNml
         hU+AjNVCRHIifiR+Oz/ANptvWOMmuFFAsQb9i77uZxKJndWXE4YwTX9PODlUcYe5/ImX
         iGH21go+qtCQCYnxeZU+U3zx9ZoqIEENRR7BKib/+44do0KGuL18v2G8rxlwQJvHQVVv
         g9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732181425; x=1732786225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G62SJK4bl5d0gaQB63MpaNEHBD7cIZWTGCIeZAiElG4=;
        b=rLSr/yifT+Dvx7S9NzHm3rhjaNRpUo+Zkkc+jdV0C2rE+GEErP+77wv3TXMtWQLfVI
         mAr4mvFzdH16JnfYREakAYN45TEzycv2e+r90HKDY7AfDZtPxUbj1ijjnvOQvUnwRhwL
         1p+aZBMXqQgWdkvitrp4W/hkXBzSIaCd2T/kxZI+9bG0HfJOzN6hcJ2dPpnKBqAgrki3
         PuQjyjrBAujCGT62F7IF3qDjSfLsJNkZ3+TPsoF9PaodZ+K+dbW7cBc+/VybWI+WghSz
         lv2QM4OnihxtDvrUGBcG8zF0JYNy4X8U3poQFl4iAJi0Sd7sNP6JjWOS/CtVoRBCWZek
         IcaQ==
X-Gm-Message-State: AOJu0YzJi/Gom5fV8OkWJtqYlYfXxfmLYJ8GLvBB8qT4d+BG2iP50Yd/
	cA7t8pfV1UcpUkS/03Vfrf7M32DuHgCVzybui+LRr8f668Oq02hHSYqDZg==
X-Gm-Gg: ASbGnctUch6LI1w+DKIOGx9xuaUxyfAo25m7NqBPkhdsGZaZ/E3fYnDYQQNudAFL4wk
	DUhlcrEXhDGXQsPH92qO1LY9hnnMdj4ba23BWZi4lMK0sG+bP1Q7HbPphRkpV3hP4zMwunJkXfR
	LNaaVgOxnJx8VXo6z3S00LVRy0QI9YFXEAykUlLuLEedG9EyuZGFc3jynaosdUASLX6XT+eBWmy
	njciw+J3u6arrvZRwFK3VcWRyCbSzna+aqtt3PlHLglS8EUx7FI
X-Google-Smtp-Source: AGHT+IHwHl6G+9hqtVZCILH/TZRb5RrrUZJ9uZof4a1VdfGZ3zCIO3uKxd4pQrPvcaEObE/hBQyBkQ==
X-Received: by 2002:a05:6a20:72aa:b0:1db:f087:5b1d with SMTP id adf61e73a8af0-1ddb0338a66mr7517816637.37.1732181424777;
        Thu, 21 Nov 2024 01:30:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724bef8daa5sm3268930b3a.102.2024.11.21.01.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 01:30:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] geary: Specify location of iso-codes xml files
Date: Thu, 21 Nov 2024 01:30:22 -0800
Message-ID: <20241121093022.272900-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 09:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113963

During cross-compiling it needs to know the location of
staging area where these files are installed in RSS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/geary/geary_46.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
index 2ca27c4f36..6d6d9f5443 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
@@ -47,7 +47,10 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data opengl"
 
 GIR_MESON_OPTION = ""
-EXTRA_OEMESON = "-Dprofile=release"
+EXTRA_OEMESON = "-Dprofile=release \
+                 -Diso_639_xml=${STAGING_DATADIR}/xml/iso-codes/iso_639.xml \
+                 -Diso_3166_xml=${STAGING_DATADIR}/xml/iso-codes/iso_3166.xml \
+                 "
 
 PACKAGECONFIG[libunwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
 PACKAGECONFIG[tnef] = "-Dtnef=enabled,-Dtnef=disabled,libytnef"

