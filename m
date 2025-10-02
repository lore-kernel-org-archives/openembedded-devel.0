Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE98CCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7962.1759409976923218031
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YE2Ip4ig;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b4539dddd99so205528766b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409975; x=1760014775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bIeheDGakJIuTvKKke5If7uckE4w23E/THcMy1oFlSY=;
        b=YE2Ip4ig/ID+Pn5PFNNeN6CLo7rXuTWTiY6+ZlHvnoBjk3wa9gz5MHwNh+NPxLs78Q
         zTTJivudxs6enUW/JMjHkx3AdHWf5G/29FMp/IVQrG/U9q68+jbqKH9VPv94opHT8GDy
         EDGP89kyL4rS/cArERqWZxMN0HW5lxGrFLonp668lmWPdioj+xcES384/3uJ5Nwpt3Ps
         Y0Ptywj6ztvP4OoCsf9T3ODT3iCX5yojjC/4dfdNatopHpFpXmaVwlAmsGYwZ6pxRR+Q
         xa8a+KX3eKncy9B85CsjJDlbj32cEHn8Ym1/p7x1tYunHoFLt3GHleprXx88v9TbYZSg
         qIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409975; x=1760014775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIeheDGakJIuTvKKke5If7uckE4w23E/THcMy1oFlSY=;
        b=GzVY65vHvwm3QkYwTp5wcKA00EiRfzAPdjCC18Kiv4Lg8sJWcrngCQHnl8TPmJ6Ya8
         +UYXnS44s63/82oPRtENqDwFb+o516oNmXWmTDyvWy56StwcryfOrpQ6NQ4UQSwl/8+c
         2SrztB44m8edMxXHhL8xs3fW2iT/9B+Z42UGNehmBD20wWz6ojj64ZmoLTQhoZOBJZ5j
         RmLslpM+BNBrFWCRM5sOZQgrvPYenJY2josl4gWpUOWlYIOiWEvdpWYHY/4yVFjtDlAS
         1T5KIRUhU+CeZ82SoZw1dEJ2aYgZRsfjjQ3b1AP2N6QcL0g4VNvcLDqM/Hdsmyx+WCEr
         Am7Q==
X-Gm-Message-State: AOJu0YxCN6JYQPNS+947ZnsOwffmRChDP7+jjJmCJQfybFQw1IkId/sc
	bHM/2sHIrayjsasZMlxvYb6WyNEOqaLn6fs4JkaPsdNlisBcAbU02JgwzSndAA==
X-Gm-Gg: ASbGnctMLUvg7QGMwRYeSAcVefL8aRkrPtCXnHDN69t3DsT+cmE5mjoOJcjCrotiyWx
	9rSSOLmPB/7Ry/F5l0ErH3xox/SMLJJQSesCywX2szJmXIwrpjr2PGucx1RkqMhCXbiwgl+DlsI
	626+SfmwXXiCSh4n1/1GmqS9Em440GRAKD2hO0Cb1qqwLmNAQS9aHAPIaD43kN9bfSXCfqYR3Eb
	RpoDyHEimBhSxpGOt5zG91sj82X1gtmDpMnl2cR1gJQGB0KzvsY1E1nGmlCPD7l0ct0UJ/b21Fp
	uouL1K/0/IWgznrMd2cqwhoWsvVn/8/oAk8X1KISi/XIEnfcLdU8VGqiTv42rehEWO1ZBEQvm8m
	0dZ1rHMGzD99m45nwf/0QZn+/W0UZ+mbOpfz0KQUe1yHlACcv+IZpv/s=
X-Google-Smtp-Source: AGHT+IHWWUmzZNLqPcYmvQXoqG/aZfRx9U15LL4buGElU7m0rYcm78vBwnunZr9DmqU+pDOlp/wAKg==
X-Received: by 2002:a17:906:c107:b0:b3a:7af8:c4a2 with SMTP id a640c23a62f3a-b46e2623a1amr996655566b.10.1759409975070;
        Thu, 02 Oct 2025 05:59:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 10/26] procmail: Update status for CVE-1999-0475
Date: Thu,  2 Oct 2025 14:59:10 +0200
Message-ID: <20251002125926.2624522-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120179

From: Ninette Adhikari <ninette@thehoodiefirm.com>

Current version 3.22 is not affected by the issue.
Affected versions: Up to (excl.) 3.2.1

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 30e6d975e8d7567b40cbdfd22e89bc1a7e1a9c86)

Adapted to Kirkstone

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index ba268de0a5..2e2735d192 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -43,3 +43,6 @@ do_install() {
     oe_runmake -i BASENAME=${D}/usr MANDIR=${D}${mandir} install
     install -m 0644 debian/mailstat.1 ${D}${mandir}/man1
 }
+
+#fixed-version: No action required. The current version (3.22) is not affected by the CVE.
+CVE_CHECK_IGNORE += "CVE-1999-0475"

