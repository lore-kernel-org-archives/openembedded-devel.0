Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 227C3D35E3D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:56 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.27823.1730831887415422728
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AwPP+dFR;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e2e41bd08bso61044847b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831886; x=1731436686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfwJX6+YASgH6vBUVoCUOYQL2JCS7Y4lRkaONdbaupk=;
        b=AwPP+dFROdpow/vpTIvpPfOrpCowI19KFJfegr0/q+oy9Bo2wpEmum590a1ccFiJ0g
         jaljBebGHyPF9WuVjiCDaBo6BaOigPQNpvu6051lbbtLIcTrSBhPh4x9orPkZ3UKnjKQ
         b4Pqiduyj9mO13SErfCpgEUnpqegdqz27fl5OIy5Zv1X4Xnd7iasVQwDyEYuSFxd94/8
         C03LsMLALW+wcjQwb2OKBbfPy640w0XlIegffday1asAG5vg1CwUa9IzOaxCqkVw7rWo
         0TKkeBbjg3oFJZg9TJ8Zt7ozZM9aSc9Ygvqrx01VuNFi2+p0kiXXycGr/h39CiNqDVHH
         xF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831886; x=1731436686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfwJX6+YASgH6vBUVoCUOYQL2JCS7Y4lRkaONdbaupk=;
        b=eBQ4QA/LV3ONt2asQ4YTPPt4ERcZSqRpviYVBrgAYHZwEkDkE3YQMMrSlxvbt9tzXe
         0w9cJJDH0oSUoSA1GQgkkrNwlZS++X+OgObMu6N31XCdiSbFMjArm2TMaqauMTPaqCv0
         lLwjArWklBxmXyoflJo0MMu4AzW27C33uMjYc/eeQ7ki+SO4T4sc9xkgS0AeGcT4Sy7S
         VTxVgwBaOkTurOlK2BTYLA8sbRRqqYWxrpyBjm+N8k8A/0A/vnWnYtkmLqy4UdQduyy9
         mbWLPwbQZR+8sntUqoNIwAeo643FQF89yxn/wYjaAN7goTEZ04svsY9hjG99b3owc3YT
         RKBw==
X-Gm-Message-State: AOJu0YwX4y6bfcrsrYEPBbIGh+Rm+JcHe+T1qb/OxSlQPTOcjnVQUXcr
	aaymHOxwOF5gL4yz7ybZVx6mCKBxIOkzFtIgi6J8hGUtFowLxo8m7SYnq6ql
X-Google-Smtp-Source: AGHT+IE3L0ThBsn/PYsN2a4Fo0P9ISzMu5BZj2RCBlQrT2wEHkjkiEzEuLPcbgJciByRXICXfCENUQ==
X-Received: by 2002:a05:690c:6111:b0:6e6:1018:64c7 with SMTP id 00721157ae682-6ea64c2f2bfmr173267077b3.41.1730831886163;
        Tue, 05 Nov 2024 10:38:06 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:05 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 011/161] acpitool: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:47 -0500
Message-ID: <20241105183658.34982-13-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113526

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb b/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
index db862c896..2a9ba574e 100644
--- a/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
+++ b/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
@@ -9,7 +9,6 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.
 
 inherit autotools
 
-SRC_URI[md5sum] = "9e4ec55201be0be71ffbc56d38b42b57"
 SRC_URI[sha256sum] = "004fb6cd43102918b6302cf537a2db7ceadda04aef2e0906ddf230f820dad34f"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/acpitool/files/acpitool/"
-- 
2.43.0


