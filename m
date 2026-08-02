Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB3EC55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:29 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22339.1785672323289374945
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R0j765ZF;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1820346b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672323; x=1786277123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zr1Apajc5d782ot+o+nqYc5MHX4vV/JfSQ832DfKHk=;
        b=R0j765ZF/eYPJrfmM3lJk5zuX+MinEdYbaZVm3KR2ri2Pmc84O4+8sP7J5SvZClbJf
         6srPJNz2VHuuD6lZtmgZJCoxAK/rkTO/fJGtWSx6VXNG3KiK6POO4uBs4MtNGMvIJZip
         JeRCNTh9YOTo89hzRlsffdQMUdtCgZou4I4gSSld0RyYW23y5h3vJSGEBNlkWr/4fhM3
         KJ6QbJAaMhdEHdzZyTGeXTmqm8od54x1A5k9jj851n/3v8qfrmr0KbPpQWLJIKORbDbo
         1YEDvg8sRh8PFrF7uAcS2RE+KE73g4APDE8/Msy62RcDQmVli0Y2OJmx4feNl7m583P4
         Pn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672323; x=1786277123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7zr1Apajc5d782ot+o+nqYc5MHX4vV/JfSQ832DfKHk=;
        b=FY3ixbScWSAIHnwBxYxRTM8qe+sy+IFSs9hPhcWBxG61O47ET1WnvHj+abU9AKrL+4
         uP/IGy06s0tQJzNvUNDhmoWkY798RlccxHB46kp42TpGGYSAByNlwY0ou06Mb8UP5N0a
         4HwgFNTAsrfje0ZIHLTkRKR5MP9zKfTKMhxwnKxeMB5ZOlAobtgb9ULc7dQ0dVRLc9vN
         E1BV7ke7k33kSsP5Fk2kRcTZIEM38RYR3WivVKLIvousc9LR55YI9ZWvOjWGRPpBCL8G
         FH2MOiB6W81bAtxN/clq5CTOBRDDSGFSF1hvew6H3xto3P3naBQLKDAkrVYuk6dhgTND
         wPTw==
X-Gm-Message-State: AOJu0YywmGDNpUEJiamScjlzOauwKVq8tbD7UscVS7Aul5oQMIVD+NPB
	DtbogkscDa3kTdBEMpqq6fvO7tB0ZZuCrYvAJOHocgJTKuRPDT/zGFM4x96gfQ==
X-Gm-Gg: AR+sD13VBEb3rsP/FNNL17zV7eLIfOq8sQZnID5FeIIPm8EbuSYDuLu1A02Xlmzhwlm
	A5fpXlgPaf7XmtCoIQdLM9bXgP8f/4WXAGU4KDS9CqpTHSY+PKAn8kFBGky2EsflOXOxNCJN9AD
	6QFQHYrMsw5YN+2VRVJ6T5IoNRQyR0s1lRhCg9ZFH+prKxRRmAo1q38eXzBrzfaLbWRGncqeEQH
	D2pAM9IjWg+jTkbXQJyk4eI4tfPYg+Zmja/QuK5l1asebaBlQVo/XexJGOwUxkioDOHCHZWGT/7
	cQ1IjprG2uNHWBynBUUNXUsY72XZVxh1C/3fLLLGehK6anTC18LxONxL2tx6Kk4JrvMVHEAkXHa
	waJET6od+EODRwXjRMZXXchz74LnDSCaNs/dmwY+dvTpR+rTE0Zl4T+tjoYAeoIH6KaNqvgMtwJ
	QDptwaUhWYCzW12gqJYOhBgY7dpEZtensA3N2q8Ml66XzlO9pm2L6bfdXdfBsxw0pwp0xd1yatj
	Q==
X-Received: by 2002:a05:6a21:8213:b0:3c3:a490:9674 with SMTP id adf61e73a8af0-3c92a906576mr6060141637.64.1785672322533;
        Sun, 02 Aug 2026 05:05:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:05:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][master-next][PATCH 11/11] parallel: upgrade 20260522 -> 20260722
Date: Mon,  3 Aug 2026 00:04:42 +1200
Message-ID: <20260802120444.2973561-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128666

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20260522.bb => parallel_20260722.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20260522.bb => parallel_20260722.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20260522.bb b/meta-oe/recipes-extended/parallel/parallel_20260722.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20260522.bb
rename to meta-oe/recipes-extended/parallel/parallel_20260722.bb
index 4ceffffbbc..1d4ed737a2 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20260522.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20260722.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2bab0cf913eeb60a24c6575d60e3c167cd03e63b4f7d17965915844e005dd895"
+SRC_URI[sha256sum] = "afe4b572a4334aac3a002a080ad618249f00b84d7659d03e77412727d18f1ad6"
 
 inherit autotools bash-completion
 

