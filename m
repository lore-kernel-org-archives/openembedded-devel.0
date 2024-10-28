Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4526D5B867
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:26 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.1017.1730142309835593101
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SYf9XydW;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e3cdbc25a0so50890317b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142309; x=1730747109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xvrp+Ui2TNXWwg1PJTg7xMTwMGidzvjDQ8U+0w0T04=;
        b=SYf9XydW+fOkUDBSaYKKsavFrLrUXdFk6XwkW5zCwpdwHW8n5RESofdyzrrTy0DkSr
         gu2fh/HODMpTcdgoqSOeOYh6GMUicPeFduVaxgeUCpe1potkHaRe+ovsp98+hGJm1kc6
         T4b9+m2J+UOEPUgn6b4XtQMXOftkRrI9omgc5/v6P1laqf1kLZmgWMlCEIGgLTS/EO0M
         uWweOqAs2yBUnZqHLTi+jrrBCU45nuwwGAoFzvtrvD1OU94VwUI3kegZEiGBW06vD5W9
         vivUhZ/j6bVW2VRV0f9vX8iDpFc7LiI4V2npjJpGVdgIrLys/+r/i9sSB27fCYgBgFUs
         K/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142309; x=1730747109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xvrp+Ui2TNXWwg1PJTg7xMTwMGidzvjDQ8U+0w0T04=;
        b=UHfPCViqLYwlz8kOG+rwrs2qOAze4o0Ya5UIIfYNRw0dY4egKE0DXRL6l85Hn/CGtS
         Z2NaUpNYLEw2fkuuAjkP+ljRsOp13w8+zonm/JESnIcClnA6cl1LFUhtPfvOAGhL/4rB
         AgGHxWyAE8Ihuur5sPzJMTBcz3haHNUxZEJVHnY8SqmH5bApcgKXdEQ4J6/ye/0lZ2yi
         WdSldYCII8G5GU5GQdV/GhmpP+PfNVmu/SfRyVWiD5ayZa7Sex0lLB2D1APr61If4XlM
         M4MOv1i9vwJ+eThOTCzjLpxea5fN/1PocyLCrN+TWRBVyBNEk06LkKhiHyxKcxm+IpOK
         EdSA==
X-Gm-Message-State: AOJu0Yz+6e5dadMQ8uUwIxoO/9mOYd3w+gQPnWZliswGjiiWi2P+UTiQ
	yV3h8jJyiE9UWhs8bGXulyOIWZKlavbYjABtda3xb41Agjj6NIQssqU3Rg==
X-Google-Smtp-Source: AGHT+IH0L8SVQwlSJNXQ/NDJglwt5o+T3Kie+rvNQIFAu/UueclzRUd0g0UWwgiq3zXrLttHqq3EKw==
X-Received: by 2002:a05:690c:dca:b0:6ea:157f:6269 with SMTP id 00721157ae682-6ea157f63dfmr29693337b3.19.1730142307262;
        Mon, 28 Oct 2024 12:05:07 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:07 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 21/22] libxml-libxml-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:57 -0400
Message-ID: <20241028190444.10522-22-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113313

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index b1d5e5db5..e0ed6e7c3 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "\
     zlib \
 "
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
+SRC_URI = "${CPAN_MIRROR}/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
     file://disable-libxml2-check.patch \
     file://fix-CATALOG-conditional-compile.patch \
     file://using-DOCB-conditional.patch \
-- 
2.43.0


