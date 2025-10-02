Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6705DCCD185
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.7966.1759409981861547924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OZww+m2c;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so2024969a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409980; x=1760014780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xzky6Zs2yAYX16LGiIvOMJyW3uwEgXdc6nypyW2uJYs=;
        b=OZww+m2cU63luqSJNq3jjrjXnI84BqHrc4qZI5GMPwQouRsgYLgwF2sPEZSgv3DG4H
         7k0JgXsDZQkz1ZwANpyvyxDnijbf+UFwtY3PQu1gxtG7JS22xpX1n+iESud2sRfj//4T
         xmug2DJZw1MqfX3XnzsOuYxDPC9vCcSDyMpWUDHhzkPIPLTpc3yyn3TX687TOPMVvkxd
         PZ8Zz2MUpHSYQxo0jvvTjuWuFW3dGSXmt4U33er5tBYaMzPwjjqEhjWCgarSKx0IoRAs
         Rh9zMFkRCGH2Y1r9pm/+WL511/fb+/MKSbAQ+abwnEFjQOidDdghJEOdixi11cSGYplc
         V5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409980; x=1760014780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xzky6Zs2yAYX16LGiIvOMJyW3uwEgXdc6nypyW2uJYs=;
        b=FywQoXFAYZN5uUkHRLXt5RHMoGD1hXYuU8NoLo4EGsuPTEw0yKd1trvxInVZgCyURE
         /JQQkdL6XAz4f7oBCMxtr335Q0wwvUON1U/nTIVzcF35zoZ9Vpf3hZdpmGcO0Xl6+NBD
         TtSjXCLOcCLZYPGdrqMGMtuEhKj8txCC/BeaoHFKuo4tK0lVlWLOVEAoUTd+dg8DaY0q
         6FfpaPDFurfTwU+1Jn5sxOo3MGFSAzCYbWTMy+CP46UwDiTLozPvyiA+7qKuWsbk4/5Q
         qRox4HVkQHlpHoOj3c/Ql1/GPZe/WBC0fefHwwz87E/xuuIbehWxRK/NY2ivcIs1aBH3
         A8yA==
X-Gm-Message-State: AOJu0YzOtrxDGxOAFWWJEMGQne+t4k+02hZ8CdtHoDDjwtSU8VzEEMs5
	MHO6VQ3pzHCi1Ie5CFNA+Hywz74KZcN2Nwj6qZjwXwSxEfdDLryJQKb1PxSCFg==
X-Gm-Gg: ASbGncv+Cgk3Qj8jwhOYZ1e8QLkqaTvt8ABJAM8shBDfFpe2/VJdfZaiped/oLbuwEZ
	dhGzf4qh3ZeST7hCmf6n9V3htC1tH+Q3XLvQq3uFMmOmCBmOO0hmXoUPsdZMUc2l5ShOPg+pF8V
	d0Wjx0IIaWkIS5ZPAI86NCYh+nR9g4cEF8EdDKiMeXjCNwhyIpza+PdyF6TzKlMuRCTXHjo9YZC
	NM029RAxOxNFCj4He6C3OzpJ15LkM1tXUUcBMOxuheJFqeCdt3yl7kr8JYc0hSSpYGhFzzP+1I9
	xTbKluYO+7Uij7Lf96pTGi3BtH9Z9doRN/CPPEswrb2xdO4oImsttw2Pp2CV0GnebLDnioJWR4S
	LEfUVp/gtUK3ltzMfFVfZUn7PUt1LR5FkAY1uWuPmVwSMS4/Ca3CAXQQ=
X-Google-Smtp-Source: AGHT+IFKyKFWjWIW7pGMLPSektguseKHXt1nMr1yHIu5VRrrBgYr9zcw2i0IcHGzcEJ6wRqI8db9qQ==
X-Received: by 2002:a17:906:6a1e:b0:b3e:256:8332 with SMTP id a640c23a62f3a-b46e5e315famr996142766b.54.1759409980151;
        Thu, 02 Oct 2025 05:59:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 17/26] tree: fix broken links
Date: Thu,  2 Oct 2025 14:59:17 +0200
Message-ID: <20251002125926.2624522-18-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120186

From: Benjamin Szőke <egyszeregy@freemail.hu>

New tarball location is:
http://oldmanprogrammer.net/tar/tree/

Homepage is:
http://oldmanprogrammer.net/source.php?dir=projects/tree

Signed-off-by: Benjamin Szőke <egyszeregy@freemail.hu>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0c4079fc28cc36cb2dbfe48093f2cf64106f8b5d)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/tree/tree_2.0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/tree/tree_2.0.2.bb b/meta-oe/recipes-support/tree/tree_2.0.2.bb
index 26b6074ed3..08d234acdd 100644
--- a/meta-oe/recipes-support/tree/tree_2.0.2.bb
+++ b/meta-oe/recipes-support/tree/tree_2.0.2.bb
@@ -1,10 +1,10 @@
 SUMMARY = "A recursive directory listing command"
-HOMEPAGE = "http://mama.indstate.edu/users/ice/tree/"
+HOMEPAGE = "https://oldmanprogrammer.net/source.php?dir=projects/tree"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
-SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/${BP}.tgz"
+SRC_URI = "https://oldmanprogrammer.net/tar/tree/${BP}.tgz"
 SRC_URI[sha256sum] = "7d693a1d88d3c4e70a73e03b8dbbdc12c2945d482647494f2f5bd83a479eeeaf"
 
 # tree's default CFLAGS for Linux

