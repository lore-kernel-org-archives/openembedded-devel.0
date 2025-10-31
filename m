Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4054ECCF9FA
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 11:23:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.13187.1761909826401978794
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 04:23:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YBywHWwO;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429b72691b4so1920017f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 04:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761909825; x=1762514625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m4qGwqezhPxr0r8QZF6ZkWjZzFvrFasVq6Gm8YX8Wo=;
        b=YBywHWwOWRSiwAjh4SL8PuR9Q5+U3vQCec8Ep36HXZNGG/n7sSAyqPRPYsrjzRXJLE
         62kkx0DvKWbm8Tyn2YtPV/nF0tRL33ckTvwbSCFffNzATIR+CDb+pbVUtxs9C5uuLv+k
         xNa92+Fj/BeGO26DVKHn4yflcto5zkiNhj9WzTi6LvF/ngb1nr5CaxFQRwNsBNrmgWrm
         yXve1vIYpN2tt9H6UTXpyWq2c9ntg4N2PQ84TU6+Kx8MQodjomNvlZHagZS62ORl+SYe
         5AUjwTRAVWMhiKvWV7rpD0jmY2aDxjG2yMfKF1tC2Ho2BHSAkhV9i5zcJyYp5enq056c
         QwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909825; x=1762514625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3m4qGwqezhPxr0r8QZF6ZkWjZzFvrFasVq6Gm8YX8Wo=;
        b=n16Hwaar8Qa12y3Qq9NUJKTFli3UnxctBeZhRmUwKQh1Gyt0CV9/LZnj9N4plEmqwX
         Fd8gN6rIXXj2t5sAVFIWspKQA24gsui4TDcV/GDr3O3QmbLuEncspp0yYxDqClNzHHwx
         lrIFKpLLY6uDc8AZKwBRhBUEZKcqdeWrurzXXQrVjVaoOC85qZniiP6XbEgnU9Cfd+cG
         t7Vu+nQqCXZ7FXP6k2jA1ZScbRhEIWtze4f1KBidfu5eX9716+7/6EpbZmirHewEGRa0
         K9YZRLCyRSUbDcvnHL2Gten65AeAWou/943RBbFySeB/HAGGVKimpXAEYHB3LGp3AL77
         sY8w==
X-Gm-Message-State: AOJu0YwRWYMNQwRhzS3Syih4F0eO3zlqlrpQGV/kAbK+7KWbhaNA2CUf
	XKnpyXRXPIIlK5l3EYK31N2Xd1+5/iZtlKH3CR4XtnPET2xtc9M5pU/jSJXKhBu+
X-Gm-Gg: ASbGncsI4y/P//7uVCH4Qp8nSLMtjf8smmjEfh2mB+lWq4byE+41s0kEOlQ3h+0jxRd
	oCvWCnc2RA8+AnlxqNC+eqyU9XcPhl/WBRZDVZMlU2DwptubMkFtMnXYDQqTH4WvW5s+7Rmrs6n
	YF+zP8Nn5O+qLG+EK1HBYA9/LB6SfxWPtqbualayZVZzr+sdQHHeL/J/dgWy5vhofBj7rWvUIms
	XkQ9FRag5Y7KXFO5MFUS693q02QJ5fqj4gt8cegp0NQhv0TsDtFo7o13wjYBlcE7RaqJapJFcmh
	c4E5xMlx/6NAZ9vFcID6wybWDQeCmUh54edDhtJoVZbDafYpba++QQ9bPTUcwvi9ieBzOq883Mb
	OM1oJGwtSwoFmzV6i7Hn6B9xDZzFiHUDV46fxh8+bdN8aN06kGBvecXAVFqAQtV1pZUrPCqtgPn
	FzRuIScHs4
X-Google-Smtp-Source: AGHT+IFLZe4Tp6CHC7oyDrKe7r4dPKEyDh3qpsLHQhoCZ3BdYsb6UUcKhzdI16FzYHYB8wVRsLQwzw==
X-Received: by 2002:a05:6000:2f86:b0:429:8daa:c6b4 with SMTP id ffacd0b85a97d-429bd6860d5mr2161846f8f.21.1761909824695;
        Fri, 31 Oct 2025 04:23:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13e16e3sm3174401f8f.28.2025.10.31.04.23.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:23:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/2] python3-aspectlib: fix ptests
