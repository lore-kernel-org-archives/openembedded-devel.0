Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id E44337F8AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:04:09 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id r4so9759151pfl.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dVN0ANCj9wPzXDb0J0jKNQAFKWXg+qMbocpb113YD3I=;
	b=uoRoLtvhq4R3bdM1ulveIRD+OaPdTENfmqZAtjJHXNe3E73qVHrXaDyKbwGbJgjLM4
	lPG4tsIlMp6qMjOkNY4e4khlFNwl4zMAB1nSZjxSC88OPKIFcMYbC9AXHVvTChKQDCdG
	1dZjO02j2dEdtyKhDBcOjKn2G5QHxHyraDk3J/Rj5RjwfndvNQarTS+A8XmMcEOXHNa3
	Td/7EarSQlLSYeyttzDVlBk8wWF4SfS9j6fjENf3lugW3tv1Hgz51nF3YT7Oj7JQhES+
	IS/1qB+ONhy41TiLPqNDxC6ge8wQ11QmyPzuVoRb42IHVqeoJugn/7c1JJ0YESDfcyzy
	PtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dVN0ANCj9wPzXDb0J0jKNQAFKWXg+qMbocpb113YD3I=;
	b=C6KbS4QU8q6hWl0ebvr3oKScC2vvIVv5y1hvOiPs2HaP0jHani0/nkC7mCnCGUf2Fi
	xj9D8pJnk2MD6chbhURX+VYJnfh4vHu0WIvMiGliHXM2DonqPMwovus6Nzhf/hmYtsSC
	K1nVpSUSqvcMejDGFtIDnuYC234/T3ke3K4dxOzcTcAwgAVU1wQjaouHww1/fWw02LTg
	ct+MuXUUIzrp/bSVJnO1u41dARXma8hqkENE9sI3EDNQV11N147wPLw1/FpfeE4BjdPV
	S5uVUdA9LPS5XKQNZPvu+nNs+sfCrczEmzc9vOTbQqcTr8NLWYcCVlYpt2uZn4T2rayA
	Hrng==
X-Gm-Message-State: APjAAAUWmeRwOCAQc2t8rBfcZOgFDAtmXIGNGD+zFV51FUA35xBcRI9/
	EQEcfOt3vsm9Bg3qYBs70Th7+W1AcXU=
X-Google-Smtp-Source: APXvYqzC2kC42rHj7NhSOxVU1VZ8ZgxDYHqmuym6wj8sTTsztMaNCUGx1zz975eRGOW6KsosCwk1qg==
X-Received: by 2002:aa7:85d7:: with SMTP id z23mr31977498pfn.24.1574053449680; 
	Sun, 17 Nov 2019 21:04:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	y6sm16881131pfm.12.2019.11.17.21.04.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 21:04:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 21:03:52 -0800
Message-Id: <20191118050352.1379153-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118050352.1379153-1-raj.khem@gmail.com>
References: <20191118050352.1379153-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] libtorrent: Disable instrumentation on ppc/mips
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
X-List-Received-Date: Mon, 18 Nov 2019 05:04:10 -0000
Content-Transfer-Encoding: 8bit

From https://github.com/rakshasa/rtorrent/issues/156
all atomics (__sync_fetch_and_and_8) are not avaliable on
mips/ppc, this patch helps workaround the build error

Fixes
ld: libtorrent.so: undefined reference to `__sync_add_and_fetch_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index a3902b25f6..3ee69554b6 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -15,6 +15,13 @@ PV = "0.13.8"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ??= "instrumentation"
+
+PACKAGECONFIG_remove_mipsarch = "instrumentation"
+PACKAGECONFIG_remove_powerpc = "instrumentation"
+
+PACKAGECONFIG[instrumentation] = "--enable-instrumentation,--disable-instrumentation,"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--with-zlib=${STAGING_EXECPREFIXDIR}"
-- 
2.24.0


