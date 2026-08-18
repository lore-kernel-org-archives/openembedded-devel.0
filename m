Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08059C5DF7F
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:01:59 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2324.1787029316629276884
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PhR05AT7;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacf197759so57860235ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029316; x=1787634116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycDXNAUS+xiFdI144rgja/fgJ746xGXSsvezyJ+l/ig=;
        b=PhR05AT7S1SjGjdSXhVAIC1C2WlyHuCACmOW6xVDF5OjL/ieZ2BR4JAosi4rNG4BAc
         ZJHKizO57TGNTWYHKE+i5w1MsJKJaAlgwq5Xop22i9ec9rNWq91jme4RHXSajd4V49l6
         j035ZJuPQH7RlaKYmAB+mR8j8/2y2HFSxLaAZB7iPll4xyTJi8u4EmF0lre1KM94aI6L
         WgyvBNoWBcYnAQz/SnWwlmfl2yMG8S75bAHPszQHiY3UGq32acvw2WTtOqlDBB6eaXzz
         0xeh+bxk2xOJVN0IPHLGrHRo0es43K3IKBuNCAPOCH41JqrctDJ1PcXQW31sy90kz34P
         ZUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029316; x=1787634116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycDXNAUS+xiFdI144rgja/fgJ746xGXSsvezyJ+l/ig=;
        b=XPppTqGsFOi1eFRI05TBEqtUu0JC47/q/GQi1Bh9Ex9BHeIBfGVdpYrlYQchi+wobD
         jcm8D6xJDy4/3b6cmDQoC6fMBYud828yFxTj2q/lIkn1jh46BPiXqp7Eki5bqPXN14Ip
         t86PdCNKfN0BNklxTCfbdVP8njEIuHDuupXO0DDhxHxRbiTKF4lZJGh/jEKdNKx7hxtD
         W6s1TTmlrNnixA4Iyx/mGxYkY5WxAkM7MnT21BF4Je3AVSZB1u1EtUJ6v+qFtmr4BYE9
         6+9AbvRdkY6LmEpfu+9k5Am+sVPHNFlvClI5QhKZ/1V9dsJ+/5XY1Z4Fbhu1F9MnIMTb
         nEEg==
X-Gm-Message-State: AOJu0YxxBVz9je4+cdCi5Z0QtUdlZ8isBh3WMAqFCQilxJpCJlV/vN1E
	szWaC+AjWLDnN99ASklu6gDhoiOYN3GJnTKdKHcrJ8BoHyFU0oMUGgZld+Y1zQ==
X-Gm-Gg: AR+sD13NNvfnHRZAxv8iKo48NfCLzqEFqOLXT6ti/liunLqglEIeFq+vWGOyU4qJw5N
	+5rLEgukG8a1eNtSdBehGc6KH9Jm/FBCsxo/TMxWmG7m6Xw/dSepz2L6NrbX+n1LxarPfHOEo7J
	wtMTXVbZRGRvy/MIiolH2SLfsMdo6YnCg15ENo0puXgLEPcRkl0LOtKzN1h3eQC4akZoLZwBXHv
	kTHjCvjycUFXDGCkAUfLpgjGiN8gsrazYypzWCIihPn6j7CrHai14hdmcMypJBxSKeeqXTrngQL
	1CFaLBECUEbzXPaVe7UtJgBC3OU4v9ZP2xkuUzc33Z/NyVecrB4JRE7W7gZqlgnHzX4128VNOLD
	jdXem/gUh2nHhGHGIYrERoDTAcYqFoRM7/fc2IobiypnUryH+oRHHZ2v8TNLc3jm6Ih0o7iXsF4
	JwVfgSIiBt2XZAw8HP1XmIJTBqGmuO0u5hDyToskh9f+btj2TaUhwfBYjjzvqZ/mNqVvT2DIxon
	yGUVFw=
X-Received: by 2002:a17:90b:2b8e:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-3933b8aa611mr33094388a91.15.1787029314934;
        Mon, 17 Aug 2026 22:01:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:01:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 7/27] gnome-settings-daemon: add UPSTREAM_CHECK variables
Date: Tue, 18 Aug 2026 17:01:02 +1200
Message-ID: <20260818050123.2901739-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129206

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version gnome-settings-daemon
...
INFO: Current version: 49.1
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_49.1.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
index a9b5aceb1d..4a8b7a33cc 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
@@ -28,6 +28,9 @@ GIR_MESON_OPTION = ""
 SRC_URI += "file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch"
 SRC_URI[archive.sha256sum] = "2a9957fc4f91c3b9127b49484179bef485120d9c1c208e44d44e6a746e6cc1c1"
 
+UPSTREAM_CHECK_URI = "https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/tags"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)} \

