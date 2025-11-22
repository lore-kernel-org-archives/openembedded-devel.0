Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BC2CFC518
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 00:12:56 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.443.1763770368369949518
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 16:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pACNUdi5;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso24455685e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 16:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763770366; x=1764375166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rfh1FlwJApVet5K4n2pPjoz/vZulBtAofBSj19BWPpo=;
        b=pACNUdi51wJZFOPy0vFYUHs9dLcjdzDFyhkjqaHaLlTBYfgQ+zCkb+OGucj75n73MF
         0DTj+8osg/pxxpmUpkMgjunCOhSjPNZmVRX/VUq1zgVAzwF91rnobiXB84x9Or0A/oA4
         OuQpiVV+Q89uIFh0qtSoG2m28QVmz2zRCDM7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763770366; x=1764375166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rfh1FlwJApVet5K4n2pPjoz/vZulBtAofBSj19BWPpo=;
        b=nYXzihJIor754q4ueWIwJZpllCv366FRf5R4kkN6PgrvVp+fWVZsrUK2jTGcSR8qbq
         8SWeKkcUbvWB6Oy1dwuTC+VhqVZGRlsxEpaHY1dRFBVGWuIbZ0aIcpLJdfVS2a4jrhRA
         HUahtDn0UQdKAK8GrYie1NBOkrxQxV+q5Ea+SgbDne054yCFUq/Wcf5lnjJ/b5Kxmes3
         erz+kyLEFkZ41r2dtL0/w6M7dJuAMwBgLJnbkaG++qn2/hjxht0qW+qsKSrNPwJLowWA
         fBKtZLddoacXgjaCXQIdchNJH9DhwDGWVs8tBZ9u9WydRvkSMaHFfRthUP4sNOoWTy+M
         1znw==
X-Gm-Message-State: AOJu0YwefNgC2VYoB/AHrB8zxYc9LgcGyu+VZmXi1AtChnEUgJ+rsZXH
	/4SjwuR1Bsj1mL/w6bYlOWTGZDl6bzMLo5QH03xxNPoWk90dMKbPcliIwe04PkUvGEpJGbDtwt1
	ibrw+A8U=
X-Gm-Gg: ASbGnctSyLqMV52mVtt4qAxAtpMFSd8wXGQLYTKv+tE9F533st1JiTFEcZq6Lu4dDid
	CONYmuHQUYMxE2eYbeofa5FMPhitbaBObTUJRJTMeydEyHkXTHOLEUTdfRUjXB/VMvZ4pgYGBbk
	cS/CZJT2mpi8ww8//J4iesXAqrFLwZybXCmAqYvwWRpl00qd5SFFBP0KlcBj1E9x3k1P6us9ti6
	SN3qfZthMiESLPKebg9T/5v2f4Lpfq4Q6dhPym1Cnv+YlrntQeP2U0AXJlkGtW05cVPLRgU/nU4
	rTRhA8WmzqQ1ze6jNSMLSbvoYhwqYEKF2nRpVCmLct4yyOryfK3/zeSYv8aPbFuafom1G+chlcE
	WCSs8QluhAhH4u8Vrk+sNMUT99BmKTCf0SQbyeyDYNlJqN9Hj/AtIHHSb8O/+OSWPZzvxo7mdp8
	DCMjAUbSS0qV8D5/4i3s3yEG4qfYPYD4lYq9mT+Qm4qbdlqXRqKE1REhzyAw6dSyvhQUB0TcBzp
	LibccmLRYX/PIWD8AjbMA==
X-Google-Smtp-Source: AGHT+IHTnybJhJOpgHi/1O0lXqkYkAkpCwwgmkEm/HRkYe3gIYU7HEhA2WF31lPXfJX8Zd40MnWRWg==
X-Received: by 2002:a05:600c:1d1d:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-477c01ff5bbmr50136915e9.30.1763770366344;
        Fri, 21 Nov 2025 16:12:46 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dcbca9sm95018525e9.6.2025.11.21.16.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 16:12:46 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-icontract: add BBCLASSEXTEND nativesdk
Date: Sat, 22 Nov 2025 01:12:25 +0100
Message-Id: <20251122001227.3538675-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122001227.3538675-1-yoann.congal@smile.fr>
References: <20251122001227.3538675-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 00:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121965

From: Yoann Congal <yoann.congal@smile.fr>

nativesdk-python3-icontract is needed for the dependency tree :
`-> nativesdk-python3-pylddwrap
    `-> nativesdk-python3-checksec-py

Cc: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb b/meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb
index b906be4ac2..355f1fd88b 100644
--- a/meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icontract_2.7.2.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "281ec16f1d09bbcca7a4227e82cd10b4d5fb291f638df77c29b7acf493
 
 RDEPENDS:${PN} += "python3-asttokens"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"

