Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81586CDD0EC
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.21790.1729612095273966212
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9lqmuWx;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e28e4451e0bso5335731276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612094; x=1730216894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrbUDz2e8cWcIZ39O7um0N7xtoUntDReRDGQj8KQgo0=;
        b=S9lqmuWxCz8RFCsUenCuHTfHquX9GczGWNcCivZhDKyQQ5IUqmJWEBnVyP4ZnR3NCD
         juFI+OmlIO7Tygv/FpQ+cw4ne/y66tbAKPyqeD0oLo4JfMnwpv5+wGlwLeBBaFYXZTue
         D6iYeCDuOP/80xvz517mdHbGQFvhtTmGwxnuHrKc6ir030GPZsiR38A++qPPbTxum2Rj
         RMmH5lzOrGxAoteX9jtHZH5bW50UKLyV+a88ggwP5lOHJGAkcSRTABk1psMyQW3EArIn
         DZoNeWyWOBzod2N0F4r18n53S1dUAJ4WLUF7qoegMKFzOdKLpyqJIVdAURwGPtJZS2jp
         wwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612094; x=1730216894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrbUDz2e8cWcIZ39O7um0N7xtoUntDReRDGQj8KQgo0=;
        b=TKdmhjaybFrJ546UU3ERQaHhXDNoddRd0YqnSAG8A9QxW5T376GL2jqG3HIYcKIzTd
         QifvwbPY/1WSNP9PaxC4CAfV63XEYUAX7mHNJAXpBrtf7mcgVuiDc9T16wUDGp7GntRE
         oerYQbgEkE7V2kgmj9TVkF9z6opTzufbvx8JG8LZHKMzaMVZ5tVpi4mlnHDFBq3fn3RG
         5WvNvG7xo9FCneR1ubhBUjKKnuF4LITSNhCdpVhxC3y11kqG1pyz2T3h8lJcqI/pyNHt
         1pnUeurdUHqH5a76GpQghWLHYwR53xsospuT8KxJ31Jzfxd8l7sbmIjPZXjyiSs/z1Hh
         72VQ==
X-Gm-Message-State: AOJu0Yx7NweZGdZBHORe0xQVqTw3hBrfPD6qaA66GZiVss/leqv4A2UJ
	4aZ66p8p8Ro8sla0IvvIZuP0MO4dqYwzt+beQdV4QRumf16RRmHG78gvFQ==
X-Google-Smtp-Source: AGHT+IE1KmZIuqhOh8ZhzEig4mysqyFoiR45Fjca9VW6eZSex5bJ052CcqmvpXbn3hqEFT3W95eIzw==
X-Received: by 2002:a05:690c:740a:b0:6e3:8562:fb8 with SMTP id 00721157ae682-6e5bf72c5fbmr163606277b3.7.1729612093966;
        Tue, 22 Oct 2024 08:48:13 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:13 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 30/46] libnet-ssleay-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:48 -0400
Message-ID: <20241022154729.20331-31-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113121

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index 5d0eccd84..a91bb6cbe 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -27,7 +27,6 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.ta
            file://no-exec-on-configure.patch \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "d602bdce4e0531c6efc276e3e429ca69"
 SRC_URI[sha256sum] = "9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8"
 
 S = "${WORKDIR}/Net-SSLeay-${PV}"
-- 
2.43.0


