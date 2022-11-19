Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D4CC4167B
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:57 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.23561.1668873530618690521
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDC5ir9J;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id 8so5439548qka.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI0FMzDPJkrItFLW0VYeWAHczrEFL8xtpGZw/MuDXu8=;
        b=DDC5ir9JhuBggbjfmm4nhUpY7z8zeDTEfFkvjRs/NfE6z/GoaPIFwuil3QC1fJ21Mg
         0EjiB8ugWb2xF/C0tw1hbH4ZURcyPAbD7Pa+YClngGYY1iellU96b5G5Hscd7OiINUJ1
         P9wP0SGqf0xzy/PDJ47E5sG5CwhUataWzQfa0ZRGyZ+rozRUCB4sz+NF6GrkdyeZ+GHY
         KstEifbUf26a4PjggU68SJx9dY7byt4zivfx+Q1TQ2c+xlOIz7zEh+dtj3ReJIl7mEui
         f8NNahaA+A2vxGOCm+1d0O1l++cw+iE3PkmfHti3iT/f6R8DRsDvPS0GK2y5ul6+sE2A
         aYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fI0FMzDPJkrItFLW0VYeWAHczrEFL8xtpGZw/MuDXu8=;
        b=n985j0bL+S/MWM5vCin8w6ZZ8iPkNlfKfyxpxzygmjJIpdGb8vAKB5R/77NYTRcid7
         fTXTPLTZzyHHTFSZBVIBuOEAP1GKYqQedSpb3J+lEOr5FSNtBAme/6sKdr+QLUf3eB83
         WcOODSr0ktI0ZQzQWIT2NNoVhIF+sfgZP3Stq10xfqREprwSK4SloFv/liDjIOZK0G7j
         oo+6ImcsUISiezGMs0fyqW6N2kRrJhvwnNlBw/Gw8DdKGuWa2usbe3l72m1vpaTr0e2G
         IQLACGCF2jFDjZSfsjXw0yo/KYb6cv6HIBF1EhVT20Nozxlbv9ufqByTFaO1uhHLaRIJ
         MPhQ==
X-Gm-Message-State: ANoB5pkBzPqlPgo3Xk3DV+X1jXiLVnROUmU29biAZX0UYLut3QIA+NwQ
	NHaAcR5vMLYcMKNPxJIZ99g78MWY41YiHw==
X-Google-Smtp-Source: AA0mqf5+h1DQUqUCui4xYt/wMNsyawC3dKSqnhCf5Wr84ePVQS9+3wfuQpDD9OY9EjCg30oFmFaV5A==
X-Received: by 2002:a37:503:0:b0:6fb:c3b3:a937 with SMTP id 3-20020a370503000000b006fbc3b3a937mr58986qkf.34.1668873529229;
        Sat, 19 Nov 2022 07:58:49 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 31/35] =?UTF-8?q?ipmitool:=20fix=20typo=20in=20.bb=20fi?= =?UTF-8?q?le's=20comments,=20using=20=3D=20instead=20of=20=3D=3F?=
Date: Sat, 19 Nov 2022 10:57:55 -0500
Message-Id: <665824e498f814059d0c1915f2e3e286e9098d2f.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99670

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6ebff843cce0a66a7749e048f280bb9cfdca5946)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
index 0a600e23bb..a8d203e599 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.19.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://github.com/ipmitool/ipmitool;protocol=https;branch=master \
 IANA_ENTERPRISE_NUMBERS ?= ""
 
 # Add these via bbappend if this database is needed by the system
-#IANA_ENTERPRISE_NUMBERS ?= "http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
+#IANA_ENTERPRISE_NUMBERS = "http://www.iana.org/assignments/enterprise-numbers;name=iana-enterprise-numbers;downloadfilename=iana-enterprise-numbers"
 #SRC_URI[iana-enterprise-numbers.sha256sum] = "cdd97fc08325667434b805eb589104ae63f7a9eb720ecea73cb55110b383934c"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


