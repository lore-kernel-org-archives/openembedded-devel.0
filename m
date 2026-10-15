Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0030CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:16 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33231.1792042988964075605
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YCPc5XNx;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so28512105ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792042988; x=1792647788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NjzE/v3jxnPok3/kOyd0v7jWN1eTGZHUVo7vK+faoa0=;
        b=YCPc5XNxQSSZlW7HTjAl2RjQ6FPYuxjNJ5p/vVuJwKs7EbeQl7jcFZekXKTcfkD0pO
         aN7SwYJsqH5SPWecwRZG2ZVr6U1ooS68gqMD0ncgktKjPwxjZwPnehDoYN3gFP1SPmFn
         HVro8Ivny7C5N/v/VD9xc2CD73U1fp8Y1K6OBdJvCdmMrkq8hMVBWsqj/c1l95Lyu2UZ
         NXmLrI69M1W0h1XWSzKG+dGZs9NqDLwcSwQDHNn4VyjI/HVX7+qSitgKMRdmSCg3ku9m
         6PgGOtlYyQNp41VirsladmQS/ceBsyu4sx7ZW8OsMDMnmy/OWzU+47mvOda7sGdoRMFx
         aArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792042988; x=1792647788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NjzE/v3jxnPok3/kOyd0v7jWN1eTGZHUVo7vK+faoa0=;
        b=PH4XrIOp64FwVolbda2lGaWTx1qolJpSPi4oT9Mq6UmZotuWCke/ONhYnAQ7wjzwMC
         7SRht2lV3sSUUS/e1zdK8faiXkk3yIaaMdDfDwmf6FDDQn21WUH8enC5517Xkr0xw80W
         KrsAnlTaEaq+d3sPjKlGQbVCEg4q2DiYWZCYnUBArrz/9iBgF3HItUv3XWP83o4Ao+5k
         JysVkBh6DBc+giYbhFC7J9w1E1X7/M0oYWTz/phEVXyqWSQZNzzb/e9b4R4y0t/B0X+n
         6U4Vf9QsZWj9n7uY9y5HT8s5BhwmXUOZ0o/kvzQiDOIJrvVTe1VxIdjfnv0pw4k47uS2
         2TYw==
X-Gm-Message-State: AFq9FYJYeJ1MSDDJkFAqA0ze0xbCkPaUrXaRDXF2ovgEtyIkimNNKkUs
	tEZ1wnloxYrbWmRQTYVpMZLvjb0V9SbBTXvKXN/9m1K10T3LL/81bTw5JWQk6w==
X-Gm-Gg: AYBFou2GrbNrCjK8lOo0YBEC9JijKKYrnDPZkALTGJPE5EBAy5iyE+0ZHEyRCsagQOU
	GjkXp1tVm7xJwqlnm5UDJjfemUfUrmvrBSMX8LVLTE7LqhSJBjtNtU/jtrnFI+CyOJH1mTYqtv/
	Z967utL9t4r02TKDbz98LZEpLzbxy6eGrvaBuSidpI/K6ppUqWYN3Ro3Jw8L4rcEzAY9eBT195g
	MwJ/LXi50zoB8qFwJpZ82kzOS3w4xhw83ospzMsuZI5HKYqJ6Ia8d4J4wDhJBR7ZAfzMS80bshy
	jTiaih1hlTyI3oULWJ8sFa+P26fajHfChWyjv6KVONJ3Gnz7tZppzbVrpFlULVX4zrN6r1qZGI3
	tNB1Q2pQV/hvGPPGRMdv4m0M63OrT/RaquC3NS0rJmE4hare8r9ZzI9I/QOrAS7pef2RgG7ponB
	KwMChO7mUwd6YASh5JA5ODSrylApdB27RKBpZQfU15MXr4Ii7HC5b4CE+oHZ79eUtkls5uVBw+Q
	T+LVpzf7CXgfgkBXiuwWyE=
X-Received: by 2002:a17:903:f86:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2e951750309mr22820545ad.1.1792042988283;
        Wed, 14 Oct 2026 22:43:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 10/82] capnproto: ignore CVE-2026-59704
Date: Thu, 15 Oct 2026 18:40:58 +1300
Message-ID: <110844e1f06cd8651ead1cd43ab193300e03e518.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130930

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59704

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
index 9909afb0e9..1149913c2b 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
@@ -41,3 +41,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2026-32239] = "fixed-version: fixed in 1.4.0"
 CVE_STATUS[CVE-2026-32240] = "fixed-version: fixed in 1.4.0"
+CVE_STATUS[CVE-2026-59704] = "cpe-incorrect: this vulnerability is for CapSoftware Cap"

