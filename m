Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2EBCAC5AA
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 09:53:41 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.10164.1758189218770847614
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 02:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWNaR2RG;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-625e1dfc43dso1120460a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 02:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189217; x=1758794017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgGX7pGI8wAApJzDiZfIq/1gOFKUYOOKbfarNnCTFPo=;
        b=cWNaR2RGGANGrpcZAvJtgjeKFlPDwOjTIcWEaFWaAQpkzK/f3oA2UF5zYIuCayni+h
         wdaV6zQQqBqB10GXDfdEhcoDgpSCqMKWAB0jKVSk9ms22ZUbHmOZqO0HdV3RnD5a5m+m
         106OZQQ2RNBbf2mJ3quJyHEb7V2R3cNPLLBznRyKJRhDchzC2VW5zzGssGK3G6TX5xi/
         9/4bt+JZi9d9JZrlPCfvECdB+vtp3mNBw2NtiOHjDNC9t1+v6aSbR3lTxv4j3BnYhf4c
         Sk4iFN71GhPyo1WgmaDi7xa3i8UCO9KONYYpJWoX8+cw7zafylkaBtl7xEdRDfw856vM
         tUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189217; x=1758794017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgGX7pGI8wAApJzDiZfIq/1gOFKUYOOKbfarNnCTFPo=;
        b=pC50/BMRQFPjOSrHGKytHQ2gxv7sTNA4d0dZOoMhsx6jUGFbK5rh2s6WpKlUVFRbEv
         GNOICltc7uBHg/AhnTdPZzTrueB5tWx0nE41Z/ZOM+SYwInwnl8SV//q6RgMYZFETys1
         0iR7Kbnb6C+4KXFuIMww25ECavWiABIVTbWGGDBQffPvUJdaYm3S9Thq9TcBR5+fKsw8
         9htYwM/r0+iSBEUdEV8oE9NgY23DuAh6fYfZSzQVy/BzT2Tzl31ltDxeaEZaBbcrM71z
         5frKtdtSxlq4eOhS1Mv1vY9JcvqGieYa37bJwzwmXxcZaYyRCnTtFHX4edmBg60mBvSN
         YAHA==
X-Gm-Message-State: AOJu0YyMA72nP+a25BMrg8kSPUO176Z6QenUwzZgXaTeGR32OoKCw+5v
	COFTmKJ2z7kte/gX1qS0whAIS+W4xfV2gwfUMYEpzZSYRCqplOlrX57rzxQT8g==
X-Gm-Gg: ASbGncs1y8I3AFulatBs0wVfRVqnTiCUvVG45rWC+TxZEMnars6Z13ZWI5oYrr+bKdz
	NzGDoEZOQCBzS+QhihZlN6e7nGqZ9+o+IAdSRwpdn8OBOxL5bMsddorFJNTGjLk+7oGa7IUSomb
	rrJ/1+7eQWw95/M+yk0IikxHrTY9j9JdqxOXd7XgHBzpBXje7WQYyKvlm9KZnILsW4bLFvBkabX
	BGgDFmleNolji8CVGVqc9Q/QGmr0xe2puU+II1g7ZJETGyO7VCZr6IAdEsCHDqM2M/8PcpiLQei
	VDf43Ul3BmO8h2D/yGyOu5S3Kgd7Fzyb2/PvytcaZPgBCS1buHOfcJgS/1y1w3U/G2kjQJ9cIx5
	tz3dzVEVcgwklr50Rxyi6ZFbSJK9UhPD5hRYCV2w=
X-Google-Smtp-Source: AGHT+IGgfhmbwsT6wMiszRQoEatuKxbicFmXfKSC1deFPt5NRb4Rm3K7TYKxWdUqesg1VF40L980Xw==
X-Received: by 2002:a05:6402:2803:b0:62f:259f:af29 with SMTP id 4fb4d7f45d1cf-62f8444cadbmr5635158a12.27.1758189217044;
        Thu, 18 Sep 2025 02:53:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm1168184a12.16.2025.09.18.02.53.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:53:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 06/10] cukinia: inherit allarch
Date: Thu, 18 Sep 2025 11:53:28 +0200
Message-ID: <20250918095332.3369767-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918095332.3369767-1-skandigraun@gmail.com>
References: <20250918095332.3369767-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119547

From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

The recipe installs a shell script which does not depend on the
architecture. Inheriting allarch will make sure that the recipe is
built only once accross different architectures.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 97c9e5c38d87785c80f824969eb530bcafcbf401)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
index 7b6a7622f8..9ad6e6659e 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
@@ -13,6 +13,8 @@ SRCREV = "a290f2dbb813ce12ba407962655a5d8b57322221"
 
 S = "${WORKDIR}/git"
 
+inherit allarch
+
 do_install () {
     install -d ${D}${sbindir}
     install -m 0755 ${S}/cukinia ${D}${sbindir}

