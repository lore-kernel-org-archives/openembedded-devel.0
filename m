Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.5344.1591772587529747208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 00:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Z+yhBIjw;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=0vpq=7x=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49hdHD0nybz2k
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 09:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591772584;
	bh=R3ibz00+ioBKSguEeEISn0oU7/+0RQtpyeJ/GMhtRrQ=;
	h=From:To:Subject:Date:From;
	b=Z+yhBIjw/MW3Ns8fxMeDIMKxO0ndK7WoDvvbx0DCKF1v98Xo/jzBYvDe3kwnPwR/h
	 YNa6RI0rbH/WS/1CS3PcAcOJh3I7IWRR4Ulxpsk42tZRCUUcg4NxRx96w8KgWwc34K
	 SM4PDt10tpzhHXKCuNzwt+8K7Bugx9kehnxvP/hMTcHYGExe1UqQAFWjy+WgTt/V6f
	 kaFP+iBz7L4KSFtspCmiRfR52jSg5HrsAPCzrPTd2Tm/RmGt484lSmPums4PfKn/eR
	 PrX2jnjb7/cU3Hl9nMgQ0s5iWTcW+JNfgMpExhZOYC1o4GcJfKDzlFIzrwqXJLCXj1
	 usxOtKHOVKN0aGvBPn0wlzh8usUvgZPnxGEkht/UDFVouXQH2j26UpYf5GW24EriEF
	 8Zj9RANG6/RZJiDwCuBs/UkUSdajCZCfG8s2ddsK3M6Y1PIQ0lc0vRsZ1Kpsy/qHud
	 yja52jAoFm4d5PissWmpuV/NaFB37vstXGqHA/Q48Aq2VvuFPVUjAwr88zcGoevKlX
	 ShV3V0WhJwTuGCLTFgScmidbnRmsb1ix55a6HHIw6o7aWwnWgRa05zlawYZEa6tyuv
	 yNzZhnXEy/mkJoGxns10a0DLW3T3v962Jum4OnSQlI+iJq7q/7SXf+UdDdYq5outtp
	 h4kGuWFrVc/9zwaIRNxsb2hI=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] uftrace: add PV to update the package version
Date: Wed, 10 Jun 2020 10:02:52 +0300
Message-Id: <20200610070254.9851-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

From: Honggyu Kim <honggyu.kp@gmail.com>

uftrace_0.9.4.bb now doesn't actually use exact 0.9.4 version, so it has
to add a PV value to update the package version.

Signed-off-by: Honggyu Kim <honggyu.kp@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
index c33fa048c..a3d060218 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
@@ -10,7 +10,7 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools
 
-# v0.9.4
+PV .= "+git${SRCPV}"
 SRCREV = "d648bbffedef529220896283fb59e35531c13804"
 SRC_URI = "git://github.com/namhyung/${BPN} \
            "
-- 
2.17.1

