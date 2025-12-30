Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA05DEE021F
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66711.1767109754138698089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DhVkyF/j;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so58266515e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109752; x=1767714552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NigXKxhpmZpr1sJYS5hk5xsNNzibrFO4e4QyT9IgzWg=;
        b=DhVkyF/jodBOzpRjTtZ/PS/dq2Bjn95f9ArbEothx6JsT8855fMkf3HcFykOslLGA2
         h4Bfwv/XHeb8DVyihM9M47n+cUmxJgyngDR6+BLCKRqDtsOdsa3SmpepyVzT1xwToAeK
         eD8p1BWpq1oSfVuu2QOIqLtks/2+cKBTSFuxrzBOQMLHqM+26Fcpvzyn87c1ETQc83C6
         deMCMlmrucG+4w+cSbQMAuuiLi1NTGd87DO11mcAX1/Fqq2PCPXbQatuvQNzR7eqk2ku
         6X5cnkpdn8Nb5uXsMdn9svbL65/6gCyYSVzdOLEhvW4sV2cX8GTwFBEhGk+h5ssxHOke
         Frig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109752; x=1767714552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NigXKxhpmZpr1sJYS5hk5xsNNzibrFO4e4QyT9IgzWg=;
        b=ibrFEgbzuttSIXApibFLKZ0PNaEY+enRGBRSPwNSirrPAsS1d4vZvkWXKU/CK7lcsy
         9KaahEgWsAEyTRYfA9JAOLRSMeHzDzzNjxpPEhuDcrcQ9MwT5pmQV6MzpuKsMtp/xbdr
         klIVkYPYUkLhogz5+TkxIN+5anHQBmTD+426gRcMrXD1wfUJj2aPeV7CWXJdjWbQyzgr
         ebb60argEu8LmIATj8+9GdntxdOYoM242jq9GFjR0t1NqEmvTxsBwIDY+ZK+f0MLOpUr
         7s70rSCfGbyxs5/ArYz7W/j3Kyoi8xC4Dppjl0AFcylBcAgIXEe0g2OyK2ep5Eig1CqG
         wkWQ==
X-Gm-Message-State: AOJu0Yz2iSelM/1HFKthop5HoVYcViEn5XSTuJ4aa5fpQd7lC+vK+mOu
	3i5XjuIi7IEBqxEAjspkPU3bF1KKXFIo8pepugrrQXnUP49PccPi9qgdYpmRIg==
X-Gm-Gg: AY/fxX6mx5Hq0JE2cyuvQ1H0CTu/EWDbekTo0NcWegPAt1MpYpDO1IMqIkCiB1jxOH4
	yqI0Eh2c8RfYbiG4mCMCbjkyjaSmpxDF3spAgmX3fZFJGfRPh2rgLF7muRrWMZKY2QvsP6MFmGt
	wcW64GPJo2RGS7FfdnMJJkcM+pEDttUttuLdZJzmcrrQxsHPhVfCgUa/wR+cqRk7F8Ryhh++ZWG
	FGI845Q6RNzbiNmVF/b1G1j8JcnDjc69vto5WHU+Ccrd5D1wpl2B9UKsA9N4ebEdIjlED4pyWOc
	j1LU5PZV7cdsfNA5Fewz0X4IdS38JqmhWpNX02zI5OqzpQRI16jLfId+Sl299/WhngZlyqdbOs0
	CD5peqsTxTzwqkudTRohr48fFhSPh5B5SP3mAc3L1rFa1EoyAPAa42+iC/zny0DZ0ARfGEqpMe1
	8BxAIZYN7K
X-Google-Smtp-Source: AGHT+IGrwoZ/MXwbUpqhbna9AtDxl8Hw4cnJbGQDhaSjCb4n27XO9su1RlHa6J52fg11YfJd/Udb1Q==
X-Received: by 2002:a05:600c:858e:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-47d1c62930dmr298120355e9.9.1767109752400;
        Tue, 30 Dec 2025 07:49:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 10/10] python3-svglib: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:49:03 +0100
Message-ID: <20251230154903.736590-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230154903.736590-1-skandigraun@gmail.com>
References: <20251230154903.736590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123036

There is only one relevant CVE in the database, but it is tracked using
svglib_project:svglib CPE, not the expected python:svglib CPE, making the
cve-checker miss it.

See CVE db query:
sqlite> select * from products where product like '%svglib%';
CVE-2020-10799|svglib_project|svglib|||0.9.3|<=

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb b/meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb
index 67c072c9a1..fc16e3099d 100644
--- a/meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb
@@ -6,6 +6,8 @@ DESCRIPTION = "Svglib is a Python library for reading SVG files and \
 LICENSE = "LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
+CVE_PRODUCT = "svglib"
+
 SRC_URI[sha256sum] = "4c38a274a744ef0d1677f55d5d62fc0fb798819f813e52872a796e615741733d"
 
 inherit pypi python_hatchling

