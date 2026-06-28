Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA953C43602
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:32 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69110.1782634291391932141
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K6ZuQaKN;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30e7eb50b83so778352eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634291; x=1783239091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMWmw6zuf8QJTv4C8Dz2ifPLmPXaqTmZgAZoEjTl/JA=;
        b=K6ZuQaKNtUMW4SIyey7t3IEBNlaSkCt2fmbv0tbSZxjzFfCsaUWPYgRhUK2At/1SFu
         +J9GzRImtAhy+n5Bxch4gVTYhaXpSTwgBsnnQc8bwO7n0UJLD+0U/CqmdorkoUf8zR8S
         r28+6MnKepj46sxNqKEhMCUal7VjIbxvDTN1VJGQ+DV+HrJvP3NndoEjuoo9oLxGVQXa
         ppOv9/BTqmODfTFdnQlzvjFDbBmqJwWwrYpyHTs9wmw0Y5d7TW04q9ASh9H+0I3JaRSH
         tZCUnvvH2Q45ZKUeMmaz8FhjmFtvY52f0DIKTV+MUD25h/us4spOYZK/brkSMoLSOuoP
         /9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634291; x=1783239091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bMWmw6zuf8QJTv4C8Dz2ifPLmPXaqTmZgAZoEjTl/JA=;
        b=DlKIyRpIkXE8FUS6xAtJFbrqzqI1Y3cHOge9cCPoO4USLPygASMcwPPHGVld92Vog5
         fmEQHCBzahsWL7wpweRLRZv6q19R4geg/cboT24DzyB9D/ABTgb9UIqabr6xdGpDTsCY
         Rlxlbpfcsw7kykcECJc8SDL3zz2OllE84vyY+l02GOSbfrtYySVOOVfLwOeUCbbAP+dp
         jRGfyJKZTi3E7KwF/+MkPMOym5hmY0L/Tr3k7mPKIN4jqcT1q2hN4jfBgK+6T+4k1oJ8
         rwuGHcPJRDVQjyMpyiI8hLMgWCXDY4Yu3tyNsGXBhNdEH1JM4EVE9L7H6RPcpA5z2UmK
         qx7A==
X-Gm-Message-State: AOJu0Yw+UVrEYhC8LtfJK49DjqVajbDne0QCEIW+Qk7Lj7QZconfWwJV
	MqziriL9qc1/wpp4aKTD/acuHwkG1oGVeU1MdO/wFQCNnzkZ2BuEyW0blg+fUB799Xrm3g==
X-Gm-Gg: AfdE7cnTLyQQMADIVl0uRda4s18HQRG7O7r+SKw8zsfPoPkxCbSCcyP7XaS7pVCHDOO
	KD+gfUYBhwklK62QD473EiD2ra+HVMosY536OqH+L+FkWD5FBwzD9kajzZmIvOYdpxTtswTzsnF
	URv+DQFDHVWQ3rcP4TS8yqvnywZ75jywhPqL+FDaDx6HR+rWnIKY1wk92O5WmuQJAxzlVJeMbtY
	stc6VCKOMTYuu57y3VokyQYv77irdMiTMf+AGfpbQ8yXlSDjMOh87Rr0Rg8UP9ze+HOwx6wc8CI
	baqF6+h3fF0H7vxwSUt3N+NWfQFG2lsJf7nt8tzKNOsGPw/y4wNk5asgXXcVteKVEksyOt4B6WH
	lkwoxpkaueHFGvEzV/5aRgcIpV7+ecuGbgq2IVI95R3xWf6tDg8kfJ/Mq5MGeD5FHY9sTa5B5zy
	uoj7+BFttvd1sNGd6PTumw+GgcMHqNTPyxIfkhXorYt1A6AGVge2GebsHd3YyENTltPUPRBsPMq
	HyOyidrwd3FVJzQpxDzMvJmKhJrD9vgsdoHH9iAj779Tp7m3HIzRkUIfZCMb2Zjxi/KjBP4Exu8
	itoss0av3DhMazgIbYORRGNJBNTOHA==
X-Received: by 2002:a05:7300:bb08:b0:30c:283:9042 with SMTP id 5a478bee46e88-30c84d59176mr11944017eec.30.1782634290560;
        Sun, 28 Jun 2026 01:11:30 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 006/128] libtest-nowarnings-perl: upgrade 1.04 -> 1.06
Date: Sun, 28 Jun 2026 01:09:17 -0700
Message-ID: <20260628081122.178348-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127816

License-Update: bundled LGPL-2.1 text reflowed; FSF address updated (Temple Place -> Franklin Street)

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...nings-perl_1.04.bb => libtest-nowarnings-perl_1.06.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-perl/recipes-perl/libtest/{libtest-nowarnings-perl_1.04.bb => libtest-nowarnings-perl_1.06.bb} (82%)

diff --git a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.06.bb
similarity index 82%
rename from meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
rename to meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.06.bb
index 23f339bcda..ceafb0598f 100644
--- a/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.04.bb
+++ b/meta-perl/recipes-perl/libtest/libtest-nowarnings-perl_1.06.bb
@@ -18,14 +18,14 @@ LICENSE = "LGPL-2.1-only"
 
 HOMEPAGE = "https://metacpan.org/release/ADAMK/Test-NoWarnings-1.04"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7880c36af69ec5fb59c117cd41e6c38d"
 
 CPAN_PACKAGE = "Test-NoWarnings"
-CPAN_AUTHOR = "ADAMK"
+CPAN_AUTHOR = "HAARG"
 
-SRC_URI = "${CPAN_MIRROR}/authors/id/A/AD/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/H/HA/${CPAN_AUTHOR}/${CPAN_PACKAGE}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "638a57658cb119af1fe5b15e73d47c2544dcfef84af0c6b1b2e97f08202b686c"
+SRC_URI[sha256sum] = "c2dc51143b7eb63231210e27df20d2c8393772e0a333547ec8b7a205ed62f737"
 
 RDEPENDS:${PN} += "perl-module-test-builder perl-module-test-more perl-module-test-tester"
 

