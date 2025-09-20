Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98577CAC5A7
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 20:04:55 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.16671.1758398694860168216
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Sep 2025 13:04:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iM269XwC;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e951dfcbc5bso3213727276.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 13:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758398694; x=1759003494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC18eAMQ5u65jcVe61zGGA5+jD3hE8pZEUo6/bFB8uM=;
        b=iM269XwCYpI3w07SN5Q+RzVq7CzJStRBiLkeHXlxYJOPufeZTgMIOu/Cr4DCMWi5DQ
         hHspIX3g3SGIkqQbqzgf6RzoaVot8o6Byqusg1UX265KXGG0D30rpsO1pE0idWeY6NMK
         6jwL6lDyX88xjL8dRrXRZbk8X8SVGetcloN0bXpjGW7MYhGvlpUhH7Ok4UhYZ/sEobr6
         EvmlDVyLGw6nO74hsFuckF7hBMK9wOks2PLfpTiLRf3Oa4h4t9H7OScOzweFkM2WLs30
         AqqEeI/SePNrD8qK8/9yfsIx+n9rspXi2hp6MYUSmvFweiLRWmqhSP05XMiKdSMcCR8/
         qLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758398694; x=1759003494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FC18eAMQ5u65jcVe61zGGA5+jD3hE8pZEUo6/bFB8uM=;
        b=npOZHb5Ckg5FS+Zv9rkYWuahQqdIK2Zt4fhCZD2w48/CQA5SZhKhClkm6XYbl6qopn
         YYVulAL0jfl8ydDoBz/fHm9zn47kR5iarGh/ka2yMGantxTpXek40Rxr+0p18NaC3vVL
         NcH6Ff331xblVNUleh6DYdtAIOxWDARU7A+dc/QFiuB1hqXYi+EQlMlynzPdaWf82T0r
         KPMfLJKCZomezzRn7l+cq5bRMg+QQCJa9GnamQyxxOtNAcUWy4EY3Ejh2qdD19A+3hyt
         vDL6lFn+OXPyi4con+IJ6x3ulsOs71TvkvdCP8bnP6Jrdk8QnDwZ/CZG1t/ZjEgyPgUW
         qjAw==
X-Gm-Message-State: AOJu0YwxsaJw6e36srQIhyTJc6kO1A0kvqGKpi97SU7kut3dmGJcuq3G
	AQytXytHznAAM7siR9h3ppHaSiIOaz86ASCCLbLcGX35CkxiTuA3zHUO47putGaN
X-Gm-Gg: ASbGnctK16NG930d8mrZv/hT0h5QfKA+OYVSyUwj0F5WA1rgdNVptMsKoEDzzdRsW49
	Xppjz0GMu3oHuOEo/wybsI/4kGReEKKlogjYPmcR9W3sYkv2mmnfUNCoPQYsMs31xKwF64jXVpC
	lI7HQJgcAq7HmpRtZCxhA+87Mibro36er5dDlYIqhZFYXY44Hn2DBdWd9lol5hoc/en9RUBW8gY
	oYpCf3JazallHIfPmq+ypZU/F6g13l29P+D9LEDROx4UGlwEpk3HBzg2A1Y8O5Jpi+BKbcnGeVt
	Xy2Xm2bkQO0SUVbhP5XQpohucZXHie8JweiZALCRbmB46WY/uzYagawM1V+jSm3p/eYbP7K+sgy
	kTZgGbN3CqHTuSsvvGC4GaVFRx0kv
X-Google-Smtp-Source: AGHT+IHguWhaQ3CmBja6escDO4a9hH4yUY8oZpJpQwpd8K16O9Iu5e3d2c4MNfhj8NqSI1+YOAm6VA==
X-Received: by 2002:a05:690c:22c3:b0:739:61a2:ce9d with SMTP id 00721157ae682-73d1f5abe6amr63968757b3.7.1758398693319;
        Sat, 20 Sep 2025 13:04:53 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7468da56970sm5713487b3.17.2025.09.20.13.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:04:52 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 2/2] libcyrpt-openssl-rsa-perl: upgrade 0.34 -> 0.35
Date: Sat, 20 Sep 2025 16:04:35 -0400
Message-ID: <20250920200435.14135-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250920200435.14135-1-schonm@gmail.com>
References: <20250920200435.14135-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 20:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119624

Changelog: https://metacpan.org/dist/Crypt-OpenSSL-RSA/changes

0.35 May 7 2025
    - Disable PKCS#1 v1.5 padding. It's not practical to mitigate marvin attacks so we will instead disable this and require alternatives to address the issue.
      - Resolves #42 - CVE-2024-2467.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...enssl-rsa-perl_0.34.bb => libcrypt-openssl-rsa-perl_0.35.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.34.bb => libcrypt-openssl-rsa-perl_0.35.bb} (91%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.34.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb
similarity index 91%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.34.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb
index ffcfa196e8..2e383a83e1 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.34.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.35.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=399bd4de06d233aa49afa7c47cea8117"
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/Crypt-OpenSSL-RSA-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "368ed198e1fbaebaa2e681d77dbb3c6f0f94e9bacd97b2674759bfaa75bf4a35"
+SRC_URI[sha256sum] = "5eebd55ac071634c864a8e78f5cfafbaaf43cf84c04323a09b71dd76bf025cc2"
 
 DEPENDS += "libcrypt-openssl-guess-perl-native openssl"
 
-- 
2.43.0


