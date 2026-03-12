Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95934106ACE3
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 19:34:11 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1249.1773344047621261737
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 12:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DWVFgcHW;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so1907932f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 12:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773344046; x=1773948846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8dNhkXSmuNJGVXpTdS8ZzATk0ZU9POFbd9gfqOVm5Ng=;
        b=DWVFgcHWMZsLUnbs1Oil3wL+5Z0/4QGHbcT1S62Qnn9O8Siv+c0u6Qevvyl7xjC736
         XGpyZAEEtJ5r9Rq8foZDaE+PYGsdtNE81LhcfKtsNd/G0LoMX1G+ivBVCf7H1o+SMChq
         d8GKRGP8JfHrQJKUwUFnPOtr0fo/Kd/OqYA24uyjRn61yCUqW6kaL13965WVfjM6exPT
         dLWrSVbt1l68fiz6W/BGWYXXBN3burd6QjnFiCYf8EL4qvTPDjFtz2ExElcjhySe7oE7
         EPNgjEqKwOF4lB02B5heyyPP5suSgRn0AdkvUVI6dEwxfP0zdH9WBeOZENPCyylobeSl
         J8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773344046; x=1773948846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dNhkXSmuNJGVXpTdS8ZzATk0ZU9POFbd9gfqOVm5Ng=;
        b=RF4p45ZGPaWhqLir/uSygeZeLJqvnxQLH62MayyWQigxZMC7J4KlySLoiYXUd3NIHO
         DKzkcEPsTzF6YQF/JagMmDat1IvcUeAP5gflman1xgT/EEt70sNJj5YLDMwuS5stUCu5
         /U3qopTcJ55QUKLwmF/+nSvUvZpWcZahv3RDeaEFujcEpGFDr9VgXY5DW7e8375UGZE3
         jpzCZeWY5TBgP8mbzK16N+Z8VVkCFFGIWauoUD10tvig1JaTR19K2WeBQNxBCwXrTf3e
         w1kTKutZVOZcRhr2XgCqlXTs1E1HuJJhFCchXE5TPh50GBkFts1Er09/uDB7eQyK7R2m
         Pl5Q==
X-Gm-Message-State: AOJu0Yz/qg7zLSM6xRyQfyImuLi/+xSTqyFvtOuDcYA80KvUR3vZWvW8
	ZKc0WX/fwXndVff+qDDyRk5AXtWawunSnuWA5Ue2Ug4TvLyZgzO1TuHfuC2qsw==
X-Gm-Gg: ATEYQzy1lkeIrCGYtAzy3DQ1vfyBpBruw8BRM4SjQpu5SAHV1h/W2kXjgrfo8BSXgHy
	XYCztNcQ8XZZr4Qg/u2G9V7KnBFKsx+b0aNezEAfGr1U/d8YhIdvCvwQqGODU5OwVyVmyQmEQyR
	T2HU37JgCNACGfonw2j1asnGuh7H2ePTezAr4NqJeV25ZmqiuVJ8Fx65X9+ifRjb62UzmZrxOpd
	ffMPOR/d7rz5YnFgXQHpjaCdjcD+K9ODq/b/rpP/80ZiwyubS70kDLCv+LJa2miMgBapVp2ivOm
	s2p8rxcVHDMggSWqYn7aFA+asVYIwS4N06xn33cF6ice2RXGv9885//3MpyInyNb0q+xatRYEt/
	N/K8XOWqavziJ75tv7n73GvOXhvEZXnM4aoWRxHKUaUxk8Sl4c0ylPvoIDu2A3x1jLDwOdAebAj
	dnmc/oCr8RgX5dt9whMPY+
X-Received: by 2002:a05:600c:3b08:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-4854f561af1mr79220965e9.1.1773344045466;
        Thu, 12 Mar 2026 12:34:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19abbasm9931801f8f.6.2026.03.12.12.34.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:34:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][scarthgap][PATCH] hiawatha: fix SRC_URI
Date: Thu, 12 Mar 2026 20:34:04 +0100
Message-ID: <20260312193404.2758016-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 19:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125175

The tarball was moved to a new folder on the source server.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
index 0b3c325e80..84895196d6 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-10/${BP}.tar.gz \
+SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-10/${BP}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 

