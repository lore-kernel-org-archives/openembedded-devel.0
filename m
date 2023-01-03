Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9225BC3DA7A
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:10:48 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.55272.1672715438958556914
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GZQghMnI;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so29848303pjd.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 19:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFX7WhEMoYAFG6VINKRrrN+fZYZLwK1Ysnh2DLRFP9o=;
        b=GZQghMnIejGImqmVwRGzYCjKBTgAbSHGNECzYaPoiJdZ902jFtKsu6nnwMJb+mpykt
         oFObsaePsrMS/4L7mb8UGNnbtpdQlp/9PXYR2BXl5Mk01NLoH9CJDQUXbDCtWhL5sjgk
         xkYA9DNZA66DlwFzbLQiiukszRQQ93r2O0gF3BAB+3D0RmO6qGul+8mYuTvPQ1Qaqky7
         LP0pX3H7XvCWDDVeYqpZJelv+/In6Ab+ixkAcqClIslyIc2T1AMOD36+saqLdIazhOPR
         0OF+tJffg955fDjye9JQ6fNi85XgwAasq/YNgAknSG/T2bKfwy8FFfaWJFoml6JJ3xFZ
         nRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFX7WhEMoYAFG6VINKRrrN+fZYZLwK1Ysnh2DLRFP9o=;
        b=T9PIHG9eoPi5VCj6PAFstENbNXCpNuEbs2tl5qO3l1oXHWhRKCW/bXu3If6IaW3rb4
         SsGE8/3Ql+2oMFEihf3dBbKx+uUogR0zOttq3DZxukynlLRqMlvOldhOwxuC01CxfK/s
         6AR5xmfhmWHt18ErjWRl0RIkEC5YG/fj3Skjp+1fQIH02RzE1Pk8U+vzGNS80Gc3wTzY
         8Rp8s69VPsB2VIF5436D40BQ7lajLCopJVAEeF3JHiZqv0hWLljZ+MInJ9b8ZhVHYVKe
         eQ77SEQMKP/+a0GNSnIWVQLiGgka6xJ6rYOpcLS4vbpC9q50W1ktGAYdI3HM3aEw9jQj
         1Qjw==
X-Gm-Message-State: AFqh2krWvp2u6IHXQB/GjBl7sk/2KCdH4qczZYIZCShxj00PrreonDjX
	MVl3oSAWi0YUCbei7vBtb/AcLs60EII=
X-Google-Smtp-Source: AMrXdXvgufZuZwa7oDqDg4qr/f1ZkTO6m04cQWMI+v/kzgvL7uOZn5F38PpvahVwlJdncYctn5BoMQ==
X-Received: by 2002:a17:902:d491:b0:192:ad82:dc98 with SMTP id c17-20020a170902d49100b00192ad82dc98mr19898607plg.34.1672715437922;
        Mon, 02 Jan 2023 19:10:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902c3c400b00172cb8b97a8sm20979084plj.5.2023.01.02.19.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 19:10:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] opensaf: Fix the check for __fsblkcnt64_t size
Date: Mon,  2 Jan 2023 19:10:34 -0800
Message-Id: <20230103031034.3261309-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100344

The size on glibc depends on time_t size which is 64bit on newer
architectures like rv32 while on musl it is indicated by _FILE_OFFSET_BITS
therefore check for both

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-correct-printf-format-for-__fsblkcnt_t.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
index d44ceb0d2e..7e88c498ee 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Use-correct-printf-format-for-__fsblkcnt_t.patch
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  			    ((statsvfs.f_bfree - 1) * statsvfs.f_frsize)) {
  				syslog(
  				    LOG_ERR,
-+#if _FILE_OFFSET_BITS == 64 && __WORDSIZE == 32
++#if (_FILE_OFFSET_BITS == 64 || __TIMESIZE == 64) && __WORDSIZE == 32
 +				    "Insufficient shared memory (%lld) to write the data of size: %" PRId64
 +#else
  				    "Insufficient shared memory (%ld) to write the data of size: %" PRId64
-- 
2.39.0


