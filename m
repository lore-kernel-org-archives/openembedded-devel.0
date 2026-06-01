Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8F7CD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 07:20:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23059.1780298414623508691
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 00:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Gij1igZb;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: nmjain23@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so1419372a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 00:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780298414; x=1780903214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aa7v75OmwjV5lC+UF8lGwUp2rNSMuO5EoYuD2nF42qI=;
        b=Gij1igZbTyNjolWATR2GbNBT9TWMUqlNtjxegqKFas5TGnNcF58S8jSh+4h6eQePlO
         JDAuuLUY2Wfj6MwYDYwBB6sG/PWdLsq4IKJv9CFIBlJEFOefRIewiOlPplONPs2IpW1Z
         FfJ5PQsBCVW4aQPTY9QWHwP5xycFhUAwHBvBHduMh/x/qk4yNM4fqu0lRs0cU+l5Um3g
         sJJqS/YpyFXNpvKdb6GQBMumNyIQps+X0aDLdtf+75lxen3yH6rJRK/Oj2pamfo7pnKK
         oO7O7O93JhcuXkDqmHkLk+DH+vwCP00R/6mQZpKmp5l/shtsie39TmwO7X7pmqR7HHXE
         HVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780298414; x=1780903214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aa7v75OmwjV5lC+UF8lGwUp2rNSMuO5EoYuD2nF42qI=;
        b=cLJ9Zp3fGzCb2sfYl3VQbeKwaVUMHTLFQl1138Z6xg/0PXoQpjrrdGNiSFALbPrTvU
         4RP2wTqakUrwRozGVcTTEadLMjHX3hQCiVfIzgnE+kLN5SNNlQn5/UnUEsoH4EZnbKbQ
         gWEfvwhHoFFN3ZjHi4+mOtA88MiZM+WmCei1eZqCfa2MrwAYn2VzvfzsYdLP/XVViyC1
         XTidue9ZOv47r1MW/TwnbXNE+DgsHFSV9X4y5zmgpdlB6x5jL1sVDo4gycK3wG2pr+x1
         0jmvyukirk8jQ9hkwGtQHrQvV8X8WXGU6z9CCREEqtOKMHgwsJAQQRcWrPhJ8lnJiJKr
         k+bw==
X-Gm-Message-State: AOJu0YxF8X3Z+BsIVYdVEboLq4vPaD3RNmKk5tzHiElAc+4pCKxxgj6m
	6OZ+zMWZPHoRsU1AaHxeHlfKpqMfhoPAMlXT+gZBU8WVRkL0jN83BMWiHXbDmA==
X-Gm-Gg: Acq92OGqAHWBJYsySeSGfd/RoyAHrLUsXwY0DJ4mTo7YtDuinQlasZp+UR33tkX73KK
	czTpEhlTwRsRozZSE3dDK2ZcmkzL0rvHMGipMEVBZq7XWJLhvKyTMPi+sGgb618Pj+gEvs/us6X
	1mNeQXzw1/c6asl2vXSHHeLbeqdAWJ5gWUpSeu6sat373143n4pU+1QrKKnqfyUBXaWFXGzZFus
	MTpqlEQRqz1vIYiVWE39AoYpn+irr9uf2rXA1NuR+suTBg6KuKZbnDa4TXPidyMvJqkDoekp3dx
	Rkt/k0mqJlHzasX6QkLvWa+M+eMe50Z+JpQqvdO2m2eEwgZugIuirFH0a8vHHKHaDCy/S774MFb
	ZNGFHtKqfB2LJZ0yPp5xF1crYRhDU9gaX7G+bju1uPs2dAis1wgY0nq37BYTBbyC0loxXyTnEDh
	jYhwzVmqJB764KtpCG9NrioKfRwwyrI2qyOYUlDf3I7wUP1tf2ySEEtbDNPxMQvvAHzxgfa6eQ1
	Q==
X-Received: by 2002:a05:6a21:9f07:b0:3a2:bd1d:d679 with SMTP id adf61e73a8af0-3b427f9e1d7mr11014949637.48.1780298413973;
        Mon, 01 Jun 2026 00:20:13 -0700 (PDT)
Received: from LL-3450LLL.. ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a789bsm9886114a12.4.2026.06.01.00.20.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 00:20:13 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta][scarthgap][PATCH] libssh: ignore CVE-2025-14821
Date: Mon,  1 Jun 2026 12:50:01 +0530
Message-Id: <20260601072001.2491831-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 07:20:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127306

Ignore CVE-2025-14821 as it is only applicable
for windows.

Reference: [https://security-tracker.debian.org/tracker/CVE-2025-14821]

Signed-off-by: Naman Jain <naman.jain@partner.bmw.de>
---
 meta-oe/recipes-support/libssh/libssh_0.10.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 189305fd2e..5f270eb183 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -46,6 +46,8 @@ PACKAGECONFIG[tests] = "-DUNIT_TESTING=1, -DUNIT_TESTING=0, cmocka"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
+CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: The vulnerability is Windows specific"
+
 EXTRA_OECMAKE = " \
     -DWITH_PCAP=1 \
     -DWITH_SFTP=1 \
-- 
2.34.1


