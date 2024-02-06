Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4E7BC48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 13:10:16 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.20998.1707225009334663192
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 05:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/y5Q5SK;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6d5267cceso5054362276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 05:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707225008; x=1707829808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tab3iNJilhKIoa9yaXlJ+R5ZQKrYYnEow4beCnORyOY=;
        b=f/y5Q5SK7QFdFpfngoSRB0h0cFiVZ6RQOutam8SisrIpdiDQyInJeoB8DdBR/tt38G
         Vw3mtH5nBZL7bVrvhjXCGB+f7bJxrri/kWNXWzQc3UOj0BIGw0ZOfCabzD5DbytYaXe/
         h0uZd2vTQrKS6xNouvIYfjiGz/d0AUKDTzcWy/S1O+RxAShe/zd6v3gFJZpoEmVhqRD5
         3ooHNXMFYOp/yj04uEVM1nc73Ws3spJBGFjxRRcDFg1BcslEus5+8dtGwZRQuf3qE66/
         Y3P0h8WGlzGKwKzaA3qdXd1TDg7bj2Gg1i8ukHYg4VTG91YRaL/ag1d+sRZlArixXt9l
         ycMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707225008; x=1707829808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tab3iNJilhKIoa9yaXlJ+R5ZQKrYYnEow4beCnORyOY=;
        b=hihp3xQE9HJE9sZqgosgXpti7LkgBucSrt26XPCspVxx3nZR0u1MTkCb+mGoDb7dLV
         7WawhWolbg4RvVgR+9xB29rrpKNT0WH7x/REp2kYrVUuyFzmestKUpz7VbP7YMkYUE6g
         jZwPQsYYJhHyykyYCKigkQJePZyRAP6vkUknv7juO6HlQdSHr5N0zGdiMTzGrvBDIsV+
         Xn9I61zH3AnqJm5TguObiqPWp5t1VcGR93B+OhmwdF5t1teACKYti/pDc171pTPn8Ilf
         Of4KE+yaenWPeTxUqLF2bErRQP2GYKiFFWCRG97vT3gmw3Vq5FO9N3MSS3Vy+bSogNI6
         WMaA==
X-Gm-Message-State: AOJu0Yy7wvAZXkwUKj5X2+Cv3RPtHVMre47AFffRFaUm8VOtUJ24VL2C
	hbknrXH46tiqImDRsJ+zVvt9f4ij4Qf4Xp5oUgFrmp5lgZWA54NlJ9bbhYpE
X-Google-Smtp-Source: AGHT+IEFvhVCfMRO196GaAzoUX1p9xxxIQ3jMa182DPeanGYr36asF54cPe98Sg1QAkIfEnskdgdrw==
X-Received: by 2002:a05:6902:566:b0:dc6:421a:3024 with SMTP id a6-20020a056902056600b00dc6421a3024mr1503941ybt.43.1707225008450;
        Tue, 06 Feb 2024 05:10:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWDiubIVrOiAp0PdrcVhe5ptWF59zYglws7fVvjCAAASWyGwJKeM+VmeazoJ7XGBfvVK3w/A341n7vdleMnmayP9cD3tT9K
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u15-20020a25094f000000b00dbdbcb37e81sm473373ybm.31.2024.02.06.05.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 05:10:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Angelo.Ribeiro@criticaltechworks.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] flatcc: drop 'r' from gitr and ${SRCPV}
Date: Tue,  6 Feb 2024 14:10:02 +0100
Message-ID: <20240206131002.515330-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 13:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108626

* +git is preferred over +gitr since 2012:
  https://lists.openembedded.org/g/openembedded-core/topic/72154716#16837
  some recipes still use +gitr, because updating it would cause PV going backwards
  but this recipe was added just recently so adjust that

* Drop SRCPV similarly like oe-core did in:
  https://git.openembedded.org/openembedded-core/commit/?h=nanbield&id=843f82a246a535c353e08072f252d1dc78217872

* SRCPV is deferred now from PV to PKGV since:
  https://git.openembedded.org/openembedded-core/commit/?h=nanbield&id=a8e7b0f932b9ea69b3a218fca18041676c65aba0

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
index ed26299901..2530dac526 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
@@ -6,7 +6,7 @@ SECTION = "devel/lib"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3d8fb7158bf7e2600ba3191428dc4ef"
 
-PV = "0.6.2+gitr${SRCPV}"
+PV = "0.6.2+git"
 
 SRC_URI = " \
            git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master \
-- 
2.43.0


