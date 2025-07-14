Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B545C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 13:47:02 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.78533.1752500822059603650
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 06:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uocq3U9I;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so12483675e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 06:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752500820; x=1753105620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck4ewxS82Zn9v/MjHcNA88D6UnwiUrjWX1F/xuJEDjQ=;
        b=Uocq3U9Is2TqjF8+nOPpNY595xum08AFZDpOULIJ6uCuDLzkRVxZRmLnD+bSV0Wct0
         QJR9804DQa3/8y+Yn4r8xKBf9niM3/1OljmCqGG5LnzbfynEv4DqC26FKmO849FbZmzu
         pShkZct6eVRqhP5GAmLcaaAcohm+VvG//ANIWp+zkmsg+kutK8PjKBnRnSAemyG8Xwxl
         hAGpyEso0r2/DoDqky4vTXuJgTNpHLgLeEndRG9/sjiCmOYz5Jyxnb+/KbUhyA7kaARI
         QU2bLU7LsZfSUSpbsFwWSCtXe1eXthBk1Y/IEFvrQ3crDJeVkJ55NFbug8vh7F04nmK5
         EjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752500820; x=1753105620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ck4ewxS82Zn9v/MjHcNA88D6UnwiUrjWX1F/xuJEDjQ=;
        b=BjQSnjBvomRqHK7ZexPfkMZsaoF/MJ6h4O7M45G2ttJBZtIUdAvi7X0DmSQ3oY9Jgi
         ukTebO8WnIlAzYcjIiPW9hwN+QwnwRndIt/DcEWWGvtcB62RL57wkcjojV2BV340aW1Z
         CyKkppCLDAzNDLMNlasF2xFuOjDXCGkCKqnf+SpDiEnVTybELzArXAChMUssL8LhAA0v
         tlCf3qpymWwbna8UVRhaOGth9PsEP0PNTlkkKwkIE9FuFGStQsiq+BU6ajS4824EwYbf
         1FF6ZlaKFR/oWE1DwwTElB784BxafzOiinTJG25D88OJIzAoG5fgq82jxsdgumdZE5zF
         Gy8Q==
X-Gm-Message-State: AOJu0Yz0u2Zxj4x6ZpEeb0fzwKlTMV0oOWgosroECsNvlk31FjOA/oMq
	G9wC57AkhSsCal9/HwnaJJtAPiPNj7aTAwkyRJJ2UIvmRzI5M0T/SqB0tqpLPA==
X-Gm-Gg: ASbGncsi5t2sgEXTw536QR8bLtmN4MML5qyVvA7fAb2jSz1G6SjkwuZEHcue03txv4N
	5gNQnO+4iDVhLffNdUCUmSoHLutXjFSeu7l0LVPNJ9Mhie3FlJucYA6vQgBATaTwQECdz9rm5As
	0D7Dlzy2hbBDP3JzzFvjNtyG9WLKB1mJW3AL4MpGdWXfAtT1vJvQgd3/F1Vx6VBqCd7Cwo54vxp
	mYJfKu+Y4/mpTk6S74RPyl2te8IdxSuVHheI7FVqWPU4qj4BI5/ixXuAcDtwemJmw+8wYawJrLq
	iTwQJ7A1vF8/cB6Psr7kZzUCo+DzDcYskhjDfNOchiOHXJiFl4s9/uHm+Yl6DPuH1oGqwDxhNui
	TZMqRyloNFACk8kngdvo+RTNw74+Nz8dZRg8=
X-Google-Smtp-Source: AGHT+IFnF7t1/EeFLM3F9OrS9eoLRKf1mgPs1upajDDKmvXwT0rjeUvi7ungjpLId5gs4J6lylp9NQ==
X-Received: by 2002:a05:600c:4f07:b0:456:24aa:9586 with SMTP id 5b1f17b1804b1-45624aa96fdmr963785e9.21.1752500820128;
        Mon, 14 Jul 2025 06:47:00 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d587sm12261771f8f.46.2025.07.14.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:46:59 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: mikko.rapeli@linaro.org,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] fwupd: set vendor_ids_dir
Date: Mon, 14 Jul 2025 15:46:57 +0200
Message-ID: <20250714134657.1620685-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 13:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118532

From: Martin Jansa <martin.jansa@gmail.com>

* it's in RSS as fwupd/2.0.12/recipe-sysroot/usr/share/hwdata/usb.ids but
  meson is searching the paths on host with:

  # look for usb.ids in both of the Debian and Fedora locations,
  # and fall back to the system datadir in case we're building in a venv or prefix
  vendor_ids_dir = get_option('vendor_ids_dir')
  if vendor_ids_dir == ''
    vendor_ids_dir = join_paths(datadir, 'misc')
    if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
      vendor_ids_dir = join_paths(datadir, 'hwdata')
    endif
    if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
      vendor_ids_dir = '/usr/share/hwdata'
    endif
    if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
      vendor_ids_dir = '/usr/share/misc'
    endif
    if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
      vendor_ids_dir = '/usr/local/var/homebrew/linked/usb.ids/share/misc'
    endif
    if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
      error('could not auto-detect -Dvendor_ids_dir=')
    endif
  endif
  conf.set_quoted ('FWUPD_DATADIR_VENDOR_IDS', vendor_ids_dir)

  it shouldn't be looking at host's paths and and on hosts without
  usb.ids in one of these locations it fails with:

  ../sources/fwupd-2.0.12/meson.build:323:4: ERROR: Problem encountered: could not auto-detect -Dvendor_ids_dir=

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
index e25fbe1f54..eb43c3d865 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
@@ -37,6 +37,8 @@ GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
+EXTRA_OEMESON = "-Dvendor_ids_dir=${datadir}/hwdata"
+
 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \

