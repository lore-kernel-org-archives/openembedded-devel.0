Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0867CCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27196.1762704034298738466
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IAxEv0YW;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b31507ed8so788434f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704033; x=1763308833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evFZggWhJLoyHuBlaFq9ShRxfCP7vZHQLjvdNgXaJUE=;
        b=IAxEv0YWRFl7gkxskTRo75jD7svBizSExoyky+BhyMWXP+vVlsXX9gXgzAxSHj4fxk
         RcDMmQjC9oBmeRnHn+yJnORByfCrMfuJNMAZJllGxPL5+3Fgme/1XvejZKbraUkzqMGg
         a3cdcIAR2QfQmHciOh3m+ZkShuesxdB3iPibRxs5TyI5yTU6x+UUyeMxvS4p08sz0nOt
         AgFGRK2cv4x56y03OwD/Vxob8empaN0+h10kM9ind8rZeVytyPjXxkQ3QXnReK2OPbYY
         mwAfHvyqkb19XshFESuP9h2y/qCVtEo8iNSrLHzMhJL0yN+ksY2FyvKB8E1p0oHEbVO6
         PHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704033; x=1763308833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=evFZggWhJLoyHuBlaFq9ShRxfCP7vZHQLjvdNgXaJUE=;
        b=Givtee4sHhsY3gprQftuqLP+knQmnfckO+nwYFZz7Ekv3+I31uFl/YUYMNBidN6T7Z
         faucnjqroFeoTmXqDTxarl6p6hiqYrTna7gKDbr0rPQrupWiMJFnQebb9C/w3UYScjfj
         B5FOwWi23OvvhYGgUu4Btq+0CF98UpiGh6l8VLGBiB+P34Ocr60S7xN1OH1J1T82N0hV
         ruuToOgdkjqa3+qgUiRu3rm4jJqnbqEykWVpN2k1TVU38EE76LxAin2L3IsI6QK+JE+f
         Z3HCu0yKcbTP91aN5P93nxyfK7MQe2iiAPq/hrcUQjADP88DNJlhM+gNB+sc3XHQ9NZY
         kC3Q==
X-Gm-Message-State: AOJu0YyCzWhuC0IcKClm9URnqh1MH6lWLz+7C5DezReNPTyMGnNNjV+2
	4IVx6szuTwtVzXdeJ3Pn/PuJYlQLIOAwHE64SdV+9mEKW+YRpYhf81ILDaM7wRV6
X-Gm-Gg: ASbGnctLek+82NGpAYe0QUfv/aLAC9HBPxrKiFGuAmrpgN7qhbjP2AV18+bEGP/vQlY
	aoqlIgnzGAtiI59dgL0mbXQL/Y8DogZ0z9mZL/Z7HstuHG544drHr+SH9TaY266d6FKBO7/i28D
	9aLvnw9SxuWibqcQ9jKrBxWlF8rJOL3IiArkKddeSgl7XnmaQWLg81ibAXuA4mF3akWNLxmFAz8
	e6Tluh/hLNiSPMhDfsQ9nN7oyE/LikNwrPD9JTVJgaXQnnFfiPTotAYxpgvOFD5Bk/DPC2egFqL
	YltQHoiRo9ZEW2fyOaNxToEeJetsPQO1Y0RDi4LJGNGOiblDNIGtYwNbHc/egO9yICv/TRpEQV+
	58FLcWGKtjKkoEyXP1QB6rHAye3KUAXRnStI+hehW/H++6VxDmdC5nBFdEtje9Nxw7ZcirGC3Og
	==
X-Google-Smtp-Source: AGHT+IHc5y8vH+euIBc4C+jGJWxyq25HMVWT2hplP7NU5+Nwj3lgPYQLmtsfx2z6gHBuQJBEjUbCug==
X-Received: by 2002:a05:6000:430a:b0:428:52c7:feae with SMTP id ffacd0b85a97d-42b2dc7f59amr4895373f8f.32.1762704032633;
        Sun, 09 Nov 2025 08:00:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 11/27] gnome-chess: fix SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:03 +0100
Message-ID: <20251109160020.2522353-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121427

Master branch was renamed to main.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
index 0b78a935f1..b66a96cc1c 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 
 RRECOMMENDS:${PN}  = "gnuchess"
 
-SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;branch=main"
 
 inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check mime-xdg gsettings
 