Date: Fri, 31 Oct 2025 12:23:42 +0100
Message-ID: <20251031112342.674183-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251031112342.674183-1-skandigraun@gmail.com>
References: <20251031112342.674183-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 11:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121231

Backport patch that adapts failing tests.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-fix-failing-ptests.patch             | 54 +++++++++++++++++++
 .../python/python3-aspectlib_1.5.2.bb         |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-aspectlib/0001-fix-failing-ptests.patch

diff --git a/meta-python/recipes-devtools/python/python3-aspectlib/0001-fix-failing-ptests.patch b/meta-python/recipes-devtools/python/python3-aspectlib/0001-fix-failing-ptests.patch
new file mode 100644
index 0000000000..8c07da67f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-aspectlib/0001-fix-failing-ptests.patch
@@ -0,0 +1,54 @@
+From 2b1e16fa9de6f444ed42c89b8d689e2607b6e358 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 19 Oct 2025 17:05:35 +0200
+Subject: [PATCH] fix failing ptests
+
+Some error messages in Python now include the classname also, so
+prepare the tests to expect these errors instead of the old version.
+
+This patch is the backport of a very small portion of this change:
+https://github.com/ionelmc/python-aspectlib/commit/ed4b036b9e69e195226faab719c470f77ad11cc2
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/test_aspectlib_test.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/test_aspectlib_test.py b/tests/test_aspectlib_test.py
+index 05e2c25..db315a2 100644
+--- a/tests/test_aspectlib_test.py
++++ b/tests/test_aspectlib_test.py
+@@ -414,14 +414,14 @@ def test_story_empty_play_proxy_class():
+         (('stuff_1', 'mix', "'a', 'b'", ''), _Returns("(1, 2, 'a', 'b')")),
+         (('stuff_1', 'meth', "123", ''), _Raises(repr_ex(TypeError(
+             'meth() takes exactly 1 argument (2 given)' if PY2 else
+-            'meth() takes 1 positional argument but 2 were given'
++            'Stuff.meth() takes 1 positional argument but 2 were given'
+         )))),
+         ((None, 'test_pkg1.test_pkg2.test_mod.Stuff', "0, 1", ''), _Binds('stuff_2')),
+         (('stuff_2', 'mix', "'a', 'b'", ''), _Returns("(0, 1, 'a', 'b')")),
+         (('stuff_2', 'mix', "3, 4", ''), _Returns("(0, 1, 3, 4)")),
+         (('stuff_2', 'meth', "123", ''), _Raises(repr_ex(TypeError(
+             'meth() takes exactly 1 argument (2 given)' if PY2 else
+-            'meth() takes 1 positional argument but 2 were given'
++            'Stuff.meth() takes 1 positional argument but 2 were given'
+         ))))
+     ]))
+ 
+@@ -449,14 +449,14 @@ def test_story_half_play_proxy_class():
+         (('stuff_1', 'meth', '', ''), _Returns('None')),
+         (('stuff_1', 'meth', '123', ''), _Raises(repr_ex(TypeError(
+             'meth() takes exactly 1 argument (2 given)' if PY2 else
+-            'meth() takes 1 positional argument but 2 were given'
++            'Stuff.meth() takes 1 positional argument but 2 were given'
+         )))),
+         ((None, 'test_pkg1.test_pkg2.test_mod.Stuff', '0, 1', ''), _Binds("stuff_2")),
+         (('stuff_2', 'mix', "'a', 'b'", ''), _Returns("(0, 1, 'a', 'b')")),
+         (('stuff_2', 'mix',  '3, 4', ''), _Returns('(0, 1, 3, 4)')),
+         (('stuff_2', 'meth', '123', ''), _Raises(repr_ex(TypeError(
+             'meth() takes exactly 1 argument (2 given)' if PY2 else
+-            'meth() takes 1 positional argument but 2 were given'
++            'Stuff.meth() takes 1 positional argument but 2 were given'
+         ))))
+     ]))
+ 
diff --git a/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb b/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
index 0cbeca21c7..ba4baefaf9 100644
--- a/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aspectlib_1.5.2.bb
@@ -12,6 +12,7 @@ inherit ptest pypi setuptools3
 
 SRC_URI += "file://run-ptest \
             file://0001-Remove-tornado-6-test-constraint.-Ref-15.patch \
+            file://0001-fix-failing-ptests.patch \
            "
 
 do_install_ptest() {

