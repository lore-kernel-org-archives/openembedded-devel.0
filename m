Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC97C433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 06:42:23 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.8662.1638513741839270583
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 22:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Un5AmLGt;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id x5so2022602pfr.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 22:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=69v58Q7BQbEVK5JsRizU6p++HR2F2kX5yY6QRUwyz+k=;
        b=Un5AmLGt24l310QXGFCcsULWMJaBbsVfAkZjbifx4SrVcKGTcp/XCzslvCzc3RtOh6
         lxxFsSr/4HMvWNQzFfT8bxKe9HuXDQUlCWZGjOtqYIcFMH3zXd14XyVEntgO8fPhwBza
         fI1hWVRQaTqVwxZ/Ic2N7EokoFEdUSKC5jhxoVJZ9FUnrVrKTBMfVKijmdthipuu/1xQ
         MspCwEUHvL2dRIXFdx3+YIa3QOsTNra06/sHD4aQAWJ7tnoOqAXDx2XWonWKl2LzHD/9
         e7dzuYPJGgJPbbSJgPF9pwIEnjaL0I9a3+WbA/ky7GlJWh27DjFlFkTbcrfKqHp/olzy
         CATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69v58Q7BQbEVK5JsRizU6p++HR2F2kX5yY6QRUwyz+k=;
        b=cr2xy7N6V6lOb/jw0tJrqBU6q9Zgr/vuketXwf+QedHiLZ2IMheUV3h+e2edNy6qxR
         UPjrNjfL3h9XMzFqYQRVClgnx16rbGXGCT/o+AwMF28Ou+R5k9A/max6wC4QUeB5nh3k
         7pHiUoAaxevbCWfSJAL35Paw24V885fQskDovCOkRI+i4FOjn6oewN3230ijJhpGtKjq
         W0dzr6NSpVil6CVKCm196v0ALv+s9QLR7Aqb9wua3er8LXXcAb5MNAv8rD8lZxAfCRU3
         M6CboX6JvPi25M8L9Z2vE4Z6kw6hdOjqzHyEIe0wvmH8vfCjNX8daVLPUSq4lNq7mqAf
         NQBA==
X-Gm-Message-State: AOAM530EgM3uh7AapLkWJq1bGCckhuWjSR47jomdNYOqdho5Hk9AFjIw
	LMGoBhbAMNOWmMjJ62sCcsXhZq4L2IkkMg==
X-Google-Smtp-Source: 
 ABdhPJxMQAQFNLmR7I5T5aDPiCtMsWXDIZGZrBZH6N2rzbM+B6875lGsOV1hnI4fT9Hh9POI/eNGXw==
X-Received: by 2002:a05:6a00:228f:b0:49f:d8ac:2f1c with SMTP id
 f15-20020a056a00228f00b0049fd8ac2f1cmr17599993pfe.35.1638513741103;
        Thu, 02 Dec 2021 22:42:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 n11sm1300956pgp.15.2021.12.02.22.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 22:42:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/3] ntpsec: Disable seccomp on riscv32
Date: Thu,  2 Dec 2021 22:42:16 -0800
Message-Id: <20211203064216.2609394-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203064216.2609394-1-raj.khem@gmail.com>
References: <20211203064216.2609394-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 06:42:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94194

rv32 does not have seccomp support yet.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
index d07cac4265..2551b6aab8 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
@@ -30,7 +30,7 @@ PACKAGECONFIG = "${@bb.utils.filter('DISTRO_FEATURES', 'seccomp systemd', d)} \
                  nts \
                  refclocks"
 
-PACKAGECONFIG:remove:riscv32:libc-musl = "seccomp"
+PACKAGECONFIG:remove:riscv32 = "seccomp"
 
 PACKAGECONFIG[cap] = ",,libcap"
 PACKAGECONFIG[docs] = "--enable-doc --enable-manpage,--disable-doc --disable-manpage,"
-- 
2.34.1


