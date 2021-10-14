Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2502FC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 14:17:30 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.10192.1634221048751777920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 07:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=R4VtRggm;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id y15so27772176lfk.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 07:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Y340xZOT4Z7xp8+EJu5sazkBu3wvP1f+WDK+Pb/ehA=;
        b=R4VtRggmEWB+O1zzVaqVgR4VC1mTr2LLXQTXf7MUiz8TZ7ECsJR40OXECCLXw+Q1Tn
         Dt2ZPCIC3YX2tnt0VyCRPaqrDAH1nrXIdNr0PinFrXTxuwaJ0NBkevQqKtxwQxuCtrnl
         lmhHC9JbM2YKNGT6cVNqSRLx+4LOHe2dryeo2CmDlanXQuXeYarxdelZaCp8nKBkhwd9
         Jmex3kYzcpDaDZEOY9x7Z/qj4SZtcze3SNfFgv4rpM7cMxlXBZmUuHIrxXkwKtGVO5m8
         FdOv5syBtL25GDZzOL1qH7f7khsZGsmhh0mxs32SS6i1Kpn9TlkBA+PjfwnIfVgvGRHR
         LI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Y340xZOT4Z7xp8+EJu5sazkBu3wvP1f+WDK+Pb/ehA=;
        b=VN7erjJxtaJZKf2F+qlf2vQP0evLExV1nolOCGd69GKVmE0Xrwa7H3sGI/R+WOExed
         6KOsPwhtxpRStz75FZ+Up2FqMhVY0nVc+S3TQgd831kweX1VGp5S9Lrn/OaD5qrCkC0Y
         yfPef9BEdYREQrhV4UxzvsAmrQoFbe0LATUztZxoovaagpfBFAfq2v0r5KuROhgMCWIZ
         EvC0VIicbjeeTUBPaIpldOYQk9eTqrfCtzq7o+Rr5Z4Hed2q1r0jdSEIerUj+44oqieO
         JLnPZlis5TB5lPBIRZ9qp91jbmU5YKDrQT00M9fkmq9VCPjZX4PknqdfOcGE1idS/QKH
         3eTw==
X-Gm-Message-State: AOAM530esCOZUjxp8i5McfoiZeE73W9Z/nqRiGUm64nZdwKX3l2JKL44
	dFoCCMmhT8IeJ/ho5XehzrzjDfJ294mcQQ==
X-Google-Smtp-Source: 
 ABdhPJyr9VlAXe5kAibyQz/GXlRLAZBe3CASgWVhFNpdXonAmnRYLLMSvw2gmsYqa9K/9a8y1oPW9Q==
X-Received: by 2002:ac2:4471:: with SMTP id y17mr5177780lfl.681.1634221046190;
        Thu, 14 Oct 2021 07:17:26 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 p23sm237059lfd.127.2021.10.14.07.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 07:17:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] nano: update to 5.9
Date: Thu, 14 Oct 2021 16:17:24 +0200
Message-Id: <20211014141724.3612811-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 14:17:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93298

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-support/nano/{nano_5.8.bb => nano_5.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.8.bb => nano_5.9.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_5.8.bb b/meta-oe/recipes-support/nano/nano_5.9.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_5.8.bb
rename to meta-oe/recipes-support/nano/nano_5.9.bb
index 146ad55c6..85c81fb79 100644
--- a/meta-oe/recipes-support/nano/nano_5.8.bb
+++ b/meta-oe/recipes-support/nano/nano_5.9.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e43b63db2f78336e2aa123e8d015dbabc1720a15361714bfd4b1bb4e5e87768c"
+SRC_URI[sha256sum] = "757db8cda4bb2873599e47783af463e3b547a627b0cabb30ea7bf71fb4c24937"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1


