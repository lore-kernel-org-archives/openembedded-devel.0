Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA68CAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 07:46:06 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.7556.1758959156898163183
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 00:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EFU8wgCb;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-634b774f135so2733464a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758959155; x=1759563955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDcz6crphHhcbWc+B6Cu+nUa/Q9DUi5UKXGJMPsvFnA=;
        b=EFU8wgCbEQ4vmF6MOaI9xDgR4aDuS1+di0aG7ClfHFm7Wp6EpCdJnLfCMAsoAABgQI
         DFINkD1GUHhVSgxJaeoGJSyVebeUUGbyxy0LH4Dd4l+BliAI6hiHK8nM9kS9CWaN4bnR
         cTvDsJ3zL6hTVNiJ0XNALPP8+PvQmV7o1l+iw6eB1tiZCUZ2I6GWGX6TjOeueogBkXA2
         Xke7AFc7xktEoDJg0VTB5Kfn+sYL97fllPkxcgxR1pOpIi2sxPmIUF4UUIYqXub5mktX
         GpfQt+bVxmnFburgFNKeQmXJ+NWPWp7LLCHxU0utdfG3GkhBuRKp/I705LPX/Xven0n1
         u0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758959155; x=1759563955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDcz6crphHhcbWc+B6Cu+nUa/Q9DUi5UKXGJMPsvFnA=;
        b=vNNR0FfEWSU8ZIU77NBKomxPKny35UMBxJzT6uoJqMG3gu0sDKXb2DL+dK6mkujVs1
         3sSqrdNoZ8tP7fHVcSTZ0QaRTWRny9g+ir0ZqJTVj6TkNNB5goPgDt8/YGVB0houRB6H
         67rGasVPaCKSoBSH5viu/VOZ24GpfK+mUAbgzMFZFbvx935n+5Do69kfKzIT36S2yQeM
         N4WunaMrIJeuqOXnYkCSEXFffPcvnr8gia7Am1NIB1rQ6VwJO2yQDi4HahVMfZx3sDVS
         HgbB7dlz+PfxygSJbELfZP5spMekbp1QTOdjT8tApIqO9dnJtkJ8hXbubwocDnA2pEHr
         4Dmg==
X-Gm-Message-State: AOJu0Yzj4diF+xqw39ClJTVFSkqEUSTW1ogjugvoPjgXVZrgC9jyN5CW
	O4JLaSYr3NRwOd1xHtTmdfQMsCLwQVN5SwGzwq5gezDUVERLMEWkmndRm3v4DA==
X-Gm-Gg: ASbGncsJ6r2Lm26TWaxJjnr7T2RnR+j6Y951aIndsMCKS0BncR9unzn2iRIaZ6k7dKz
	LB8NFAP4jwas45WJE856tspDRqqSBh1Iionp8ddTUbLdf5P6ptwfyR7Cl/bveZ5B12DmLZFKscT
	6HqnYzaFUYqYzF+Am2/b5tIKDlKMpHzTiBtNJmjPan6RNn82F8xE4mNZrUKy6GhAjyZYd7lPEqG
	0uzb9X0oAgzQ1QCI3cCjEyF13rNwwcRNEArIrV+AaBnKNfuv+Vuz0imnu64eJuWg9CjGARHF2Bz
	jkBuLag5y7NtOAa1EohjHgJ/OCIZeae2CR6gvDIeUQHqC4BI4jRppfRcu+GhtVGpKWgWg/D6zMs
	WrWCDn0AeGJuzZLsIh3EK
X-Google-Smtp-Source: AGHT+IEWGDQyzyVn/L99QkDeCDJkzaXPXTmGggjdNeaG6R6PMLH2RSDYkG8IPnZHQjQruW3yPdG/MA==
X-Received: by 2002:a05:6402:4412:b0:631:6713:3ac2 with SMTP id 4fb4d7f45d1cf-6349fabb58bmr8592071a12.38.1758959154981;
        Sat, 27 Sep 2025 00:45:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a366116esm4061515a12.21.2025.09.27.00.45.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 00:45:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] psqlodbc: set valid SRC_URI
Date: Sat, 27 Sep 2025 09:45:54 +0200
Message-ID: <20250927074554.175225-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 07:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119977

The old URI stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
index a1ef8e75e9..d3b3ea5109 100644
--- a/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
+++ b/meta-oe/recipes-dbs/psqlodbc/psqlodbc_16.00.0000.bb
@@ -19,7 +19,7 @@ HOMEPAGE = "https://odbc.postgresql.org/"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
 
-SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions.old/src/${BPN}-${PV}.tar.gz \
     file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
     file://psqlodbc-donot-use-the-hardcode-libdir.patch \
     file://psqlodbc-fix-for-ptest-support.patch \

