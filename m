Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50A9D10367
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.6095.1729801160565839938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aqDmzrXp;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e2772f7df9so11789307b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801159; x=1730405959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GiAs4FS/EM1Wcnb7+cDkAYuTc0AIq+Waw3PsYMkpFc=;
        b=aqDmzrXpbKYsNteg/Lfn3o8X+/mttqKllGYQ7+6ATSSVsd6qgT8b/FJFqSwPdbcNLm
         w33WNcxUxYfoW69iDIVWKjAQrzhvp4tAiIRfa75dlgmVm3WDngJEJawikN9N17oqUbG6
         JRzJbvtMzM78rDJrpvPkMyT4r7ySWGp24kq03lH3Sb3O9FcQguWwzuhq5A5iPrCJGHUC
         6onYYmjziNOlR1txqz9FhroYrK954qaoWnS87Xucb5/BA1Ve+6pTPSzGC684DBh6ue+8
         AwIGwGHywhGUzgYgYl3kLPvD8FQdfljJ8avu11JK2oWiPcp4OuHpHRDUj1GwEcPr9ov0
         o0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801159; x=1730405959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4GiAs4FS/EM1Wcnb7+cDkAYuTc0AIq+Waw3PsYMkpFc=;
        b=F8Vz+QA63iswN7Yi5SmtkXo4ztP7O18cjO3T8aARA/teVTmedZQG689ixEz3oflb/y
         NFPESIRzaKPWtPrGGzcDk/uEUmBOHRoHXmtQzzuaVhDPDvGkg1yZg8SRKrLAecPo1zX8
         t07GEcwJpCdyiAjv78NnSsULlouNva8kp9v/X/s7W15c3Zgl1zOlVs6S6LUA+XnhCZET
         8drFdp84BrJVFHk4pelhgcUK27n68Wb6W5kesHM1OxIu24xU+kUAPr+1+wEIOX/I7992
         Ee5e3S1MYhLRXrDdM8VQdxzqIVKRWp5NCD8YvEslBZ5GfmNYTS63a0fbnQlpHfqEsics
         IHfw==
X-Gm-Message-State: AOJu0YxPGVwd8/mxvF6I4sulParUOZm1Yheu1Jwyp+5mFsDy6zwtfQus
	uqBBTsAn5NW0Wg1xnYp+qOm7yx6v5JUgRTvWS7KzdFQSaL2598BGciKktg==
X-Google-Smtp-Source: AGHT+IG026/zWrHelCtsA+gq588hMGod30r0a2W6Qhte4TnR4rLB+ohCexc2DqNiQPEgrztbNeJA1g==
X-Received: by 2002:a05:690c:4d87:b0:6db:d7c9:c97b with SMTP id 00721157ae682-6e7f0fdb740mr87963867b3.40.1729801159323;
        Thu, 24 Oct 2024 13:19:19 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:19 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 39/42] libtext-wrapi18n-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:58 -0400
Message-ID: <20241024201806.440273-40-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113217

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
index 0949dbb7a..7bc2e234a 100644
--- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
@@ -11,7 +11,7 @@ characters). Also, minimal handling of languages which doesn't use \
 whitespaces between words (like Chinese and Japanese) is supported."
 SECTION = "libs"
 
-HOMEPAGE = "http://search.cpan.org/~kubota/Text-WrapI18N-${PV}/"
+HOMEPAGE = "https://metacpan.org/release/KUBOTA/Text-WrapI18N-0.06"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;md5=080862e1e40cdcddef4393e137285858"
-- 
2.43.0


