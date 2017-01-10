Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 61E0C60851
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 22:48:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y143so9654696pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 14:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ckMH6Cj4uV/nKSDAKX6DDouUCkJUEx2s0Ynsdp2fZRE=;
	b=JAzX7vi8ogBNhyUAEyXSXseOJuNtSrnVNV18hCSm3paMgPnu9cA3bidBHWmy57GA2K
	zIhdaGD/Ox61SYN0EvfmNrzKoUVUT6eByGXzNy39ThmfC70tXvUQxY67h6DVGluMn32t
	sTq3gypMg9ANEBMeurkTJ17hNxpWuW0CSJLzkkfVRWqdO668gB0FmB0PjlbHcZFQcc1g
	GkzK0Gj4WnKSfDiSpvV06Auowfp0bn83IwMS5KaJ2Ot3Q6AE4R3U4NoZBXeajd8GqB4f
	pllpOHvBHYtssn2YHeidIlUOng+wnUrMD/6vkcjVBgRX2mD0O2VLNXoBPIJIylisgq8F
	Lyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ckMH6Cj4uV/nKSDAKX6DDouUCkJUEx2s0Ynsdp2fZRE=;
	b=okibMtEqDtmn/t0QSrlqCdbFA6oi1UQpz2vxr/jRWotIzaqINRAqV/Fx53At1zKRb0
	4tKCkIXpGBS7CedcYfBRr5XfBIJgA9ZR7eybJCMftzOfuLwQgKJKxEwUBL0GnPOCseay
	jiHDDoC9EeUybjMCYrhgen4Jn4mB8RTXV8c2iye6zr+Hy5RXfVT3KnGkBx0/3KgX3QA3
	7O+5kF8OzZXMzdvV4MoeOMh30xJo/T+t9vScrdMxS6QaZP+Xte3htq6WpOYG+tZGr7Ud
	lMBn9sbkAaWCp7+qp/XVUxmTNPWDVkFsiCoJuVRpcTo5XOz32yAEsZQDJoKnnqQLlBTJ
	cU2w==
X-Gm-Message-State: AIkVDXIMmmM4t420S7FqWOXTT6JlgI+vZ+KoMZn5KiJglOrarKLG1jQYzyVb09ITBCR4Ww==
X-Received: by 10.99.1.132 with SMTP id 126mr6749725pgb.129.1484088483240;
	Tue, 10 Jan 2017 14:48:03 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id f65sm8169671pfk.5.2017.01.10.14.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 14:48:01 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jan 2017 14:47:56 -0800
Message-Id: <1484088476-2468-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] log4c: add support for log4c-native
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2017 22:48:03 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/log4c/log4c_1.2.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
index 3286b08..a028f2b 100644
--- a/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
+++ b/meta-oe/recipes-support/log4c/log4c_1.2.4.bb
@@ -15,3 +15,5 @@ PACKAGECONFIG[expat] = "--with-expat,--without-expat,expat"
 BINCONFIG = "${bindir}/log4c-config"
 
 inherit autotools binconfig-disabled
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


