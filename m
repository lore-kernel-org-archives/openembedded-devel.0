Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B62C98311
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 00:38:56 +0000 (UTC)
Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1319.1790210326289333067
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 17:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kM4g35s0;
 spf=pass (domain: gmail.com, ip: 74.125.229.12, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664c2da6so959857eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 17:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790210325; x=1790815125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LTw7szGQk4Gw4JAKfQqqdsE6T/7JzKIPNA5H62FOLRE=;
        b=kM4g35s0BK3tlHFVqAOlqGty/LtjJJbsFkS2QFgwyL9wLBhzLONG4SePpSqlquD0MS
         6f1hHZuEuMoY4X+8rgjb4WmMZnfHKe8pm9VwJqOdRJtydg8RZ54yMyjpRYbCF2LeEtDd
         R1GTvhhWSpFe16l7KDfQOAPBvAdT5NqXlEGMo1yCrCeOUxkCl9BIOzZnevNwdomriZkL
         xbCqnmAv5Xjg1/+F0eEYf766vKh6FC+Tgv1YcT2iflmZdNh/2LjdFpoOLVk9FeIUASUB
         ZC4FZB/jzEPyKYPgNFS7oV3tHukFCdVjp2ftLeWaVf3wgZg8plSR5m58IZ2863AwUvZU
         uxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790210325; x=1790815125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LTw7szGQk4Gw4JAKfQqqdsE6T/7JzKIPNA5H62FOLRE=;
        b=MU5+tkmRR99SwbLE9W0j7VeyjDbPi9VKIPlFVKwHyuRF73/i40ls7EX3oApF1AjMs/
         2V58klghxvc1eHHjO2eGQbe454Yhk2NFyRC/zp2pfebozziDLQhV40z33to2ehq2x13U
         30V7GZkb0uUkEhzp272Wr40PDyey3Zw6SRFas01WUuDLsPv+JKUz+8/oep1704RMy8UW
         ts1cL2TQYg1PXXf1B1npF4U0fENMSBz5UnHnnZpq+oawarkr8dyrEnbvSpL7BZfH/tT0
         IOdsAXEtdxSE4YamcgRwaqeTVOTazwg/awEbWS9zpOFdeiEBZT7xDnBE5rRqVZarhDc/
         8Srg==
X-Gm-Message-State: AFuF++lMCmFa2qSAT3GfrMHovgfbrHwfERc+sHIEKWvwrU4W2D9M3r6A
	CcRe2EmMQ42lRmuVEjcEQGXQE0pnSozbiOS5xc4TcMhQPeUOq407WhiE04sMVhPT
X-Gm-Gg: AYBFou2i9Sen/E071M+QUKtkwWjWS2JgwmMyVrPlmfDGXfIUvKbiXLMGwhDUtaGzVBO
	AQiX0y8GKqvaUo9l3hHk2/zAEaHM/n87XXYhlQ5y94eC7x+OEHHiaRzd/DC+lzQYX6MphSFE0yL
	Ch+uhL5JogINT3m0i1Xly+5uDcarJx46GnpLWvtfRZIeyk+Z9TWSQr2mzBBmblb3WIdfrwwZmuw
	EmjcAFawxUPLHLZX9nmsav3UQx1b9MYk4SndcXWYsaeKBJindvJSYVc1hrobo9iWOxJxwZtM7QV
	sccRfODbJd+WNqNHCP+w2f1y4VIWT0rONhhiOAFgkjtjElt0TnSmJhbu3CBendwLqWo6C/kX5ND
	QRlXfhBFdzotRieXSH8Q7aab+SMYzHRCzftnia9tDoVSR5Kru7xVsu10HtPU5TpwU24qim+3tQF
	X2aDXuT1YX6U16iSNZ2L3bbPAR8T02nyiDlIbVjjpGUz17QRQ0QJehkSrZ3uSBVQLaDgP/jUZ5/
	H2DsuD7iEfaHBoZG/ttZWVbAlNVVYBdHreFgi6gG5S6aK2CaEe0Lpp7/gfq1tD7rVpLLY+FG9Ar
	NAJ/Zc086NhqJS5qz60hzfqrGNn4NgIcaU7hH0Pv75W+FkjKQDZ3n5wl9SJbNvT8prVvNay9t+p
	qwHAYkcpNrriMwL+o5JAyW1d9MdfLjocarnQACKxKZMvTw3lFdmbdhRzGCF+PYfMtsFAEz2dacl
	wdKl6VDYdJe0ow26EOPpDOVAAXW8dqbvHHR/yDIg==
X-Received: by 2002:a05:7301:211b:b0:33e:5cb6:249e with SMTP id 5a478bee46e88-34006e8d345mr491954eec.39.1790210325094;
        Wed, 23 Sep 2026 17:38:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e972395f9sm8106622eec.30.2026.09.23.17.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:38:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 1/2] ibus: remove bundled vapigen.m4 again
Date: Wed, 23 Sep 2026 17:38:40 -0700
Message-ID: <20260924003841.1113450-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 00:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130245

Commit c175507f1c ("classes/vala: remove obsolete logic") dropped the
removal of vapigen.m4 bundled with sources

That macro does prefix the paths it reads from vapigen.pc with
PKG_CONFIG_SYSROOT_DIR, but older copies bundled by projects such as
ibus do not, and since these are found first via ACLOCAL_AMFLAGS = -I m4
they take precedence.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-support/ibus/ibus.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 9ec1dfe578..1344cb1981 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -40,4 +40,6 @@ EXTRA_OECONF:append:class-target = "\
 do_configure:prepend() {
     touch ${S}/ChangeLog
     touch ${S}/ABOUT-NLS
+    # Remove vapigen.m4 bundled with sources so that the one shipped by vala is used instead.
+    rm -f ${S}/m4/vapigen.m4
 }

