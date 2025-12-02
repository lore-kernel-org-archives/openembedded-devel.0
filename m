Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2108AD1171C
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 17:19:01 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1323.1764695938211751048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 09:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oei6C4Cv;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2984dfae0acso88648205ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764695937; x=1765300737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kkXAehw1gRHee3kfufadG/QM2+2x9/X1Z9s9DU84bOg=;
        b=Oei6C4Cvt1IpkehBhymMOV9OXpNZA2GXldRLguGZOJEJu9YSUgvkzbnkBLf9aLlB8O
         IkNSrwDnYiYW1Cz+jjR0p33hNbUUfNKbC6wmW2IVKfydboiGxThY7ppGwD1ErFMvoyrF
         n+x6AqMGjHo5sGGdnXLwp87eA3zciwqazXVRhMmvr2BNJmdo77ZLN6JU1tHaK0J7Snr4
         H24d05e0THJlrMFUaYFHZGztTDXSJJ4S5vd30f1qzdrXmtRoAGuDesvOC+PQelR3VoLw
         nWroLk9oNLZic9Ch+2d32rmkHqRHKFbtKqTxCOLbRDSvK7xrcbpBf086oIVBjhW+TDD/
         EJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764695937; x=1765300737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkXAehw1gRHee3kfufadG/QM2+2x9/X1Z9s9DU84bOg=;
        b=qbxcHFFzg+TOL93GxCkVfWA+05EakmiyQyxk+N2Yg7y1CQOrbfexwCOpJYhPmjD9oB
         yl3b0b0nIqJBsXG30mdM7+qHbPguapz28ONymMObq1d4p/iObUjdCrEaDQ/xyhViaN1C
         5wK7weg2MsrRz9aSPzM+LwBSFqOsZabfTFE7N5mOJ1ukBwaBg5raf/U6PVzoXLOj9WGI
         jmpuy14Ul9umkXzb+XtTDG079AUsMHEGgICVUY4kw1akzeutNFAjVS/llD0q93mHXAub
         GdlBs0dWcGtV1stChbJB/8ZPskjWJHQQ4w2k+O6wKpEao7fEXRwtuv6nU4xAb03FAab1
         k8mA==
X-Gm-Message-State: AOJu0Yxv1efVl8+ptUAWpCUhbqNKiqsVLFxeUX879rf80nhzdY8uR+Xu
	g47g7Y4yo9ptx7HBPayVN9h7YoF5VAGopPlvKKcowL95s3KQtyKAWDrAdrulMG8f
X-Gm-Gg: ASbGncsZWG+TzK/Jt5GUqtXoO/sUt7Cd5JU47G2vR4msrjhL/dLe66Jh+AlKmBPjgt+
	kvUj9jc6UlaT3N9navn+tQvoEC5HMMNUeIqRTDilD6fjoRQp3ZoXorPPHDiAEbiHVdVMLqJpnvf
	dvle36UyFhA2NGyBcu5hdqosz68PjAirRredTT2ZwtQEznwqwf5vCafdfb5aOftUo11pd64DBr/
	lLrYqzkbE/aG51qhWJAaPn36tcTLFvf1kSezmiR8KVH+NKSlVdd1MBDNxol1GBaVwivTdKuSv4S
	hJGTzYRDsYXuCh2ywDJ6PPJrvNggyV1f0XUgZokVJHC3ejA7IYFcIkv/9vfCxsJSN+OSlff2YN3
	tfRNL5k9Ekfu7MWcXa+4YdB/crLtmRIPxfy7GRDvE5s0/qpxYeQALM+bYwYWtXMwtFXYH05i1Tb
	kyu4PWdAqf9MMG4uwIHcuUQLmorkLf1qAk2Tf57X+bwpe4xmEBo09Itm4kyzv2x/D27f6Eq6sWO
	MpZwBNv2d2HDdxoLoWPgVpWlsYhh+jdl6Q0cfpup0g=
X-Google-Smtp-Source: AGHT+IH7bSF55eJtLWvRZLrRBfRe+UMBQPK8M9uZvfZDvomHJQEddzBEGlc1Fk8JmGPzpMxTK9bHGA==
X-Received: by 2002:a05:7022:429:b0:11b:8278:9f3a with SMTP id a92af1059eb24-11cb3ec373fmr21845622c88.8.1764695937144;
        Tue, 02 Dec 2025 09:18:57 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::821d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaee7076sm73254871c88.4.2025.12.02.09.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 09:18:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
Subject: [meta-python][PATCH] python3-mpv: Do not consider it if commercial license is not selected
Date: Tue,  2 Dec 2025 09:18:54 -0800
Message-ID: <20251202171854.3581512-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 17:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122265

It depends on mpv which depends on ffmpeg needing commercial in
LICENSE_FLAGS_ACCEPTED

Fixes
ERROR: Nothing PROVIDES 'ffmpeg' (but /srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb DEPENDS on or otherwise requires it)
ffmpeg was skipped: Has a restricted license 'commercial' which is not listed in your LICENSE_FLAGS_ACCEPTED.
NOTE: Runtime target 'mpv' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mpv', 'ffmpeg']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'python3-mpv', 'mpv', 'ffmpeg']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jan Claußen <jan.claussen10@web.de>
---
 meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb b/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
index c11ad4a118..2d345cfc55 100644
--- a/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-mpv_1.0.8.bb
@@ -14,3 +14,4 @@ RDEPENDS:${PN} += "\
     mpv \
     python3-ctypes \
 "
+EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"

