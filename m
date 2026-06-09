Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509DBCD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:17 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80819.1781014870252190855
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LQVIRNqS;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-307d0405e07so1091865eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014870; x=1781619670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8eT5ljnZdeTtLAUCR31GINAyp45ymQaME6yii4PEHw=;
        b=LQVIRNqSPhIJJCnVkbGF8xHL5PmkiEHtCS4dAKEkc/bB8g60hSf6gxGXPU/nsOlsd3
         qwF9nGHLwxHUrEFKhmsrqTcmewABSTe7Aao2a9hJc3aRH+ZIFXS/T1nONQWfXjtsYJyw
         Se6vvymnzXo3/FAaJL8fhR+gLslf28gK7cg/Ku/IBkYUvnZ2geK7wcp/EQffsn/jgOM2
         vFgTCyTGfj24qQ8n7iR4+LXp4VE6+5fYlB+lIcWWPbJmBQqfal82MptAm8+l4i+FjkI8
         ypkvh257xZS2856Ss4KH7pf9D5bHK5dhC8Kj3t9kfTi/oyM3K+HmZ8N7+XKkpPsDsnga
         xQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014870; x=1781619670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8eT5ljnZdeTtLAUCR31GINAyp45ymQaME6yii4PEHw=;
        b=iJaBbTELJw30gbaMZ+Ok6gCdVcq1Ffk6o2LgxCk2IMIgHN1BgSWIu/dRfdbW4ld7bW
         L6UHjepQPtM7gxWCSE8yNL9UuGSKP9u41Konm4xAe9+TRFWqqp9a/E7Va4Z8cgB+tsiy
         jmF8OD1sr616X7yTq66UfszYRHe2BwUxCi2elA7Wa7DyM3CErwHjMsxdKtqafExD1XE1
         63QMw/PL2sOy2DpIr5GgtPub2RnaQl4UqX0haJWdrDybg1XysvnT5AAPFDhoRYl35EHa
         mMMABlrPmNkGdjPDqCKJI15kc+emS115j5rWdAhb57SBWjfWQUyO1YJywYxzjsMGKyZ0
         WhFw==
X-Gm-Message-State: AOJu0YwunlsgwY4APtZr0jb0dOk5OfLH5rHN8z3qenJocemTfNIpt17a
	rycL8kCXRr7Koi0aKzerF0zzVhZDLWt6HerXE5iJr4TW7cW9yNCiFcOm3MX//Si+9pFkXQ==
X-Gm-Gg: Acq92OFNbGcwyYY1eEa4JQB2PXtpYw+97OlmMEKuPwLMTZa5ZqoD+N9ejrTHuBSRelU
	V1Fo+NauF166H1cuI1Yc//Ra/wy4DaZFp+cXre9ZRfUiGJVq/RHs45VbU3VxbjI+T4bQKNYEjuC
	IaSbMByI0oiQvrgqRC0PYw9pq3whb/dU1caCT2OIIXWv97NCGUwudkMvKuwbEUhgUMgNyiRsXtc
	cXlK6qZqymA1Gd/XseWZxUqFySusVWx7M8cwHauTdCFquibTUxMq4ukc/BOfbo3FvrqbeOv4F2d
	Cjob07SSJCAmN17WbuYJjT3+NuI0AssxAUNrbIJzU8ThY/7HjTCpXnWIZf8OMtmx4FjtQWeZvvF
	mtAThmO69zu5LHkQHi+/FirwFJ5aM+bP3nN6lw2DoohUcQ2R37l786+Qq2HgthQHwI4t51gHmi+
	9NV7freRoUMYGqtLqgdNfH1nUFjFN2T8BrqzKazSKNy3+Kvjb0uLe91ce0awHuKlK55flrEh2KV
	rWN1sWnetRZtZVEE4L/V3/IawG0zd2wW4H43HSxthvcDfYQAJkdW+WZbRIxAufXzC4YAiSy/VdJ
	xYNnjRAVqOm1RGDY5qnuLRiT/mPQD7003vAkYt1b91llu8x6lDY=
X-Received: by 2002:a05:7300:641f:b0:304:b93a:511a with SMTP id 5a478bee46e88-3077b311317mr12751834eec.28.1781014869399;
        Tue, 09 Jun 2026 07:21:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/11] mbuffer: upgrade 20140310 -> 20260511
Date: Tue,  9 Jun 2026 07:20:55 -0700
Message-ID: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127488

Use ${PV} in SRC_URI so future version bumps are filename-only.
LICENSE checksum is unchanged and the md5 PACKAGECONFIG still maps
to the configure --enable-md5/--disable-md5 option.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mbuffer/{mbuffer_20140310.bb => mbuffer_20260511.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mbuffer/{mbuffer_20140310.bb => mbuffer_20260511.bb} (76%)

diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb
similarity index 76%
rename from meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
rename to meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb
index 01e7645ef9..aef96f59db 100644
--- a/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20260511.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/network"

 SRC_URI = " \
-    http://www.maier-komor.de/software/mbuffer/mbuffer-20140310.tgz \
+    http://www.maier-komor.de/software/mbuffer/mbuffer-${PV}.tgz \
 "

 UPSTREAM_CHECK_URI = "http://www.maier-komor.de/mbuffer.html"

-SRC_URI[sha256sum] = "ab90b6fdce16db2bf08bcda0bc5d2bfb053a9a163d2a24f95fbf246460549b99"
+SRC_URI[sha256sum] = "13bab36f39408f7a08fb368913290ad0f117c934bab602094e18fcc123ec5783"

 inherit autotools


