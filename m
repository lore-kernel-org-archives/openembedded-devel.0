Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC97C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 16:04:36 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.17146.1747411473875529645
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 09:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQhP7ttO;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7398d65476eso1987385b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 09:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747411473; x=1748016273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqQB6oBDMiq5qv5vwcy+w0qG1zfpvypC4hPqsgeO5xM=;
        b=EQhP7ttODpV+oFLP+vvZO5P9mRMA7JowyOCJKji6HdMLmr/2q4z0Zyx6HXiSQo2Ius
         ouHukTZZ3GxXEGc95VfcVFH6iEqoMflhn4blTWpO3BPeYDA0w1HolD+WMr7sxPw6em0V
         mL0aJ5N6gtYglV9KSXBVnj85V5EaCHe7C6TKrIuDU3BUVmh9Pc3ChPPGIyfW1DfuL6WC
         GmniC6Qq5ZpCHeFRvrupw66IDMLJKnCWU2BC5RZWohioshmpbU+K7Yt7Adar1/3BF7iC
         EzbD7YO3ISU4KVFPe3YFAgSWxyBjlkqqdBhFtQTYUOP51NM6PJFAqRBejn+ZE/cprXxj
         Mdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747411473; x=1748016273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqQB6oBDMiq5qv5vwcy+w0qG1zfpvypC4hPqsgeO5xM=;
        b=Gx5y3E3usmlEqoow5m6gojfaYa1mZm5SY2KJO1LIJBleumkToMFF9Ec4b4OZoWTNm2
         WtstOqO1oFl1IMVePzK7he4gUyh9tt0pixq6WVOdxlr5TGlJg94WQJkptFMFv8Xul7ef
         UVZ+t8v29+hJzeRvXRC65hJT8qjp9Ly2TWK7qz3rZhwCG1aY1tW2sTpCw9vQIeNTOMKX
         5XPglc6oviQw7dAiUF+RvmHwMRvAW9iKqk+fVWgwE78kgoRS2WWvSWtGngP0ueyL+KQu
         seWPXAu1s7dZuRDCJEM/3l+qZcEa8BoMYB6HFZBWu19I26QfNLOC612uAbXuNYc/TL+D
         /PEQ==
X-Gm-Message-State: AOJu0YwL0ft36bvpOTAu7yIi3jAGjA+FK3EFpUH1/7W5KIKEN01Iqlsj
	WjNvCrxQ8G48Y6k2pfdxs1gWlkV28YvEwDOwObANCNGFogkT9T6aI8SRT9F8HMX4
X-Gm-Gg: ASbGncs4U8pdjX9y1gq8Pv2j7+Gn+gkmFjR75q1cKu7SHxAe6X75XirIlmG2+ncmaQO
	0ViKJnLj2lobExgqHHkvVd2Cbq+A+eFHkOWE29+gysbKxfaxILnl4scY1UreIiAFX9DAciFl41K
	xmqd6bLok/3OgKVVtMTcKyoU9faAdnAuCQizzwza2+OkYX2po0yegJ33BRmXexoECrS7xlQ0s5Y
	6eiSFM8+v7Tb7EKm/FhRLyfDeiEsI6Nf/K11sQ2pNdghLu1CinH37PgK5mVrAvKJouzsRzEpkV7
	0N24/1Aqb5U4nTsHpQ37mav1Z5jqAe6uCYqkgKGjJOkyKbmKysEvQA==
X-Google-Smtp-Source: AGHT+IELt0mRsFNyYBwa8ORua537TB6cXPA/A1ymmEIF7XihyXRG2NYYbZ0eGkk2MwbRwdgd9L9CMw==
X-Received: by 2002:a05:6a00:22c9:b0:73e:2367:c914 with SMTP id d2e1a72fcca58-742a9afe7b3mr4924561b3a.7.1747411472735;
        Fri, 16 May 2025 09:04:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b9a0sm1749877b3a.108.2025.05.16.09.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:04:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/4] xfce4-screenshooter: Use libsoup 3.0 instead of 2.4
Date: Fri, 16 May 2025 09:04:27 -0700
Message-ID: <20250516160429.1391450-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160429.1391450-1-raj.khem@gmail.com>
References: <20250516160429.1391450-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 16:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117430

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb
index 7c2ecd30d4..da929b7fca 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.xfce.org/apps/xfce4-screenshooter/start"
 SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11 libxml-parser-perl-native"
+DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3 glib-2.0 libsoup exo libxfixes xext virtual/libx11 libxml-parser-perl-native"
 
 inherit xfce-app perlnative
 

