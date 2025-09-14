Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90FBCAC582
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 12:45:28 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.8802.1757853922129880889
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 05:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vs3ppW8D;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-72e565bf2feso22718137b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 05:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853921; x=1758458721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1QRaV/5a8MzFHTyau4dB02BOFuzNvGjc6zt0N6xRMnU=;
        b=Vs3ppW8DY/hHwAMGoXF0IX1QaZI17OqmNgjtl6o1Iz5FawrGkKXhel/YY9PfkMbX5u
         dHrDadyP3hTxoil4AJ/1CPKwdG4bjmkR69+jmKZv+xIdD+3mvAxyi+9k60F4Rdw0GBSx
         bhCcEf1Ebf8TvUDRnbp7rXozWGvI7qaVM193IGkyQCqnUtiJYiIUGr1Zcub84NMnsZet
         kteoPEvF9oXBf0GA2gFeoouKCXP/DIqItfMtjVI7zZRpmsgIAlUY6IDGwMFr9K8nDeYQ
         XNVyi784JuH8ZXAIKHNe4BNn06zzxfDcjuvgwQrHn2xebeMipvnyFfrBZsHMLQmBVtAb
         tgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853921; x=1758458721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QRaV/5a8MzFHTyau4dB02BOFuzNvGjc6zt0N6xRMnU=;
        b=muCJLOYifU6aucg3iQS2knit368F59h/iphZltZ+2AYfr1mGfArASZi9x5lBdJFqaZ
         FbMoZ8VhRnCZxvsjJxtSiaNFd6ARtLZkeejKpLstApIjv6bzwDj+XlAbbjzSh0ygdj/y
         A6w4dlLxsfihvC1V7evH6p7zqT8dNuc7Vs10iFHlAkOlri0+yNYnm5mD60qdNwJ4DDtx
         ydzCEl6YhaI5MjhdoFjnqYm77fXPR3FdIqy4NF93EXRgzFPyp7OGKCgS1/HZOjUalRPK
         y5bvMvb1VITgbC/n9PbL0sI3B26mGyaYUKmmUG7M4zbKQx/dFIBY/3gsnSoEsv+8YMRJ
         TZbg==
X-Gm-Message-State: AOJu0Yz7161bA9W8/FrZgwF2viuh6ruGlJ5TymGDeSh2GsgnodK7+Erm
	sDuhSuyLn20W39CU4POrLJB21j17x7nZmPQg391Dbwhm9Kx4X4zWXOSDp1FZqTu8
X-Gm-Gg: ASbGnctljZQv30H3WZi901gDQ/6Nev0suTomhms+Q0csTgrtz5MN6AKodrIfNMeV86s
	hvZG0bfgzsO/L6z8ULr9oGIKf0llB2Xs8/GGuK/v0NE7o7oC0uv0EH4ODB2oaTp9B24qxhe2NMB
	X1A9UNsZOkVYq5FrwEZWawgXZQ7uJPSw1I+sLT/4KWfldF/PDwiWxp3SzsiMi8kzaiiXeiBWPBF
	+C6LU73gauCaaXuEwIWgT8SqudfDnERpI+mEsgVkC/6pFgKiL/a0+RB9WAEiv6opymLb7YViWTD
	tLzrcYjm6hTGR9+XtM9POSZwdqNj/w+vzjxItLfenizSmaZale4ZDoK84sUcsEpnjlkAjfbRcj4
	CyYc3EolmLRGqID9PFDRbWdiPyeUVKPdsc57SqE8=
X-Google-Smtp-Source: AGHT+IFHiTssylxvrS1OZ9yPvpoKaBw5Xn9NurX0jsXiXkiAgiIBgMTN7MzULuVEUMgM28zdURPUKA==
X-Received: by 2002:a05:690c:4484:b0:71f:eece:bda8 with SMTP id 00721157ae682-73062ab400dmr66717037b3.8.1757853920469;
        Sun, 14 Sep 2025 05:45:20 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76e1657asm24260847b3.33.2025.09.14.05.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:45:20 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libcrypt-openssl-rsa-perl: upgrade 0.33 -> 0.34
Date: Sun, 14 Sep 2025 08:45:06 -0400
Message-ID: <20250914124506.592617-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 12:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119392

License-Update: Still the same license.  Checksum change due to the change
  of the physical address of the FSF.

0.34 May 5 2025
    - Production release.
0.34_03 May 4 2025
    - Fix bug in rsa_crypt. Need to pass NULL
0.34_02 May 4 2025
    - t/rsa.t needs to tolerate sha1 being disabled on rhel.
0.34_01 May 3 2025
    - docs - plaintext = decrypt(cyphertext)
    - #44 - Fix issue when libz is not linked on AIX
    - #50 - Correct openssl version may not be found
    - #52 - Out of memory on openssl 1.1.1w hpux
    - #47 - Update FSF address and LGPL name in LICENSE
    - #55 - stop using AutoLoader
    - #48 - Whirlpool is missing the header
    - Move github repo to cpan-authors
    - Fully support openSSL 3.x API

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...ssl-rsa-perl_0.33.bb => libcrypt-openssl-rsa-perl_0.34.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.33.bb => libcrypt-openssl-rsa-perl_0.34.bb} (84%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.34.bb
similarity index 84%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.34.bb
index 5b81cfa4a3..ffcfa196e8 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.34.bb
@@ -2,12 +2,12 @@ SUMMARY = "Crypt Openssl RSA cpan module"
 SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/pod/Crypt::OpenSSL::RSA"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=399bd4de06d233aa49afa7c47cea8117"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/T/TO/TODDR/Crypt-OpenSSL-RSA-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "bdbe630f6d6f540325746ad99977272ac8664ff81bd19f0adaba6d6f45efd864"
+SRC_URI[sha256sum] = "368ed198e1fbaebaa2e681d77dbb3c6f0f94e9bacd97b2674759bfaa75bf4a35"
 
 DEPENDS += "libcrypt-openssl-guess-perl-native openssl"
 
-- 
2.43.0


