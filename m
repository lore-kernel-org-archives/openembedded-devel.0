Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D293CAC5B4
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.14105.1758625602499513522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OKLAFPLQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b28e1b87aa7so397883066b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625601; x=1759230401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTH+vi6yh72FyHdfStBTs1xFEoqx4aZgfegsVgX5cKQ=;
        b=OKLAFPLQB33aaMVNpMb+JcsMewmRaeRbLW119vHfFLMAe35bM8Op9xLusc7srC7KyW
         PwCy2T6glxyVIs8yjjtHRSKd3trjhFzMRmtLDfCgik9FnvaqttNsGBQl8uCVptqFlCgg
         RnAiY/+lnlNxMD7s2XafcSlLUOXIkvZ436+qDNFQA2Zu7MTBg0xR9MJrlyIIplplGvue
         wP4ff/Ty3qRpvgliWE4KhTRWRepG3lDCz/CE3E0QJ20JoRHSiiWstDj25kHC2IXoGZjI
         KonzXDcI+DFYw2/cfDQN7/sPINKmn7p9WDpjPXhwxKO/AhvDWfZXrjls1bDn0k9fFX9J
         05mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625601; x=1759230401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTH+vi6yh72FyHdfStBTs1xFEoqx4aZgfegsVgX5cKQ=;
        b=NKdZS1T7cExiIenLnYSQi/PJ0bvOvXpAexuuXI7DdjT+9KGTDsJjAWNPbBTB99NOBw
         zL1oCCVqXQ44mos5maL29jKzIU+zfIKdfGIthG1Vv3YgleEj8QLX9HC5VysvXYQCzIYE
         B8O6Gg0+ikWyT2xe62JminaAjdlbTXPUBqu5W0vwp6bqw/f/l8QZXzEiQhjwO8fA3gFv
         IG3gDkpizSmMNTlF1SQxNMteFzBna8pkrXDXAkmh3+IoMAWOO+j1s6uuhxjVVeuLFZ0N
         l/zerPOjJ32ESchunHtJ1Xe1R+zW6dhCxiAK2ALNSFkjwkt5vYMnx0rVEXNwGvpxfklf
         7B3w==
X-Gm-Message-State: AOJu0Yx+5+lJ+CoSjFvb/SbetKxHvHr871BU5wHfvjGhCKydwBXPJfB1
	FH40EJ7G+ZcppwMIc3u1tMDWyXa7jB7e7RsLv05W2iT/Gzpbo5az+uCqHyn6dg==
X-Gm-Gg: ASbGncuETifMtrU2CcSphOGtgRp+kbeIhHUWaDar+oMdZr0fsbEPlwriNLznS1DxkmN
	nsXr4j2zLIDtyBcQKhjQbVCLZWd37lmukHLOtUNCt1iyiQnqNS7JNWsxZFiEIOD0Yf3Wv6Ps1/S
	FeEz4ZenDvz310RqV+HBaEZi8npazt/HaTi8JkgH1iDLrPXtGG1SVhSzN4LAa9EW5Y3/PYiE310
	N+potTxf2TzUqSRsxjx4A5ctMMSqwriu/Vx2+xgp6jYLlRmuKhCxMfUoDzgbUQnIRo5ZeScpahe
	c9XVrtccTkNiKlCPGsoxEzVqi4qbz4HnzoouoNC25Z/r1q/zhQEhCFtA02x/2RwgvLTsXKs7OJl
	Gw7/ZblFWmvvqR4deKkC8
X-Google-Smtp-Source: AGHT+IFs1F42AXfXoeFYOlzQeN+tQFgiA+EdHtdSC6+/rYDALetQeu1O6qvpIHqzota/69thQNLwRg==
X-Received: by 2002:a17:907:72cb:b0:b07:c5b1:b129 with SMTP id a640c23a62f3a-b30263b9618mr193500966b.1.1758625600781;
        Tue, 23 Sep 2025 04:06:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 05/22] network-manager-applet: add opengl to REQUIRED_DISTRO_FEATURES
Date: Tue, 23 Sep 2025 13:06:19 +0200
Message-ID: <20250923110636.3413021-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119669

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'libnma' (but /build/layers/meta-openembedded/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb DEPENDS on or otherwise requires it)
  libnma was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'network-manager-applet', 'libnma']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9f8799d59471459fa1d79a001c999c47503701d5)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../network-manager-applet/network-manager-applet_1.26.0.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb
index 8046b139c0..0c4834c94d 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.26.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+3 libnma libnotify libsecret libgudev networkmanager iso-codes ns
 GNOMEBASEBUILDCLASS = "meson"
 inherit features_check gnomebase gsettings gtk-icon-cache gettext
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "69611b29064adbd57395fe3e51a9ebde1ea794615f776900453a2bbe3d8cddfd"
 

