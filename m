Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE16C4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 03:08:17 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.5380.1699931294837514146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 19:08:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ephFcZ9H;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6bb4abb8100so4277816b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 19:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699931294; x=1700536094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/zths5zyU/B6RcKmWgbz6DGANPmyU/GHv9VwZtVVkM=;
        b=ephFcZ9Hm3ZQa3zyT1rhZPAPBM1qYgUGokUmTrF/6MhnQTnGDiMZHXaAGgnJmeRp9z
         +PbG2NQkDQzdA1R9jb+x/X7z3A0pK+YeMfbQRWS1V8K3SeaRTw9tw84O4o2ghLQrsgCx
         2ehYYGnBoQXoBTtNatuB7tjP+0Xl+Be0NNSJdKb+lLI8rd4QNUH7cWWcQ28deDFJRc5s
         U2SheTab0Ni2VI/NrikHZ1M+cCpquinqj/p5F5N9lJ6APIJx4eXixhRQ1ieiEW4GLqI9
         09KFUlLQ89g/T1i4B9S8AW2+gcpKEBKR7UWK0nyuc44HNdpQnS7xf1ymcRhemLLJPxMG
         g13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699931294; x=1700536094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/zths5zyU/B6RcKmWgbz6DGANPmyU/GHv9VwZtVVkM=;
        b=C22fUnA1xftTjQwBYcugGtklNd+Fnz8vTHGVznA/cBQxL2Q9WxgOfu9bZyVVskOAJ6
         WPxZGdNIjbpe7TVc/aDNgVnJH8jH79/Ck4zWiaa9YrWKNkjAaqcLpkRN9ydyk+YQLow3
         c4Owxco6cW4JG38ez5mpUo+nrJzNofL/6l0ANbbwQun/ccKchdEkZC8Uer624sH1D4fP
         dgzJmmu5Odhn8x5/dpRTuEdZ+qIDQzVTsVBm4GP+XkoBM6HNT5Y4CHVQ/g0WxyGyjnU/
         pPpD67vAkI+4TiDcQBgvYZltW3I5p5ay/2NRKfWrhz7XK5+Ekwl9gmhwKiuYVXtC6uRC
         Eg8Q==
X-Gm-Message-State: AOJu0Yxv3W09hhgQsm8zJjgOLW/ERLeK8l5BervhAGrm+5m6wriS9jC7
	5csBKj0lvM60WvgZtpKfz7/Lhb5eUJ7Urw==
X-Google-Smtp-Source: AGHT+IGjAF+HgnW9IxIzgV7E0STPnaUq11LUMJdBahyIkZanod24f/nOL6LrKCHiDVMt3APl0Z6hHQ==
X-Received: by 2002:a05:6a21:1c8a:b0:181:293f:a78c with SMTP id sf10-20020a056a211c8a00b00181293fa78cmr206579pzb.57.1699931293536;
        Mon, 13 Nov 2023 19:08:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709026a8200b001c44dbc92a2sm4687978plk.184.2023.11.13.19.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 19:08:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [PATCH 00/10] Recipe updates
Date: Mon, 13 Nov 2023 19:08:01 -0800
Message-ID: <20231113-gnomebaseclass-switch-to-meson-v1-0-111dd5d0fe68@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.4
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106687

* Skip dlenya recipes
* Fix recipe dependencies
* Upgrade beep, gstd, and gimp

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Khem Raj (10):
      cannelloni: Fix build with clang and libc++ runtime
      gnome-console: Add missing dependency on gtk4-native
      gnome-terminal: Add missing dependency on libhandy
      dleyna-core: Update to tip of master
      dleyna: Skip all dleyna recipes, slated for removal
      packagegroup-meta-multimedia: Remove dleyna recipes
      beep: Upgrade to 1.4.12
      yelp: Use autotools for build system
      gstd: Upgrade to 0.15.0
      gimp: Update to 2.10.36

 .../gimp/{gimp_2.10.34.bb => gimp_2.10.36.bb}      |  3 +-
 .../gnome-console/gnome-console_45.0.bb            |  2 +-
 .../gnome-terminal/gnome-terminal_3.50.1.bb        |  1 +
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb         |  2 +-
 .../dleyna/dleyna-connector-dbus_0.3.0.bb          |  2 +
 .../recipes-multimedia/dleyna/dleyna-core_0.6.0.bb |  4 +-
 .../dleyna/dleyna-renderer_0.6.0.bb                |  2 +
 .../dleyna/dleyna-server_0.6.0.bb                  |  2 +
 .../gstd/0001-gstd-yocto-compatibility.patch       | 22 ------
 .../recipes-multimedia/gstreamer-1.0/gstd_git.bb   | 29 +++++---
 .../packagegroups/packagegroup-meta-multimedia.bb  |  3 -
 ...lude-bits-stdc-.h-only-when-using-libstdc.patch | 37 ++++++++++
 .../cannelloni/cannelloni_1.1.0.bb                 |  4 +-
 .../beep/{beep_1.4.9.bb => beep_1.4.12.bb}         | 19 +-----
 ...se-Werror-as-it-fails-with-newer-clang-11.patch | 63 -----------------
 ...-beep-library-Make-it-compatible-with-c99.patch | 78 ++++++++++++++++++++++
 16 files changed, 153 insertions(+), 120 deletions(-)
---
base-commit: f1109887083d97365e3e0c292a76cb0195af269d
change-id: 20231113-gnomebaseclass-switch-to-meson-929926feba62

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


