Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2F1C6FA83
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:24 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.11310.1662276865171884035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oGs3C69J;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id bh13so5608782pgb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WwB/PyRL98KPuuJRoO0zoTLQJcPWy/HYZg7aHUOW+hk=;
        b=oGs3C69JQeFzbe85azRXjtPPYe6EaIwMVGO4O0YNF6mUeqLhVBAVd+YQpWfGOhmxVC
         S5/EqgiKjR+AqNLQi0X/4IYMcwvUoo5th931g32WdgqIq8ZymzDQrCT1IQVycjSqO9wd
         5NG2gfWqeyzSm1CClWU04XlN+fFFkqgnnYVmzhEzd9lRNL3rio7HzFkcPV+pdG/PWi98
         FpPurUIV2tXP38kJ70kyzRpt8NhiQjnwK293ZqgetRxRdEpoSs2nTwXoEiCMYaMINTzi
         HBjnJtD/nVzP0oo4gm8jcAEwUc5nqV495IANwPp0th7GNHb8CQ+zGgJUjfWHbI7wHWoJ
         Icwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WwB/PyRL98KPuuJRoO0zoTLQJcPWy/HYZg7aHUOW+hk=;
        b=yYUiROmdoyb2PXdIw0qjqNUiEHMO1aQa9v8WYi8gcJnQpUyTIr6Xj+oN+OrjSQDIEl
         KFSQtYJ8reSYUvIF3BuryB+9+yCU+BoFKAm3UFZo0ohrIMnlfssG87MA4kS9X6pqDfmE
         KQlq5UmTur0S9tVIVWAmabRbZZd9hWIdsRE1T+28d/kbSVE7qhRl3bNAnV1ppwM+z2re
         TqrSBbSnRBo6D5nPIXjuDYfsHWxoCaA7mUA0LQ4GjU8utF0O5V1Qa4lrsij1YEry2JhN
         RcX0ZoT3sZUtVYYxEa/HY7ezzcFy+ISreZ0LeEb8sjPTdVK7p7H3m+F+oHgZkd4DvHGF
         rvyg==
X-Gm-Message-State: ACgBeo1KAOdCzF3UoWikfaV9XGYpSqN3sr9LT89FirosCleIt77h+zUO
	Ih3QyoR4rn9o20VuwiboS+h0i6vUoLJY7A==
X-Google-Smtp-Source: 
 AA6agR6NFpcwYtO7RY+Fkv+c/IRwyGKYilIe2Bw7YjmWI/MiBBH+/seeja0U29R1O5PBfEke9WeKLg==
X-Received: by 2002:a62:e50a:0:b0:537:1eae:1268 with SMTP id
 n10-20020a62e50a000000b005371eae1268mr43838634pff.16.1662276917591;
        Sun, 04 Sep 2022 00:35:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 56/63] minifi-cpp: Disable gnu extention of
 strerror_r when using musl
Date: Sun,  4 Sep 2022 00:34:10 -0700
Message-Id: <20220904073417.3251865-56-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98650

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 671d320195..8fc253908f 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -79,6 +79,11 @@ TARGET_CXXFLAGS:append:riscv64 = " -fpic"
 do_install[cleandirs] += "${WORKDIR}/minifi-install"
 PSEUDO_CONSIDER_PATHS .= ",${WORKDIR}/minifi-install"
 
+do_configure:prepend:libc-musl() {
+    sed -i -e 's/-DHAVE_GLIBC_STRERROR_R=1/-DHAVE_GLIBC_STRERROR_R=0/' ${S}/CMakeLists.txt
+    sed -i -e 's/-DHAVE_POSIX_STRERROR_R=0/-DHAVE_POSIX_STRERROR_R=1/' ${S}/CMakeLists.txt
+}
+
 do_install() {
     DESTDIR='${WORKDIR}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
     MINIFI_BIN=${bindir}
-- 
2.37.3


