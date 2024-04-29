Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFA8C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:05:17 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.18094.1714388708197801187
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=MCircn8d;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.218.54, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a524ecaf215so539938466b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388706; x=1714993506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iO1x8ZmvfWd+1VE97+NR7s14sFmPt+vXilGEtPZjH2s=;
        b=MCircn8dIm9pvWlfOukeD9/NDHh08EBWTtISV1vd0VIj2H4CcKcLMnlU5XCUd13B/M
         ZsSIr8qkRCEUevZ/et2RtjxqinbR6GIb5sAqElahBOrrfj4JupqbcDAta05KSlxqNz1S
         TlUsAEwPY0HMG5/6Jot/LK546TTn7QWeLUFW3e6+LHtwT7wMQTvCFgY3yXcZt1Ic76tf
         c6TuOrhHme03b4jJrF1HAXpzpNqHqK4+BurhqmabhrJcUSUXdJVU5pn02vn2bYJg9TlA
         u2j+GcjnYVmjZm0Bwn+8ADptNYGL3Tf5JjsOqokO5agEa934j3NC4ZShl/RSHhM7BiYo
         2/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388706; x=1714993506;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iO1x8ZmvfWd+1VE97+NR7s14sFmPt+vXilGEtPZjH2s=;
        b=uBhbsv4ACQUTjwfpjWBN6aCekI8QcB3cMntdrCvwmzSr1M9TFswdxOswvdK+BsLROq
         UwEVcykbVKIZRFPGxj+zmBjE/nCbZPtIGl2KolbYjcRYVmBbcg+F89ld5tl9nnsZ/lqy
         cEDZG/VSF83kwnDQ3jp22jwRVOE5ntSuzkG/VAwk54XuLWYKGFGYHIhAAGPOfjivosrr
         +fmU7uP4M0KiAqNvCG+CKhFXo/frg3Iu/SXsHkMlyQ5kudzt3plauzxRgQ/dagUmZjyM
         4883I6GdERBHTwrh5nYBpbUFThPMFtl9JGJeSUkPsEJhqFvBMTsOPN0lDExAztNVG914
         LlJw==
X-Gm-Message-State: AOJu0YzrG8Tb6BYMiuhk8LppZ36YwjHYNT2nA9EJ6XWA73Ws74+OiAjT
	y/rF7ql8m5glmU/fLzhA1Ss37f5gSsX8j2zl5OqY9nxc8GSNsVBSkcHBNDBexYHGkt/juzjwQ1Z
	OU3c=
X-Google-Smtp-Source: AGHT+IFJmj2rhHwL5fTSxHW94RGt/aN37WTcSwsa4SXP/R+eT/Vwz7sEbB89yVImLzdrcygsyYdp3Q==
X-Received: by 2002:a17:906:e82:b0:a58:ee4e:1329 with SMTP id p2-20020a1709060e8200b00a58ee4e1329mr3946065ejf.35.1714388706333;
        Mon, 29 Apr 2024 04:05:06 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id j25-20020a170906279900b00a58e170f175sm2983452ejc.63.2024.04.29.04.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:05:06 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] procmail: Update status for CVE-1999-0475
Date: Mon, 29 Apr 2024 13:04:59 +0200
Message-ID: <20240429110459.52299-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429110459.52299-1-ninette@thehoodiefirm.com>
References: <20240429110459.52299-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110171

Current version 3.22 is not affected by the issue.
Affected versions: Up to (excl.) 3.2.1

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index ba268de0a..723e15d10 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -43,3 +43,5 @@ do_install() {
     oe_runmake -i BASENAME=${D}/usr MANDIR=${D}${mandir} install
     install -m 0644 debian/mailstat.1 ${D}${mandir}/man1
 }
+
+CVE_STATUS[CVE-1999-0475] = "ignored: No action required. The current version (3.22) is not affected by the CVE."
\ No newline at end of file
-- 
2.44.0


