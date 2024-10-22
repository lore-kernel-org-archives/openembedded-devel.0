Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49EADCDD0D4
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:21 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.21776.1729612084069125396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pd6cqeMC;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2e2ef2e906so832409276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612083; x=1730216883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfABOCaZbwa55NcrKtDiCevcN8V6qGSGkHFpKVAeyOA=;
        b=Pd6cqeMCSK+VAqA0nQp1I35wm4ysf60OVC/gq9P/omoEIlnTemfekyKbfXBtxqO70p
         VvNiiYuoJUcMtmmhWH7WVh6ShL1j3glezyPOnSGv2OMQV1tASHL/Zf7OzqUlbAbn6Seb
         J5vgHDgw8W69MWATStV8ua9gw/zusYOYVnynMIJvw5FAmPHXviNBigJM5LRuySPc2amr
         aBrCXzibC2p9r6pNNjJggzFHjf/0zNkiLYAtJivIYsnjgIbUeLgkTHOc9tj8zwDBh151
         avytELzbbeoqqtegwZwUvo3TLukzvpDS+EBIJf/abpDzAKqGwAa7VgRFAqJQ8f54hGMV
         1Bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612083; x=1730216883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfABOCaZbwa55NcrKtDiCevcN8V6qGSGkHFpKVAeyOA=;
        b=holVhzs6P/4Ja+X+pWI1KRpwdodE7EZr9CJNCBRAqUkUMFIobggj5AMy4u9nW2Brb9
         AWOISa5645jWCQRMY0Cfi/ZDkdI9I4WsX2I5qbbaBXA/zYSwoafNC0fW6pmHgB8u1PSs
         ww+hbwwP8Z5VHMozItagefCio4lJ7XWntRycDi+gu0GJDc6HoT8W39eVekb79AE5irQT
         CbuJ29NSIMhoLa3Cwk1K2xDBeWDK+UTCsPtzfTkXjRHVIIxmzI2f8NcYVpCZSa94T4+j
         VPuquAUyCGonv8CgOwP01eMiH3vrvC8Yzg5V53CBOOMW30OjnMFdCl3o9QtOpIRgxjM7
         pEhg==
X-Gm-Message-State: AOJu0YxaXuUcp68rJBf4XsydMfuh0fDuHGz2kICElqoCbIWdACoA0Oda
	ePiCl80GXvrhaSQmuwybr4Ig1AlVyztV/JCTxN5Mr7duf+feGxqqnu5p7w==
X-Google-Smtp-Source: AGHT+IE/yhcC3JTFeEW7Nstxtzryi4SjwILVBFfkBw6UKzP+F6iwMqtXg0B5OGWEgDW/YOkGl5cofg==
X-Received: by 2002:a05:690c:9a0d:b0:6e5:a78c:5795 with SMTP id 00721157ae682-6e7d3c0fb40mr40329287b3.43.1729612082688;
        Tue, 22 Oct 2024 08:48:02 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:02 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 13/46] liberror-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:31 -0400
Message-ID: <20241022154729.20331-14-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113104

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
index e54bb11cc..15e0ef85c 100644
--- a/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
+++ b/meta-perl/recipes-perl/liberror/liberror-perl_0.17029.bb
@@ -33,7 +33,6 @@ RDEPENDS:${PN}-ptest += " \
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6732b1c6207e4a9a3e2987c88368039a"
 SRC_URI[sha256sum] = "1a23f7913032aed6d4b68321373a3899ca66590f4727391a091ec19c95bf7adc"
 
 S = "${WORKDIR}/Error-${PV}"
-- 
2.43.0


