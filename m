Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9AE6071CA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 19:19:35 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e4so12622589pfg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2017 11:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Erpcb9tXuuXf72w7nKjHPt0OvWnmz/n5vhU0shOmxMs=;
	b=CPICa8nGPCLTDPdDfb42PfmJNdms5r1FrHPw1HCPmKBVqjUbnm4uCQs/PIWlbx4B17
	SANJxIYjVlaTWKxZbO5Lj2W+36SJbms5Gx/pcHA95OuBRba0d8UcQkSv8sJZ1eC/VT8+
	vwURjI3gH6KpMhxw62f8DTiS5ZP3GUYNFPSpqD8XppfG/arwH9SakNHwyJmjIvIEhexu
	6xwdjEnSN4zfK/cDoyZVzFQy0OV137LHW7pNp9tTMy4UVspA/ETQbc+DtELfrGi2YxOV
	+im/m2/9U4hqkmNsPPd1OVJ97iCpCZLSJHzBkU0rdhu85jg4K+w3uUJ0kjhYT0Bcf7EZ
	o2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Erpcb9tXuuXf72w7nKjHPt0OvWnmz/n5vhU0shOmxMs=;
	b=gNUDfkA/0g7agsOC8zSucKnKyx3IQOw6A/V+lSNYMB+3BjV1mJ6F43nNvw0a4LfNL6
	GIevm6NIRX0BNpVJSOW5BdccvpGcC13iAkZ0y1gWXxm/fpdRtGv26bKWh9DTB6u8rr+n
	g52XayhONJDkxlK1y66NphxHybMKcLd0lRDrB06fDMPnu/MBr6HzFYI7Ays3nN35y3tI
	0vVu+pneLwhLFVfFCTa+gPVMn5/5xn8kcEHX03i+U3FIoyZj215HhiKGnV0V5k8izZKH
	pRiAHoZpLBbSEdiRvwJOVrWzxWz2SHLAdOli4uebhg/UAdHwxodRJ7qqr4gu8+rmThJP
	j+eA==
X-Gm-Message-State: AIkVDXJFYY9l+xxVnAIx5FnIs7hKu9yNtDmeuIF/Gb6N7ztQ2ynKX6cqsUlw/Lv+GdaPgw==
X-Received: by 10.99.4.71 with SMTP id 68mr41806572pge.77.1485285575717;
	Tue, 24 Jan 2017 11:19:35 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id l3sm894125pgn.10.2017.01.24.11.19.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 11:19:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jan 2017 11:19:30 -0800
Message-Id: <1485285570-27494-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] luajit: mips and mipsel are 32bit targets too
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
X-List-Received-Date: Tue, 24 Jan 2017 19:19:37 -0000

When cross compiling, the word size of the compiler set via HOST_CC
must match the word size of the target. That's achieved by appending
"-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.

Unfortunately the current list of over-rides (powerpc, x86 and arm)
does not cover all cases. Add mips and mipsel to the list too (which
is still not enough to cover all targets or corner cases such as x32,
but better than before).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
index 964dc1d..2049846 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.4.bb
@@ -24,6 +24,8 @@ BBCLASSEXTEND = "native"
 BUILD_CC_ARCH_append_powerpc = ' -m32'
 BUILD_CC_ARCH_append_x86 = ' -m32'
 BUILD_CC_ARCH_append_arm = ' -m32'
+BUILD_CC_ARCH_append_mips = ' -m32'
+BUILD_CC_ARCH_append_mipsel = ' -m32'
 
 # The lua makefiles expect the TARGET_SYS to be from uname -s
 # Values: Windows, Linux, Darwin, iOS, SunOS, PS3, GNU/kFreeBSD
-- 
1.9.1


