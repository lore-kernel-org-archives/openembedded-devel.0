Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E239310987BB
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:02:05 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18083.1774026124845740288
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SwW5TcoL;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0d36f3888so945125eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026124; x=1774630924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUhH0PS0FFTulFOj7pGgzeOSR6KVG7yrydQXd5zPaO4=;
        b=SwW5TcoLKbkOvIETjpYaKBq4f4jKT42pruPFL2wGCAXRq7kwk1SYa78cLVZpe2VsfU
         k9GVfEDAF4kqPgUw01l6Yi3ltZePy5r9asZYKF7X1A7YzWiAlYNi/KRD/z+TTHOnsm4c
         j2wRn7I4j4vmpU2XnUSJOolimgoFjPN+myKo+zslEpiijRYpYKWYp1p/cP2WKh93J7RR
         T0Tah0b1XMN9N3H4HYy6GX4etsV1J1sB/ilr+8cH34gqLbkY5zMmdOfuwdBMT7gTUBC1
         nLedq6x8mait3JbBjUlB1QXGY9aLcAutKF5wd/nVd2AmV+l3F8Bd/hv70dHyQO/fAAI9
         o53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026124; x=1774630924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LUhH0PS0FFTulFOj7pGgzeOSR6KVG7yrydQXd5zPaO4=;
        b=oOXmacs2h9WD85m4nLWTBQhRJoFMCN3ymr2q4V4nqHnuiPmpPodsc+hMSJKIXaYIOu
         YQgQfx4uF1a49zAKqi6qEB9BX/5qpSzNmd9xVTsw8IUWRSx+6c7G5iZyv/v/sX61oWQl
         doC1OWdCPa1SpYEVf2W7SMJabJJ4XhzgfbwmGIdaObsPNseSJB35/Vr9F7AOPLXWIMJQ
         kF/xrzEB0jpqASFxuxf2f1O4Qt3l+7YsOcT265XY04OeU6JgpwzDIqFzZ59dWT+PBjD4
         FsyS2t+5aDx8GJ+lZBT8yxpOXZ3jgCBaafzpYG3AoMr4b8xY4Cb3wMqc1eqGcJO+w440
         7Aqg==
X-Gm-Message-State: AOJu0Yw29tjQL5y3s+MEdbW+IkP8/q6riIFoundg+EX9Z4pK0pAPzEk1
	u8BsuY5R+z9qzpAD5vsdA1KK2fw16Q4yp8J96QrjDai4o7LRFUb+TQvYza3kM2lt
X-Gm-Gg: ATEYQzyS8HDY24hzaIaezaBcgutX07LN5sJJaUcpHrZoHex24cNAauux6TuKOOgChbL
	ijFwkzUZuXBpFtuKnBlVnLIaeq1OwdGneSUjqWCsMW1e6OMsOSSYY2f5GmTK+X4JZe0MBZaO5Uc
	sguI639YNEaz38fvq9wvuM9VvaPkciPpdVclpxGFS+W5l7qsnPCwMDDcWNX3uzEikerqAibLsUv
	wKU7IeQhmFC/fx9hKY+tjF+V5paJhrzMjhktYe8qHcc1wPlc1tN3tBrSGwxdVKBNptdov3ZeFh7
	tMf35wcEPflnJzSSNdJo6QpgxHmLcQNMJoluvnFDwhGdYZXB2u301LFO3iBP5MDrQsr8WBhjtlQ
	bCOszG2tWA/fWteXaJM80XC0YwPiHwHgl77kLdRvVeXoxM9SekAbl+oYmjKqJYwwACiwQ4DAWAa
	BwaiwN+yNcDbZUJeHow1zOa2A3jX6oO64ekQAyfjT/RAJG5ENVOYpFkC0FtW/PQ4YE3lIfh2+dG
	0TaAzdCm4IzOt5ToKaNbJLWZKk/tMXEYV6kFrP2H8luZadgCuQqb5Q4QEsM
X-Received: by 2002:a05:7301:4198:b0:2c0:df54:d47 with SMTP id 5a478bee46e88-2c10961eef8mr1904179eec.12.1774026123584;
        Fri, 20 Mar 2026 10:02:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm5148632eec.5.2026.03.20.10.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:02:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 5/8] lilibgedit-gtksourceview: Upgrade to 299.6.0
Date: Fri, 20 Mar 2026 10:01:52 -0700
Message-ID: <20260320170155.1413929-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125446

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...urceview_299.4.0.bb => libgedit-gtksourceview_299.6.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gtksourceview_299.4.0.bb => libgedit-gtksourceview_299.6.0.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.4.0.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.4.0.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
index 0d67471280..119a75b2bb 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.4.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.6.0.bb
@@ -1,13 +1,14 @@
 SUMMARY = "Gedit Technology - Source code editing widget"
 SECTION = "gnome"
 LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=310c7c93cf5181c6b0cc8229a1f3c6f6"

 DEPENDS = "glib-2.0 gtk+3 libxml2"

 inherit gobject-introspection features_check gtk-doc gnomebase

-SRC_URI[archive.sha256sum] = "20c17ff89e2031aed5dc1107fe9a93fd50f92b569be2954b119c86f9e2fd85d6"
+SRC_URI = "git://gitlab.gnome.org/World/gedit/libgedit-gtksourceview.git;protocol=https;branch=main"
+SRCREV = "a7bdc39f9fbc10c49ea7468ac1e5bf77385da0c0"

 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"


