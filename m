Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A114EC1136
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2756.1771874335838286196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vr8UB//8;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48371119eacso54442795e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874334; x=1772479134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnHZ1ay+QbIyDK4tAdWW/5xMMEzCBtT3qVW5gUPEB10=;
        b=Vr8UB//88AsXRkE/iLWVyHwN566MRyjbW4I2vHXQqVRvT+5GUPPKKHjzegrx+k9Z80
         THDmDICMgdheJH2BbGeKVPrnOHEdlMgXecSfPfrO4+pHCApB3pAR5ejNw+j9vjnQF0lK
         tHVWG4vwBOVWpCgnmq831HTIoBdv3dyLya3XEXCs9Cff0AZLnlDom7R8ZHVgXBMSea5T
         gvBOoIozQg42uYSkZZModuproQ6bAXPl8o8ah9pRx1UFYqVHkx4/UU8kpnK4OvCv2C9C
         2ep/nEOUOtO6leSSi45EyJZ4NfboM7Li/UNrUu0+HgbY7Z1PUcuub7eX1rbuadRME40V
         H3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874334; x=1772479134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xnHZ1ay+QbIyDK4tAdWW/5xMMEzCBtT3qVW5gUPEB10=;
        b=urrlrrGpZF8YvmRnzW47U09CYTbpC1ZTPAE6yUEBl7mv1miEGSTgta1bK6WQvxTQS7
         I2XxzG4+JatWjsJNiIGJoJXqa1lmeQfF53KEjjO+Msp+QBHMpK6UZaculjjuyZHGCdTT
         IkUmhyXIHDZK9Y+ptCZL5zYRVrbpTS65Nn2qMh2lrP951Jwe/fmlFScjyiEAxu5dtFds
         sJWET6Q2zMRMS30cqJ32dRSmX47a4MiVqUSzJBqMzxchup4DrjSihdeK9zVIcJ8B+rKC
         GWPfi2LvTx4GGBlMu0FqaqKK6/A/rnLFqeSt5JGo4/veuYz/DoYgVwuDiz5U908mhtYq
         xFzw==
X-Gm-Message-State: AOJu0YxzJjcJWhDKzLwmGKj+QRHkSlu18/StRIFqXhb2I+SOprkNeEJm
	q0+L9XbhKD2/4kUwSekUY+51s6Zg/+SLY1Vq3685fYAej3W5fUAfBsvIjziD/w==
X-Gm-Gg: AZuq6aKv1veohXp+25osfoyDjUnichxkig9iXI4CgLZSQOcXoDrxn5xylm18i6kg2nl
	NFUhlTdSf+tM+EXhCdmHcxTgvYwbgM/rwf7bHvW3j0baGpfKdUw0frO/VuWVauvm/0/9beDw2/E
	Y/WB+osptJ/koBh7VDHpUMK+kZjrV4S9icmQSuTeHIQggUWGkV/Qsu/1vqNHsdGsjjVbHSnHHRw
	cegaGg6I0iUMky0U0hdORhJ2NeBDvJtSN4+bdL3i8uc3VDnvl6H7Xtpy6LIoY/mvNyxBYLQMwRJ
	50Ije+WEcRnTWghZb3rMzYsoCxtnXwzl64FlOYERUBmFE/8e/Hf7qoHfpeHjko3P/hMoxfMNkjq
	M2k55vv1UF+gywqsrG0UPJPF7vPu1YxZwPJeR7XAmNCMZunS6V/lGew/FUvj5arqJEXQi+mQHaV
	dXg6QVbwzOQzF7mP3xIU+vLiP34VRy7Ao=
X-Received: by 2002:a05:600c:3553:b0:480:6910:abd1 with SMTP id 5b1f17b1804b1-483a962e49dmr184493765e9.18.1771874334097;
        Mon, 23 Feb 2026 11:18:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:53 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 04/13] gnome-shell: ignore CVE-2021-3982
Date: Mon, 23 Feb 2026 20:18:41 +0100
Message-ID: <20260223191850.1049304-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124558

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-3982

The vulnerability is about a privilege escalation, in case
the host distribution sets CAP_SYS_NICE capability on the
gnome-shell binary.

OE distros don't do that, and due to this this recipe is not
affected by this issue. The CVE is ignored.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
index c8a5e20899..802a6948ae 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
@@ -92,3 +92,4 @@ PACKAGES =+ "${PN}-tools ${PN}-gsettings"
 FILES:${PN}-tools = "${bindir}/*-tool"
 RDEPENDS:${PN}-tools = "python3-core"
 
+CVE_STATUS[CVE-2021-3982] = "not-applicable-config: OE doesn't set CAP_SYS_NICE capability"

