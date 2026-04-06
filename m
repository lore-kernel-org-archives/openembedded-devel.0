Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4302BF46C72
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 19:06:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62683.1775502388064016700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 12:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WU5W0Lxn;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso20113235e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502386; x=1776107186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55nqvo78r6s2g7YaQbgvEsFdPvVe7BuN9XYpVSPFfUo=;
        b=WU5W0LxnwF2JrUxEQcFeYD1szb6EA8NCqsZeJhnv4/GgRo++C6bMXWLSkdYyb5jdd9
         T291yx7sJmQcUOD0QiCPXJgkmOnwoMeg+NJc6SeARRti1La0+W18YPer7vqUBX1U9NCG
         kzMX6XUy/+Eyr8txfTQtleFjDGSkgJQ2ks1ALzMgtFsoQoFJmP4RiYfD/5AA7YdmPSIG
         gFzddLXM8TcCpVQSFPucFIATqyoTv4kK9pbzn72bq2O8cPaUPBOMOTt7MzdzcDdCHL7W
         1ob33VlBpIY/XUFt3lWgfYoeYO8J86TvJQt00QAPMf4NAep6DwVzYkboK2Of2qGGlbEb
         d1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502386; x=1776107186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=55nqvo78r6s2g7YaQbgvEsFdPvVe7BuN9XYpVSPFfUo=;
        b=dA2bj/gGr/ajb0UeKatRyHyyLXi09JF/5UczpL7oMYHcziDou0JFUpcZPuKIZLAzec
         FwPN6YK4gn5HFoPHrXUGcR/HgkTbh5Xw0Mi84aJDXYxFx2gwxm8WGP0HvD+ANujIT2ED
         dDkWAxfRrNRGjBej4CWdVEwyWFLnUFpjSTBR3mNlEMCE6qzLmGYKV5NIUYREEebu9cZk
         Zm9yIv/AzUWUO2WFHvdi67D/qw3+p1hurUsNa5mwNExwrZ8GxVndUeT9pDj1aF8FLxwp
         Gh5jwhKNJD8LfL5T2oIxAKGKlfK1lnlGimJgW1cQq2AkGZzI8+FxmPH1qORk6pOnogDU
         UDXA==
X-Gm-Message-State: AOJu0YykYSKQdRcxbr4s7kzZ0izF/6cigNBh+7j8EFgJgulgFMgRj0RL
	1kURopi3VkLUzdtIbwYTDq+TYoT6JtTJ3Blw0n7dHCh0GL4Uub9AJYG/MgfVPw==
X-Gm-Gg: AeBDietU2PgjkVEyUZQuB6MGy1EEKM/M/atFPKZTqM5wSp2U/ptAXWjBM5IJlVm0Dzd
	KWhwlvJQPH7aQ2P0A6YlZVCuqXlwiYb00YAxIV8La7s3ed0IeaFez0rDctQ+VkPo4rgRI5d6t5i
	fipuRuXxeZwtReLva5kaJvCMIg5cNH+JGG+PdWTM3U1XFBHSMBeTHukUxAUqzEB8Ld9qvHkeRi5
	yaG08iHqXqTryNMTUECE0/IJuN2hqqzk22/qw96H74VoPZ1dR8NFJ8pUt/mRM4bfJWhwyr/pmUe
	Z8D50iipv4chB64QwxMAy3F6EjD+BWstwU+ZoJAmDIpeWH7GRk6GXOF1LrSJfvKQ6oEBmx4md5T
	h9dB0ELR5MvY0ZGj2zOQyXA59iT42U16csSqAYplr8Ub2dom1zKf+Y1bYCEsZot05zlVwStF6Hd
	cTVw0nfSEYXZk1PMCHhx8y
X-Received: by 2002:a05:600c:4753:b0:486:fcc7:d6a with SMTP id 5b1f17b1804b1-4889976eb60mr196775895e9.13.1775502386281;
        Mon, 06 Apr 2026 12:06:26 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488b6ff70bcsm115187395e9.14.2026.04.06.12.06.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 12:06:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 2/2] dovecot: mark CVE-2026-0394 patched
Date: Mon,  6 Apr 2026 21:06:24 +0200
Message-ID: <20260406190624.3889147-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406190624.3889147-1-skandigraun@gmail.com>
References: <20260406190624.3889147-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 19:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126063

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0394

As identified[1] by Debian, the recipe version already contains
the commits that fix this. Due to this mark it as patched.

[1]: https://security-tracker.debian.org/tracker/CVE-2026-0394

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
index 769e693c5a..0f4ceac599 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
@@ -88,3 +88,4 @@ FILES:${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
 FILES:${PN}-dbg += "${libdir}/dovecot/*/.debug"
 
 CVE_STATUS[CVE-2016-4983] = "not-applicable-platform: Affects only postinstall script on specific distribution."
+CVE_STATUS[CVE-2026-0394] = "fixed-version: fixed in 2.4.1"

