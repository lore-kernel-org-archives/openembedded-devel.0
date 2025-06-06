Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BB5C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:06:46 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.26227.1749182800673542284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fKPh8L9F;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7db5c13088so1497421276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jun 2025 21:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749182800; x=1749787600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iosFjyl/sCWTFz7iR0Y7yc1SJEvo7sji6nnV8wJoUNU=;
        b=fKPh8L9FHOPAcnkO9Xjqt3qEgITOpel+S8R0idgBDKbPtXmAjQ+OURErOzFvpqkiK3
         IaEXg2yKjrd019WAqVRXa9MmqUbgRlDxbz0EKhV4icaIyaTRgTabnKCyGDDJ5omUq6eG
         k/R7ko+zHeaMkdA1S9qOCrFx5409TTxKrRZoASEoHmTKYO00VEjpFvsrl1wYGJj0PsXY
         hN0uWhdvsItsj4WYX+ZliZr6ZHcFDRsfEbqHHK9wdFtsJ4gxhx1E8X8rtVlhVMfk/ZJ9
         csGrZFgYtGLZt1L7uWtficCy/sgVnWcJZDimVC7Zq18mO426ufmTJMsIw3UExLxicxZe
         1w5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749182800; x=1749787600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iosFjyl/sCWTFz7iR0Y7yc1SJEvo7sji6nnV8wJoUNU=;
        b=OZgLInroXExElmjqqgncY8o8DKafWyzdjOx6fSUsgdHn8equ8v7KBwMTMnlJUj1HKj
         fvc9VMftVhtS7JtXGTm4ZEkoSr/FXbz2semrg9C7iJ3vVQuTSsctcG8AV28udTC3RRJ3
         6JXHdxkTCwz418VX3rvhlqfdOlbea4Ia4zXAJFlSBaa+9ZTlbAt4/GElwd4zaLFYza7n
         ShulPg/FZalFvmYXtlUtCUJ14SsWDFJ4KERA8oiGfPPsFYqNqK39rzkGD+yAevZ1JlMv
         isqx/lZho3dwEt7cHdVIvgtrhJLz63GOyiOwieRe3M+myWg2QYqLgQp5Z+ZJ7/gN894D
         YmPA==
X-Gm-Message-State: AOJu0Yzhs6CgzOW5245WihyEasV2mGV4r/YSPfjQS88y4pqcfCjlgawP
	QHSjMr6PpcazVBDnf7iTl+nBnF+L3mszFY4qZt4+OY2xKe/vbJKlCJaYxCbCl1yG
X-Gm-Gg: ASbGnctfZslIGaaXqqQn4xJ/Hy9KJ5OIRczfrFzrqhG4ZfWlcBCLkmBAqS42iHWqi2c
	3tLj0XOaIiHwafO989fYNKgl4/MZxLU8rh6EJkjL5/a/aIDE2hVZt9sEGWk4lm0gxO4ak58fWxk
	jtrq4UoHtSY3QNvbPDz4Wa13ptd7gMKtuf85qdhcpzSgAo/ek2Mp6IbVIBtV/lim/XnWOr0yWka
	MZTLebqPqSC8ENnV+wGqrs84rcIGMkq10NhpB//L5N5YDDU29FO4Iojbhv6blzSWHNej84P2yyH
	7Wj9cvlxdNIICG/cowYGUy4fFgz3sNTYEZmQ0tVsxF+f2zy9BgP4yLCLZWN57+Lz8gdVLx89NAt
	HRmn+DTIX10B31VdW3KEK
X-Google-Smtp-Source: AGHT+IF0WMXcY0r4uxUqrk5jNPtwmYQtGJonCFIVgF4rwhDhbGj+E8ZEEwKSpezV/g4VDUgCSU4Aew==
X-Received: by 2002:a05:6902:161a:b0:e7d:bca7:3629 with SMTP id 3f1490d57ef6-e81a380d308mr2368464276.12.1749182799236;
        Thu, 05 Jun 2025 21:06:39 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a4157c3csm241440276.33.2025.06.05.21.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:06:38 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/6] xfce4-calculator-plugin: upgrade 0.7.2 -> 0.7.3
Date: Fri,  6 Jun 2025 00:05:59 -0400
Message-ID: <20250606040603.2410505-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606040603.2410505-1-schonm@gmail.com>
References: <20250606040603.2410505-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 04:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117755

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-calculator-plugin/-/tags/xfce4-calculator-plugin-0.7.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...culator-plugin_0.7.2.bb => xfce4-calculator-plugin_0.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/calculator/{xfce4-calculator-plugin_0.7.2.bb => xfce4-calculator-plugin_0.7.3.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.3.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb
rename to meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.3.bb
index d5ce9ad361..540935cee4 100644
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.2.bb
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.3.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=909430f63fddd63f120ba29e8979f65c"
 
 inherit xfce-panel-plugin gtk-icon-cache
 
-SRC_URI[sha256sum] = "d1f622bea41a90c1686bf9f13c488ab28e995e2762b84712dea9027e0c94028b"
+SRC_URI[sha256sum] = "3feb5f56092ceef2858c3c1bd443317d4caf289a6409f9db506f49088e19a2e8"
-- 
2.43.0


