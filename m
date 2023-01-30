Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4271C636D7
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 05:09:25 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.34385.1675055357364101877
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 21:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dSk9yeie;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id b10so10063148pjo.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WaV3p3R9HvCWX5c80HG9h4UcAa7jaoBQxbhWLte1mU=;
        b=dSk9yeieOp9vpOKFdFmNJCfN1RFdl4iCp832/OF5UyZTErn//yYozX3Kke1s2ucBgX
         FVpLAtXpPmgfz00MWFUVJGI/Q5Fj1uu4XARTIhn9/JsQwXPZ+Fif+W4voWG6siT9xj1S
         u7znRQcTvffjmH0c0q/SJ25mThog6vr0V/ieFsaHcSIPUxIO/MoncZy7luCmNwnxI3dB
         ckaxPicUWJMukkDf9SFlf98u33yMwEtV1HSZxo1EG8TcqPL4vtTlnFwP9KBvRXO8mMcS
         qr7RM+IXLhHmawi06pm5fp0eASRz07dzYz3kzPMFtcIF8MTqKQMVWR+G3EJ3HylaUTl4
         LqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WaV3p3R9HvCWX5c80HG9h4UcAa7jaoBQxbhWLte1mU=;
        b=Y5u2GIyHc6YTHyt8VVmdAqj0nnspBMisqNHLHSlqeE8alvm13f8u7Lfz1qYxsjrRZ8
         jNNQNFahmgIlFz+3TNMKkovQlnMcXD3wYC80UPsBpfOS9yZVnUtQndzTC3+mdkQOqSD0
         4xnVA7mbwBdYSVa5CZ44zSvb9Qd+z5D4QdNDnOrrdDzcPZWk5mQ5CyK+djCoYwhzJ1+5
         LfIrnd+znVK2RVEcUAcChArToH3b6ExQsyKfU0e4ppppxZsgoqn4oW5pMNTOZ7XXRrWm
         9HopJx4dxKDBMetlgKBqjznGM3e6m0J1/QWKeOHYzQT+OJtQ1AafqUZ3gTHkrK3MWQYb
         FIWg==
X-Gm-Message-State: AO0yUKWkn0i0ojCtiDvKPJaWAY0rVvK+GtYNf0OftGbPPONkeJr3ELNz
	d57QYdrNGgKnIbpy+Hnx2Wnxu5eq1Edg6Q==
X-Google-Smtp-Source: AK7set+aBmvDICCjFLNNO74D0l9TlYVAUS9s6NWN7ybvMiD7pN4yUOejHWw/OscwJrbUsJAuZMSymQ==
X-Received: by 2002:a17:903:2093:b0:192:ef8e:4258 with SMTP id d19-20020a170903209300b00192ef8e4258mr4942664plc.14.1675055356487;
        Sun, 29 Jan 2023 21:09:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b0019493c84880sm6671467plb.188.2023.01.29.21.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 21:09:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/12] dante: Add -P to preprocessor flags
Date: Sun, 29 Jan 2023 21:09:03 -0800
Message-Id: <20230130050909.133727-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130050909.133727-1-raj.khem@gmail.com>
References: <20230130050909.133727-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 05:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100850

configure uses AC_PREPROC_IFELSE to check for certain errors from getaddrinfo()
it user search operation in a preprocessed file

 UNIQUEVALS=`sort $ERRVALFILE | uniq | wc -l | awk '{ print $1 }'`

However, line numbers are generated into the preprocesser files and they
get sorted higher than numbers

 gaierrval:
 # 130 "conftest.c" 3 4
           -3

-P ensures that line numbers are not generated into preprocessed files,
so these checks can succeed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/dante/dante_1.4.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb b/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
index 746c08be6e..4badff8bbd 100644
--- a/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
+++ b/meta-networking/recipes-protocols/dante/dante_1.4.3.bb
@@ -25,6 +25,7 @@ EXTRA_OECONF += "--without-gssapi --sbindir=${bindir}"
 DEPENDS += "flex-native bison-native libpam libtirpc"
 inherit autotools-brokensep features_check
 
+CPPFLAGS += "-P"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LIBS += "-ltirpc"
 
-- 
2.39.1


