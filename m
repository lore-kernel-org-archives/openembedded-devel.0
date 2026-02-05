Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4DCECD990
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 17:07:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25859.1770311249710688238
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 09:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PpKMcd6Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801bc32725so10560365e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 09:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770311248; x=1770916048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wAi+MTDKcUMKWp/LgUQ3yh+dvHV1U1At6EMHOmBd5I=;
        b=PpKMcd6Zmv7d5T0IJQ7hZ2LclPj8bwwrlWMX7AhbxmnvrPAZW1KHrlNqwqR7pzaEAe
         oU5RrT1I6VS8WCZu0OihTD0l8xrZEnJgteKWwNf7TL8b8iUhmP3T7Pvswlqojnsj4Tl2
         m9iKNetr93UnzlZlBfcYpkIG2hX6pyDuscAEOfdcPfvX2M16OqqT2bRxchIWTYrwA+Uu
         Vh/NeZfvdFh2lrMOlNVDOkcNOkA5XGVxzLZWccNgVijrvekovoKK0rrPXWuoyc29N/4x
         UUsX/iM1tjgzfmnr8JPT2y2NjPV4YCCzej3h4gU7JsfDorttvskXbWT4VyKpUTGpXQfW
         fPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311248; x=1770916048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wAi+MTDKcUMKWp/LgUQ3yh+dvHV1U1At6EMHOmBd5I=;
        b=PE/lCSI1PSKwzn4NE7vUdj6YxI1fHF1jBMmd5D0OFwHFbHpF5Tt7QfwCfQOQUCKSHb
         Gm2DnjNchtquQbrV8cKsZB01Ju8xpnJcCnvPLfX1Q1oPI4g37DjNGNDPYF13/eF+mNzG
         3ReGxs56sx4np5KZQN0G5cTvAoC8xJWP1nzExFD3WlFknXlKwMYCLvATEiNOKG03Tq8N
         Ia+TaoPEzFDigLBPCFPhk4MXoxYNHAahlKI3bnVWAbeC9Du8PPO0EFfApZCXOJo4QC1n
         eQEdlKm7pZqaFjaIhdojp1titgLTmEgwQjJpKw6LpOjMcZcZPgbmRQHnCYKIg60L/7m6
         3IqA==
X-Gm-Message-State: AOJu0Yx/1ZOaxwjeGzsEF68Ugg/uvVxwL+/XYa/2XeyrNKl0k77v2beW
	el5i1YgRbtvhhjDsxo2ys6gRkrJuM9jB/qVRqHaLgGScEttUqPL+vcRij/mBgQ==
X-Gm-Gg: AZuq6aIt5RjpNNZHFdbaLhuPJ3tTIpWsnaQIuTYjT+CC9WM4ICHy0Y5yxYuybTbM4Ut
	qqXQozk1LFPZ83QFy32+yTrB/aBTOadz1h9nXJmetNaDXHlXhroXobM0BeVkaz54ra0OJqsiSXq
	ALpnLDhvv4cZdUnBreT8h7S1J/Z5WYmkqvUj/LasWEuYkeySVK19VNHn8H0XLdbwr4owvJqxm4e
	8AoVPNsKKXNjOceMm0Eyf8TDw15SehXA/NCR2+g7ArEJgwRS7eRGjsUOuYeheM91yl/sQYgcwu2
	NXuw38MuApXlkx5NWrk96Qdg+qbDw18aNpuzHsprLNlZWCMWlqJNJXJKgyM62RXv0chTiuBEi9X
	Lmpj1dxK81grQUYaJoke9hl+tb9kv4czRanLbgLOUfxrUDA/h3aYC8uY3aqnJflYD7vNOCWagKP
	/C0LEJHAcu
X-Received: by 2002:a05:600c:528b:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-483201e25b5mr1255885e9.10.1770311247753;
        Thu, 05 Feb 2026 09:07:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d4d030sm102237375e9.13.2026.02.05.09.07.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:07:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 0/3] another shot at mime-support recipe split
Date: Thu,  5 Feb 2026 18:07:23 +0100
Message-ID: <20260205170726.2389904-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 17:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124214

The original mime-support recipe split was already merged, so this
is trying to fix it up.

- Drop (the new) mailcap recipe. After I have sent the original I have noticed that there
  is a mailcap recipe already from Fedora. Though the new Debian recipe seemed
  to come with more bells and whistles (manuals, scripts), they shouldn't be
  duplicated. Still, this might be up for a discussion if this is really the step
  it should go. Feel free to comment.
- Move media-types recipe to its own folder
- Fix up the mime-support RPROVIDES in the media-types recipe, to be able to add
  mime-support to IMAGE_INSTALL and get a similar result as before (hopefully this
  time it will really work - at least it did on my machine)


Gyorgy Sarvari (3):
  mailcap: drop recipe (debian version)
  media-types: fix RPROVIDES
  packagegroup-meta-oe: add media-types

 .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
 .../media-types_14.0.0.bb                     |  6 ++-
 .../mime-support/mailcap_3.75.bb              | 54 -------------------
 3 files changed, 5 insertions(+), 57 deletions(-)
 rename meta-oe/recipes-support/{mime-support => media-types}/media-types_14.0.0.bb (89%)
 delete mode 100644 meta-oe/recipes-support/mime-support/mailcap_3.75.bb


