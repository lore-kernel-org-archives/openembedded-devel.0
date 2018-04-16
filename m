Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 81BC760685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:01:43 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e9so2221217pgr.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OIwkElw1sAASEsEpobsTSjPSFkz3Dwi3X3JJXXFIp70=;
	b=cwcfpVbeptGizaJt60dSbE8Y9+7OFerW43ZpSVvD+NYg01hxzIRHQdUu4lfLiLwmcP
	Nn3apocQsyQzhLT4+bWwyDxyFlZ4H2LdGaWaGBQWweK4zTBGMdxF3I/6zQNdkRFYej1S
	+D/voZHQVWiKhDsLUXcC0Pd0XuRXDdeUUAIqYmuheGkFlUkJHyqVZedgm64qvySmysDf
	Yuqr3HT1zdd6uEAM5Q+UC9p+0Lv7BMt8i3B+oHodAveCoF51G0LWNmyiwIKOH9g33VzD
	/+OcSIV6sxhXmW8TNbTOgs/B2Pf8m6vsk8fAgnF0YESG2iQ6R6hRB8IpbbSIWNn6ZKEV
	Zz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OIwkElw1sAASEsEpobsTSjPSFkz3Dwi3X3JJXXFIp70=;
	b=Njh8HiOWOW4uJDsK3J0lcQ7VaHyDeAPPj0QLreq202sc9HT+3cfxE4suIIFd+P9pwq
	k3TJQS6ju7Fgknxm88Na06d8qg65dgSbKtMq0TWALLcGNtrGLU63G/YrO4VGo44KA/Is
	+U4HzJZ9N40TPx7rYvpfL1vIR12ynlW0QOdgKoOq7al9w4K/qxMIW+uM6JK2mja/dxiq
	6Pa8P3Mq+0FoT5AP/vLq4JyNTG+DBKIkCk9QWxZKOYbZL0azfN8KTi8f2LorB2SlLIlQ
	MwlaTb2PrgasejeFIEIOWwG3ihn3YO6jrBvVG8+qH98kxOQmwumndIg7FvlJfcU8klMv
	muCw==
X-Gm-Message-State: ALQs6tD3dnLFOHZJe4gDQrV3JKQGwCQU0jR2Mssr49XB/lmFNpD/3zd0
	frHkm6jApb/aMZESWPlXHkxmjQ==
X-Google-Smtp-Source: AIpwx4+4PiI4wtgRVl9wxkZClvFKehJj7nCziPmldsPntqI1rdw3spuHFyMq6C9uU1/TqQz6ZG3XLQ==
X-Received: by 10.98.98.65 with SMTP id w62mr12582069pfb.256.1523858504419;
	Sun, 15 Apr 2018 23:01:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	75sm22412103pfx.71.2018.04.15.23.01.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:01:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:01:31 -0700
Message-Id: <20180416060134.26291-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180416060134.26291-1-raj.khem@gmail.com>
References: <20180416060134.26291-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/6] site: Add riscv64 specific cache
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
X-List-Received-Date: Mon, 16 Apr 2018 06:01:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/site/riscv64-linux | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-gnome/site/riscv64-linux

diff --git a/meta-gnome/site/riscv64-linux b/meta-gnome/site/riscv64-linux
new file mode 100644
index 000000000..e3a41ea0e
--- /dev/null
+++ b/meta-gnome/site/riscv64-linux
@@ -0,0 +1,16 @@
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ORBit2
+ac_cv_alignof_CORBA_boolean=1
+ac_cv_alignof_CORBA_char=1
+ac_cv_alignof_CORBA_double=8
+ac_cv_alignof_CORBA_float=4
+ac_cv_alignof_CORBA_long=4
+ac_cv_alignof_CORBA_long_double=8
+ac_cv_alignof_CORBA_long_long=8
+ac_cv_alignof_CORBA_octet=1
+ac_cv_alignof_CORBA_pointer=4
+ac_cv_alignof_CORBA_short=2
+ac_cv_alignof_CORBA_struct=1
+ac_cv_alignof_CORBA_wchar=2
-- 
2.17.0


