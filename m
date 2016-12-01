Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 90F0671A26
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 05:47:51 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c4so11299684pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NRrLx3Qy1gcP+mSGW3PCPWYb9rUM7GlGMu/XozgMdA8=;
	b=Vxe0Csd8Xr65mqhWXeYJNXrBkjWy97XCbz+8/TnU/gJn3Rj1IT1dSxikl6k7jr8aPh
	fQLGdYyM+Y0E1o381169euWUzKcKjCL1XBrLlz71vKOM72AijlNTvoBsKLUqr5u3+Hf3
	xHKPYRmLGcG0TqffASO7XzsXifO3+Oh1Lrj3gzlxbw3RsUvqcXYZWsMry60nPdzH8p5g
	cP9oegxwyMpLbWiPDb9kDEORHDUkPB6eDQGEcM1c+wfdrOtvDi+BzPzRGb+fpaNCOaCZ
	69PPAV2GjPIaAzbgy0sISsW/IGQAk7EvOZZuCF8i747wDrODEOJMBfMGUjm7YhTyJHQS
	mg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NRrLx3Qy1gcP+mSGW3PCPWYb9rUM7GlGMu/XozgMdA8=;
	b=jjU0wogR1qvzyBmLN9BaUqDGy/ikBQwOm9zK/L/lgaU3MVl4+8NZ6eiLu6woQ1OEqS
	SThkOZJThWbmwy0BtrsbjIgXmmtlEF0WODey+VdZMMU7wGvMUE2o3DUgxCulfgsifqE+
	5mxkKyMyXvZrp68pjbWx+GxmKlXImWmSpIon6HaM0sxaJBcwSkjSi6oSqA+Hji4liN88
	KsxzxBs5h9Mmz5jvyEGAvQxNPYiKkJSBmZn/m4zaFpv05fqe4m7SwqBcMIP7m3SXyBB7
	WkVF56Lg+jEwgQuC6PaDilt+x1ib39mqBc/awzKoJHqOFSdnrkdj3zYuWIKi7EsGMDqo
	/gZg==
X-Gm-Message-State: AKaTC031sA8MA9nKVR3FaKNtFgkEPHpfovQX67Q/LS/Wxi8boL09+5rJEcIK+p0sSWBd7g==
X-Received: by 10.84.210.13 with SMTP id z13mr14084953plh.167.1480571272747;
	Wed, 30 Nov 2016 21:47:52 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	d15sm106870900pfl.46.2016.11.30.21.47.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Nov 2016 21:47:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 21:47:43 -0800
Message-Id: <20161201054744.4776-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH 1/2] meta_oe_security_flags.inc: Disable PIE for luajit
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
X-List-Received-Date: Thu, 01 Dec 2016 05:47:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/conf/distro/include/meta_oe_security_flags.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/conf/distro/include/meta_oe_security_flags.inc b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
index e57cc5b..9c451b9 100644
--- a/meta-oe/conf/distro/include/meta_oe_security_flags.inc
+++ b/meta-oe/conf/distro/include/meta_oe_security_flags.inc
@@ -17,3 +17,10 @@ SECURITY_CFLAGS_pn-libcdio = "${SECURITY_NO_PIE_CFLAGS}"
 #| /usr/src/debug/glibc/2.24-r0/git/csu/elf-init.c:86: undefined reference to `__init_array_start'
 
 SECURITY_CFLAGS_pn-libvdpau = "${SECURITY_NO_PIE_CFLAGS}"
+
+#| /mnt/a/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/6.2.0/ld: lj_err_dyn.o: relocation R_X86_64_TPOFF32 against `static_uex' can not be used when making a shared object; recompile with -fPIC
+#| /mnt/a/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/6.2.0/ld: final link failed: Nonrepresentable section on output
+#| collect2: error: ld returned 1 exit status
+#| make[1]: *** [Makefile:675: libluajit.so] Error 1
+SECURITY_CFLAGS_pn-luajit = "${SECURITY_NO_PIE_CFLAGS}"
+
-- 
2.10.2


