Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077E0CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 04:40:31 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.359.1791866420511910827
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 21:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EVa31YO5;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so21597a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866420; x=1792471220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5SQBJTrK6/1j3bU8KsixfJhb7T+dkT8VhDHmqHBiIs=;
        b=EVa31YO5o5sMdZSTL6ha6KFREqsyfLmGZjOUt8hXYX33mBwK27TFR0YSXlAwSOECjL
         +lG1/wiDUeRrraSL/M+sVPwJUe40TBIO3P22OALXfMPBt/Cmvym7bLl6voOFLnbljHwv
         u+XZ2Z7jO3o9eADbTFGYSlFcvVmtC8UwzMxpNUpGraVZR8wqP7Yf1QF240IKKEQnofhj
         6e+layrQnkIT4USKFi4EsMPV77vlBlbeP6fuvI0Xm93+kEX/qX9Jb25QLz9+WAgR+K9T
         BmiCwGMeiBeRZWoo9XXaKVxTswGC9bfxDtjjIGgz4KsL/1iNbvF9rZQ2QZGG8FANqGVq
         q0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866420; x=1792471220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5SQBJTrK6/1j3bU8KsixfJhb7T+dkT8VhDHmqHBiIs=;
        b=l2vhIUj5yCQaAoexkwmg0xztF8lpEfWuXp2O9XMTxo4rIXuQS23CYg+8Nf07xwaSCW
         stwAG1+BAQ83iUcV17T0Enc66fPmY+nkZB/RGIOk6g93qg6pEZOHhN3+8RFt1VsVQSMr
         GeoKg6Xfx25zGcZCj1K/uSP8JnfmdwPG2HnQ36i1KRPHGksSf45RC7XEh4eFv4/1LnUF
         ngbkmz1MYSO8WORlRi84MH9WODxtqUnTuJTlN81uA7w4PbJxdsGzSsiWOH1pJeszt+Ls
         twJGIlnNV2MfLDBkAaDqDFumdBXFmTiTqLlYcW2gxhttefIi01WyYEOvk6Jf7+NxIcjC
         WnnA==
X-Gm-Message-State: AFq9FYJQl2i8Nk/CSdUXgSMzYfc47eCxnvzHcgijgpfAOTy6ja7vhLuP
	itCTOAW5gtgp9NBxYqL2lfQ4FbZoLpvjN0I8m7LeOGXqjdZ+xb7p5bvjbgRo1A==
X-Gm-Gg: AYBFou1bzvc3wEd4oIFnZkzQETwYe8S9+7b+y2HsD1RaqaNI3iqX7rB0zfLoZPBvSTU
	LMSN3tYVj0QyviudnEaiv6IFQS3IIKa52aREcn0nsCPc4mH3jMepHdj2XLhH/tEftk0xQhdWk5D
	94JiU2M69UUF+AfmoeDWNbFSQReSpXQGfcHJZe0HnVDHNzWgo0q6WEqa8+dqLxzXuSCvbMqNc+p
	uSMTfDcb5Zrh9J/xBjeuxMhaG8YuddX1b3jdLj1ZCq77Fw1t7cUvdeHZJVaDVmgE5gb3T29JLeD
	TBTzeKngFmBgdInMmzYX0yLJeFBdWSoDW7cbBS/78kqnSiFuozoUXbotbbyLylXy7e9P5OnaENE
	Op7B/ZYgj09f0mH1GIpPpArDLboj2YiPvO11Sj4ih7+an4rdthzRtmMGkLCQdVfPGaYvLsU8GAQ
	TlAygIu4MMM9dclPQSFnOUIQkmEXBm86JbqXLmTN79um1Ux/fqUtCGgOqKJOtlqG39iQS7/dSpW
	/YJutDYerCwhHgtbPvaJpxnf6E9Ms64pE83hlc=
X-Received: by 2002:a17:90b:224c:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3ab3a0ef48emr8723288a91.0.1791866419626;
        Mon, 12 Oct 2026 21:40:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm11672757a91.1.2026.10.12.21.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:40:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 1/16] openvpn: upgrade 2.7.7 -> 2.7.8
Date: Tue, 13 Oct 2026 17:39:51 +1300
Message-ID: <20261013044006.834868-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 04:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130815

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/OpenVPN/openvpn/releases/tag/v2.7.8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../openvpn/{openvpn_2.7.7.bb => openvpn_2.7.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.7.7.bb => openvpn_2.7.8.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.8.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.7.8.bb
index 604162a7f2..6040935d4a 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/OpenVPN/openvpn/releases/download/v${PV}/${BP}.tar
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463"
+SRC_URI[sha256sum] = "c070d1d2440b5a6fca6c2c68645c98cd492116ac36ef4f0946177115532c8e36"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 

