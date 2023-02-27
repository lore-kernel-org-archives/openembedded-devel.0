Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B32C64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 21:51:14 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.8180.1677534671584231557
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 13:51:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=H2mP7uUm;
 spf=pass (domain: konsulko.com, ip: 209.85.219.42, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f42.google.com with SMTP id y12so5507026qvt.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 13:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D7FuY+ncRhmsdxB+Jvo2tDCPD7wnwRtsjSEvhIsa4c8=;
        b=H2mP7uUmmeVYblswKn0pqHyil9kxI5uPaDw8KJiM3J/4RzLodwU1nnjIcxQt6ijK78
         ZIKz01Rj3z9TND9Bb/fXDWsqQBjTP78u4K8BXSdHECG/NGGA15/uMPdnZsIBtYoTaZ5k
         5LvEs7VNO/gJJMY6zGHof0DvxTasMj4am672c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7FuY+ncRhmsdxB+Jvo2tDCPD7wnwRtsjSEvhIsa4c8=;
        b=C+SOPmULWuyYK/bSn6/1cHrgpt9eDG4kZtr9Tn0z57y/uiM2XgAKmgkC4tKyMAj7k/
         VJe55n7RfqBiD0PZ0k58LfeKj29VVqolZpNg5UMa9m1/hU61dhRnxZAj0oVevYNFwNNz
         Yz28kJMq8uu0OhzlD32j/x6LOj8vBp38W0F/puKPfqnvFlCW0H99W+A2vR83tBmyjpU6
         r+P0ml7kRzkIAglX5+9pFw9GNX9we/pt344IKZNGXkqe10OTaADYXh4RbZGNKYZnaGdS
         VzKZ1aJMYpk6Zk4Tzag6wwV/M2yyOUyHe/DNZ1UbSX1Ywb341wwqSSZXSVzgicT4V1h1
         qMzA==
X-Gm-Message-State: AO0yUKXxiXvpCHUta+NKk9KintaC8xxCWxZoJ4Newt0SUzWIlnSd9oaW
	RXUkvSOnOA4MNqweg86mtG8diylEQDW3OQJ/
X-Google-Smtp-Source: AK7set/F8vxGD601vQxsJBsVfGQyYIV+JbtB9kOTkTruvc8s8jiX8MZlMqTYRu+i4i7AYXhUT0/y5A==
X-Received: by 2002:ad4:5b85:0:b0:56f:154:2508 with SMTP id 5-20020ad45b85000000b0056f01542508mr1680402qvp.1.1677534670248;
        Mon, 27 Feb 2023 13:51:10 -0800 (PST)
Received: from ghidorah.spiteful.org (192-0-174-82.cpe.teksavvy.com. [192.0.174.82])
        by smtp.gmail.com with ESMTPSA id a186-20020a3798c3000000b007423c122457sm5650370qke.63.2023.02.27.13.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 13:51:09 -0800 (PST)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 0/5] Backport mpd and ncmpc upgrades, fluidsynth SRC_URI fix
Date: Mon, 27 Feb 2023 16:50:58 -0500
Message-Id: <20230227215103.795230-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101302

Backport mpd and ncmpc client upgrades to keep current with fixes.
The mpd 0.23.8 bump is very desirable for PipeWire users as it
includes significant fixes to the output plugin.  Also backport a
fluidsynth SRC_URI fix that made it to langdale, but not kirkstone.
Building mpd with the default PACKAGECONFIG fails without it.

Khem Raj (4):
  mpd: Update to 0.23.8
  mpd: Upgrade to 0.23.9
  ncmpc: Upgrade to 0.47
  mpd: Upgrade to 0.23.12 release

Preeti Sachan (1):
  fluidsynth: update SRC_URI to remove non-existing 2.2.x branch

 .../fluidsynth/fluidsynth.inc                 |  2 +-
 .../musicpd/{mpd_0.23.6.bb => mpd_0.23.12.bb} |  2 +-
 ...egular-integer-to-fix-Wenum-constexp.patch | 37 +++++++++++++++++++
 .../musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb}  |  3 +-
 4 files changed, 41 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.23.6.bb => mpd_0.23.12.bb} (98%)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/ncmpc/0001-SearchPage-use-regular-integer-to-fix-Wenum-constexp.patch
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.46.bb => ncmpc_0.47.bb} (92%)

-- 
2.39.0


