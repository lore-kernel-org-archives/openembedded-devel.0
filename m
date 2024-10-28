Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC566D5B868
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:26 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.1072.1730142306505954109
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BAvqYBCV;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e35fb3792eso43509257b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142305; x=1730747105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIQxcGbQCewyTV+jIXpHwCSX6b+HxZA7EDHvLy86Nkk=;
        b=BAvqYBCVdMkh1GZPRtxSXhx5dTksMOosV9+PZ7brZQkvF/VNHBtTZWFODwlrf53/J0
         1uveGFaWk7vn0Qtw4rxNYVDFCqZuitAoldS83pue777Qkkp6A4LexW5liFSAVZ73rlXc
         fOGF7YMQWQzSFatppuKx1J5QSQywJ8ezf0EtLNbajbt1BIa3qWwKYNofekoUa1cr+o0Q
         j0Sj2m57XevD2iVVJlnCQzSQSrk24dU4P1L87Zkx6vqUCQt+SceSa81z3PxJsPixIBCm
         QKfXMEG40f/qV8pb1R5OoRn2bkvo6Oe2UC/zPyqgRvUH3sjHGlevFj6hNk/zcix6LbeZ
         Lp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142305; x=1730747105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIQxcGbQCewyTV+jIXpHwCSX6b+HxZA7EDHvLy86Nkk=;
        b=uK6tha1LDxNpVymDimsPfhov79B4n5L4mDT/qJTfgKE+isCzLzrbKld6pZGJ+y7fA/
         UOSP6kiGt7kH7rjfRyx7cTmRSRGkMu3s07flLiVxleRODvrGqQYUSapqzKiJgbqn6MNo
         wvmZOKV/gUqnk4MzmeTsN4lku3MGfEp2HuPw7Gqdi0E3XMFK8wgnspbM/dj0+cM79g0/
         h0VSXlA+J09ae2/Uw845ujpdLMHZMwwjmvDJZgRCHY59v0hyfNDQNDArROHpVkN0wSz+
         DzDIePSLgB2fpr5k8IiFU0PM/PGdwyuF/FTDxr2ttucLcbSHHwLF3EMw4af7j/vvAEJa
         0Fig==
X-Gm-Message-State: AOJu0YyFl+iaV7nF42oJOlf05VkGYxhseed8EfMyBy5IjoVZOui25k5u
	nOUVwR9s+3/lCIuBhLUgfXbRXw9+GfJB425j7a5Ld9emG+WbJpkbJS9pZw==
X-Google-Smtp-Source: AGHT+IHg3O03ZsrsE2sgGdlYVLfQ6/IxCD0CYfT3K6QoJ+mWK0VkPa2vWGi2bndbyPt0RFdNE9M2zg==
X-Received: by 2002:a05:690c:3585:b0:6e5:bea2:1099 with SMTP id 00721157ae682-6e9d8a4f72cmr99749177b3.21.1730142303890;
        Mon, 28 Oct 2024 12:05:03 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:03 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 16/22] libnet-ssleay-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:52 -0400
Message-ID: <20241028190444.10522-17-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113308

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index 707b9fdef..d09f756fb 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -23,7 +23,7 @@ RDEPENDS:${PN} += "\
     zlib \
 "
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
            file://no-exec-on-configure.patch \
            file://run-ptest \
           "
-- 
2.43.0


