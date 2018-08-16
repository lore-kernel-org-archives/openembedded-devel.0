Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 59E10792AC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 20:39:21 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w11-v6so2697939wrc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 13:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u+YwcdpBDEm2CCXjAAyhMajc4Buoml1CsU4x+57CprU=;
	b=gljhrroF4GNRmgyp6zIf7+z0Iml6hVLF4CAZDXvWSxuGWrSMmMBRfEaeKu5uv/Xw/k
	aHEOfPWlJieDKlo/vLIPaQ8PHyzx62u0kPJ1HvlJCtVaDj4/ZNXailWrpOmP5NWIxOqo
	kDY1XBihRZfN/wp1pCQMqHIt8gQAO+xRJ2kIz4bK6ZNAu2+tTXzmPqG6G1ssqTCr7w8g
	X8x6n1/qZHi8A6U1dyxd2uPU4feyUilG/NOMJM1Zb/I2TnynlbkE54vzJZ8tXtBNhN7v
	UnpX+QQGrdKN22rC2y4ceX3IwtkopNO66faSpk02qx/wqOJr592qhJ5RIHQMt214qLkQ
	6W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u+YwcdpBDEm2CCXjAAyhMajc4Buoml1CsU4x+57CprU=;
	b=o21wxQU7pvyqlvSHT0RmnfcySqgSfizNU9hplcBU1QSkz66BGmy2pvnLDYbqoQ02jZ
	dFXxLioJ3Sx4iS51HaYfLUKq2Sz+ll1kv87UwTJFMfgB+bK/R2YtBqZf5FHQouRdVWVL
	Ua2jvP3uP7xF3CUZM74VwOfyhitpbjrIhYtAow3iaS8ER6XfmxbYKYGpflvjpKn3NlV3
	CB2IpotKtMCj/VSIlsELv3WGw53r2twelSrRwIZxQHurhMLgZCIkyt87y/gYlFXlKJX5
	9l1zpr41S0HMuvuMHTkySOQQKfISTiR/g14IzDzOhI110Nt0hj21YLkOTQRRfs3+xmKa
	Ulew==
X-Gm-Message-State: AOUpUlEHVUIkXAGpUtBm3DYvsNwWbnytrEMwlUaERJkYh7P8xcqCDIPl
	R+Kf8/5aHF7mMqpIdSuuBTmkAZmA
X-Google-Smtp-Source: AA+uWPxCGrX+FLgWBZVaO49pAV+vJkHg0idjj++V5OtEXjc16yJVXFxeYKnXuz+DRDZ4CQHjCnFyng==
X-Received: by 2002:adf:ae01:: with SMTP id
	x1-v6mr20624043wrc.45.1534451961915; 
	Thu, 16 Aug 2018 13:39:21 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	y18-v6sm184678wrh.85.2018.08.16.13.39.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 13:39:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:39:17 +0000
Message-Id: <20180816203920.464-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180816203920.464-1-Martin.Jansa@gmail.com>
References: <20180816203920.464-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 3/6] netkit-rsh: fix build with glibc-2.28
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
X-List-Received-Date: Thu, 16 Aug 2018 20:39:21 -0000

* fixes:
  rexecd.c:79:10: fatal error: crypt.h: No such file or directory
  ...
  ld: error: cannot find -lcrypt

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index 3990f7b527..f08256d31e 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "netkit-rsh includes the rsh daemon and client."
 SECTION = "net"
 HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
 LICENSE = "BSD-4-Clause"
-DEPENDS = "xinetd libgcrypt"
+DEPENDS = "xinetd libgcrypt virtual/crypt"
 
 LIC_FILES_CHKSUM = "file://rsh/rsh.c;endline=32;md5=487b3c637bdc181d32b2a8543d41b606"
 
-- 
2.17.1


