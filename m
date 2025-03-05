Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C27C28B22
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:34:23 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.13077.1741181658735789536
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jSRTth6W;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so44539055e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741181657; x=1741786457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGjEG6LmYx2siFM9xk0NT3oFo3RiU509hE4rDYZszQo=;
        b=jSRTth6WgN2FEFISB9HRQ3ZQFMdjRPrKP1wLW3Dh31sgLpC7vYf97BI4Jg7opXCQZp
         8CjYSgY1JUnF27NJ5ZoG4OsR2EqVLIfdbMcvPRuhpGfOhAtRYh7jzvb4irqg16+2ZXOC
         9b3FcaxsiQVxNL1lkKgx/u/ZA/IRFiuEpP6LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181657; x=1741786457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGjEG6LmYx2siFM9xk0NT3oFo3RiU509hE4rDYZszQo=;
        b=vswko3e1lf2qGYnRk35EteudiOEp0Rna11Jeh/YA/h8tgBDJ82H3+iScqpta74jxuf
         od0q/2zI4GPJlEgGrwaEa2wCh/ZDwwjYJsshG1e1k69c2oqwY3fwYNyjeeyeq9QxEE6p
         VnwBUEzts4IxTdAF1urGTVrfo69HgB4hRFLYgzBD6HOu9RE5WRy9xFvMv2294N/h/r4V
         lfL+2kmgCj6AWiJAcybAzDVcLHWZqTmDVLXDx0roVxZVq21Ig/cju23AA5frJitx0h/t
         I1JXXGQKNM78a4tL14G2HyDSbMGGnCoIT0wRSAvujdmUSST3kjC71SazxL+U2FxL3zOv
         Cxhw==
X-Gm-Message-State: AOJu0YxX5Z69v7pOl4nbvNLF9McMpNeYDjFfzAgIN/kPsg7r/C353cVT
	2eFlPfZXqYQloOSeuI+2uw3BN7ESSaSi6AYiROuhWudKbqrQkctW2HE63RmlgL5QbiKCEd9WiuF
	n
X-Gm-Gg: ASbGncsBX5b7lsdOFOUmTVmqQbHUiPzneXQkNLJykYjNONI1848slqdkTVpxr7ZfNRZ
	lYCO0Mx4zh37buPIZieB6B2RxGpd31m39fmMRuN7h1ZYupAzmIOiTB2wRqIsNVbBthkkSx7mGTj
	vAHVkYz4TXx2nfDqn70HcVAUfG22+0bbVGNCoX5nBCIX0CEJ5n1OYa2lKa9pCCZkvL4N6lOrPOv
	BaPt0kJzMBgBFfzNROXNWEQcjKNCqodh8ygUGbMjF3M7qTF0j2w7zIH95LnoBWCKuhXgc1zYvQt
	LUGDCiThj+IWRtghrh3k+hdOuQXF8N5lVOMxS9fEeU0jm2W87rcHjpJi+28=
X-Google-Smtp-Source: AGHT+IEicaPPePWa/q6H8bR3Dx1us604prB7yEmyH8XFaR/GtVWDHHiFWQAFbeE7QcD8HHxPLsHPOw==
X-Received: by 2002:a05:6000:1885:b0:391:1388:64ba with SMTP id ffacd0b85a97d-3911f7c9fedmr2645146f8f.53.1741181656936;
        Wed, 05 Mar 2025 05:34:16 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485df5asm21266361f8f.96.2025.03.05.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:34:16 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-mock: Upgrade 5.1.0 -> 5.2.0
Date: Wed,  5 Mar 2025 15:34:11 +0200
Message-Id: <20250305133412.3463021-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305133412.3463021-1-leon.anavi@konsulko.com>
References: <20250305133412.3463021-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 13:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115753

Upgrade to release 5.2.0:

- :func:`unittest.mock.Mock.attach_mock` no longer triggers a call
  to a PropertyMock being attached.
- Improved documentation for :func:`unittest.mock.patch.dict`
- Add support for :func:`dataclasses.dataclass` in
  :func:`unittest.mock.create_autospec`. Now create_autospec will
  check for potential dataclasses and use :func:`dataclasses.fields`
  function to retrieve the spec information.
- Fix :class:`unittest.mock.MagicMock` reseting magic methods
  return values after .reset_mock(return_value=True) was called.
- Fixed :func:`unittest.mock.create_autospec` to configure parent
  mock with keyword arguments.
- Indicate if there were no actual calls in unittest
  :meth:`~unittest.mock.Mock.assert_has_calls` failure.
- Deprecate :func:`!asyncio.iscoroutinefunction` in favor of
  :func:`inspect.iscoroutinefunction`.
- Limit starting a patcher (from :func:`unittest.mock.patch` or
  :func:`unittest.mock.patch.object`) more than once without
  stopping it
- Fixed :func:`unittest.mock.create_autospec` to pass the call
  through to the wrapped object to return the real result.
- Fix :func:`unittest.mock.patch` to not read attributes of the
  target when new_callable is set. Patch by Robert Collins.
- Fix import of :mod:`unittest.mock` when CPython is built without
  docstrings.
- Fix name passing to :class:`unittest.mock.Mock` object when using
  :func:`unittest.mock.create_autospec`.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-mock_5.1.0.bb => python3-mock_5.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mock_5.1.0.bb => python3-mock_5.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb b/meta-python/recipes-devtools/python/python3-mock_5.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-mock_5.2.0.bb
index 1b89260e1b..0861518d4b 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.2.0.bb
@@ -16,4 +16,4 @@ RDEPENDS:${PN} += " \
     python3-unittest \
 "
 
-SRC_URI[sha256sum] = "5e96aad5ccda4718e0a229ed94b2024df75cc2d55575ba5762d31f5767b8767d"
+SRC_URI[sha256sum] = "4e460e818629b4b173f32d08bf30d3af8123afbb8e04bb5707a1fd4799e503f0"
-- 
2.39.5


