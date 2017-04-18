Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id AD32C72F2F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:35 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id c198so470944pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IjVs9gkx3Ii7dahcvuMpa5PIokVyW9v8e4mSQedtjY8=;
	b=klvJeOUTAB/Fru2FOIdU9bLHxUZ0pwmC4EAfbu2l5cQUCkdbHxr1MAHFY8y7+9Hs80
	60rAb9OVcVY8mtYpxscMkDotMx8dsNg/KJLUNCRcAGIuEXGfOITmHEp9Y+JXec+azF36
	HW6a5hL5JfHrKJN19b8xbuvZQFCLjj/cipkjJiLREqrQFe1phjo4a3R1NxF/3K+YCD3m
	A1kT5kY5rtc2dEzH2S3fMany7oRALxmy9tz4W68Lldi6sqdd/g/VxtIo1J8ldVMjVCi0
	7Bk7iZMz3BUvCJJqf7Ru9xkk/zZ3M+RHt1UmWOLW9oS7LHCx1LmP9cps7J/5jmNe8YTp
	1H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IjVs9gkx3Ii7dahcvuMpa5PIokVyW9v8e4mSQedtjY8=;
	b=nuBpuZdHdJxpgdPZlLAmsJ0VJFnA1oPX6ULAZKTUAXNOQAS1V/xIs52CEmdXw6Ot8p
	j+T+aOkHff94fUjUnx7BE89SupVj0fBpucdWmKPGQY0beqgKHbe/tQFEZPI4qq99f0Ck
	4l5Dv8UaL3zAeKKNzx2v3w2DZrQmrtH9Zz4OkRaEArldDlnpK0yr9B3A82JDgCva2RdS
	4ToMN7wjNi5BE7mv8YLi6vDOUAAPDDOPFASWMWZq9smmIT+S0u0ZPX6MG9a2hyO6o1Ni
	wu3XS09B1GhQBt1V5sK/Id1rBKZSbT6at/ZhyrG6WM/fPFVl2Du8BsHo+EWOwbPXtwnD
	45uw==
X-Gm-Message-State: AN3rC/49Cdn61SbdgcshbFrQZ0YXAu+0xTwvmOKYJyUnhS5o1j2eixAD
	+VuPiJ9j7BitEA==
X-Received: by 10.99.174.69 with SMTP id e5mr19704934pgp.161.1492539756835;
	Tue, 18 Apr 2017 11:22:36 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:38 -0700
Message-Id: <20170418182142.27253-28-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 28/32] dstat: Add missing dep on xmlto-native
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:35 -0000

Fixes
| make[1]: xmlto: Command not found
| make[1]: *** [dstat.1] Error 127

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/dstat/dstat_0.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.3.bb b/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
index 1673b910a..18af738fa 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://dag.wiee.rs/home-made/dstat"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS += "asciidoc-native"
+DEPENDS += "asciidoc-native xmlto-native"
 
 SRC_URI = "git://github.com/dagwieers/dstat.git"
 
-- 
2.12.2


