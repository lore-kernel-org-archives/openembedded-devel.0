Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FD5C54F52
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:27 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3024.1785293064478259247
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M/YwG/fB;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso259069a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293064; x=1785897864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=laVXVR2fhOQ26pQJl4/PPTNC2VCuoZE//VxPU9tY2CU=;
        b=M/YwG/fBGkxTD91ixryoztZ6P2TJED4U1PvZwjO+xvDI5tO6385OtFmyihCBG/Zr9D
         CpSgzrnUbtQ3w5uOdEDcsAEmd3jklwgSV0aQgF+xzVX6KNlWWfnE0x2TjCdB7ndkYhVU
         WDhDKVp5wV5M/944qTKFILxG5n8sc1MmISOEFrrCh5I0BaUr4T5rFljYYtusaGT3oxTc
         uZTUzACcF3n938kCuSvX1fDoS0neAD53TCcvg8eEZPj9A0mzFfwg6hAE0eNcST1/8eXH
         LaASjZSiDW+qmQnzWbARc+01mpN/bPZhLqH1KaEqyZdc9or/h7gHfAg+Ml0NYy0AxRea
         nH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293064; x=1785897864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laVXVR2fhOQ26pQJl4/PPTNC2VCuoZE//VxPU9tY2CU=;
        b=YwnKZuLvV35agK3Wd/mxCm2lgZ/bnAqnxIgMgvIg929sI9FKP5cVGD/JzxMy46hZb/
         ZOg6ZQeZh2CrDLhDONrbfvv660ttA87Oj1XxM0PcwrztXiPruQHXLVKnvUtq/v8vN9/N
         aB2i9bdmkz8ey7FEBBnwEAATunF7TzwW4asvmcEHzOfzQB6LXQyMhJmS41dN+vPD9bx3
         2ZQW9UATjBRqUY8+D7+fyozRPgHaJVsKseEMVgszFa00kNvW5P7faDyFyDwIJTjZR2a1
         /5sFmOVrYsTyM2tQGetJzVDH3IXjsxmyRJiBeSWj9Y1bBq9xLHa8nhNMYqefS1k1dSNb
         dLNQ==
X-Gm-Message-State: AOJu0YyWSzV0eDBOb2EqvHzl5DNVpD296/R2ZS1DZ3anEX6I57f6DMyk
	+LttJ5MuTrxPs0rIeKsHTqQE7Ry7oa03jqDeHJcAWUsEuMib6/L4jHEBJthWJYMh
X-Gm-Gg: AR+sD12osaqIvfAlNHNF0E4/Lkiiq5KttwEoMZVS+GEprCnXOAKlnxMHCjX3mR6hbWW
	K1Q1ll+0z4wxklWEsQmjyQYpHHDidZDjM7eK6Z3eY27Bh0iNrTqZ3GZAtb+wCIP0ja35VXHkA2L
	5eHAyC3ios482UaodzMHB/Tg1PF9vAd4/tdPna3S1KU9xJxXMmwq2Sr1S+RJw1m6egy/pEkP1OY
	ZHMsIHD/BYAVvJC4Ggnhxgc91Yz6IL9rLEHIqRAfPBto7cmtV/on/pgCa4EsDCtYQlRMIsu6i7I
	ErOsZVyg/gpHDm6taAV7bJO4o43Qx5ylpNZNcKONEf7wIB/INXaT4VlSdLRJ2Zw+2HSgbcrDaon
	En3U7WLUlKC7hHRikN9HhBUMvKfkcbdVmZhatLeOwvHcEZtdD41OFrhBoN3+cZ2cjMUsBQR3eOf
	zQwhku5iNdOLsznQIdUeqO9IiY2iP7zJd180uuGeX1ZKdz2kkwmU1CZb38ze6+ifa7hTmZFiJzo
	+zsInZlX63/wwxR3+raeUo2rOvjm2iCKOrP4P93KGCBMpTkjdI1/fAD4l7IdGexCXfICIGNw4BO
	t/fZGZrZF41GgTOA1BsJNEOhtzqI8rlSuzsyPu6ZBhw1Rxvad1tg7Hn2B69XNqJgt8N1h0bRqJm
	vOw==
X-Received: by 2002:a05:6a21:4c13:b0:3bf:ab76:63d with SMTP id adf61e73a8af0-3c8aafa291bmr5426694637.11.1785293063744;
        Tue, 28 Jul 2026 19:44:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/18] atop: upgrade 2.12.1 -> 2.13.0
Date: Tue, 28 Jul 2026 19:44:03 -0700
Message-ID: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128517

Changes:
- Allow sorting the process list on any column via the new 'O' key
  (case-insensitive column name, ascending/descending); the 'A' automatic
  sort on the most-utilized resource is dropped.
- Show oom_score and oom_score_adj per process, and a system-wide available
  (reclaimable) memory breakdown per category in bar-graph mode.
- Improved offline/online and hotpluggable CPU detection; maximum number of
  CPUs raised from 2048 to 4096.
- Show full user and group names with the -i flag; support longer pod and
  container names in parsable/json output.
- atopgpud now also gathers graphical-use NVIDIA GPU stats, can run without
  root privileges, and uses UNIX domain sockets instead of TCP sockets.
- Raw file format is incompatible with previous versions (convert with
  atopconvert).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/atop/{atop_2.12.1.bb => atop_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/atop/{atop_2.12.1.bb => atop_2.13.0.bb} (97%)

diff --git a/meta-oe/recipes-support/atop/atop_2.12.1.bb b/meta-oe/recipes-support/atop/atop_2.13.0.bb
similarity index 97%
rename from meta-oe/recipes-support/atop/atop_2.12.1.bb
rename to meta-oe/recipes-support/atop/atop_2.13.0.bb
index d40b95ce6c..625a7b0937 100644
--- a/meta-oe/recipes-support/atop/atop_2.12.1.bb
+++ b/meta-oe/recipes-support/atop/atop_2.13.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
            file://fix-permissions.patch \
            file://sysvinit-implement-status.patch \
            "
-SRC_URI[sha256sum] = "4fdbe67c5dfaf89405639e18599f4eae77978073ffa54f3c78c368ab54bd12f6"
+SRC_URI[sha256sum] = "ea182f84c9f52ca922e5af4f17dff97ff424400a4f2f92393317a6af66e6a874"
 
 UPSTREAM_CHECK_URI = "https://atoptool.nl/downloadatop.php"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+).tar"

