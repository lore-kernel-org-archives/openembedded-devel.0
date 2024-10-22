Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559ADCDD0D7
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.21960.1729612103249075929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=do3LA1bT;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e292926104bso5191103276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612102; x=1730216902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rm/HOiKlNppSRJFgE6/pO6sJ4qa1qpSDpOlvoECzIM=;
        b=do3LA1bTXr5qDh5ERnJ2k7S66MOYUC/f1Wk08yChtJOREgOwTZxGSbPsJvmKfEXt6J
         qrxmk01bDXB0LNfucklfLaCnqdLcu5R0cDdurpmXIPRQwKQf6IMIBu/2E824u8vqbfkH
         5WWxmNFb9YmApSAVaga0pfUZKXhWBNdBeLmF23eYYOxxpZx2V6uoGw3d+2l46oyTBtej
         8cLWSPS+/Z28YF7RWFh/wxgkS7AvVJiQdQCnhwtlfEp3veyDq71DezwE9WUnlxrps36W
         GdBGx14AhZ6SVtwhwthIdFAhA+FPhne5lO7Y/C4sGKs5dRRBVOdqwRgy8lyuNPKOTvot
         lzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612102; x=1730216902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rm/HOiKlNppSRJFgE6/pO6sJ4qa1qpSDpOlvoECzIM=;
        b=jBigobESEf6nIf1UzSfcm8K8C9SSPZAA7A1ksinQOh0rtwvXKhcPiFn5Iw9u/z97Ie
         uHqMuNaC7lJSvsFrhshTqrl5Me/wnXhuKFwksGtkRIO1eE/qctoJ3nlGe8VSeOm+Kk6G
         qJOYAyVilaA7X/Fbqnn4rQ2V3RIxQuwuPuKaTsHyJHKnw2fc9wJY5gj9V/Dky23L5dK4
         8bE1veJXMVFCNdnvIKG7SS0jE9tYNZuPplTwFvOePEpJzBlCxcWo8frOLNsnlL2cz3N3
         MkOum6PCoNUpPZQJZOAR5wcLnpYgKxGCqM62OVz9soGZOboMYrt5mWS5YY67SUUF73NS
         j8Dg==
X-Gm-Message-State: AOJu0Yz7qTs2E+493GVBnFcmtWv2uq4UzbBA4bl/t2SfIlRSc6FB4dln
	7BAt044KM67xRYck8BphlHax009CTNWNS0RAffoln8vykTj42RN87uoKUg==
X-Google-Smtp-Source: AGHT+IHt/wImuy7mphc+9InOGFpsUNZOFPJLkYo4weppuPpt2oDWMLWw01WEWoIWU9nFgVZkq7Y6fg==
X-Received: by 2002:a05:690c:f93:b0:6e3:21a9:d3c4 with SMTP id 00721157ae682-6e5bfbecf81mr147065467b3.1.1729612101852;
        Tue, 22 Oct 2024 08:48:21 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:21 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 42/46] libtext-iconv-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:45:00 -0400
Message-ID: <20241022154729.20331-43-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113133

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index 1e8405cab..88125845b 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -14,7 +14,6 @@ RRECOMMENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "81b26e069eaebb084e91ea3c009b67ae"
 SRC_URI[sha256sum] = "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4bcee383d029e7d2d5c3"
 
 S = "${WORKDIR}/Text-Iconv-${PV}"
-- 
2.43.0


