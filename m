Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1412.1793765230333975300
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 20:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lFluEZJL;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6774639a8a4so355978d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 20:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793765229; x=1794370029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/s4WUudeQr/K3cSfjzCDuKu44HETJE5uZ1S1NCWZ/M=;
        b=lFluEZJLSw24HXCNzXIi+S5Pws4S0HCeXKmJunlRRzLE4AowcCTy3VtLU56aRYaZIN
         Qv6luJNXF4o5cdkVq9kc2LSDvv5dLxVFwJ1TUpuonNZvAD9wI1UOCovDSe98ypq+Uk6z
         yO6+GA52XdQcAd2A+egld5+mzoPdJ1N64rc5s0N4E5JJ8CHgg45gaDz2PyCUCZObgEx0
         p3ZTzkIfNVykErY40UExyuIKQQQP5hT9FGXobtoxFcb2+GgqL8Yrp8hybXzvclTLFIYK
         lwor4w2BwhOLVZ4RM4Cw4lNTSgApVjo2a4Qqfmg/Vzyk/lAkCpp+glmvTvq5wXj3WSiL
         J7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793765229; x=1794370029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/s4WUudeQr/K3cSfjzCDuKu44HETJE5uZ1S1NCWZ/M=;
        b=i1RYDktZ2Z/cnCER/2Pl5oujIRhNl9ITf5L9CKHN0F2B0Cb5+xWKlot8OlKqvZS2F3
         gUqUnuEoWnSPDZwlp4wSz/lTS4jgb5V2hcTk6d7BhOd87wg+ayZQTWBhpPGdPbb1eKv2
         Tiygnvf6+fevUZcC7/dGzFeTc6Yyrt67wLXSNIMdlnmaNacaQCvrKwqSOvdJDf2bQY1f
         Wc+6lrYX7/QyrnLJzEtf31yoH8BmntwcY4L0+akcdaHpdE7KOqFVzixrDfaZGsZP0IKm
         MHAO/iVyDOf1LqYTwgtE3BBz/ANuiQ/Lg41wnNx/pj187fpqxcwjg4qVlhMHTLpn/XTv
         PmBA==
X-Gm-Message-State: APuU4Z9Q1C8x6PI0vq3Z7BgLuRPF9OhllKJT2T2IcKfwjavPfw8Z1HfO
	NZgS3XZgXncCAwnIZzRQ9LsvifLp1i86N/3NdGUvDGCEyNMeTPA6b+7LW8Dv9AMs
X-Gm-Gg: AYBFou2Uc1hnIackSznm/csjlTvsG2SXUHjy+2ECOAATEPyBw3G8L024SSia2+t+dvG
	Ayo4qNffP0QjloLdizo+0wNifZmB9SOY05/3vHaCAAV1Rif/DSGaqqEvcqzA6fLy3dSgmJ+OYiy
	gvOmK8DfhUCcaWSmmMWxj5Lix0c7I42vUv5JUuEPJtHq756nAzaWjWEjRMtg5glF0aMYobJmOD7
	/Ap4K5v6Zhy/qPlFjsJV2GuqE2SHLdgEI1MMpW0/A/HQjdlZQPJ9hFS5jG+c7RUVl9bNEBPO9V/
	LO8ftcIf3Xp9h4ZYRLTBg7q/gz5u5DiUHJgQBHH0OoU+20B9ktT4EVoBflj80wUQregvwtwykxV
	GPgbm7h+QxuDTV/GOHVNGAiB7moSwfe9NL4jKTh0pq9MMghsNKnXh3aKOk8kWeit922wLoIN3hz
	y+Q6BZ2qJaIj+utOHvSb4BrLyOlBoFiC4ZD/J6yes/ve4rWpyzAc6eT6CgsFJdMgojztdFlQaJN
	UGFTYBkuxLnDDGniLgOfUhUDftZBfgg11flMTSXjI9boGfmYlbNwz+wE9BQn5WGqjIcdiWj2iaY
	d17a7yvHJ8kyvygPL5SJp+SSB3Zw/yCdaKsBOy8GQEXDvPb1OhcaxSJdi9HsimEG8kLxpst6Sxo
	fWbQRLuOvE9M4GiPxd1cDBiMR9TI0V2xEyb73WNLY9LWbjTP2X9vE
X-Received: by 2002:a53:ac84:0:b0:677:cff5:52cc with SMTP id 956f58d0204a3-67ba4f6890amr8460632d50.56.1793765229205;
        Tue, 03 Nov 2026 20:07:09 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67bedc40ac4sm801363d50.0.2026.11.03.20.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 20:07:08 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH] libio-stringy-perl: upgrade 2.111 -> 2.112
Date: Tue,  3 Nov 2026 23:06:56 -0500
Message-ID: <20261104040656.462758-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 04:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131830
Content-Type: text/plain; charset="utf-8"

2.112    2019-12-13
  - Added the change log from any prior source that could be found. Formatted
    the log to fit metacpan.org loose standards.
  - Added .mailmap to correctly attribute all commits to Dianne Skoll when
    using: git shortlog -s -e
  - Added .gitattributes and .gitignore to assist with keeping the repo clean
  - Change use vars qw() to our $whatever instead. 'our'
  - Hide IO::WrapTie subclasses from PAUSE
  - Rebuild Makefile.PL to contain all of the prerequisites. Make use of the
    stub from Dist::Zilla
  - Convert README to README.md
  - Fix the documentation in the main module, IO::Stringy to better indicate
    where to get info and how to use the module
  - Fix the dist's META information to indicate the original author and license
  - Add a LICENSE file
  - Get rid of the set-version.pl file as it's no longer needed
  - Add AppVeyor CI testing
  - Add Travis CI testing
  - update t/IO_InnerFile.t to use Test::More and a proper TEMP file (RT #103895)

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...io-stringy-perl_2.111.bb => libio-stringy-perl_2.112.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-stringy-perl_2.111.bb => libio-stringy-perl_2.112.bb} (79%)

diff --git a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.112.bb
similarity index 79%
rename from meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
rename to meta-perl/recipes-perl/libio/libio-stringy-perl_2.112.bb
index f9fe23e7b7..ab5eff852c 100644
--- a/meta-perl/recipes-perl/libio/libio-stringy-perl_2.111.bb
+++ b/meta-perl/recipes-perl/libio/libio-stringy-perl_2.112.bb
@@ -9,10 +9,10 @@ LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=01406e4ff2e60d88d42ef1caebdd0011"
 
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/D/DS/DSKOLL/IO-stringy-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8c67fd6608c3c4e74f7324f1404a856c331dbf48d9deda6aaa8296ea41bf199d"
+SRC_URI = "${CPAN_MIRROR}/authors/id/C/CA/CAPOEIRAB/IO-Stringy-${PV}.tar.gz"
+SRC_URI[sha256sum] = "872328f5a665c79e24a777b35e4f7fc395a1912d5e142879ffda83e8c102f765"
 
-S = "${UNPACKDIR}/IO-stringy-${PV}"
+S = "${UNPACKDIR}/IO-Stringy-${PV}"
 
 inherit cpan
 
-- 
2.43.0

