Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A69EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 16:13:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.46846.1691770394302827346
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 09:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dt2jSROL;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-686b879f605so1655894b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 09:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691770393; x=1692375193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eQOlhdI1p4emVx2t5kc2lHsNQZuKwqs6ePz0RyMPl3U=;
        b=dt2jSROLbs+aPGCxTy9gHfQ699fxrkYnVKA9MyfbqYhqFQWuDwGeU6zAYwrlvJ1oLJ
         iznFVD7e1kOcMlBmdbZDopIPN5j1ztUi3JD2JKhn3DyjpPvjZu1dmmyhaCDHvCoecP5r
         vfAmR9lHi0rKeti39HR+aw1hgHFKqfOVlk46cM5MewcExxZ5icOF33tGonBS4YBECGwV
         5V/BYfbYQBgQ5Nmq4UAJilqXhtkgcmV3/LHxDqv/MUdP1bRDwkH7TkppQDVOH3MUdc9L
         0a5mgxZlecS/BgnOh+LTNcOqgWsI1pyDXT57FI4/fG/Tl9fAdk1zmD5R0Drz7Wavy2pX
         Bp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691770393; x=1692375193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQOlhdI1p4emVx2t5kc2lHsNQZuKwqs6ePz0RyMPl3U=;
        b=FWX3m0EmEpmSciHNQOm3pggcykiR10RUrWCkJltSaIzs+1JLZ35k0B/k3aIHnOpMy1
         JZBpX5RLVQOJ6s2qI+wSYyScbmWew+jAF+whs+cVmlgn6nKUvsShgydwlXiynjb4A7nn
         VldhfBBoi83RbLsRP2BiA9rhWT8ie4ZDn+5IO1aJkv+Hhng1xSJCoj/Cn6Yzwf/yk40u
         E1160l+Og5+yZQQ8i3c32fGe9hbY11IPJdz+An+yXrgx9gmrWlvb2lt0oRAAsKSR86VP
         UF4W0FpdkjeuBa3X0/HREMEBv8rmVMAmrSgTxpmmyydY4Qjda/GRp9nwr9ViIi24jCf3
         caww==
X-Gm-Message-State: AOJu0YzLJmI/owdMhLt2ATewZ+AXa4cF1u4j6T755c4msBv4XUE8UpdE
	ykWXL88kLvKYnGNvPwLsle9dxKEE2sf7iw==
X-Google-Smtp-Source: AGHT+IGW0We1fM/+QLaUTKv9oJX2qsDA3sdUHHeRfFgXrpsqQKQFjkG9Izl/uJGQHe9OMsNBxp6HbQ==
X-Received: by 2002:a05:6a20:3d8e:b0:12c:b10d:693d with SMTP id s14-20020a056a203d8e00b0012cb10d693dmr2681701pzi.6.1691770393179;
        Fri, 11 Aug 2023 09:13:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id k19-20020aa790d3000000b00682bec0b680sm3499983pfk.89.2023.08.11.09.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 09:13:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-dominate: Fix get_thread_context ptest on musl
Date: Fri, 11 Aug 2023 09:13:10 -0700
Message-ID: <20230811161310.11632-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 16:13:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104339

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-dominate/fix-ptests.patch  | 20 +++++++++++++++++++
 .../python/python3-dominate_2.8.0.bb          |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dominate/fix-ptests.patch

diff --git a/meta-python/recipes-devtools/python/python3-dominate/fix-ptests.patch b/meta-python/recipes-devtools/python/python3-dominate/fix-ptests.patch
new file mode 100644
index 0000000000..81211d4498
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dominate/fix-ptests.patch
@@ -0,0 +1,20 @@
+Fixes test failures on musl
+
+Fixes errors
+ptestresult.python3-dominate.tests/test_dom_tag.py::test___get_thread_context
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff --git a/tests/test_dom_tag.py b/tests/test_dom_tag.py
+index 43ffecb..1126e54 100644
+--- a/tests/test_dom_tag.py
++++ b/tests/test_dom_tag.py
+@@ -18,6 +18,7 @@ def test___get_thread_context(monkeypatch):
+     monkeypatch.setattr(sut, 'threading', threading)
+ 
+     assert sut._get_thread_context() in [
++        1692341442, # Python >= 3.9, 32-bit
+         -6805948436281256182, # Python >= 3.9
+         3713141171098444831, # Python < 3.9
+     ]
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb b/meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb
index 73701ec72e..6b0489e4fd 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.8.0.bb
@@ -8,6 +8,7 @@ inherit pypi setuptools3 ptest
 
 SRC_URI += " \
 	file://run-ptest \
+	file://fix-ptests.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.41.0


