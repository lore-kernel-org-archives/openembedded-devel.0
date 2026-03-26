Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E7310A1E78
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:03:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44809.1774523030815695272
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZtaYYIz8;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82a646c96bdso693443b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523030; x=1775127830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQgh8/73HcVGFgnJJZcZsJP/7ifTBcGo7ofb+u2QbvA=;
        b=ZtaYYIz8VH+pxkxjf5/rmBYxrhixrh/Be+J758gw59+jA19fYA/Cy1+3I/8vYw1urO
         1ThDTUOBwRIsOQwilhYSUSzQxd3FImlZbuI959BYKicGjBKjhVtNgCMhAJVDNAw3MqRI
         guSLp5G5zh/3UO0nxv4dq1TIzUyPqoJVznE+7DD3EVIOGKHLODiOa7o9ReS1KifSuA7f
         5AphHlxdcqAFsWVZzLrc9FbFeKTADn+IYBzV1xbNsa6xlJ79r/yNBtwbh+0VVwyJIgXl
         UFecHGNiUoALKKRqDceO634+O9IFqmDCW2003ePiOdcb2X8yE58JIq+jy1z9+cvwJ5ue
         T0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523030; x=1775127830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQgh8/73HcVGFgnJJZcZsJP/7ifTBcGo7ofb+u2QbvA=;
        b=WehKkVBgjpfieg2AxNXvenoM91dPFAJlpMySFo+62VwRuYWAkP8MZx1BH1380O/SMd
         R+T4V61p5n2elycYA3p6B09gcZMLBuaGvLjaEgZ3H05BDievC/zo5R8u5HHiKFrKBo5a
         Qd5xXTPBl3z8Oegm6XGOCISpX567z5ca5T7eg/kX4lRfUSCipbSFQrPBJ9X1k10GZVBj
         oa87p9L2jaABfhIizJa9+VPXXMW2J6ByZ5bMefn8SVJBsqj3SnE8HkziH+SxkQwLr8sz
         E4GYQPzEEqdXD4dPr9NY5K7/j2reT+74CbM0ubb+yDUvaxAbsCyd+THn7DCgGKs2xokF
         swVQ==
X-Gm-Message-State: AOJu0Yx6icglcgYNR88ZswVgzq1pbIZMehXkYijbrpJ6TeOf9y+IrM7o
	Y9rLZM/3xGtXLmv66RINaW0H+Ut1GadMyBXsPijdCXAtt15cRpyth3gWZhe/8w3N
X-Gm-Gg: ATEYQzwPc6KPUUoz/DpdRJv5nX2arag39GxLocRQvexCLGIXwY4Lf4tFDBQqHFyo58c
	I70a5K+x2/cwnQuK3E6N94N9kafBp3cuTrlL6ZGSEDwhH6ggjWNdIq/afACiX2ERAc6OKGvIVk4
	LIntbRajU8RY4OMQn/izGKGDmiWMdEaDny9VcnDNCxmoY4vHwv2/chdYF7uqF9WrnOZSNWsrQTE
	EWR9gOiB1pxI3BvKkFZuxl2ecYG2V47Re/VnsUvC73SwON36Adrh6eYn8G6aBo2dlHCibf5EU0n
	VXEBVHrjf/7trh8CJQ/qssaQ9uPcFhpmUAgNGZYxywEbu9mWQMq1LqBVUrGJ279M8YUuu+3k7g0
	5aDuLcg9/+Sytf1+tHSESvG8cXaDSa1Nt/J0kKqriKIyEWw1rwOE0TyBvJ+d4wgdsobWaWm33lw
	HCfSF08OcbKkZo+Nqn3jdOQjTAjDlOJ2Kfyr5eYtLszTqKQw==
X-Received: by 2002:a05:6a00:1f03:b0:82a:768c:9a49 with SMTP id d2e1a72fcca58-82c6e121936mr6796736b3a.42.1774523030010;
        Thu, 26 Mar 2026 04:03:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d2113absm2265885b3a.20.2026.03.26.04.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:03:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][PATCH 11/13] gnome-chess: upgrade 48.0 -> 50.0
Date: Fri, 27 Mar 2026 00:03:08 +1300
Message-ID: <20260326110310.1809866-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
References: <20260326110310.1809866-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125652

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also include tag in SRC_URI

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gnome-chess/{gnome-chess_48.0.bb => gnome-chess_50.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_48.0.bb => gnome-chess_50.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.0.bb
index 3aa353748b..e57bdd39f2 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_50.0.bb
@@ -22,12 +22,12 @@ DEPENDS = " \
 
 RRECOMMENDS:${PN}  = "gnuchess"
 
-SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/GNOME/gnome-chess.git;protocol=https;branch=main;tag=${PV}"
 
 inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check mime-xdg gsettings
 
 GIR_MESON_OPTION = ""
 
-SRCREV = "b0bf5288438f74fcb455e1e49f855b4964a2c7cb"
+SRCREV = "079ef83fe6c538be9178b03999724d5f4649bc69"
 
 FILES:${PN} += "${datadir}"

