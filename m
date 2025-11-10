Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9427DCCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 18:56:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.830.1762800957335808158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 10:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DbdtfiBz;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477770019e4so24532695e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 10:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762800956; x=1763405756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WF5R6d/+rzaoaqh7WZxiqsGvTh3njfL3hMXSof+bWXU=;
        b=DbdtfiBzy2WtrayWUqWW9+HjEjZF4VSD9W2QF3S7FwVmCHB45ZU90Evd2zD8m15637
         dS8E+Fqwdliqucd/CRT04YIxR5FMxMZzQSIoL9mQho/S2CVyMRz3qeAGrmqI/tIlxO+m
         SZfY2Oya02m+Lv6EMGHXFWvZgI0DvDkguwD+vv/BRFLcISUlGzr1I4t4BX9VQ9Is4p3Z
         pWotoBJzqbQaRNzUTLdqRoSZkzi7kXajGICwjiLOde6NLXK8Od7N3EqcEki5YB1irose
         /qf/R7zP8RiTS/5F30WZWjnyh7q4YJMRVMHC3lcP1EBjb6zxQiJEbr2IFRX6VV9G27Ja
         FCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762800956; x=1763405756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WF5R6d/+rzaoaqh7WZxiqsGvTh3njfL3hMXSof+bWXU=;
        b=kUDAKSJfAGI3DfpsJKH5cUIgr4m9g2/Lv2CzMqoYjCa3t2zm4nfSbVQqqWJ9MjiTNR
         3Cff5KFtmyPOs38BnUv6RbURWo+xeXfHoG+L0Mr9hd7Glo60JwfXmmTD5y5xfq1DuVFa
         cE6wB7kclDQUX3mMCcYMYROfQbQiLPvj2yGcBAF/UkRnMorVZug8rmiRzpzJO8ddBvwT
         MS3dgpddDar0yQck/akCqOob3w2YEN43SIw8GlyCRSBU8rh+Kx2CnXaD67X8308RGT46
         RUd8vkAshPY8HOpzMCKJ/fGmuVq58NcAVfKIHqQI313EjM7u8n03a20CzHbz9Sxw43Dq
         NClA==
X-Gm-Message-State: AOJu0YydW1GumMeVYDWBsK0oy6LwhYx8XkEAlyEIFCTJPk+i375qX5T4
	b0acnMm+5ISxnvuUtTplpnRxYwKeMQUsnaugO5H8WuMMM2E9uEuZtEI/rWA2My4+
X-Gm-Gg: ASbGncsPIGiRUOTmeSLLshmuW1AnDlENWsRoIfB6k1NHmEhs38RkoctvNfU22XTXbsB
	LSAZ1MyIlLxlReWI6qI6ldbDDX3mpzEYZvy6v5jwzMNmkGA1+SKTF+vtlvgLH/ZBY+51hlgAflg
	kYmOCsrgHo58PKd/3icWVlx95FRD7Kesxyz9M0DbOsFGG1o8jLyfP1mzWwKOv6iEGgdc7oFXmYu
	oN2IBzWCxTZINkpDXQt/1McLGGOciq5ZY8CZ2F1fzqZnZy27Bnpyuka+VyT+bbDJqpHjZNaEAJ2
	WmBtcNX0ehn/2/bXSxt19nQ1UnB/wLPLQcTqxxBQvi5nAMzuIQGCNKytVs8aa/KW23HNYV7A4wG
	uwrosozG59XpzudIcosdwYWhph6FdH1DGqGTu6RrQwxrKMmvrhzxneQttRM58VVLxGJl1fJh1iQ
	==
X-Google-Smtp-Source: AGHT+IHd4q9eZCY4XTvxPND1L3eIM5xDWI5vu25VLpcagWWtnTIa3gRBTIOGAGHR7LWBwUmXy4zWKQ==
X-Received: by 2002:a05:600c:524b:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-477732705b2mr63388005e9.26.1762800955423;
        Mon, 10 Nov 2025 10:55:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bd084d4sm274529425e9.14.2025.11.10.10.55.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 10:55:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] poco: remove mongodb from ptest RDEPENDS
Date: Mon, 10 Nov 2025 19:55:53 +0100
Message-ID: <20251110185553.354551-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 18:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121471

mongodb is in the dynamic-layers section of meta-oe, and not available
by default - which makes the layer not YP compatible.

To avoid this breakage, remove mongodb from RDEPENDS.

To run ptests fully, this is still required to be present however
(bbappend, or local.conf...).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/poco/poco_1.11.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.11.2.bb b/meta-oe/recipes-support/poco/poco_1.11.2.bb
index 53ea13a480..b8a1b571b1 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.2.bb
@@ -101,6 +101,9 @@ FILES:${PN}-cppunit += "${libdir}/libCppUnit.so*"
 ALLOW_EMPTY:${PN}-cppunit = "1"
 FILES:${PN}-ptest += "${bindir}/TestApp ${libdir}/TestLibrary.so"
 
-RDEPENDS:${PN}-ptest += "${PN}-cppunit redis mongodb"
+# When running the full ptests suite, mongodb should be added to RDEPENDS, however it
+# is in dynamic-layers folder, only available when meta-python is
+# available - thus breaking signature generation and failing YP compatibility.
+RDEPENDS:${PN}-ptest += "${PN}-cppunit redis"
 
 BBCLASSEXTEND = "native"

