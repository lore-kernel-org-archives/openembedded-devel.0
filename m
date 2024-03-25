Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1695C54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 13:27:31 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.51958.1711373243405540636
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 06:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/oHTfIH;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: jhatnedap@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-36867dfe940so14668005ab.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711373242; x=1711978042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nzPRjsike27lDu0vFuampYo58biMgU5RkbdEBmPPGKQ=;
        b=M/oHTfIHv5upsemM4pIbq3vb4clROB7hHBlvd6B+vioY+2skFzSwvXkWZVZ6Bbgj5L
         eUMfEsxpQwVYXy7btWtz8SAPiKBoufkC9RX4ZC0C/f5MVoZ2KN6DMczz5CALFTj6TDEc
         P/tGZNT+hwNyUCCKdJX29fPehLEeFc0sk0mU4yDSAviMf97Q5VFk9pVmqdQ1SBN8yfKL
         huXZ3GsszfoOw99g0rys4uQfa70vnyEcnK8jjIGrvDWD9NXTCBOQobCbaa2Jpo9TekA7
         0hwF4EljzQSd/uNCfDFb6do8zzDoqgE8lZ0njxNLOitVc0GS9HzHhr7LFpKBlalEvjTh
         pBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711373242; x=1711978042;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nzPRjsike27lDu0vFuampYo58biMgU5RkbdEBmPPGKQ=;
        b=tQHTHTP1tfl2xT6ljT/LCyRrbyqAjFAWAUGJsdHEnqTd4ETQKOI8raA+Tm+lHJgQ+V
         HaqvvaRwpmLP0T1KbpnzIbp7PBeQdC4zxjeeEdmCcEQYE0P54kCRBM39CSB3i1XlT+hy
         b/jIPmcVQnb+cPp74zwENg9sFLIvzPxmlNkRKyW+8VkkaQapc2Ekf4H06RDgwI8ftg6l
         OaOQu+Y3D2FjJETzZbUZGoAG4CycCF/I8v4pNCd+ZuN+NjaZdNhkVdtHcFIFN/uF8xG7
         n5pm9KiuKzEPiqB0FohpQmiSmoRfQ5q/ltYgmE7X8ucGgwAKbXsapTsf1cOv1Mre0Ngl
         oWRA==
X-Gm-Message-State: AOJu0YyElqCiLO1PEFd69CSDD0oeAYH7lf4OzFO0JK8+6n1EENG/DbrW
	48LyYdFS/8SLLFLdxCKYqhYSzRMiu0xTsOy17ePAifI25JbzDxjGAXih6Jm9
X-Google-Smtp-Source: AGHT+IGIqjGuFr9I/zFaFK1bLQIxm9PMfIoK3zHvFlhS3FQ7tDs4UwSt+jJiTXDEzRFNnCDfQ57Vdw==
X-Received: by 2002:a92:c84d:0:b0:368:80b8:36f6 with SMTP id b13-20020a92c84d000000b0036880b836f6mr6466216ilq.18.1711373242618;
        Mon, 25 Mar 2024 06:27:22 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id q4-20020a056e02106400b0036862333c77sm2390379ilj.33.2024.03.25.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 06:27:22 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 4/7] xalan-j: Update SRC_URI
Date: Mon, 25 Mar 2024 14:25:59 +0100
Message-ID: <20240325132603.2477-4-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240325132603.2477-1-jermain.horsman@nedap.com>
References: <20240325132603.2477-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 13:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109582

From: Jermain Horsman <jermain.horsman@nedap.com>

Archive layout seems to have changed.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-core/xalan-j/xalan-j_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/xalan-j/xalan-j_2.7.1.bb b/recipes-core/xalan-j/xalan-j_2.7.1.bb
index 5e72a34..d09f9f9 100644
--- a/recipes-core/xalan-j/xalan-j_2.7.1.bb
+++ b/recipes-core/xalan-j/xalan-j_2.7.1.bb
@@ -12,7 +12,7 @@ PR = "r2"
 DEPENDS = "xerces-j regexp jlex cup jaxp1.3 bcel"
 
 SRC_URI = "\
-	http://archive.apache.org/dist/xml/${BPN}/${BPN}_2_7_1-src.tar.gz;name=archive \
+	https://archive.apache.org/dist/xml/${BPN}/source/${BPN}_2_7_1-src.tar.gz;name=archive \
 	https://dlcdn.apache.org/commons/bsf/source/bsf-src-2.4.0.tar.gz;name=bsf \
 	"
 
-- 
2.43.0.windows.1


