Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C7FEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:37 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.11117.1689607235761453476
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 08:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Ui867Zko;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7680e3910dfso301237385a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689607234; x=1690212034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkBqDBcljo6zaelsoREwbSOR7zZycxuah/S7gDYrQSQ=;
        b=Ui867ZkooUM9Pui42kH4NThYX0Y/7Z1GGbXI/zCuaLbhPhIcLAeMS0bQm6oJnHNmuu
         LZNr0aJuhIay0SgdkgsxwtkKuGAwSu4nZ2dXpSuz+ey2YcAfjHDdSzdAxLAexJH7F+uO
         xDexnNh6dqzCfNE2U+RFtrf6dNWWNQY/lr4B91xh11jMHjce/6JJGKLYBRilST5BHJPM
         dDABrukFyz23j9hsMs4geKYi5w1IxJRuo/0fBHqXC0dvV3rgJwwQr6pE+wEDcuwnX06r
         F8r/VhAS4T3+13BSZZ+GT5SpgJBTyCyAnl//ZawYXGUREGfbUkV3AXevJ+YKwPmJNUsp
         FxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607234; x=1690212034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkBqDBcljo6zaelsoREwbSOR7zZycxuah/S7gDYrQSQ=;
        b=Q7fkT0ltbQ77aNvJqsN+kqq13g+1vwJmtucmHbIdw7sQ6hgZvi6JPnRWgPvKC0sHbB
         xslJCWsSERFIz19ACgR8bjmI+t6keLVRDvOvq2DFr/hQMpFUgZBs5DwMOWcdwXX7WcMg
         Soez7PIgWx2QyyCxRX2Tw/hI+RkpFPOnYmGDwm/7RVw+zNdG5K+rUgqRZaQNlalDZwVw
         V/YqKpy+6Ha/S6UcxMg3x6ZZwDoMde0HbUyCVLuau9nkYqUhlEVFblrfZUWXc45dTRi0
         gV0fuztbHIynTLvCkA9VmG/F4zGHZoCeEcfXc4w4P5AZO9e1Do62PpmPElXf+4RUEo2l
         6GIQ==
X-Gm-Message-State: ABy/qLYq1xRwjPNSNIn0bnd6R5EZmyfi6OXFbidlTE0e/K3vADgsKhOs
	tIFwNcVMeU0hUJ+UW6ozx/+WyauCjXO5EbTABFc=
X-Google-Smtp-Source: APBJJlHIEblnyKl1ZnsSjp8pKO1aLdIeMxFljJC06tNvK3mruz17BqE+DsPIepUnw+ZQr5iTHf7KkA==
X-Received: by 2002:a05:620a:2847:b0:765:ada8:e938 with SMTP id h7-20020a05620a284700b00765ada8e938mr18044567qkp.22.1689607234540;
        Mon, 17 Jul 2023 08:20:34 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b00767d2870e39sm6144226qkl.41.2023.07.17.08.20.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:20:34 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/9] python3-sqlalchemy: upgrade 2.0.15 -> 2.0.19
Date: Mon, 17 Jul 2023 11:20:25 -0400
Message-ID: <20230717152032.3161667-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717152032.3161667-1-tgamblin@baylibre.com>
References: <20230717152032.3161667-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 15:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103880

Changelog: https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ython3-sqlalchemy_2.0.15.bb => python3-sqlalchemy_2.0.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.15.bb => python3-sqlalchemy_2.0.19.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.19.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.19.bb
index e6f0d64293..a2cf00dfd3 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.15.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.19.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "2e940a8659ef870ae10e0d9e2a6d5aaddf0ff6e91f7d0d7732afc9e8c4be9bbc"
+SRC_URI[sha256sum] = "77a14fa20264af73ddcdb1e2b9c5a829b8cc6b8304d0f093271980e36c200a3f"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.41.0


