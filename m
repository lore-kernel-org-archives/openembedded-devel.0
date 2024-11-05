Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAB2D40D19
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.30919.1730840351618711285
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hSawZqHi;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea07d119b7so48592227b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840350; x=1731445150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCbjHQ+6sywwR42zdFRrK34IMZDGlUh1oFeMvtmeBDA=;
        b=hSawZqHi8+0c4O5hZfr171ZRCeU2f9730+m3K7cFcJ2n0Z9VwXrYDYyAcM4lhUarHm
         Q1Q4kvnGTkXZ2ANMwrYgXKGed+YBTiM9s/JudVz57HBYv9yp7fwTxB2RiXLWvNORrSVy
         Ci3b6grFC/tSrhU4nmCpyTOGOQXUNZJCpGNzvVMWgku2hXybLZVzI6N/aO0c5R96wSeY
         bPU/XUk82btQ84U/Lzi80P2FEnZS9T/cMTZRkXEK0AWdqkD59qgRQekp6qfVxZ1V/BY6
         O/tIJ5XbiHG7FYiyg+6qofIOGbydAVUBP5J/1RbEbZcSCtUI8dpZcx0vyM6MzvSDNMV8
         mVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840350; x=1731445150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCbjHQ+6sywwR42zdFRrK34IMZDGlUh1oFeMvtmeBDA=;
        b=q5ubxtjVF8ug/IGQfZX6+quE9l1TxxH82iH96Kq1BDi53di1SRmFpKHOkmf2tzpTq8
         35kQj+JCiTwOVZcDf1uuDsFkloAf9oaWgxZU7HzLmgCfrZllnz2InS2LPMbKgusMmWWh
         cANEi5dRezv3n33ePvp63x7gz5D4Lj1Efgvon3lrVF3bSloL+4fKa1rQ5BCzYo4NRqnM
         j6H+xNK51bRmMyxX4SioC0cVSimxWTBtywqNrK7+sm+b63hoyBOLMYw+Xawm+skLpiHu
         TEkO9TT/yixAsHq2sC7c0BeQHTKMM1bQMFZao1ITOePYo8tyUUHnnDv4v6cbrvx1Fxar
         72Lg==
X-Gm-Message-State: AOJu0Yxq2Yi1DAzLidjof3iyeoMv7e+ro19qqHDMl+cNfTPLsweUsLMC
	9HQQgIXB1+Z/t/sWlU95bH/pdBukEEVy6jS+KTGkoDPafltp5QJQgNjIhDao
X-Google-Smtp-Source: AGHT+IGYBH7VPmGiLrck0Md78wuns/M4LChnebDpG5Dco6ygkxU6/kSC4zwi/x/7h5Cs8oXUDTY8qg==
X-Received: by 2002:a05:690c:608a:b0:6ea:86b6:f703 with SMTP id 00721157ae682-6ea86b6fa7emr104162017b3.1.1730840350233;
        Tue, 05 Nov 2024 12:59:10 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:59:09 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 151/161] sdparm: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:57 -0500
Message-ID: <20241105204707.4155-151-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113667

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/sdparm/sdparm_1.12.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.12.bb b/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
index a5f98e672..dcb264c50 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.12.bb
@@ -17,7 +17,6 @@ UPSTREAM_CHECK_REGEX = "sdparm-(?P<pver>\d+(\.\d+)+)\.tgz"
 PACKAGES =+ "${PN}-scripts"
 RDEPENDS:${PN}-scripts += "bash ${PN}"
 
-SRC_URI[md5sum] = "2902fd29e6834fd62c16bb5d1ac53c7e"
 SRC_URI[sha256sum] = "e7f84247069da9a0c293963948d8aba8e5897a13e35e5476c8258acb7ca3a124"
 
 inherit autotools
-- 
2.43.0


