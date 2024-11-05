Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95963D33A40
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.27860.1730831922015968001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cqnrh2oo;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so49029977b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831921; x=1731436721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPfQCsD23snBxRSa/f165/yuor6CzlMpAON+8abmdGo=;
        b=cqnrh2ooWehz74flGsFE2rTTFgD95WqNEBUwpgeQMPfmFqw7KTluvm0sn7tgFbxgwI
         E347GxUkm/fzx8GDbrGGNSvwmBXVVHujS6YZLvwO/w0FshbruxLCk533a9HAb8YEWoPX
         ye07YkRnyIosukBV8PafseZvoi/V7kJdb8yEQaipUUgV1ctLohBb6G5YSkXwGO4jyCW/
         oEOeTTqWerDgdHioD+D4P2W7xKKyX/9qt3mY4qfJWXMrXlmJBueqvG8xnoCdgPGxjDVG
         /PsR2lBzNx9lT9a1SIvQPH6+dAh6FQ+sjPYUJv8aTlJ36vFYdnIycrC7MeFTL4F9MjXH
         MAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831921; x=1731436721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPfQCsD23snBxRSa/f165/yuor6CzlMpAON+8abmdGo=;
        b=G6Y9UYy/oE8bdoInTWm5d5EvR3mX8S/UoRjkssbUFI9TPHDlTJNYQeEwzhDRx+MEaz
         8smmZVJAldLeLauwsY/48n3kHVz4cFrm5u8TKeZePuHn1aSIM3/lTBXzH1q/UJaZ+8JP
         z6uZX4wn+xau5NoGNebyvd5tFLgwSOueYT67DN13xwFtU3Vk3cAaMFYp1aLO8anyDU31
         Bccx3UUCMo9QX7eR1nEbC4/ZGzU5/VEa+Z8/AFw+RTCGcKPiWyMsbpLsnTpsikJcvCgr
         tgLvku0zl5pKC1l1ISw0PNjNx/c2s8QW1P9L9Aw7JgSPQ2dFSjSeRPHYp58NvbqJHv11
         sLAg==
X-Gm-Message-State: AOJu0Yx2ZKqBHRKWu6JNcdAKYsthUCQNMVJD0syDeg8RrwpA/z1nTOdq
	XzXTgzqVhqRE24P9xh9CC9HNw5xc4b5LM08D6sso8xWa3k91ReIJxfAknawH
X-Google-Smtp-Source: AGHT+IEGBa8SUCE2GelnDnTFg+qQo5yy1qwhJof6x6/RgL5LXzuUiFj/KTgb4pcquQRDqJTLX1wouA==
X-Received: by 2002:a05:690c:4a02:b0:6e7:e3a9:f30d with SMTP id 00721157ae682-6e9d8935894mr381570677b3.15.1730831920556;
        Tue, 05 Nov 2024 10:38:40 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:40 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 051/161] pam-ssh-agent-auth: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:27 -0500
Message-ID: <20241105183658.34982-53-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113566

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
index e9508b6d4..609d2902c 100644
--- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_a
            file://0002-Check-against-the-correct-OPENSSL_VERSION_NUMBER.patch \
            file://0001-configure-Include-stdio.h-for-printf.patch \
            "
-SRC_URI[md5sum] = "8dbe90ab3625e545036333e6f51ccf1d"
 SRC_URI[sha256sum] = "3c53d358d6eaed1b211239df017c27c6f9970995d14102ae67bae16d4f47a763"
 
 DEPENDS += "libpam openssl"
-- 
2.43.0


