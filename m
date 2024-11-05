Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCB1D33A49
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.27738.1730831905762462885
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDcLcsVF;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ea15a72087so46486877b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831905; x=1731436705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=op+KwOhzOO3pJEtEBEasYWH+/bHFfp2sRYncP7v+0g0=;
        b=EDcLcsVFU6kWUzCLZJ7EWgoCs+k4+teph5gagySdKXx7IWMqmqWQ0L9v+w4KH8JzT6
         TASrKO/TwBJL6rG9ItRh2m69nd9TrMWk5Oara7LvWOJi4u+vfFnJobZuIXIgmVNZSRiH
         fh6wx+MluWX55DtkDTd0c/1s3DhNe9q7ZeoO6VTu9AtOWBRqUzqsqB1dns7fKr43iB99
         ohrARtED1kpXoJXeuc3B4bK3etYYKRhhp368nLoZH/8UODXtg01l11PqeZP4mdV0bfPB
         x9YS/S0EzwOaOrZUbJLxyXdIKWjXrTiA3Yzs2dTF2HEPHgNf0/lzEBPi+txKaqgm9aBw
         ZMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831905; x=1731436705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op+KwOhzOO3pJEtEBEasYWH+/bHFfp2sRYncP7v+0g0=;
        b=h6wC49nL0Nk95k0bFzFDT1scf5SbuA+7zkHmmHixYEcjqQSrZLAXTZIZN1/yGWgYLp
         9KDAgoaoeimH6DvKrlWBYP6MrSv7fl0o5ScxxFQ/BNVB7o2Fjo4dl6G/bZ7rjai+NMQS
         3qlI0pIUkPh7bmbHu4mSVtg8Jupn6HGZ0ph5X2lXdFJILidBVBfACy7fo8y7X4oZYkCf
         farrwdavvOV2Spab7ARmzezGOH+GGfDkRMHKUc28EN73ruAbn7K4V9roBNiWtdhjIInz
         i+ov9oIvBy7RbfqcAnianJt1bQ3UOncsQxwPzlioPU3risflORAO3HHqKpU/p2Sk4+ht
         V57A==
X-Gm-Message-State: AOJu0YzGoxjIMeJ/nLxDjmrQEZW54i9IPbynT/fb+53jmEDYUnmup9fT
	/+/TwZEIK9Jdh7OJuXpIJO7ryZIC/Jyt/7EiLzqzcHAVosMS98YRCdVQe6iz
X-Google-Smtp-Source: AGHT+IFc5iUmldM45rVKpqmfVxOgoycGWyDrsQtevF5907ykSZP9PJbQ58Sl+j2CGP899Afwsaur6Q==
X-Received: by 2002:a05:690c:6711:b0:6dd:e837:3596 with SMTP id 00721157ae682-6ea52360e93mr210280287b3.14.1730831904464;
        Tue, 05 Nov 2024 10:38:24 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:24 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 034/161] msr-tools: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:10 -0500
Message-ID: <20241105183658.34982-36-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113549

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
index 05220c249..51fb98ccc 100644
--- a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
+++ b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=11;md5=678a3928c85604242
 SECTION = "devel"
 
 SRC_URI = "https://01.org/sites/default/files/downloads/msr-tools/msr-tools-${PV}.zip"
-SRC_URI[md5sum] = "67d18527f64fd707c9b7a79f13d19fd5"
 SRC_URI[sha256sum] = "f9457b5340f5f274da4239a461f0db6b514142b40461559d9c6150f05aab1d1e"
 
 S = "${WORKDIR}/msr-tools-master"
-- 
2.43.0


