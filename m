Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D51D5B16B
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.1060.1730142299030252916
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PmR+Eev+;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5fadb5e23so40606497b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142298; x=1730747098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxdgwwBu3J5I6J2nBQcgL5QRPzFDRA64poenntXCM68=;
        b=PmR+Eev+wanDrX0eXUtpghgHFafbZaxvc8P1j/bafh26jKYKlyYIspaKcRphjUtEea
         W8sOaxoWCy1OfuoZRCfrz10Dhwb3O7fGbTiN9VSm6lmQWaqgSGVFpbGEUKtBS5jw8xej
         tsy3uOTgWszgZT7+0/ootMqfL+Mwt8hqilalDlmcwW483SAw5jtLiGAtrMGIlMRHaagz
         223CLGL0Ge+r0fanpPndS0RGukt6SaPkx2saoeKXrDKEcmHufO3HS7WRwpFLltsNnEGX
         58VCLYcn4Ru2sIOa5ZRLyS/jifUBX5IKMw/AAYOmWhD3tPcpcG+2c2X3wquRoBbVse8Q
         +EUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142298; x=1730747098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxdgwwBu3J5I6J2nBQcgL5QRPzFDRA64poenntXCM68=;
        b=W3YlM0xXhNHkfzoim1ZWX9gRKwPbu9kBTv4E5075pgYLhiyxLtDI/eYcFMs0Wg9iQ+
         0q45BePPdmsWuh9X/hBuvtI4LoeRB/wx5teum97cMaxKBIQHRU9l9C/y5O1L+r54Bv9v
         ul2D/7HYkDilQo/eCj41p1FxhsgPqeyRvWazSNWD4V/V4Fca1IQsRoHXZgKa/aJnJ6xz
         TrMTaxMyxkrXxYyS9EEF0Hq/l6FTNYDINa1CMtmhY4cmAhjCBD90zO8mRDerSD6PC1E5
         kbY/XezpquJ0TbHZ5H6YWIXx3EqVUSEgzayS0vzaoeHI9G2i/dm/PeHdT2gofqZT/l+J
         k/qw==
X-Gm-Message-State: AOJu0YxAvFg+TnGjGf0UuusXtyDv2/k+xrFe5Jtmnx9MXl16rgXh9f63
	07XHe9fjFpbOuEH32SjOFxycNdHXa+mDsel18S3GNCha7OYElYR8z0WBWg==
X-Google-Smtp-Source: AGHT+IFeTypG+af63y0J9TholDWiLDcZdbu4hIv7HOKnKVtzSulVJQ0WV+J2QWva45AQU188HCEUxA==
X-Received: by 2002:a05:690c:dd3:b0:6e8:497:49cc with SMTP id 00721157ae682-6e9d88d02d8mr82866177b3.2.1730142297670;
        Mon, 28 Oct 2024 12:04:57 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:57 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 07/22] libenv-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:43 -0400
Message-ID: <20241028190444.10522-8-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113298

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
index 8e3b3dc2d..f88a418a4 100644
--- a/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libenv/libenv-perl_1.04.bb
@@ -9,7 +9,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7014ce1200251ebb0"
 
-- 
2.43.0


