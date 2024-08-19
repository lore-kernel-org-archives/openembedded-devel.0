Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10445C52D7C
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:45:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.206060.1724057130710357345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CSpJpai8;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42809d6e719so33793085e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 01:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724057128; x=1724661928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zU+TpSa8RmwXcOwuwGz5sIt53LrzSdx9F7Swemdmb0=;
        b=CSpJpai8Xl8kgO/JaGuIIww0nWYHF/oeCq1z39lX+dc23Od3kotDfjGbjDrDRk77SX
         qT4ChMtD9PIwU+xM8il9hD0YdKCnrWUPwIhl0qu6hclVqcSzzySEV0NAvR9Q8Ax8oOwv
         utFIBjP9RGGPvAzRZcXry1fhrVIF551l/SECePfO9ZlE6+aWi55CuXtUJi1/2DS3lIeL
         fO/sYeKtPoXsdKspnOezLOslkjEWUKz0oa1U3vAE3tGdUUAC/Qqxv9oAnDO/qu/Pu4HP
         Eat5b9JBpfl0FdKHF+BVfKB04TP/rfTPVHR9f6EIEPXtDP1e35Uh7f0awzoL+3mbR66S
         WtsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724057128; x=1724661928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zU+TpSa8RmwXcOwuwGz5sIt53LrzSdx9F7Swemdmb0=;
        b=qtteQd+zm7A7blAc1DYvYGww+FuX4THu1P+rTyirKYrxtyu+8xC2I/oTMTa67ztYVE
         euPhCHbbR+GHF/pm034EFiHHdHiCSGiBxIdVU3qoEBiMK8NjQULfdHDBL2jFLtpZXz7I
         P0syaechxZdnXuV8fGZWCa9/7U6KxlKYU9Ymkquwf9X9jjrNPoHHDfhBxRKz1UNhHVex
         sdysDojO8+N2+TsPNFoY2VGpar5YTpBpw6CAvIL1nX2101t9IO3Rx8BGk17t+Fu6gkBQ
         6GKwVcwisZV9CfSKn2RCg4vb2WcM3LrSGavS0fLElLky58riwYbXLzu35sCdbLFce0/V
         kVpQ==
X-Gm-Message-State: AOJu0Yw6SEkgwoRqyMjAXqb4DYClaYn7d28tJiWh5OqBbQuUaRTxovAL
	BDw2Ei4c+23DG9AUoCsDsNXHawcDgrVLUG9yl5GDYskfHNazHHzirWKUVQ==
X-Google-Smtp-Source: AGHT+IEDxb65AbjNZ6xizQT95xmyz7zNd77wjMtbIHVcbtj/IQjmMnRoU+2WZ56z4i2s/FsygqW5lQ==
X-Received: by 2002:a05:600c:4683:b0:428:1694:bd8c with SMTP id 5b1f17b1804b1-42aa8276727mr37447705e9.37.1724057128231;
        Mon, 19 Aug 2024 01:45:28 -0700 (PDT)
Received: from af-t14s.fritz.box (212-51-147-160.fiber7.init7.net. [212.51.147.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429d780ba5dsm209920715e9.0.2024.08.19.01.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 01:45:27 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][scarthgap][PATCH] networkmanager: remove modemmanager rdepends
Date: Mon, 19 Aug 2024 10:45:25 +0200
Message-ID: <20240819084525.393699-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 08:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111847

This reverts commit: 5edb8335dc46450fd6bcdbb3fcf55336b32bd422

The Networkmanager package must not depend on ModemManager. Only the
Networkmanager-wwan package should depend on the ModemManager package.

The mobile-broadband-provider-info is fully optional and it is often not
required for embedded devices. Let the user choose if it gets installed
or not. Adding it explicitely to IMAGE_INSTALL is simple. Adding an
RRECOMMENS would work as well. But adding an RDEPENDS is bad.

In general, NetworkManager packaging is intended to provide a set of
binary packages suitable for building many different images.
NetworkManager is designed to be used for binary packages distributions
where it is not possible to rebuild NetworkManager just to install
Modemmanager. Also for OE, where a rebuilding is possible, a rebuild is
a disadvantage. So please do not destroy this flexibility by adding
RDEPENDS, which are firstly wrong and secondly only suitable for your
specific needs.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.46.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
index 8184fcf1a..1b4003df1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.46.0.bb
@@ -99,7 +99,7 @@ PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false,polkit"
 PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
-PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info,modemmanager mobile-broadband-provider-info"
+PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
 PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
-- 
2.46.0


