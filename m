Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1240D2CE1F
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:20 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.21942.1729612086093069517
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CNs8HVCN;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e28833f1c31so5574082276.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612085; x=1730216885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvDxe5STZ3MQAtz7MyqwlOTxglHFTMpMevW2R2b4Cc4=;
        b=CNs8HVCNZPYsUeLw4g0fQfWJI16z5j/4jZkq0nsbjRueEniOZ2pBOZg3hyZoftxWzU
         ltY2ttqeRmFE1tZieg9L8XOTcslqG0WO83RPnRnNe/7oXfbUvmHSWd1t/LvNAnHaSpIB
         8U6WWJ3IoRUWmXipErEjJmNdANWrCUED9DjmS/DYRO+fimOZQuYKkf7huFhSg/E1XLFZ
         jqg0WmCrY3yqY9Dlvv9D8rRO7dTpaM7NCZOkxd/FvqdS6svR+RaFwGqfUwdb1oXyekha
         jpLPzl6kasj63vyHewWKdiJu9wzddDUV8F0iySVedZfNh4VzTvrIWXugVCpOYGjfSpFP
         Ru6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612085; x=1730216885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvDxe5STZ3MQAtz7MyqwlOTxglHFTMpMevW2R2b4Cc4=;
        b=wA4czy6Aa0K7ACoKE48PiRp78t7PbNDZ8kKNFrPOtmSTmNxG6rZgdnpIZkGl3yX56Y
         sIqMvIusliDKt9WvcWkvPQNHiK2aCsmKI7m7QSgjW4a03LA+AoS3NVxKzp+iQ2lopJgJ
         Bd5iRdfFy6mCGPr2H2bLgoZ2ACQ9KYjqCSPNOdAjlVvTHgtCTz//gvmE1uBjjBzhQT0A
         ps2ePw/8e8g0BrzbIujbaVpl0wlAsAuim2b3mSBqu/6TD8fxcyPeOhGME6zyrvAmIsoM
         zhAvAnpOyAD5qabEzt0zN+Fek0mKGVkaqcSxPtvANi/7Su/iv/pr8SrKLLerefGOERcT
         jEeA==
X-Gm-Message-State: AOJu0YxYEbELaEibc8Ptybc2r66k6KT2FGVgC1p49oR1AkTEPRH6i37t
	v9cqKSzhxLDYuEC8/+SJtXOyelRPmSKWu/vd6dqvEjm1ZPhPECDXoP1UZw==
X-Google-Smtp-Source: AGHT+IGyZA+ppWOPBaCOU+tj/4tscdedspX4OxNsG6aA0rcGi7gPv/MEcyvMwLJ5+Xfh7mRPQJ81KA==
X-Received: by 2002:a05:690c:6084:b0:664:74cd:5548 with SMTP id 00721157ae682-6e7d4518681mr33075937b3.1.1729612084640;
        Tue, 22 Oct 2024 08:48:04 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:04 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 16/46] libextutils-parsexs-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:34 -0400
Message-ID: <20241022154729.20331-17-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113107

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
index 43b5b60ef..56617fcda 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-parsexs-perl_3.35.bb
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=120;endline=129;md5=eb858f0e3b1b0bee
 
 SRCNAME = "ExtUtils-ParseXS"
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SM/SMUELLER/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2ae41036d85e98e1369645724962dd16"
 SRC_URI[sha256sum] = "41def0511278a2a8ba9afa25ccab45b0453f75e7fd774e8644b5f9a57cc4ee1c"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
2.43.0


