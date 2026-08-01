Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93DAC5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:46:06 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13611.1785620757121844170
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K9I35/r6;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so23429705ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620756; x=1786225556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PsZIgcE2NAIJbXO7pCYxipwZvNgXpOyVNp5Qfwh5m+g=;
        b=K9I35/r6F/fHb1PvQ+ybrEsVp2sJts11iAxHnRKYEQrJlkyHb5hpwRoUZhdd1edwyp
         f4Rj66CyEcgB0VjF5kkpngSvpWxva09W2Ppq7VC6+zfhqLYDZ+aIwlzzXY6n6zODv1aX
         MIKd6D1I95ibJ+eBHmRhnH95G/ETPckH0XtDuME3NZG5puAUxluYV6fS2Un1KXEwKEEY
         jCQP4pBd2gKxDj3hOVGa8kjqISJptttFnMoDXE1NtcwQWZFpt0Ujx61NbCNABb4kdhsV
         4VaEKlYIlaSiUH0XLirEdl7hKBLIqpID8YDBl5Bq3bffDW9/Ccz49OcrLCpCbIiJbhWB
         y37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620756; x=1786225556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PsZIgcE2NAIJbXO7pCYxipwZvNgXpOyVNp5Qfwh5m+g=;
        b=n3RkiiSPPu218oP96yH/7cpElOdtdVjCv65qnMs3AYvly8lu6Him2litDHBe1PflJ7
         fm2Q7ypyzDWE93KOlTYCcgOdj9HOxzEQyax5ur00qbModJYtLsePhLvbCeYAOjep63N9
         U718oZ7MBNzAUAha3ZYKROehKiIDsRpQJ03GWx75tCNabhuVVSaUGuZFkthfxKNTy6Qz
         3GiAzKAy9P7m2AkfUY/VDfsA1LnF6M5DtwFZRzzbFnKjfCM9lm9E6G9KZ44F6or+ACYw
         riKHcIgnEmy7Fz6tzGDzhQKG4VDDSIHI/eD+2uegtdepchFatPPchFciEC7u33qwqn0/
         iEZw==
X-Gm-Message-State: AOJu0YxaoBg4Pe03413a3QU7Fmd9Fq+qqQd3Eiv1QAZwQANezdr6SufO
	CCcB9s+m/KdqjqU3f4R5D1YQRKWNxGeyT0pqvAFFY3HLcdt1CnFr2I6gR+7OFGXu
X-Gm-Gg: AR+sD13+dXKUXDsqvxFR3efJgEjRRUXg2UdnZUDNXwujrrCpxH436CNH/ha9m/7RUy6
	weXjV54wrGTNqgVYO/WRuCqNpNtaKAcMLdmxJe/jOrxEc8CEAbpdKtMS3haOCHiw409S7PcNHqU
	aUClcbWxiMqckdygRHxN/YOudvya3a8om45OdrPWiWRstPgXY+Cp3Xar/9MBvQBwxqde3iaIRhE
	dizouVasol8DtMmdFNw1DeFIJ0cwunUWnZ/GnmkGhIb0q/v+X6PRG5dKqOiwzqEybuTn9CMgrqh
	pBjWn8fntcYJ0j5/VTkTK9qQodG+nwicSiyuZ7rWzNWbEhAxAFUCZYNiOBUo5p4t/VrbQuOIdYm
	2F6WdBZIBC1JEvJU1+8yrx0js/o4fYoggpwz4LpuBPXSGVR8YWME6xVFoLxgLnmN9bG/2j5mMLv
	Uw93qscz06lBpykeCZG7iaP4N2WLuix+0gix9eGFAI0RORevcqsjoDxTYumnq1niDZOMD2dfLAF
	wiEkABCIf5lGHSHTgabbfHmkoWwsoVZT/e4u4ZV9x+qLlrOKVffeUeWqFZM00ETtFsZf2PiJmwH
	yWFLWm7ZV4kQ7LG/89VhPNrWMEAK2N3fAQvTDoiwy3jK+MVyhUyAaFPkmDbno+o7Zn8O9z90g/y
	7lAgvbng4wDJJ
X-Received: by 2002:a17:902:f612:b0:2ca:f44b:63be with SMTP id d9443c01a7336-2d0521bc1b4mr45861195ad.3.1785620756482;
        Sat, 01 Aug 2026 14:45:56 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 28/31] turbostat: Use oe.kernel.get_version_file
Date: Sat,  1 Aug 2026 14:45:23 -0700
Message-ID: <20260801214526.788343-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128645

oe-core commit b980106560 ("lib/oe/kernel: Move python functions from
linux-kernel-base to library code") moved the kernel helpers out of
linux-kernel-base.bbclass into meta/lib/oe/kernel.py and renamed them from
get_kernelXXX to oe.kernel.get_XXX, so get_kernelversion_file no longer exists
and expanding KERNEL_VERSION raises NameError.

turbostat is COMPATIBLE_HOST x86 only, so this does not show up when parsing for
other architectures, but it breaks the same way as zabbix did.

Switch to the new name. The functions now live in the oe library, which is
always available in python expressions, so the linux-kernel-base inherit is no
longer needed -- it only exports KBUILD_BUILD_* now, which is of no use here,
and upstream intends to remove the class entirely.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/turbostat/turbostat.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat.bb b/meta-oe/recipes-kernel/turbostat/turbostat.bb
index f65699865e..fcd1b116b8 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat.bb
@@ -16,8 +16,7 @@ LIC_FILES_CHKSUM = "file://${UNPACKDIR}/COPYING;md5=bbea815ee2795b2f4230826c0c6b
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 COMPATIBLE_HOST:libc-musl = "null"

-KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-inherit linux-kernel-base
+KERNEL_VERSION = "${@oe.kernel.get_version_file("${STAGING_KERNEL_BUILDDIR}")}"

 SRC_URI += "\
             file://COPYING \

