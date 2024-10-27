Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346BFD13578
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 19:08:15 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.30468.1730039169747622355
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 07:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZmCk5zYW;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e290554afb4so3653698276.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039169; x=1730643969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O3+WRjDUgnswcTGf78/lCWv8WEYytqHFQV9WKf7+kE=;
        b=ZmCk5zYW43uUSn4awnu9lP1mpXnXrnjtmDPMhPekeIX8rqW4dOqyi+sTWlsVPKt0fc
         CnPBGsiHXOxOJdEc0FDU87WHebajzeb39zRvqF/rWXpU5IXMSnLv/HrPHy0dNKoKyVbV
         lX3T4AHtoKe/NdP6WZe3vVFl1ntE2zujvgEA88mEgY5hP17wWuuw+CrhJJ5ZzteHXGoG
         ARYmkORB9YMHsW7+YsvcITs1O4DASulW0i/a+BNHaQHEy6fObbXihnC6BPluoVzfahLE
         WzhCerjcDICYA3zmKdC5+dMa10s5MHIivLoM44wo8uMv/JTmz7XzsPS5RDqI8qHNDEmY
         WhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039169; x=1730643969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/O3+WRjDUgnswcTGf78/lCWv8WEYytqHFQV9WKf7+kE=;
        b=h7RxyDWnAeC0WlajXgECJjWftxby3hrjUQq/2AsXDQt3+a4fI/Ow/T1vA+dKF3BTpW
         QJvC42ktTIu+Jqc/krgPMW35l39wjRFHt1hmPzOyHPvLQAIGGP3cT9JqX9JOPSQFXHKn
         gCToHsEx8JA/Ufib0y9MqRHradxN7vadIHjkmbTTNqexogFR7yEcS9LrNFscRRoYyBgG
         G62wDzEJcAW197J7ZQJTySzvK7s/dHvuz7d2iLFPCOmPWTP/jG8uErR+Us1chLFEePBe
         WXrKTI+WyA/T3134e7fepBv5xCAl5zZ0xsZm4HsSLdsDiUEf1/GxcFPQJMDIp5N7rs81
         yJPA==
X-Gm-Message-State: AOJu0YxVThXbUUZHVl+kB/gzWB+7NZ+7i4epOgAjJQgtth0w1jah4yPa
	7bNa2mqJMkiDu4jyAbB9itQZkvNNh4DtbpzGByWysaFMaSMTAJ6Sqbf07A==
X-Google-Smtp-Source: AGHT+IFCTGmnAnbVXUM2jbYz9zaXbbSkHzwCrSeqYTANs1g6rQeNOftgSrOYPrZCrXTQfILFohA7rw==
X-Received: by 2002:a05:690c:f12:b0:6e9:cd43:b150 with SMTP id 00721157ae682-6e9d88fd87dmr45671797b3.6.1730039168364;
        Sun, 27 Oct 2024 07:26:08 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9e2953ecdsm5593087b3.1.2024.10.27.07.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:26:08 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 5/6] libcrypt-openssl-random-perl: www.cpan.org -> cpan.metacpan.org
Date: Sun, 27 Oct 2024 10:20:56 -0400
Message-ID: <20241027142547.261248-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027142547.261248-1-schonm@gmail.com>
References: <20241027142547.261248-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 19:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113250

Change from www.cpan.org to cpan.metacpan.org use the CPAN_MIRROR variable
defined in the global mirrors.bbclass

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
index c15d41713..c55f7f768 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
@@ -1,10 +1,11 @@
 SUMMARY = "Crypt::OpenSSL::Random - OpenSSL/LibreSSL pseudo-random number generator access"
 SECTION = "libs"
+HOMEPAGE = "https://metacpan.org/pod/Crypt::OpenSSL::Random"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9e876d4149406d88b4ff1b37645363ad"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Random-${PV}.tar.gz "
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RU/RURBAN/Crypt-OpenSSL-Random-${PV}.tar.gz"
 SRC_URI[sha256sum] = "a571b24181baaa76c96704e92acffc6934ff593e380dade274db4e43c140ad51"
 
 S = "${WORKDIR}/Crypt-OpenSSL-Random-${PV}"
-- 
2.43.0


