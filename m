Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17655.1794787854788708038
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DzNTnCo4;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3042561c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787854; x=1795392654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2hE62TiRV0uAAfTKqgZPJoLO0zIfXkq2cqLK0lxUxE=;
        b=DzNTnCo4GbFb3huJQc9m759Q0fV72Lf72Sgugzg7oARdP5cyEeVODn8pmRK3Ar0viG
         wdfFMA02mM9Ba9l6pStz0AV3UHhzlxxapnTIFHcLhayiVsbfmt7AK2LsggpyeH27E6dj
         Sughps/jrPuhRbrgVmj4eZgLAJfj9h5S3W1wiTyo8HupJvUa+DUT6DE+vbhbL5MajDwR
         FiU9eGJi41cGeyXj1WkFXElUm5aWv7+01CqCh2EIJ6fBZGoLRkI3GKOD/Xexz+0DODHb
         GKlMs8l/3fa0GZ/4LTPcUTcqzUWuGK/blXXknUkVolB76fJgMA2yVTK6sezFLAEr4f8o
         2jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787854; x=1795392654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2hE62TiRV0uAAfTKqgZPJoLO0zIfXkq2cqLK0lxUxE=;
        b=mF4fA4GP0WxTTeezfF9nuFqHElgGoXpsYLq1h/bk+4XWRRWqdC63ZS4SO+M8UjAN4b
         ubkEdmSUdLUSUaBV6rDI1Eqz0yhAL6LYDtZuvRFz9Lf1wKVnptH8Cv9kWTnqv3sXPv9z
         aa5zT1ykABzv9vqG8hl/WQAuMsiBOuD/B5qghLmixQuamz/Q4V0jv9fI3QJ4ahFVAFaQ
         K+wzPmTWyk04pYn9rLFatOoRZl11mZl5UPBEXRkuwuaxPsCgIq7/bb+1cEynmwr/Q1Es
         MeuFpJn+7wHYvPIQTMtJkIhu9Aqm6vCC4badWx3y5bdsLWwc14uUjZK9w5PwI8bgrGLI
         1e+Q==
X-Gm-Message-State: APuU4Z8yQhRyH1BfmcVTQdvHp5HjPj30fwt//DdXMM1hcS+F84od40UP
	D5qAkJ4n/LCWrlU/0whortozX3FSsgMBYH8XGgElwURW0vQbB99gTrx5oVOeTNaa
X-Gm-Gg: AYBFou3bxE0MCQzwLNFUb0ZWuzZ585maZYb4vtBH9LP8/+TLwNcGZwzYUVgeY4nnXRG
	VYYDdwl5BNIDWC6KN7XdckCjlAVi2kX045z8nFSRjTqZXevEwy1VpqnlRcle05R66qKYV35gLxU
	e55+J8QAD2E92cnYaqIp7kB1nST5g3ReqgAu0a0fJEefKqNDUVLqMnNMC07aK7O2jdp0O+YYpJo
	6xzVx/0vxrHnMfrahjObhouaR8ndzz0BkF5c29Tc7xSItJ5yR+HfPOKX/Z9lCJgnM2UBBZro7c3
	T9lrX5qTX+x6VKjNCUP8Cf/Dfow+myRCenKYrfU/5CuZVwrursOrOFIl6jXj3xTR0TBo3azoFIa
	stm9Z0LYK9gRAsVc6sqB2A6xZjqZ+UrEkohDheucMBvugPjiFSVJ3OuFL6hSrujLRe5+zCnOv9u
	LzTb5Wtj1kBOiqC6/gfrtJh2wkd8TGOfxR3Kj+jumCkEn/5Zs2SqE65t2xrlJnpeIN244Klkufs
	23z9zNvnNoMmTZvS8Cjelg/LU9xeIx5Darp4sbNUNrYnNYlwhC4+hw9R/sCKWjTB3+MOybKB6bX
	6p/Gx40fbRsxawuWYs6/bVyc5sAkhcVvjiEZvsjATBXpq+FcIuY5ehABQn/vrJ9hP0sEkVFebbz
	QxX6C1V8OionmRnSs2UDRaV9CFj9ACJHixip4CoUH20SwQkULB67PT+NcTrcjS8+v68KJFnN/I2
	w9GedQztkK2YtuzpKo3UooxvkWaMzCMyT9xNTZ4iqrdD+VAbmS280hXzji0Z7UiB+x64nMtigtM
	2Nik6eb09foPJrHaJGqFxVreg0WVglJHE9h6IhdiOO+70g6IOvPI46rBaGRHTfvmfoZa+UrDx5B
	P/Ca
X-Received: by 2002:a05:701b:4585:20b0:1a5:52f6:db9a with SMTP id a92af1059eb24-1b503131a8amr9018373c88.22.1794787854036;
        Sun, 15 Nov 2026 16:10:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/16] dbd-mariadb: Fix DESCRIPTION and drop unused ptest RDEPENDS
Date: Sun, 15 Nov 2026 16:10:34 -0800
Message-ID: <20261116001038.440763-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132393
Content-Type: text/plain; charset="utf-8"

DESCRIPTION was misspelled, and the recipe has no ptest so
RDEPENDS:${PN}-ptest had no effect.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb b/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
index 65f2ec232a..138c85bf53 100644
--- a/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
+++ b/meta-oe/recipes-devtools/perl/dbd-mariadb_1.24.bb
@@ -1,4 +1,4 @@
-DESPCRIPTION = "DBD::MariaDB is the Perl5 Database Interface driver for MariaDB and MySQL databases."
+DESCRIPTION = "DBD::MariaDB is the Perl5 Database Interface driver for MariaDB and MySQL databases."
 HOMEPAGE = "https://metacpan.org/dist/DBD-MariaDB"
 LICENSE = "GPL-1.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d0a06964340e5c0cde88b7af611f755c"
@@ -13,8 +13,3 @@ RDEPENDS:${PN} = "libdbi-perl"
 S = "${UNPACKDIR}/DBD-MariaDB-${PV}"

 inherit cpan
-
-RDEPENDS:${PN}-ptest += " \
-	libtest-warnings-perl \
-	perl-module-test-more \
-"
