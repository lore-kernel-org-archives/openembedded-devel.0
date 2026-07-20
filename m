Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABE1C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 14:34:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10432.1784558072548223561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 07:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YwBPDEB7;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso5658817f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 07:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784558071; x=1785162871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbjsDNgp4VqbzDHXvSwmxgyZ/a3uk3Bf702zZTE+B84=;
        b=YwBPDEB7b+DXZftCuiDqRo/BPa3txTIt6YPk1AN6MJT31glSvixu4HYXR/XTCijsxI
         RJ7MLcEGVSW+GsEyhmuwCHFRHavujaaNFm5oVofHmwkwA0lIChvHCPZ54j3DGLpaWoLB
         op1T/za/LqGYdY/cwND6Ayy4WJC6p/liWkkTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784558071; x=1785162871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbjsDNgp4VqbzDHXvSwmxgyZ/a3uk3Bf702zZTE+B84=;
        b=LLHOxBJ5kgdOKRIDkBhQmhtCC2XIZguaOBR3zfsMAfkB0v0IjhUVukW7uPxqHWFLdI
         ff5+CEoXM/9QAUpXx/FUuDQj0u/AO8ePK4W+7MJGsf9M+ASi/CrRvTceM8P7Io/8dRQA
         EJ7CEDxqE1UkM3TErrUN9mS5X96tXcqEdnr/flT87FztlWMNRk2vkIXidRmD/upZQUzF
         xEo9bIh2m1e1AP3HFLNMUCd3JvSClFxfTrAS5covLJKEgVq0VGTaKNzEUZiT2LqQuzg5
         46kuUxtayot64NCLul+1jZ4FH6VqSP3Wc8MJjkhtnJ1Ol7eCFRJ5N5xW80CkEt+Hrf8W
         391w==
X-Gm-Message-State: AOJu0YzGLR/EaH+3J1n21SGrULVbF5BfKlyZ/z1owau/5H6jTHYGu+5q
	FmnQsGZywAJdCx/FYA80Q5LhYaICUsDvA5JsDGa+UgcgfZrwPie07g+jvPpL2CS+SUl+ulw7vBN
	EGlnF
X-Gm-Gg: AR+sD13Bkrd2jKPwJ+FS7wpyCpEM3iVirEtJ64yixIBRztm8VZOfkcLf2dOKsppCjcc
	ApVgVDzrZS4huHnOUX9Xtcs0l06+UEtzCdPpfi9Linr6jy4+8IK2448YmCPD/kpg+5/pjgJy0SQ
	eLJ+VQdD+t11RQYQYh/GxXBkyuDAyAvjzrrrzoenAr1lUWlLBVfv+bsEITn/V+CqIxx/9tM6VkG
	wto9+Ei3MzSsBYT6LtTtVk+YRQu9DLmTNuxC3EAVH5ULQ1S6fSCc3thf+IZgRgzcxzsmRt2yTbb
	YcUIPQG3Qg6nQgu9JcNUm3fHQxX1Mrn039J4svxZYY1/hasIGDqWPf7AFoHZNNprTcwISSx9Q+s
	kbbWJ45hhV/mgalP5s7Tv98WiNkdyW6p8O/KLr8YFpzs+GDVrfQyXPh6wHmeQn1/UqsntDw1pfl
	snilOJw1jSkc36u7MDxtvKuF+Xkz1lR9aUEuPNc+XJORfJCoJqEej/chMhaKxRsw6QpNSGr5K8M
	84moQvJiJG2fGMhJmTAcZsdzA4GOyI=
X-Received: by 2002:a05:6000:2407:b0:47f:4fa9:ae33 with SMTP id ffacd0b85a97d-47f622fef02mr17469946f8f.12.1784558070776;
        Mon, 20 Jul 2026 07:34:30 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm29498970f8f.25.2026.07.20.07.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:34:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-invoke: Upgrade 2.2.1 -> 3.0.3
Date: Mon, 20 Jul 2026 17:34:26 +0300
Message-ID: <20260720143426.809643-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260720143426.809643-1-leon.anavi@konsulko.com>
References: <20260720143426.809643-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 14:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128279

Upgrade to release 3.0.3:

- Reverted the @task return value type hint change; it actually
  just makes things worse. Taking this one back to the drawing
  table for later.

From 3.0.2:

- Define a custom __repr__ for Promise so it can be displayed in
  interactive sessions or other debug contexts, without running
  afoul of AttributeError. Thanks to Leonid Shvechikov for the
  original bug report.
- Make the return value type hint for @task more specific; as-is it
  would trigger typecheck errors when handing regular, decorated
  task functions as inputs to add_task and similar methods.

From 3.0.1:

- Minor tweaks to documentation and type hints/inheritance (mostly
  around Promise).

From 3.0.0:

- Add access to the core CLI parser's remainder value, via
  Context.remainder - this allows for more elegant wrapper tasks.
- Update the return value, and type hint, of run and friends to be
  Result instead of Optional[Result].
- run now includes local subprocess PIDs in Result objects (as
  .pid), via the new Runner.get_pid method. This may be generally
  useful for auditing or similar tasks, but is primarily intended
  for users of disown=True who want to perform their own subprocess
  management.
- Fix a grab bag's worth of Sphinx doc render problems, among which
  were some class attributes (eg Context.command_cwds) that had
  silently disappeared from the class' autodoc output after our
  2.0 release.
- Expanded mypy type hint checking to more of the codebase &
  generally touched up some type hints here and there. More of
  this is planned to occur as we go.
- Dropped support for Python versions <3.9. That's right, we've
  caught up to Python's own EOL regime... as of late 2024! As part
  of this change, we also switched over to using pyproject.toml for
  packaging metadata.

Fixes:

WARNING: python3-invoke-3.0.3-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with setuptools.build_meta,
use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-invoke_2.2.1.bb => python3-invoke_3.0.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-invoke_2.2.1.bb => python3-invoke_3.0.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-invoke_2.2.1.bb b/meta-python/recipes-devtools/python/python3-invoke_3.0.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-invoke_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-invoke_3.0.3.bb
index bcff343480..e9d19da088 100644
--- a/meta-python/recipes-devtools/python/python3-invoke_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-invoke_3.0.3.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://www.pyinvoke.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8815068973f31b78c328dc067e297ab"
 
-SRC_URI[sha256sum] = "515bf49b4a48932b79b024590348da22f39c4942dff991ad1fb8b8baea1be707"
+SRC_URI[sha256sum] = "437b6a622223824380bfb4e64f612711a6b648c795f565efc8625af66fb57f0c"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += " \
         python3-fcntl \
-- 
2.47.3


