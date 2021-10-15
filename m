Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE1AC433FE
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:27 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.4304.1634338587048251702
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=CUXFXmJ9;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id x27so47361097lfa.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wga6Eb4/BQMTERNzqreriOkaLahksIfPV+lke7Wmu9c=;
        b=CUXFXmJ9w/Neg+wByKw6eiQuOonreuK3j/cfdDLxh1O+4+OqnSIPGUEYagv4oAhHoQ
         Va8oCLMQJCeLXqlvxVXsRRRozP7ZH4tXRFy/gPIxz6yRjx00EbuUBD+cFkY8DHYNJQ3r
         OwbQL41Dfopc8SVD/5VqTGB2kVueZw5EH+JsdaQKCoTBtt5PIuBIgnfnwlaTB0o99STl
         /tRWPgm/B7CcO9DPzDeU+U7koIUttQQuEZFQ98PHgq2lfLH0lV8Fl8Dcl08OuB4eMpya
         u8conAdo6bclXiaiKImLcPnhsgD6f8aSAOMjBpu7l1SkRHWj/ied3BfDsAl3yuPb7Qrq
         HBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wga6Eb4/BQMTERNzqreriOkaLahksIfPV+lke7Wmu9c=;
        b=bi5HCFXp1i9mGNoOj5SHU2xdYFEacn8SYh9JxQ4rZoea8hUaxtGYwRwhC2PylFcH/N
         Uvlu4nQY5//ZlSum9RG4P/56Xva6fkCg3jqHFXgAGEnKTrEebdGjGTupuGCN/xJB+kUE
         g0XmqiY1Az+gbVU5AKNOnG4KbysymQ+G0t5FNfcSUtGQf7851b6WkncgCdiz114CPP4i
         5eplCElbUPkDXcLBiyU2xd1NvJimYcF8PP7xTKGIXY5H6pXrNp7mqein12q8jsPPp2Hj
         HIKLa0IQGwrdIlZFLgV5IA7/TWaBev1Sl/7emG3ba9tgIKMi+4wanRNIZM8tl994wKPr
         Xr8A==
X-Gm-Message-State: AOAM530rRnUFLesFF9f4sxgCkD+VAxKtx2LLlJt6SFBVb74BTObXiuel
	tn93XdF9wzjko9wj5yVbsT5UnGGVz4y1bexI
X-Google-Smtp-Source: 
 ABdhPJwh3WOgyEa3ZHFcJR/tkOos43M46mOlsPJp+5E0mQtW5RASsT2ZXImAwXROVrXrjZ/YisbY2A==
X-Received: by 2002:a05:651c:1541:: with SMTP id
 y1mr16318283ljp.392.1634338585142;
        Fri, 15 Oct 2021 15:56:25 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 c1sm702309ljr.111.2021.10.15.15.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:24 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pulsectl: update to 21.10.4
Date: Sat, 16 Oct 2021 00:56:23 +0200
Message-Id: <20211015225623.4162812-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93357

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pulsectl_21.9.1.bb => python3-pulsectl_21.10.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_21.9.1.bb => python3-pulsectl_21.10.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.9.1.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.10.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_21.9.1.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.10.4.bb
index 5871ee216..051fd251f 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_21.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.10.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "8eef4dbfc97d984e63fd609a3f690d005173ec5342be88d10f67dd507affdf32"
+SRC_URI[sha256sum] = "c9593a54d01dc1ab47ef20464aa7d00433690c86ae840c58f458fe6dedd6b41a"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.25.1


