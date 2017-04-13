Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDFE77E78
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:34 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id o123so13476748pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7NMXnES39iqAJ7hHtjnqFIK0Q6XVkJCfEoU8Ke2FtWE=;
	b=KLLbxOmtyiR4FTpxi0EQrGpctYbEBJtxvFrB3H42u0I5OKMntSq8AJKdbl1doMwzxH
	od+9de+0P5a2HSQ9esZknqY7kN33DpcetTLW76P/if+4ZO+378bN21wZIUXxDs3m2IBI
	JcYC26OsgR8EIn4odMo9Tb3c8sDhQepxN7VQL696zW1GIziBFviRAR5cWfsik2zsef3O
	DhZMcFmL4KjGozhToAlfT8Rb5ZvB8teX5usVOq4k3fJWeT++l755NznybS2set8z0oq9
	EU8cvDmqtr+x9Znx00AX+By+KHWcS12CSQtIeed91s+xwesiGrYTBqrfth9tNho9jLea
	BwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7NMXnES39iqAJ7hHtjnqFIK0Q6XVkJCfEoU8Ke2FtWE=;
	b=QZpPtqLjh6QKC4N8R3BJ0esCOlcisgPfgxKJf0JK2ip6WPWXQrwMR5Y2voD+w9r/kM
	ir8QuA7ZS/ueLG7ISqzLZW3wg4Fsi9VWLokK8KgyggBcJguEKb2NN4z+aa29Onk9xtTn
	XNWcBFpFtoRjLfLg+75MFN3fldO5ZEm4HMj2QqJNbmXPrC8S+p29EO1NppeVg1R9rhIk
	rISrW9ky5BpuE6NKEgchi853Sx2+5FoGVLWjjKXyRzx6WS34wd8iR4ocY1vMxsPnFYjH
	+K9Rnj3GLswMSNxuaLQj70hPag3X+fu1rPDipW7s098sPQ0x2uvK+4H3QehzE7C/tRT+
	KEqQ==
X-Gm-Message-State: AN3rC/6s7kFqAp832bOHuP8jmInN8PejrnDF1NMNUEx08eA5aMQNxZAb
	yZJ67B5Jk1PY/Q==
X-Received: by 10.84.217.12 with SMTP id o12mr5521342pli.87.1492116096128;
	Thu, 13 Apr 2017 13:41:36 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:49 -0700
Message-Id: <20170413204106.30679-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 12/29] fftw: Add -D_GNU_SOURCE to CFLAGS
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:34 -0000

Helps fix build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
index 559985169..ed14e1658 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
@@ -19,6 +19,8 @@ PROVIDES = "fftwl fftwf"
 
 EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 FFTW_NEON = "${@bb.utils.contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)}"
 FFTW_NEON_class-native = ""
 
-- 
2.12.2


