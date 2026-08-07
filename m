Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA67AC5AC82
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:10:15 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37555.1786086608068532538
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PHzFGN8s;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487214ad2bso4724480b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 00:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786086607; x=1786691407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gTkEsutcuk6xOpjO65O1zulxMQvoQqPFa1M0opi7vg=;
        b=PHzFGN8stDjMEAzlb3MiySeauUwMv7n4bsu+NFVv9qOxd2jNixnbU6qxag0ioxHecZ
         RxNwyrXKSm09jvZMgyFkCL4LwCxW89bzRJuhyix9FSExW840YllPMT5k0/7nJsftpaP/
         e27xoPe2IWIMI8/MhNZtXlnwIScKvCDKA6SAZkQR6Y9Br0EWyPodxZUCoU92f7w0W2eY
         adLpHD9dPp5l51kmlOFf47F8Y66XDn2pSBM5g0bldsWMq9Ku7nx7/t3tTjyQR0s0Jqcx
         PNSmJpkFtx/z8PZBYna3mPTGTjQZSDqhntFhCmwWdphlDzBO5n7mr7CDhipfkNsjnMiK
         Huag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786086607; x=1786691407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gTkEsutcuk6xOpjO65O1zulxMQvoQqPFa1M0opi7vg=;
        b=ei/+4MtvnV08yPWDEizoPwaJ8o+4Cn61R5nVMVo2DRRMKa92QDmKobP+rt3QhT1Ftf
         6TxwZAHonDaUneStiy9UqpZaNN7ioakzdzkDFEi3BDpxNb5kLplEk1FPkA2vtLrIojd0
         JZ+p4VPd+60LNk0CJjSsW8wcC5Ku6FNYrWo3MZ3XJ1BLzY45AtH1Bi4/8ub6vl8ziwbZ
         X/hPbdvZsstBS0E99tFm4Tm166j9cgVhvQkCeUCwpxl1uReL3E4qBO5lbOmhH+lbFcDn
         LVwvEhGquqhi3htal4X67ryVOQsMJ4irn7dNKoXHYhdrRVpwUOZDs65h1erGQ1juGBPW
         b31w==
X-Gm-Message-State: AOJu0YwpFJbeyeV6CpQma7tRszM9vbwJh8exXfrdwdIo1Q8qQnR+3JWn
	Tlt00c52rgLjEX5k/peRh96cwOV3UkoE749udkK6K8A3mjCdI0JFmIzMnxW3LHY4
X-Gm-Gg: AR+sD10kx90W5/Zq8QUasN7N1lgef4+jSlsZj3j9Ee47CpIPaCnODeG/e33EmHu9zmb
	ZC9VAOeVa4L6rOytwp2DdJWV1OCPyB+z+mIO0TZURWdEfYBIkxHfJER1r8MFBa60MQeg/C2pKtG
	T4So1PeoKr/I3wQHjFLkpZyYlYiOr8PK+aBgt1jl/AASRtEdbtT/+2JY2ZHsyOUwmS6mSOkMMKB
	h+TATxpCoB2bUEIwyvNkrktaIxD7tWH99nlr7TcgDIKXgOUUQQAMFTCHGxC8RO4JemRbHAVuKG1
	7aD5QWN2x+4EKnLlCQVvgfWEUNqpdgHucOiY4+ABtoa/SyVVIj7IYKrQYEviN44fbNIzLw0hCTP
	kvbTMViul6VDQNH+9B2rpJEXb4w9ba2Hch7G+AmisnefBh64JcCHvnjHRhvOy8SZwPLb5x+RMoY
	g26pH0gRvNI4ExFCVdxnW00/QgB41YzPkM77WEQYGU/Hxa3KGycwoB5IYsChLOahrRcl9P85pT9
	g==
X-Received: by 2002:a05:6a00:3310:b0:848:5540:2377 with SMTP id d2e1a72fcca58-84f5dfbad07mr1961553b3a.17.1786086607487;
        Fri, 07 Aug 2026 00:10:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e99asm520440b3a.33.2026.08.07.00.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:10:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/6] redis: upgrade 6.2.21 -> 6.2.23
Date: Fri,  7 Aug 2026 19:09:47 +1200
Message-ID: <20260807070953.2275518-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
References: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 07:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128859

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/redis/redis/releases/tag/6.2.22
https://github.com/redis/redis/releases/tag/6.2.23

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.21.bb => redis_6.2.23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.21.bb => redis_6.2.23.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.23.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_6.2.21.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.23.bb
index c47f51692d..8aad4ef46b 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.23.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2025-27151.patch \
            "
 
-SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e9b6d5f"
+SRC_URI[sha256sum] = "f06cffd69f4016986508017469cf64c16e25b1282927ea9360e7c2d1839eb8e7"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 

