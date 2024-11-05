Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E20ED2C137
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:22 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.19653.1730817441558742892
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h+nPHjIX;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e390d9ad1dso45372367b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817440; x=1731422240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyIcPHMiC/7OjVxvfA1kPcFnDKwGckCY1m1zKhkhePo=;
        b=h+nPHjIXjDvmjbSKd/sJXnYj0tz1eXax4wzVFSwC/+MdDD6cjZt02ud1S9rXLtvGeV
         2ZboizZpH6WHtb48jKiGdZWAFhcspI1xR469EgLD2rNYYoowaFiQZf6e4M5OryyUxB8a
         C1gerWilu+G9bvnLjGJhYvrSu70pYnPBl93SYUbBGdq8wdkbDbpsyRlUJ607PqO2X795
         yZT3P5PMPXq+stszoMLzeekJ4WsJ6+xD2WaY6R7TkYZjnjrOiUJ4oX7sw1be+vHPnKWr
         vAG4f24jQrXPq+xKqCHP61V09He7QlzgOjOXz/s9P/2dVu8VVSN7z5t+vPPaIRlngj8n
         OVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817441; x=1731422241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyIcPHMiC/7OjVxvfA1kPcFnDKwGckCY1m1zKhkhePo=;
        b=ghchIB7ejwYXwEdGYlwWRS9nhOKWOFklOU8dKMk14n+4OegP2LsGiY1+DyGpj8OCIx
         JKdVDdgxAPXKlnQFNk1TPqLUVLMSm/6s6HMzX9it6ODMWY0//WjIAVdPo7aH4vBJ5+X2
         8x/4aKpxxImlIqq8DKQRkPsoPVv2YMXdYkFsMWpPu39G7q19kiZ4JIOGd5g+BUOYhO3v
         2IsM89aJozc3lLMoz7uasWTNnJJ4PTmxRirZ5EZjceNDNTA0BuJInpHecTplFtIhbZ7q
         Ig7SVurEw4N7Yu+qCr+jv5Tb7IqOm05FSArp1msGoKDnCVRG9QFyjrhiYphiQjEPiajp
         xh9A==
X-Gm-Message-State: AOJu0Yy3E92YZpHdSP/DjpueEsrbbsrf4WEw56iIozoalfH1+p+RRkPw
	tu4Cc0/Q18qE2xNVms/akp9brWP4zv0yn5SxF4vAWWnr+9wH45jPQ8/Gtw==
X-Google-Smtp-Source: AGHT+IH6Puf3IoD5y/LBBz4FaPT2qST6ze1Tlet7c02CNztN7byDlR5zIi6IJoe5g6S7+kNoeO47Hw==
X-Received: by 2002:a05:690c:4c03:b0:6be:54e1:f1f3 with SMTP id 00721157ae682-6ea521d3613mr217176247b3.0.1730817440562;
        Tue, 05 Nov 2024 06:37:20 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jiaying Song <jiaying.song.cn@windriver.com>
Subject: [meta-oe][styhead][PATCH 89/90] xmlsec1: Switch SRC_URI to use github release
Date: Tue,  5 Nov 2024 09:35:54 -0500
Message-ID: <20241105143638.2301245-90-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113506

From: Khem Raj <raj.khem@gmail.com>

This ensures that we do not have to do the toggling from
releases to old-release in LTS release branches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jiaying Song <jiaying.song.cn@windriver.com>
(cherry picked from commit 24048ef4b084385b513a75792c65e7321d4164e0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
index 994adef3af..50c387d250 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 
 SECTION = "libs"
 
-SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
+SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PR}/${BP}.tar.gz \
            file://fix-ltmain.sh.patch \
            file://change-finding-path-of-nss.patch \
            file://makefile-ptest.patch \
-- 
2.43.0


