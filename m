Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 231E974C63
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:48:59 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id b14-v6so1595329pls.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=C+3sKMbtpUXCOnF0kZiXbJrW4AD91EDq6R9T+GBV6Dk=;
	b=XQV7tdOMHaMQhRNWW/qRcakvYU1qhhjjD5/k7zp02L4R192HQXRSmKsRmK9kTIAsjW
	1B3TAzANZWyCPxd9Nrkq/sZLN2D5b/8KDe2S7NuMhgL5pkxhIQg/JHxO1a+6FyaRL2YI
	aOYFFpOr5DLi32ERUhggbaVJuqtpNmV3IeQ4ChVpFAD3Oe5nVB4N3os6RWHr7qoMV0L+
	4AY67Z/MTnIl8lKxJ5K9uWR+eXjdKXEK/GBxbn+TXV2nzWAz5oeBpiZlGQPYGky7Q9qY
	X1vA61H4bW98zGI/fFJunBCLk+3EnGVpfPFMD/VvEqqI4LalJBveXXN1+KB9qR0OpKtf
	PGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=C+3sKMbtpUXCOnF0kZiXbJrW4AD91EDq6R9T+GBV6Dk=;
	b=jSB5J7VkJtdJsVth1s8VYdDvDzbx6CEIPShydJ4FmtO0nIbt2+7b39kIJX97O0TZ9N
	AnG1/EFVB4IUYU3DrTQQzUb6Kxo+s/Z3aMsoPz6ux2XBpbjTs70SJKDFkBJXrXBsxsG/
	P2BVLDIxGdTCJWDd/gADM9WgXF1UPvCb/i2naUzZLV9DaxGZNY/293Pg6oWE2/hAtlF0
	xCTgUyX71Im/MNNr2uHARkwTa4oaotqDkIo7IqAoXV/Q6G7MSUKdmzMCcnchj/qaAgGu
	vaRk159MTBdSDxgx2sot43Z/2gRO0xvb+zZ1HRZXWZps+EoJrHe2jfpKm1Lij7p6WUgY
	mImg==
X-Gm-Message-State: ALKqPwew3eiMVDAvqCZl9+ksTrAjklnitKG/6TJZ6FKp0mRyK+SOuToa
	Dheu5XH1OMeUOQp43llkI3s8tw==
X-Google-Smtp-Source: ADUXVKL7K2Tb+1vDY3qRBhDCeK7lixJIiD4pcNlVPIicg4udNf0kOeQMs9Nc0cciatF7LmVTtpX0OA==
X-Received: by 2002:a17:902:2927:: with SMTP id
	g36-v6mr19817774plb.303.1528080540430; 
	Sun, 03 Jun 2018 19:49:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.48.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:48:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:38 -0700
Message-Id: <5a70fffe603c2d2947c8499b8691cb3cda92888e.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 04/15] luajit: mips and mipsel are 32bit targets too
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
X-List-Received-Date: Mon, 04 Jun 2018 02:48:59 -0000

From: Andre McCurdy <armccurdy@gmail.com>

When cross compiling, the word size of the compiler set via HOST_CC
must match the word size of the target. That's achieved by appending
"-m32" to BUILD_CC_ARCH if the target word size is known to be 32bits.

Unfortunately the current list of over-rides (powerpc, x86 and arm)
does not cover all cases. Add mips and mipsel to the list too (which
is still not enough to cover all targets or corner cases such as x32,
but better than before).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 18771a9c9946c04dcd3ec89559018c8bbb15201c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.7.4


