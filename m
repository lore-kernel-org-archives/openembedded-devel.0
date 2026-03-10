Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE83FD88E0
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 02:40:14 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8757.1773184760487285369
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 16:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cOtI5ijp;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: sujeetnayak1976@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb38e86cf2so1399310585a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 16:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773184759; x=1773789559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mhh0yC0g6DKBNF8ndnOQxt0qrjuQcwN6LODZYyiKHhA=;
        b=cOtI5ijpYkZGReXi3LqBlBKlVDQ42Sjh1yC3dkA97sjZJmg7a2hLUChUm3+1vfkbpB
         8vsyzUIYoupmuM6UQd2zNKvCwhU1idwEdLlYV/sdTiXyRYCwCjmaHUlFhjj22SyU97sH
         kAFQ1ZihD0VI0yRSjKF4Svfmc/VaDefW+u/fK9xByWSZ8IdZOf41ilGPxoBJoWa/9z9P
         QbURMU7QaZZqEk6Ib5JKZ5rCc/hV7Nrt2V+NA56D4JX14v06mnhOncfYG0H9ffj2bGZx
         VSKLVcl2vIKav0vF5yX3GJp3KLNwkIal5G/d3ATxARrpEcRcRw8XAKkCe5/XMvbK99MP
         dEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773184759; x=1773789559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mhh0yC0g6DKBNF8ndnOQxt0qrjuQcwN6LODZYyiKHhA=;
        b=Q5xT14UsoMzJWFyxMvokzC7NWYyoJ5khSaLBBgvSNvLPAzNNLuKkJvYc0tP1DWowJ1
         iQfqr12mjMiUmlsGfAb5ivN/RJNpdcxrjC3wNvIEpaMVO4JX+AaO/Jl51f3LrNXEOjdU
         AVlGVHGhnFBFGaSETA+DeW6MRnnHLo8P0cVL43eQsjzHeLPrHHKWpdNTPpRR++XLAARr
         Jl1oP12pOQhnD/tIpT6r5FIVtuoy8rgpx6q61fjSgH3uFBjpxIUK6xeNYOIszA+n67WU
         Mm+XANA6mFfXvWw1mJb+7bPk1yQXWrgRzvq1VYbJmc1NXwkiIsX5ASZO5YUtxLwxXXQx
         2aoA==
X-Gm-Message-State: AOJu0YyK6nqhOh8SCQLVAHfmUJVfhhebJIuGp+3ZsHajiuXxIgMjFji2
	tph6cK2ovCygLyrnhBdv/wTpNXt7dZErLu1Arh2Vg035jp9RPYepIjIW5sRg3xe/
X-Gm-Gg: ATEYQzz2hhmNVcARK31ZH7tuSkXQjzvxLrqhsJH6c2u3He+XIp5NMqIDiTYJlr+U/lT
	++V6fdEraFnnwuUMeJe23qcH7mLeWQa/SThoQCJmyne6k48jJ4LYmUvhubRpj7q82/UkR7tsAq9
	eQYr2gkJmG+QefxzaseEEsmftXIyVy4GXSWntVrRzKRkqHgXxZ2aNT3a5cVdxUw4uMZNhyv+Jnn
	p3MSoMhcFOfqKkTY0KZlShxarM5u/tLWoqrmS8ewAtZ3AIIgTvYjgDW2Rd0XBwXpQUSXAT0lh/N
	J+CV5PNkjNZJOGagNrfhBjp0Zd47AwtehyPwBksNwj77TbxiVjQqE6KKo/+NtELhsksEq6WpA8P
	Hu01p7v8JjJSVtT5jjJxY2oI341X9KVmFpJGJ4B/8WqDhSs0wx/I+LZlLOag6BapHmIkRqrVw7c
	q/IfKvpkl/3Yk9O0W1lqWGf+KJ4pAQyap6RRzCd7zfvuW7LkOl0SE=
X-Received: by 2002:a17:90b:3c90:b0:354:c6f3:d365 with SMTP id 98e67ed59e1d1-35a012eacd0mr503714a91.17.1773184263048;
        Tue, 10 Mar 2026 16:11:03 -0700 (PDT)
Received: from si-sujeet-n.LGE.NET ([2406:7400:56:d351:3cd5:5dad:8909:d70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f08a5267sm3653336a91.15.2026.03.10.16.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 16:11:02 -0700 (PDT)
From: sujeetnayak1976@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sujeet Nayak <sujeetnayak1976@gmail.com>
Subject: [meta-oe][PATCH] libnice: make crypto library configurable via PACKAGECONFIG
Date: Wed, 11 Mar 2026 10:10:55 +1100
Message-ID: <20260310231055.70877-1-sujeetnayak1976@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 02:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125045

From: Sujeet Nayak <sujeetnayak1976@gmail.com>

Move gnutls from a hard dependency to a PACKAGECONFIG option,
defaulting to gnutls. This allows users to select openssl as an
alternative crypto library by setting PACKAGECONFIG.

Signed-off-by: Sujeet Nayak <sujeetnayak1976@gmail.com>
---
 meta-oe/recipes-support/libnice/libnice_0.1.22.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
index 175e10fdf6..5c5436dd8d 100644
--- a/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
+++ b/meta-oe/recipes-support/libnice/libnice_0.1.22.bb
@@ -11,7 +11,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
 SRC_URI = "http://nice.freedesktop.org/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] = "a5f724cf09eae50c41a7517141d89da4a61ec9eaca32da4a0073faed5417ad7e"
 
-DEPENDS = "glib-2.0 gnutls ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
+DEPENDS = "glib-2.0 ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'graphviz-native', '', d)}"
+
+PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG[gnutls] = "-Dcrypto-library=gnutls,,gnutls"
+PACKAGECONFIG[openssl] = "-Dcrypto-library=openssl,,openssl"
 
 PACKAGECONFIG[gupnp] = "-Dgupnp=enabled,-Dgupnp=disabled,gupnp"
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0"

