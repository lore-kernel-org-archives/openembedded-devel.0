Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F9CC87FCF
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 19:20:07 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.27376.1753471203216414443
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jul 2025 12:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Tsf3MJ3E;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-451d3f72391so24766535e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 12:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753471201; x=1754076001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=efEsFlnOIxuu7PVICTTsxlXt9Yi0ZhqR6N6oS8Xol5k=;
        b=Tsf3MJ3Erajl8PFkj/8ABoS50vI+5a+7/U1dMy9PBU6pdY5uN1weJ6G/Xw0PuLupuR
         T6+XDun+RzvV4O4QLA93ZzxiOt+wnv/SSoaLkF78aLGQpnbd+n0ut0KXC8Nyio5xKMw2
         9JNpp78o+ZcmYwOL/5qmWZDHQw7LK8T99Daqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753471201; x=1754076001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efEsFlnOIxuu7PVICTTsxlXt9Yi0ZhqR6N6oS8Xol5k=;
        b=Rv0vOHn7hCkn42KjpptSMp8orRPTfdgghxzfT1De3288/kHtHkhSTljLsbP+J2zVJu
         KNJ8jLoYPRZ2JGQODpLRjwGxbOvyDb1herXJusKG4v/3bQC0/pzvu8jAyf1sJV3KXu1d
         y/bLMq5WYnl9GmBkpDJCmAg+gOVZPI9sbLHJtfIIo+xPxXKnV/yL6uSiY+a+CHCWQLgP
         HfB4o1h25yIwrMx+c172oFfzaXTssFaBb6rI9c/W8r1FXTnm1zpWlMkrCAi3hUUcbu6G
         +YuP18KbiI4rCYsjz56jSGem5ABxAnm/IjSpZYZVo1kfq6XZG2R7tCbyoooxzDpUrZIB
         8WrA==
X-Gm-Message-State: AOJu0YxAzraM6WPbJne41P413TVMNjyicJjtKpon+gg9nDGuEQN2KUb4
	uOdBS6l3Z5ACPMDEAvvOmvrQjaV5JiLQsQFmHVs8W1yrrMdV+g83ddy5BLGcS1DvwIewEX0VKXR
	/VDBohTo9trGo
X-Gm-Gg: ASbGncs3+0NMXKYUdsd5z41Wq3qkTqdRuxn8h4tmHZBU07EnYEzaWqmvpoBAOjV1ZLw
	ffzt5rjrSDW+eyIPy/EvQWc6mZl+FhPh4F/ZNmrPavSgrZn1cPHufYFzi9M4Ty2Zz/NFF/EmSy/
	u2sk5TRGs+DW4Mmiv9x9ocOnWfIHmK12/hSUSciCmCnpZLw7BcU+m1G+x3JyJL7xU4da5fb+Rv/
	sLmLXllxuVQ8NFJDMn3M0fB7W1JDKK//f8hAVT1dAroqDns6lPnFG/gsjQbZkd/rLfAD8hlP49q
	ICSKMtpus6gQ07qMzDyiKTJYilFqx1kqhgwzUrBA2HdlEK/jfXPXiJ2Q+/Ye2vygoAWe5gApvic
	S4dPXps2FHfOGXPxUNMcISybjGtT5g3OtauYb80onCg==
X-Google-Smtp-Source: AGHT+IGiH/rYm/5arTTGKN+MoxRLAYGdr1A58AXoqVXfIOt/TRHDRHYB7siJchacS4A94+UcwClKWg==
X-Received: by 2002:a05:6000:40cb:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3b77679ad00mr2791194f8f.55.1753471201051;
        Fri, 25 Jul 2025 12:20:01 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local ([89.207.175.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705ce685sm62067035e9.30.2025.07.25.12.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 12:20:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH 1/2] catch2: enable native and nativesdk
Date: Fri, 25 Jul 2025 21:19:57 +0200
Message-Id: <20250725191958.1696481-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Jul 2025 19:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118734

From: Yoann Congal <yoann.congal@smile.fr>

Since commit de3c8d3ff2d0 ("cli11: Upgrade 2.3.2 -> 2.5.0 to allow CMake
4+ compatibility"), cli11 depends on catch2 and is native&nativesdk. So,
catch2 also need to be native&nativesdk.

Fixes these warnings from AB[0]:
WARNING: Nothing PROVIDES 'nativesdk-catch2' (but virtual:nativesdk:[...]/meta-openembedded/meta-oe/recipes-support/cli11/cli11_2.5.0.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing PROVIDES 'catch2-native' (but virtual:native:[...]/meta-openembedded/meta-oe/recipes-support/cli11/cli11_2.5.0.bb DEPENDS on or otherwise requires it). Close matches:

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/377/steps/12/logs/warnings

Cc: Alper Ak <alperyasinak1@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-test/catch2/catch2_3.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
index 6a7fc5ad47..48ed26708c 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.8.1.bb
@@ -19,3 +19,5 @@ do_install:append() {
 # Header-only library
 RDEPENDS:${PN}-dev = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
+
+BBCLASSEXTEND = "native nativesdk"

