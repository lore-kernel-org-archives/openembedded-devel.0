Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA6ACAC5B2
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.14124.1758625607022816364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SWCOqLkL;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b2b4096539fso341214666b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625605; x=1759230405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwwc5mU9yJla6qFoc2al3v0UCTet52CEJjmbsIqVA5c=;
        b=SWCOqLkLsZYlp9pqZBwE+VVHcsmzFjB8DBK2CbJwnh4RxTUyYWDFp/R+6qHFrF4m78
         /tl1fRpLNjLtEv3nQB/u/z8c1wTSFywP4hHmisf+0eYRh+FVjboJ+lgaY5e4oRvxKo1e
         y7E7mjNt0U09sFRHCXbFyNhdTW3TI3VOfCd/C+OavDwH+ZVXbyjxBYZKbXzrwr9Eudyf
         J9vPRiO+/Bsjzg6hkf+wIWj159vx9gghlNsZjuD/l8glFfptAEOrhExA8broSRJROMmL
         AOBYbRVsRCJjPUOt7m/7HRWOU/X0w/6ibrbqLQSjqSzTjkcrcPS+c/BDb6U4qyPo6xsf
         g3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625605; x=1759230405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gwwc5mU9yJla6qFoc2al3v0UCTet52CEJjmbsIqVA5c=;
        b=lpoI39HFeyCsJxE0ggNqrSEP2uAEaDCIFK8bNyqGc0rGWMA3dmPxA3A8QCVIOJIcFy
         vcZeV62KqwlHuu0cmSupz2k3J5Pb2LenH3hLuUvOYJy5/u6TxkpzP8wPJC2DWpLsd9mq
         GTug4wxMUHNvN0Ma0MowAgJWrkTHRlwSJF6+bgYYd+NAx+bjqo6T+ed8duhe3UJbisBf
         0XbCdRrh/RdwAUlZCa6fG5BeMbXsNHR4sFJXksA4DRHZ5IgNnIekQWeMOM/lO6Nd1NRc
         MEoGhtlgFgWPw36S4HTtDAlfOvtzlnfeeC8tMLguTk+nI5F0AGIiryJCk9esoq3gfVWA
         lGcw==
X-Gm-Message-State: AOJu0YwwmJvzi8cYzeSqo5bs5eWVwcLva7NRTf9vLN61S0z/kmHU40fv
	1xUOtL+rzQ1pmgiU2uHDZjvATclMftlvzHCH9+EvQh3QmZ1yCZcGrNGFZFhXdg==
X-Gm-Gg: ASbGncsHyfn660EaqrOCt3YasgO6PfTa4O+RJB3qeC8IFt/igRvhEa2avu1UTQ4+192
	c8m9nNZhVczt+vk8mu8YEwKOQ9trPVTvV3k2G0S7LYBhvXRKYDdtzN+TTQw4DDb/Sdzy9dulYnD
	cwxgMo+UmXjF8jXxsfNaf3kq8gOinGOH639LHt9cBXrai2oDzejvfmuJu0InYsfBwFtubMN/DUK
	xae25lyb4RuwoPihMZ98ov/zh34jorD4XeKV8udAQPFGSMnSUTx0kjso/Dgrg+UKYebIgudGP3/
	ET4DOPy+fRBlqPqRg2cdjT8L1U1Eu4ZbN+dcEhtRX9g9c+rxTVEbxo3wczSiS0pZmb1IDyNguD2
	BfDSh7RJwy0QHx1Vy9L1c
X-Google-Smtp-Source: AGHT+IGSx/08Tp/d1pkcmWpzJ9dZon/ciRaW4ZUVDi+7d/KgMtNbqm0OZKVKg8DrnLSRsaggs4dCeQ==
X-Received: by 2002:a17:907:3e1c:b0:b2e:f8df:f5c9 with SMTP id a640c23a62f3a-b3018a6ce5dmr211774766b.6.1758625605317;
        Tue, 23 Sep 2025 04:06:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 12/22] gnome-bluetooth: upgrade 42.0 -> 42.1
Date: Tue, 23 Sep 2025 13:06:26 +0200
Message-ID: <20250923110636.3413021-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119676

From: wangmy <wangmy@fujitsu.com>

This version fixes the display of devices with '&' in their names, and contains
updated translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2687e9dbec14776ab4a1a6747cdfd12316767311)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-bluetooth_42.0.bb => gnome-bluetooth_42.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.0.bb => gnome-bluetooth_42.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
index f2dd99761a..7f6cf84dd6 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.1.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "3d1e2720673bc9a242619dc5d231fd6e776c18a49da29f43cdc433055adb0170"
+SRC_URI[archive.sha256sum] = "d9fe5d673f27a40a86a9e23d93cb99367e7b06df51872e8ac5ecc9938e55b5eb"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \

