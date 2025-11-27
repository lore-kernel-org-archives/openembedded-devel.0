Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256D6CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 04:39:24 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11421.1764218356245360063
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 20:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RUszUEvf;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso295831a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764218355; x=1764823155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGc6XPri/S77jn7Is52eeTfY07Le7iuVt7GEJ6X8NUI=;
        b=RUszUEvf7j8ne/5xbZQHiR3IZ5/a3EJUo4Ot1Ud5nF24fwwWLYlY+jhIC+mTcJ4+g0
         o2bLZaJQ+ZiMWxcHLLqy3UQHUTSpoSvQXXeNH1DBUzbi2ewqxf+aD1iBa9ch3gb2QNVd
         w3pk4TE91pQDgsCbPDTX9/ijG4aEp47mhghVUq3Bi+p1nNL6oOtWY9WUNgoFiH2CI/gj
         1wr6hSdZGUKeB7P1piM/XlRAx/z0ic6G/oWC9l8VADwBjGR0pBYP9ZHYugULom2cU3XC
         sAS1zqQK2xKq0mOoL83yqlffq0QvsmI+TA6cr9qNH51TNQjVeu8B8Rh1fIce41IdJPNH
         ZvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764218355; x=1764823155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGc6XPri/S77jn7Is52eeTfY07Le7iuVt7GEJ6X8NUI=;
        b=E8ppiU0Re79Z2Tyk/jmADPfyys2QjtCKNFVdvBqwDj0F7wxso8Jds9G6rdruC7B6SZ
         J4SXLJR7FsS1x5jPCmU2CAdm/x0wvqGyWSuj/zdFAw8nl6xEgwe1Cy9Y3ndrVqE6lqlW
         Y2zWlBQdrpjKix2uNc+MFTDV+jHvnOdYQSbBTrklaIaV2BLXQSf8LyesEcZl9cywRFOw
         9+15+85OiBMwU0FSQUW0hmrLBNw5LGPA09+1nedeHjck8CSu7EU40w51DufiAn0eqJko
         g+XB53oEyasfeJ5OemwJHPHPEly5Bw/hHQHIEASLd9aMLLaXAb5uX4b7ApNs0TWY8Tz/
         EggQ==
X-Gm-Message-State: AOJu0Yz1tYkrIoY5O+af+VPQAIK/raYjSqbod9DZcp4mCV3wAAlJTBcS
	uU+h/snWMo66kecti+bx6BN3AI69D6+UckrzAgX/LGsp0336LjzYVWXw36fvaRgH
X-Gm-Gg: ASbGncttXdrftdkulH8lM3FlMbe96rkTPUwAm+yrTJVUSbgnNNMtiBhSGEowk7Kg7VU
	L1BltOR9KQG0zUhCwNCDSUmaUF6O+oSCscB1Y2mNxjM8oS7Z4ZCvWVvAl/2KTD8cuVK/LcZEWoK
	H0jTX66UB//MvyQvtznR0GteurCjIA/ZzXJkWiZ3sI65VXoQuEcF71nL3/y6ZpC9012W9mDE5Jq
	VhzoBC/mPLbeHdwpES9XcsZCKj8q3U0tlSlcLVLricREF9M8IN3AzZZUnHktYNq4dhejlnuJPf8
	VIVNF4GRwZXsaBDGe/5Epj6j6BilSv9/ENKJHj9v2KUbqGkAyN5kMNNJY+WhCoNobVYJhVpSaRm
	QT8+Ic8Z3+lr/GfXQVccpUBEM+FrzmBc8YGwi7kucp9s6EwuCKEH050JQXr4rQ667ssLjcwFvyk
	9FYM+CzX8F1vSSt3wSUL6oG2gFg8c2cUMPgOyqluy52X86/QPWw9q/ZjFBZ+DtMRBjBQjXxGLGP
	KEI+mJW3hOixPgU4BWR/S660VCdwB/Y
X-Google-Smtp-Source: AGHT+IFVyCSezBAzxToc5Wft7EEWVLci6k+HHKtaSVZ83Zsxst88kFH2cuFa+WzAgiHdox+8bfTeew==
X-Received: by 2002:a05:7301:dd98:b0:2a6:9ea0:6db with SMTP id 5a478bee46e88-2a719fb9759mr9346584eec.28.1764218355236;
        Wed, 26 Nov 2025 20:39:15 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a965ae9d06sm2471591eec.4.2025.11.26.20.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 20:39:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fuse3: Add missing rdep on file for ptests
Date: Wed, 26 Nov 2025 20:39:12 -0800
Message-ID: <20251127043912.694489-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 04:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122103

Fixes

E  FileNotFoundError: [Errno 2] No such file or directory: 'file'

../../python3.13/subprocess.py:1972: FileNotFoundError

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fuse/fuse3_3.17.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb b/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
index 256c663852..85991ff7be 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
@@ -35,6 +35,7 @@ RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-looseversion \
     bash \
+    file \
 "
 RRECOMMENDS:${PN}-ptest += " kernel-module-cuse"


