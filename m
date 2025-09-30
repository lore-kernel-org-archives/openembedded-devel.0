Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C44CCA46F
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:09 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.21060.1759223942434414286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Aol0S12Y;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-42d7ef9a402so455015ab.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223941; x=1759828741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtn94ZohQBQYZnAStAIvoBMmcwINVUNafjsPI7Y2gH8=;
        b=Aol0S12Y+5fOKLH5eT5/f3lKJPD78iEfHRvdfgntL3By3M4F+OtamWRfvbaPb3JB1E
         Er8A2oSn1T50zfutrwZohIo8G6umxLN4VJEnwWrMInS9yUXVuQexqpOebuUkV6WsEpb8
         Bj2lr1aCDdWC6JkEhbKzCeOE6tmEpR6uAL4qrRtuAsB5hi7VnK4Tf7uYVtJzKa3KpLU3
         pEpFD6za4CbCAmSO9ibvX/iC8fBto9yS5HGhnZa2aQuiPeH2StsSMG7yC7f0ABgzMla9
         4YE14eG9a1/GEctrUtOS5i6yTR9gpbhF+/CrxQ3OuukVMTJb5wKsFAKPF3GGOIf1Kh/9
         I14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223941; x=1759828741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtn94ZohQBQYZnAStAIvoBMmcwINVUNafjsPI7Y2gH8=;
        b=s323162rOa7+oC4azMtF8/zkbTnfrUXsuooxVMdB7+Yd2u31aegCFPIzv6uYrDoEIg
         D7ztOaDGmeNkP3BkpD5HY8MTVdI3i7VeKKmxAxLs8G93Xpf+cnClaGVMVJdr6D5WfuvO
         OaENZCPI6Vp3JXZP1KBv+JXXg9CplCtivQubYTCdK8iIZmhUU5nszBNBSDSVIu3y/3yg
         k4/6jb9mff3hj3YNNA5IoEZnD9rcHKlS4YMZNyQ8G9g7Wn8keQPFhh+eBKVO4XqBBuFB
         y5tdY3fRObBbFunibTbYMDuas1YXK0NooZv331OQMG80qYtlqxteCRD5vVjkoBA6mKM2
         /M7w==
X-Gm-Message-State: AOJu0YyXeaVx32+sMNt8WZ6MaX3ADieMMqzDCnCmHTFOR4LxF0eX7Ief
	Ui/2QYhu0/nOZZFmB7o97ZDQY8sPVUHEqq7WO59kQucHlhAyDsTyUUwhLFS1WjwL
X-Gm-Gg: ASbGncuRSIcpIBGuhy6I6gwsJJeOe5BeOsBbCsVOZqAeZMzYlrGQMECIcnm4m7mx2z/
	1qLNDjijFTnb/BIUZgkAot4BgirBICmEeSuVh691D2hIy0Urtpj9G+n55Ib5NR3+c6pJ1OphLqk
	T6NLLsSXLRmV1VBDwV9F3A38jVIRWZKcPMrvnDroq+xiBFGmcEx/jlyEf1XXRzOiSax+fnUCBvs
	JzGUkzI9Vz7Ews0+036NdDkjIH0Esph8EUbK0cbEGqIRxVCCoFJLqlEOg7rhCj733NniCOk4OLi
	9jnV4XtJSy8ODWM2PQ4KxYMZ6pIF17NtVbuP5EDO+DTA6jkpkYc9g9RHDIMSzk4oLlikYWuPudO
	7i5n1Z+o/B1R+GFfglMM4QZT4eJCsIAKDiJY9q3LsVP/qZW9PaAncJGxwk7eu9Ncg8EM90teRUR
	a9IGYe6fA9Qg==
X-Google-Smtp-Source: AGHT+IHO5BZfdkh/xmfFQOd1Hq7gxgZCU0VIZNjWq1sKnynMvpJx1/czeMQidP0Ea+QJoiTzI0kwkw==
X-Received: by 2002:a05:6e02:219b:b0:425:849c:52fa with SMTP id e9e14a558f8ab-42d1113ba2bmr46074645ab.15.1759223941305;
        Tue, 30 Sep 2025 02:19:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:00 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 05/22] parallel: upgrade 20250622 -> 20250722
Date: Tue, 30 Sep 2025 22:18:24 +1300
Message-ID: <20250930091841.1693131-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120057

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 482318ca4103e5b45ae03de593660046e091143b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20250622.bb => parallel_20250722.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250622.bb => parallel_20250722.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250622.bb b/meta-oe/recipes-extended/parallel/parallel_20250722.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250622.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250722.bb
index 739263fe30..fc7376ce56 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250622.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250722.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "69f578cf11f1b124ba3c2b673a16641debe63aeb3d2ac4cec5ad65f8a53d489b"
+SRC_URI[sha256sum] = "91a81ff4129cdf5ad3c3c45ec033e75f2bbea5447f4b6813a0d8cfe8e5c7843b"
 
 inherit autotools bash-completion
 

