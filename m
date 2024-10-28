Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136FDD5B165
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.1065.1730142302362857356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SScMssgz;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e38ebcc0abso53657807b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142301; x=1730747101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9Lgz3psCwJSSIJWnUHVEdsl/dEzfR0X6fEKoJtuyZM=;
        b=SScMssgzAA3DfLK9d6y4lqnryFlwrBV3jX+sz4AGrFNozaGYuk4COwDKShI0AOz8jR
         VhHCU3S6E5BOCd6Jas4N+lU7gGrO8oSsR4a315CWssKT8Yo4XQHe1PSh4qfzkqAdTtPt
         wuS1AOs8jzb85zsKo2Fcmk838FneY6Ef7wqiS9sKCx7QZHj4TPq9y6SWdPmGXINiIOTG
         X54qal0mNd4dV+t//kGReq3P+CXhJDW9i+fJ4BQY2XFqTlWvwFm2TDXPkNcISAjfNYOn
         0T9eOdk5odQEKykpWXpuzC4SFevQgfYuP7GSATcGrxEX9LpxFKyrysgozWysegYl19LL
         RACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142301; x=1730747101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9Lgz3psCwJSSIJWnUHVEdsl/dEzfR0X6fEKoJtuyZM=;
        b=RAgxaEp/7LKQiAZwIngejqr7++PvkZMrGfaIMwkK0q4N1hrMe8SWEWvJdoZLpW/b8X
         7WterUwdJewb6LNLZqEq90dk0VXXq8CK0qOdrlNWzm524C0wVg+hJr6Wf/p+hVCmY5Tb
         nfBHnGSDZQrrjtyNya8XK27o2gM1KhholjXFxWGnIsFB42ug7PYBpCMqCxFUfHKASM+/
         JezZj0JWfuKTfiqcmLG8KfLlEylSB98GOzc4GFUtFJnZJ53DjFfVsSdssCLEy39G/iT8
         Lr8UR1RwdW8dn+sLYukjodmLdmN/983pZ5g1ZeTeDCqjBjC6ap0XBmljtl6aC6CuTv9Q
         pa+Q==
X-Gm-Message-State: AOJu0YwjtpU4tXVUP3ca/8mPALMVp5lCjgQrNRSnooL6ivF9erfXB42A
	tCYPNAGVx//zt2fVSxOnzAGmVqgTcE4Ie/po2GmhSAQUsbSXqJqfK/Jc8A==
X-Google-Smtp-Source: AGHT+IG9eUZYuwQbMll0abDRcExyNxbMOE96IA6V6PjU5z8Ujj03EBUFythDDXMzzeKb7crvfhueyg==
X-Received: by 2002:a05:690c:d91:b0:6ea:1f5b:1f4e with SMTP id 00721157ae682-6ea1f5b2e44mr19585417b3.0.1730142299677;
        Mon, 28 Oct 2024 12:04:59 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:59 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 10/22] libhtml-parser-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:46 -0400
Message-ID: <20241028190444.10522-11-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113303

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
index a3f287dce..64330ceea 100644
--- a/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
+++ b/meta-perl/recipes-perl/libhtml/libhtml-parser-perl_3.72.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README;md5=b0459e4426b94753b9a9b8a15f1223b8"
 
 DEPENDS += "perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/G/GA/GAAS/HTML-Parser-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
 
-- 
2.43.0


