Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62D4D5B86C
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:26 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.1073.1730142307192015690
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mc0i6HRA;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea051d04caso11108087b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142306; x=1730747106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WHeyoRSIMYftA8RzX7wgf8tvUbROGNNLNMsMRhjvLk=;
        b=mc0i6HRA+ocTOqOvfmPl3hbMWNCoBKhHIMlrQdec/fhFyvQ516VfDsZRMqkEb2F28k
         BgtuJ9Zdw20qGdxbVm16bXzfcz4KGvhglzA+eawofB6ZmN8ZiflMsC9qqttfAbDSjx2W
         uM7FzDmjTLmlPbz0AbzWS1fSvbT8+26B/HB1sfqUy4c4WbRRu9tsvY0HyWXGcHrUSBR9
         u3iwstJv5fEZNNAXa1ABovFymvpSK9Z+EPCGfOZ1jOjxWuz/qDMD7ZJym/z22kL7ZdaK
         DaTcqIKpiq+bbxqz8EVvQNiwckkunLL2hKEtiwXi/NmnU5jjkbFPG2hUH7EezbMBhEqD
         U7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142306; x=1730747106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WHeyoRSIMYftA8RzX7wgf8tvUbROGNNLNMsMRhjvLk=;
        b=Agdb31YUWtCJSZFrSmmknPZIfo0wkfvZgFkaeIOrbGDIa3Jwhtlhaa5zW4DArx0Ors
         Y/fgAuq+W9ag7a7Y3sy38VEIPvJDuRuG85eY6ubu25ZnC5Q/dsS1oAC7dUGwNb9CIXnj
         YiG60EKO5Z84sQpEzNpEdO05Urq9WYZGEuIvJ4NxgP0909QN1lAa2QINxSReu80nTXhA
         4kY6Je7sIvSK2ueA7R7t+8FfJqsuBYrCRVjDlJXRnvFuJEJ0Zb4KG0+syIL6UpL+Oggp
         5THUMCmAFlYDIW3zo7TDFvhyXGaHs9Or11UTBL8voghGaqNlqCtdWF8hdp/gC1OG7fR8
         pp7w==
X-Gm-Message-State: AOJu0YxyJ0WSvN1oo+m2o4+QA5DRgjQD9rztnq9/KjVws1pPHoe0DS/E
	vGbYiAoeidK6mQ0wfAhuuijqe/DuOFivGEIpqHD2phUooqBWL0olQOXY3w==
X-Google-Smtp-Source: AGHT+IHrXzoN/PbJCLLWWwyg5wcTp1XLPwN1OIhApqwnjbR+9ApLnz1OF13wNRePR4N1sB1WBnkytg==
X-Received: by 2002:a05:690c:6f8b:b0:6db:e280:a3ae with SMTP id 00721157ae682-6e9d89d61dfmr99596767b3.23.1730142305925;
        Mon, 28 Oct 2024 12:05:05 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:05 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 19/22] libtext-iconv-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:55 -0400
Message-ID: <20241028190444.10522-20-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113310

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index d242630d8..80c976561 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -13,7 +13,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=6;md5=fadf2919c7128e887d26b4d905f90649"
 RRECOMMENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4bcee383d029e7d2d5c3"
 
-- 
2.43.0


