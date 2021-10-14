Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7563C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 22:26:29 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.1851.1634250387858760833
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=OKpB/XxV;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id y26so33325972lfa.11
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6jqnAsHE2UMQMsyoLd+z9BqhBp7DHYGbMG6wrMT20hc=;
        b=OKpB/XxVP1VcT7VMmb/GiyA3YM/iJLAEVFh8IIxp+E0tt+F0wkhlwyj2xP95zTwTeg
         9wuMkfepGwBOP5cZ1kFR1xO6aZ7wvWPTYXa0pD83OAQHTm5VomVvHUVhZjl6jsq8p1Cg
         tSmRUZSOugDHsjD7nqRPOHdwHpjUaFpriVqq9cdyL3uP5NB8XE7PYxjnnoCwn9oequEA
         Zax5d0Z+YFoZWj1MCjxhZE7FJys6e55hi9Mhi9GEBlR1/Qlil62/2HQMCeN/yIlA3h+/
         YLpgY61d0jkpJ7xFKQ+I17/TfJXu6CFlgjfk7664qRs+t7ahlAdFwqSr8RkgkWFBIfkF
         4gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6jqnAsHE2UMQMsyoLd+z9BqhBp7DHYGbMG6wrMT20hc=;
        b=GDMzsyeqi2bouub6djtwouAFWuf7EFze39hiqzfpQcb9SXFYFK0msHmo5wGaNVMhO+
         SauDs2VhQ5N1jDDFdMFigsro/52cwaxrpyYDEFZICaPt+ozz8wibzOZoAo8M+RFs8pS+
         WHiOHxXlrNV6/YvjaI3B2Yg1Vz6N8/DuWuwHQ6XS+hH9p//iGm6SH/YtF5syUYbokF5B
         MCjFzCkj5loEbW7O+Z7RdpRyfw+gna06uDBo1VXap4F21+x/DJ4M0zARLBXJaDh5pgIj
         3f+GhXyyLQ0VrTBWz0fbwbXgvj07kYrLAigtlivS1QpJWsEyEWqtugocPO07CvDMuA1z
         DQ7g==
X-Gm-Message-State: AOAM531nMoxfZY4PEawMAHITWNWtV5RgTREM4XD5/SeCzCcnih379DRW
	ETCFJ20w+V7MZDXiUPLsizO4TwrbtCxrMrAh
X-Google-Smtp-Source: 
 ABdhPJyE8wBTucoElokeXFFWMqz8wfketklNfAqij2J3vLPzaa466YCMsik7bxsaNOeu56JMgOpwng==
X-Received: by 2002:a05:6512:11cc:: with SMTP id
 h12mr7860617lfr.110.1634250385541;
        Thu, 14 Oct 2021 15:26:25 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 i15sm335411lfc.11.2021.10.14.15.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 15:26:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] pegtl: update to 3.2.1
Date: Fri, 15 Oct 2021 00:26:19 +0200
Message-Id: <20211014222619.3843187-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 22:26:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93308

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../pegtl/{pegtl_2.8.3.bb => pegtl_3.2.1.bb}               | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_2.8.3.bb => pegtl_3.2.1.bb} (66%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.1.bb
similarity index 66%
rename from meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_3.2.1.bb
index 01233699a..f0ae22941 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_2.8.3.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.1.bb
@@ -1,11 +1,10 @@
 DESCRIPTION="header-only library for creating parsers according to Parsing Expression Grammar"
 HOMEPAGE="https://github.com/taocpp/PEGTL"
 LICENSE="MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6a5195f720a8d436a4148e0cb8660400"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5b6701671289d12b7ffa69138832c006"
 
-SRCREV = "47e878ad4fd72c91253c9d47b6f17e001ca2dfcf"
-SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=2.x \
-          "
+SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=main"
+SRCREV = "6d03c8decc22b4ddd51115e2170e0e82413c7104"
 
 inherit cmake
 
-- 
2.25.1


