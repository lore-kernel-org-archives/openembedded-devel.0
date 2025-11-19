Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F3ECF257F
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:43:53 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7898.1763527431422723528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pl5nKbWc;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29586626fbeso66800435ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763527430; x=1764132230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KeWsPThi1Hc33h+2S+E4AErODWSUSGpGk7k6aeJj5i4=;
        b=Pl5nKbWcN9O9KA1xvxlRi1YHibxl1XpiZpjSTYzx9pZvGt79GXptwUlMVuGUWdS2KE
         gHYGyKkLXSm1bsl7MA1AYEDGesDKDo4mg9UnIiMtfAs0JyQhDvqRxphXLYrYYV82B+k6
         TEDViDRtHehjwnswLQMK7CH3zIxtR1jMnAMH0wuK2m0/PT1NLHZ3GNzcMc8VbEBMC3Hk
         Hq8lYEefipEMs66VkYKaVRp/rIbmWK5i5tY/7nvs4Xeg0wuiZeaeS8JGLC4NutWUlRJ9
         Dxw/4ZNYfIzU3NsIuU1L1oPqiPT1Xeo8oqWzAfLB4Sr8Y34XAyENfaZH5/dvm/rGT1HG
         PenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763527430; x=1764132230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeWsPThi1Hc33h+2S+E4AErODWSUSGpGk7k6aeJj5i4=;
        b=ntPIOlTPtJx3VsLGaK106F89UVhgBqOJDhk3Dw4NcXq5Uf6Qu95H//6qj+uZfS2yi4
         sJKVvwxecdpU4PpDM7Vzj4T7+gyvEapygljoY2sqKV231R6v4SObDG/U/u9Jq8lma1to
         cPvSzmmMw+srEQN1DEd+IJIB9j+kcnZxEil/VFsNeQ33VcCW99EzkCKUQZFwiI3xD9om
         IetmsLsv7JKi85aMxtK2YqKhdJ3SZCQL3DZ2X+asOWIy0cpWfDNWyGEidQ5v5PQKDMky
         LXFNgwtCcl59k7FrokcvtdTnZWCaWHj9Nikyv5AMbKiSKaYSNFP52URkTyFF8et/r5Gz
         0ViQ==
X-Gm-Message-State: AOJu0YxqvxCdzGKw/msxyyXvo0SQH+omyISrJPtugW3sEYnFezvVgC5R
	ojLzSgWTzxUG9LUzjVUhrxui0dk/F9yqvKuJTeurLNq2bIEBmzzEx3TA7kskq4mmtYc=
X-Gm-Gg: ASbGnctCbOS6oTfXqW9a/w2kYnYGD5GfbS6PCQdrkw8qRMu6qk9WQ4dmYnQCLLj++Jz
	YqoGNYInF6WxzcpWJdTDn86/Qhhi7k3hV+IpvVVIX8koUMj876HZP6NSnHNCk8rthNqH9ORRGPD
	AXUIacvb/hd0dBnC5rqeaeKWcy4Ivb/vU7fvBYXSBCYTBlNyHUkZMi7Zowv6Lfu2Ejlz3Jbyx9X
	u/b7WyvGtmgrJ670I2xVJwZ5N3qllB8Ukb5kdEOKQcZGjfOqu6qcIo+gUEnxWT62ZtiD4eOVN9J
	4gfAGKpucw8gsaCend94rARStaHjQ6NDWo6wU0K6VpaeahwhfA+5hiRR8XVs/03Rv7WyUCzNIWB
	cnPaYddCPaoAII9Lyx6vE+ZpeZZOVkkHM09FJ8pFyu2llDfP/JIwFf4z8XxSSToJyMMfEfisEII
	/6omvZQsiVjBiNPsDpN1FJrBdDFuEI61lLhkNSzEloRUqqQalkzdmhm07P5OErdrZCQs4YaD1hb
	/tZAmdsIC+FtuGwKVYC7oZcyR9nlo9g
X-Google-Smtp-Source: AGHT+IHMCajrzCt/aYrmx5Y7Cr20JQ/65Sd3zMe+NLCF/6hp2peu5qVqLMrmgQMgNMgYdDSC+i3jJQ==
X-Received: by 2002:a05:7300:bc1a:b0:2a4:3593:6466 with SMTP id 5a478bee46e88-2a4abb1cf05mr11393656eec.22.1763527430084;
        Tue, 18 Nov 2025 20:43:50 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49dad0aefsm50079315eec.3.2025.11.18.20.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:43:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-gnome][ 1/3] gtksourceview4: Adjust for setting S in gnomebase.bbclass
Date: Tue, 18 Nov 2025 20:43:45 -0800
Message-ID: <20251119044347.2884483-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121884

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 .../recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index b9ff4ef459..01d91d31bf 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -6,15 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"

 DEPENDS = "gtk+3 libxml2 glib-2.0-native"

-PNAME = "gtksourceview"
-
-S = "${UNPACKDIR}/${PNAME}-${PV}"
+GNOMEBN = "gtksourceview"

 inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspection vala

 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"

-SRC_URI = "${GNOME_MIRROR}/gtksourceview/4.8/${PNAME}-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/gtksourceview/${@oe.utils.trim_version("${PV}", 2)}/${GNOMEBN}-${PV}.tar.xz \
            file://0001-remove-pointless-check.patch"
 SRC_URI[sha256sum] = "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3fbabbb5958420a87d"


