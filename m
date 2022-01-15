Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B00C433F5
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 02:17:13 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.2722.1642213032732076047
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:17:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fp1Ji9lR;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id p37so4349921pfh.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7987cwk17nSrPdJrrSu9iLwEfX59MQ+FeuOo4PTXAso=;
        b=Fp1Ji9lReWSTyd5RjCWhXp965HcBeFFcb41DzGF04ZcF0C5JqpkK/mG3frQRZV8HD7
         k8CvfU8SgVcd7A/aIvhzrcxKWBOfbsBAnWkAWNmQcR9OGb6euXiuL+Gxxr8XS+Ypw5Ih
         GNu6jJrXlBzqZM190RZE1Ny2JDIOzdQ8MynEtBPo3BgphZlz6uYHM/FbOg0iNgV9spTn
         3oj/Ep30Ft7lgQ8y/IOgiiOJ8FwmN150t031VcUEDPhYH4ywIqmHqeGFI/BtWX8U+2OX
         cQlZllmx8lpk8X3Zi0+xhWDKFYFNiVjOh8CdVyu19mC0TCysO5vfgsYzo5irMFh0mDe2
         Qmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7987cwk17nSrPdJrrSu9iLwEfX59MQ+FeuOo4PTXAso=;
        b=al/kpoYVtHMS71573C7sMpHCfCeg8FH1e9nE6Nau7p4raepDguYnN+pBJawzuGyQaC
         Pc1Dr+HZ+06bmhPGLaHNJL6bOLWSv1OkYcjIZwR93Q2G6VgF6JRu5a9chkNBhNZH1HHq
         0JrJBaq8amJ8mhQNYEaaMnxJisqC58TmDWxxAt5cyOW31XjMdnJJu5Cn+N6zUGSSFPGa
         GvqaSzJCpt7B+vj3tmjU3bD5VaxVzyOljrBlzlkKiiJ7xIAa2jRhxZ+IxsgtBih/Say+
         mNhIbscPOkJ5x4emMLw60dHRKapu2WldG9FayOWj/c07Qfc33EavAmWfWarkeCrhNEDF
         mKqQ==
X-Gm-Message-State: AOAM531hNZ+u6bBvnxWsv44JOS8m9KgZJCLrwN5HzBLxUHSUz6/FkAEL
	AECdXTIIaNhbxz/M80H3zZ5Cv6ampm/fXA==
X-Google-Smtp-Source: 
 ABdhPJxOmyB2KXuNIIG2l2BqyjUXNJJnZeYHD4RNZvkkTjT1VJmLbN5tO8CVrHch6R3M5Rk1OiUV8g==
X-Received: by 2002:a63:b54e:: with SMTP id
 u14mr10206019pgo.240.1642213031946;
        Fri, 14 Jan 2022 18:17:11 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:a77:9acc:1e05:f39b])
        by smtp.gmail.com with ESMTPSA id
 b12sm7311113pfl.121.2022.01.14.18.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 18:17:11 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][PATCH 2/2] cmocka: use https protocol for fetching
Date: Fri, 14 Jan 2022 18:17:00 -0800
Message-Id: <20220115021700.1948700-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220115021700.1948700-1-tim.orling@konsulko.com>
References: <20220115021700.1948700-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 02:17:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94852

Upstream gitlab instance is refusing git:// protocol.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
index 2e34f6ab44..554d582a57 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "a4fc3dd7705c277e3a57432895e9852ea105dac9"
 PV .= "+git${SRCPV}"
-SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;branch=master \
+SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=master \
            file://run-ptest \
           "
 
-- 
2.30.2


