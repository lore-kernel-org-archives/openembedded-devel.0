Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41806E73179
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 19:34:01 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61985.1770060831423337574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 11:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J04vEXNb;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-482f454be5bso730105e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 11:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770060829; x=1770665629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CR97x3CYDcdPFEqkKLHc12Ubwgj14+W8c75ES/dSmZA=;
        b=J04vEXNb3RZWNKo5mGjpdqkVKBY1G5a8GklwyH2V7oNgaslLGtEbrqukxG9x0ib4c7
         ZQDcFZILvJFJxadH15BOhMBmEzoti+Ht9gY/SxZTx7CGteRvXUcixHO05PYjNtJpuFIn
         /DL/+j1DiOch7tz6OssEPLQ8E9ui2BAZc+hpbIEcI6ifx9zVEiK+usdI+9qI0D5mqdvZ
         NZ7cmHQMAy+/OxepDH+F7bl4xZeO0CMnrEne8v13fq3rkhbXZi9pu7awvk6Zg3sefJjR
         1PeQeeeaskuLrkNM+DAKz2fRwoe8YJqU63/1Xvtpv2wtrnbNCxyAH1bCer/7z+ZlRpHV
         Q8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060829; x=1770665629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CR97x3CYDcdPFEqkKLHc12Ubwgj14+W8c75ES/dSmZA=;
        b=jHfCiEEi7qs/yxekxP8m4AJd91GiP349y5vfyMmwArUbmvQm6ZokaxrTSGZu/FZoQe
         n6XEJNNlaqG32rPgHgteewxnHlKMNPLt2bCtWPhiUzwTinMMB5uNHTYyVpblmqKaAP+u
         J28/L69eZf1bKClnE9jYICStpSseXga1TSlK/YPnYXxK8YY6vl5BBGKpM0a6T0tpVmnN
         BJ0P239ek/VW5mQleumtcSFHlhIykhewklytRLJS07YA/uKmKAl+wJiXL4ECiyJ3ODpq
         6B7yKo5wQa0R1duogvmD4VZCSuawLtdHNwUhs6ABPHdHylcZHf5Rk3ii4dX+24UVWfCv
         T4Mg==
X-Gm-Message-State: AOJu0YxTYAx0Fn1hyL1tcbGhs+f1fA166KosOqPXfAgCXYzG8mXJSiP4
	gBsz+L/HXa1kUBQrXU81UrO/MMQ7TRTHj9Jy4O5uIbe2KDpNX+wr5O1zQAoflA==
X-Gm-Gg: AZuq6aLZCO8GSA2qVZvE3OHVxsaLPNkZf4Lb69xylq+EoFCkKeMRcjbBBoDTP/elXH0
	ENS7L3wB5jj2Bw/fWvVa7X3h0Oe5DfwtzzC0nogqTOFh7gLIgiGTKKtUXLON2941mX0oHPdmG8U
	4zGXZizIFeUi47l3ks+MSElm9qzBWuHQ83VFeVMHI4oGfgn3lsSqg42/Ox7b/3TgLMNvT0yXK1Z
	4wCK95u2tjn1TMAmbEN20bNsBHoiYyBUbsi2bJBiQX8/PVQJlmlKWP0Hwp8pG0D0vx+OuZu57sk
	T4Q0Hgqr6qvPHDuAeTQjoQhgTzEKykRFzZZkydR0cjZOLJHuZzWbzMZ3U7TCp6V3NbGCnViN8OH
	umGNAh1RYM9+Jp5PrW56azxPuCOxF48b1h6TBgc6Z/JX63ACwpIdbvFgMMHFxxcKHZp5kJDON5k
	DXBl1TQTE1vjeoE50LjY0EB8CFCzDEw2ojwIk=
X-Received: by 2002:a05:600c:8718:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-48305133282mr8764385e9.2.1770060828960;
        Mon, 02 Feb 2026 11:33:48 -0800 (PST)
Received: from Unimatrix04-Noble.. ([2a02:b021:11:d73e:7562:e239:2849:a95f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483002955dbsm21305355e9.5.2026.02.02.11.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:33:48 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: Upgrade to 7.2.6
Date: Mon,  2 Feb 2026 20:33:48 +0100
Message-ID: <20260202193348.1576605-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 19:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124072

From: Gianfranco Costamagna <locutusofborg@debian.org>

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../{vboxguestdrivers_7.2.4.bb => vboxguestdrivers_7.2.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.4.bb => vboxguestdrivers_7.2.6.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.6.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.4.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.6.bb
index eb9b81f154..ac941de811 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.4.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.6.bb
@@ -15,7 +15,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
 "
-SRC_URI[sha256sum] = "d281ec981b5f580211a0cedd1b75a1adcb0fbfcbb768d8c2bf4429f4763e8bbd"
+SRC_URI[sha256sum] = "c58443a0e6fcc7fc7e84c1011a10823b3540c6a2b8f2e27c4d8971272baf09f7"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0


