Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8D61C60807
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 05:20:28 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id y22so7892822pfr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Oct 2019 22:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gVbx3Ogf2a7WsOW4nFjVDHq6U7kcej8XFx/ynu0iNAw=;
	b=pwB+8a0Lmz7pIFdAdg+9XFoX3v9Z1bg3G78LTTVfwZE+k73w33lsSisR3jtUNyy4Qz
	PZT0n2jmdRSCCS0x7hhW3ZKP+/nAzuTHlzXiC90tV/b8MwfD3R/2WalX8rPJ/Lad71ii
	2eGAze7ILk0BHpEtwMUdFJO9qwQzk59fzvdx+rdphXcr3QyYyCjkXVHvAF3QeeJopRaH
	gI8rxsP2dBE8iwtwemTY2Ux8vr11rF3EVxTLo4pLL44T6p/szuLKOVrjo8N0ndd//2ea
	BMrvi9wGghv5kW/EIXZtuwSEJFV/sqwqHp4ZNXfOURtFQ9brV+PRVygnSZya4Nnizs11
	VMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gVbx3Ogf2a7WsOW4nFjVDHq6U7kcej8XFx/ynu0iNAw=;
	b=pGYhpSt4KRe6QgZh+rroHuerQ0aMHAj4WbBi6LTP+19L6bdhnhFUzNGjy1v7ra/o9G
	m3EPn9Pe/IThArEUNufQ28qlLna1nELl0D6Vao4SyuGXKXn42HFtC/HW5RpZkm1cd98B
	IRmDs7Y2bWv9+a8BszEs8rp53h6b9hRbycDH+z3QuAuS6o1Y9B0SMtw7DM7SKDuZViBH
	W3ZhtJBW2ZmNdiwdKGPXpHEDfccoPLivSip1ie46ohmxAFdH0f+9KkkHYSHzuMbMzHh+
	8MliqNrGa8a7x6zzxECbfUYK1NT7ZUn/4vvsjvdUxIXgovKeH5bxxhSdv+9ohsM6mU0u
	bK3Q==
X-Gm-Message-State: APjAAAWIgJIrZiYdDAE/xWCxmXPqu3yk8JdMyp3aA72ljG+Q2lik+fIK
	5uXcGBDQqmXD4wBWUBnst2pqrKMmFHo=
X-Google-Smtp-Source: APXvYqzgev5hsW2h+OxBZYzF12z7kot1ZUgsUuYJu6YJapjq+Q04lkC1jU7Skj4OdaDm2R/LgDPGmQ==
X-Received: by 2002:a17:90a:b63:: with SMTP id
	90mr31173898pjq.96.1570425629039; 
	Sun, 06 Oct 2019 22:20:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	bx18sm9524839pjb.26.2019.10.06.22.20.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 06 Oct 2019 22:20:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Oct 2019 22:20:19 -0700
Message-Id: <20191007052019.1127879-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] README: Document need for 32bit compiler
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
X-List-Received-Date: Mon, 07 Oct 2019 05:20:28 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/README | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/README b/meta-oe/README
index 0e9f8423bd..347816b0d1 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -7,6 +7,13 @@ URI: git://github.com/openembedded/openembedded-core.git
 branch: master
 revision: HEAD
 
+luajit recipe requires host compiler to be able to generate 32bit code when target is 32bit
+e.g. arm, so ensure that $CC -m32 is functional on build host, if building this recipe, needed
+packages to fullfit this might have different names on different host distributions
+e.g. on archlinux based distributions install prerequisites like below
+
+pacman -S lib32-gcc-libs lib32-glibc
+
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
 When sending single patches, please use something like:
-- 
2.23.0


