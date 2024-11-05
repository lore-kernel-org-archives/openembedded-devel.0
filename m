Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA258D33A5E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.27816.1730831883435752427
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cc7ucSoj;
 spf=pass (domain: gmail.com, ip: 209.85.219.172, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e333af0f528so2267036276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831882; x=1731436682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJaCtfN8J01FTGQ53KpKQlRsaYYq7q4VUw32ivvnw80=;
        b=Cc7ucSojsqw7pRqdbhNHB2GOEx938bWCppyXpK8+xAKqVlMAGMO88jE9TFwErPC/47
         nZjsvmjce4fpxgNkCHtkcoguv7MYejMYHiOfdNaG4bhxGAID3u8ReHCPeQ7TTVbvFH0g
         FRMGMSXrFMQX+6fU9zUCznL4OgcKfQwHun4DaSnR3LyoVEA6NHCmwoVO3qpqBYHceIOP
         tCahxPjGVQhzWHcjGLzl+LxUn8b0B5ZR2IUkf8FunTXoLggjjTo/aCBAtj3Kl077vr//
         D7UolkXO3y419moo4SIFFuiB50R6AsQCLPCzXQxC4t8jHDj5iTjcJDziYZdJ7uGK4oc+
         TUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831882; x=1731436682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJaCtfN8J01FTGQ53KpKQlRsaYYq7q4VUw32ivvnw80=;
        b=EH39J8BKzQvYoJAqgFZWLXWtuvsC4AKmB2aM/yjwOo1Ax9tfwE4cN9el2zTDie0LwV
         QrDyt05/gXChWxYXf7az1hRfT4I9KQwUt+n/0Mw8aBlsj4SHb16cS84WqbPy9ZW6Xsr4
         keVlphFU6xJ3Lzjn8TTIlHAMCOKYDeev8CflxLoP5xCHlFot8JUBascypa7mRN8JCTZw
         Ta4xG7uSWORNCOP6HfteJbKNAH1H9w6KT3p5eRnrKiFO2TLRXBFTg4pjf7gx1JsHL3wE
         1RFsm17IlndgaobVam3skZPbR0/LjP/xBM6TKj4goG/XDtisyiNZIToMOpUHBh9cpFRI
         MIkA==
X-Gm-Message-State: AOJu0YxlB5f2kpAVAGTYizLFvimMhxR1BtvOiN22c9uq2HDZYzFzxKDC
	LTtTkr874Xy/Hm10MdsfC6Ai50Ga7z/lWGrrmv8+k2QlcwxmEwlsqYnEJidD
X-Google-Smtp-Source: AGHT+IHwh94iV3zheEMLYjXfPnD/gGORqsNinGapv+DfJHHB1FrhnuVa5kAjEBX6ICWNqf2u8dNo3A==
X-Received: by 2002:a05:690c:4811:b0:6db:c847:c8c5 with SMTP id 00721157ae682-6ea3b8a4b93mr210113727b3.16.1730831882065;
        Tue, 05 Nov 2024 10:38:02 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:01 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 006/161] linpack: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:42 -0500
Message-ID: <20241105183658.34982-8-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113521

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
index a0327ee15..086f84a70 100644
--- a/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
+++ b/meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM ="file://${UNPACKDIR}/linpacknew.c;beginline=1;endline=23;md5=a
 SRC_URI = "http://www.netlib.org/benchmark/linpackc.new;downloadfilename=linpacknew.c \
            file://0001-linpack-Define-DP-only-when-SP-is-not-defined.patch \
           "
-SRC_URI[md5sum] = "1c5d0b6a31264685d2e651c920e3cdf4"
 SRC_URI[sha256sum] = "a63f2ec86512959f1fd926bfafb85905b2d7b7402942ffae3af374d48745e97e"
 
 S = "${WORKDIR}/sources"
-- 
2.43.0


