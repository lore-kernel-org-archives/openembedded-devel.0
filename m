Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33494D1357D
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 19:08:15 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.30522.1730039170853648388
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 07:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CAXTynL4;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e291f1d659aso3837248276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039170; x=1730643970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wJMvE+2JLvoA4B6CugcfU+VQIk/pjB8JxqDlK5pGzXY=;
        b=CAXTynL4oUizK704tzZcxLbvPf9YtO7349Te8fJn+/Lhb9xyOn5muspemQCFqFpiTE
         59j7VoLBXzpBkOJO5C82bVP5RMUZ7jggBFPKEH/9YPDV7hVLr5MYHvz/fUP3UD+MkfQ8
         Jvdz3UjK4dQifkh3ctXnP6GuV7JlGysZFuahx62o+tJwkcRHi5FIp1fjUDbphtmq9rJX
         wB5g6yt85jAeaq7u4tegvcUyXq4Qw927kez2J+GmfkWnW+Aje9e1JIqbbC1bALm8G2uZ
         CU1jAN487XlMaLVDHQfINwkh10kDwsMDP8z1AAFsqWPC9UQ8NbviT48JqF01Oxw8ceiJ
         hHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039170; x=1730643970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wJMvE+2JLvoA4B6CugcfU+VQIk/pjB8JxqDlK5pGzXY=;
        b=gUv6tDQ/8BoW29beOWDzl9hMekGYaDTctPeamvr+gi14UjqLRq/RcqxRVf21xsx+j7
         k5MmCMG7XyeZAsVz/OPzjSLpyUSTgc4W4k5XUK4mFjmQJ449vJo9LHAbrbzaAHUj8Uca
         j8NA3N5i84UHU+cobVmgsKQHPOX55eZylcO/rkUL09aHDeMcJ7YtmVgFnGdlqLeozsVm
         j4Yn+7SAnK8x86UQRrWta/pXhV4OW6rOQ30040gHCBeDtYyozDcEPG4cWpGyNOjsPGVL
         yiJmd+tExxFRTo0r2EAf8j2qxK96GPFK9V6/BI7HTAOgNY2lOAdGv7T0RLvpApXkNBh0
         fNlw==
X-Gm-Message-State: AOJu0YyKsTVE0I6LQghXYiI4Kkc6Ol5Nn60uky06Aj6RhIFxsncIc1G7
	4XUTq5LCVoQ+hiAOqgBDPjpyLQPCO0CiJtOf85HX/7iEckcK77jNCChn2A==
X-Google-Smtp-Source: AGHT+IEpx+dGGQeijPZuPVVBWD+5OgTGDcGMDB0teHTI0xOTinY+va3EzV4cojhmBBqsM4A3pO5dyQ==
X-Received: by 2002:a05:690c:61c9:b0:6e3:34b9:961d with SMTP id 00721157ae682-6e9d8b8964cmr52999027b3.38.1730039169445;
        Sun, 27 Oct 2024 07:26:09 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9e2953ecdsm5593087b3.1.2024.10.27.07.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:26:09 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 6/6] libcrypt-openssl-rsa-perl: www.cpan.org -> cpan.metacpan.org
Date: Sun, 27 Oct 2024 10:20:57 -0400
Message-ID: <20241027142547.261248-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027142547.261248-1-schonm@gmail.com>
References: <20241027142547.261248-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 19:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113251

Change from www.cpan.org to cpan.metacpan.org use the CPAN_MIRROR variable
defined in the global mirrors.bbclass

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
index aa8d138f2..36f96d59c 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
@@ -1,9 +1,10 @@
 SUMMARY = "Crypt Openssl RSA cpan module"
 SECTION = "libs"
+HOMEPAGE = "https://metacpan.org/pod/Crypt::OpenSSL::RSA"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/Crypt-OpenSSL-RSA-${PV}.tar.gz \
 "
 
 SRC_URI[sha256sum] = "bdbe630f6d6f540325746ad99977272ac8664ff81bd19f0adaba6d6f45efd864"
-- 
2.43.0


