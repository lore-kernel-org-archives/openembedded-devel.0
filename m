Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7180DCCF2C4
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:29:19 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31287.1768811355665874696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AW2Dz/PG;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a1022dda33so24563205ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811355; x=1769416155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwxQKBZAC0m6HjIKrBFJrdzi0qoUI+HyhFzxBv1c/e4=;
        b=AW2Dz/PGAORJHMa8Uk8ZqrbTSDwTtPziZcnpT7qo03MbVhxs4YKVpDLAi0o7KVywDh
         aghqCPkRA3V9v+RlYHXJqSjge4DXfTj8iB4k3ui3CBQ0GgO3OOkOdaYhaJs88tW2ZGWT
         XrgohTV7v+bOHQ/XoBO5TXdmiTk+IJqHjwCKP05DkrzesZ2FVQ3Wqv4+KRqf58JWm9ND
         S3Po7wyoCpaSj7J++8V2tDIkxhPJwOL+T8kD03bWE3JMXoeNmV2RzPX+R++SZHfTtKW/
         E+8gqt3TGCkvK6VNgbrCygxwEyHIpwmTJTvcdF34eXdjWf3DaJnuUVZzNzCdzD6hQfIl
         rTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811355; x=1769416155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bwxQKBZAC0m6HjIKrBFJrdzi0qoUI+HyhFzxBv1c/e4=;
        b=V2Yd474rK2yD5bAaKf+lZ+xZRed/Oz+aE7/GpEC+xN4U3YNykbQa+G6FX7m82P5JwS
         XJVrxn3fbJlKLpMhETd8qm6w2EDjVpP0bxZwjNJhsN6tyWvybQ41nnY5K7qj/mal4PCK
         p8m8+NiwPefe6p08xd/eJRsZUM4NSI8tf8uh3Wuq0F40YJgxWC63hSFMClJlaP+xtpzN
         bt85EOOSUuJTk14Lj+z/v79OpuCF0yNtpbWGSkIhmzGKxRmCRDEI4D6i6w8Y7eeIi4I9
         u4T+OHyHDn5HNesxZFRmaySS7/hDjH5TdcxsSFCrbgRFmMkOFPj9ZUnqLYO2oNbSWkqi
         7iJw==
X-Gm-Message-State: AOJu0YzHx9SqcIh7wljalY3ItXYZNrd1/oP81Aw+svVHDenFd89NZpCA
	Hs4rNFGDkg/GBUD9Y3QV6/ev+2bdZxZhg/92NmSYpWNlL7WvBVaau86Ih2emAw==
X-Gm-Gg: AZuq6aLNrtV7uo5ubHbhTl+n20j7TlQKJTdV4WdvzQXKTktzkT3UOdbuECyRmNWGuLw
	rP1YbCUJXhFu6n7BQt2O89r4x2soZ0oRILw1uArWjttO56HTo0mR71aKmno19wvY5Im9fuTcw1b
	IKP9PrcDj5f1YoXSC/VJnkclmBDIKQFW9W2XFFJLDZiUqqU6E7re846v0Tq61RMnce5s9xLf00W
	rDz4J90ncF1W94PcftRXC11WvGI29ZefREuOVI6c4DIlzzjue67nejCK8COEpd2ZxgKf8cCaexK
	ihjuGYft/2oUZX6V95fetEcQjk6U9y8qehvgHOKDJ6UIrsvyVap/5EXr45qSZGMW3FOuTEzRONk
	1ThQeFqNxl/4q6W9AJe8CDtDr/NRqu0GXgaRLH0UuiGwavw7kOm9nrELPHpgIAhSBQeOVfEjMhd
	pNk0hM9OR0/c8/wUsrrxIjyPwxC6N2J4jHFw==
X-Received: by 2002:a17:903:2f8a:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a71754509fmr99051495ad.13.1768811354811;
        Mon, 19 Jan 2026 00:29:14 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:29:14 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 28/28] xerces-c: set CVE_PRODUCT
Date: Mon, 19 Jan 2026 21:27:50 +1300
Message-ID: <20260119082752.4120991-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123622

From: Gyorgy Sarvari <skandigraun@gmail.com>

The related CVEs are tracked with "xerces-c\+\+" (sic).

See CVE db query:
sqlite> select vendor, product, count(*) from PRODUCTs where product like '%xerces%' group by 1, 2;
apache|xerces-c\+\+|29
apache|xerces-j|2
apache|xerces2_java|3
redhat|xerces|3

Set CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 29a272744a314564035ec4a337704eb6d31e879e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
index 2819366dc9..102e329878 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.3.0.bb
@@ -9,6 +9,8 @@ SECTION =  "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
+CVE_PRODUCT = "xerces-c\+\+"
+
 SRC_URI = "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar.bz2 \
     file://0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch \
 "

