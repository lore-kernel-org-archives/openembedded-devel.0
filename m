Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE2566B11A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 02:52:39 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id e1so4903019pgj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 19:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CazRO+mWf7zBCr/r2lUE35x1tOseh2eM6qk/+ND/OgU=;
	b=bHBlWHp8EIRfXshRlLME+xo3QF/JaAivbEwTvl2l8N13PaH+BEn93G8hx8JkurN/KC
	OMCTFJXbWSuBT5k5EHWs2BzzT3IHwGGIp7FgIyDFWAPiijh2fL8mUHZvrcY+q5DX7uKy
	CwVd62cp4jFcbEJHjjhd+bHQg7VpA7d0Q9VHZafgp6m2uJYzxBKdnk+kDBzd10ch8Q/6
	M+hNKo288wL1MdvsAzmgtC4esJ/6xkSK5/umYUF8C8Dm8LSTdvrLcl8lGp7ThkFLdRZT
	SaPkoIXOIEqsPRwwweG3HTejlokfRWqdZYa6+tOJ2ax3Rls1c/+moccjW9ejD/bZWqRM
	xMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CazRO+mWf7zBCr/r2lUE35x1tOseh2eM6qk/+ND/OgU=;
	b=GBZYZVTbpAU9m8DLYR1e+0gnur0epvpRlQvYYuB8FHJwbqEiGZ/uw+yav2nXeTzQzu
	N/3NgJFXPsWIvh55n2RV38Hycrgp1x5sOrcE1juoK0vv2qmTYg8IDR4XrH+xZa2y5WcN
	I3gG0WGFhDgHGvNCJjlFsGKJyB/g2uFWY21FoLjRpAG3xirMIk4YC5beUjTKPcSHReiJ
	Rc/sLRxQvU+E4Gy8tKUqewzfhBzuLQUuvJDCc+IV6QzdUk8cI+BMmWTe7HQrv2178zrp
	KMTKy8YDq92g3MOjKS0CiigBrUv6wvIG/UX/yNV1HgPaX+JSexUxGhZdCwIMD9Wajwis
	hfeQ==
X-Gm-Message-State: APjAAAUFW/WYNmu9hZYiG/7szbS6r2LC9S1puFBXIvCTMeMQkVO90DBH
	MhWuqp+nRn5XM+q588ZP8IUESzlFDTk=
X-Google-Smtp-Source: APXvYqxsIHonUJtoyu7FAuuuH4jMun8KtBboMLehannvY/w8Z3vp3lfwu6b/fcyj9nFZBLKiG+5jDA==
X-Received: by 2002:a62:a50b:: with SMTP id v11mr14003169pfm.164.1570762360110;
	Thu, 10 Oct 2019 19:52:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	c10sm7517934pfo.49.2019.10.10.19.52.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 19:52:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2019 19:52:31 -0700
Message-Id: <20191011025231.2457830-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] jsonrpc: Disable coverage in default build
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
X-List-Received-Date: Fri, 11 Oct 2019 02:52:40 -0000
Content-Transfer-Encoding: 8bit

Building with intrumentation is only useful during development or
optimization phases, in production, this will just make it slow and in
some cases not work where file system might be readonly.

If its needed then enable the packageconfig via a bbappend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add coverage packageconfig

 meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
index b23775708a..dbf44d796f 100644
--- a/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
+++ b/meta-oe/recipes-devtools/jsonrpc/jsonrpc_1.2.0.bb
@@ -14,6 +14,9 @@ SRCREV = "4ed5b00dcc409405a19e6d8c6478f703153430e1"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[coverage] = "-DWITH_COVERAGE=YES,-DWITH_COVERAGE=NO,,"
+
 inherit cmake
 
 EXTRA_OECMAKE += "-DCOMPILE_TESTS=NO -DCOMPILE_STUBGEN=NO -DCOMPILE_EXAMPLES=NO \
-- 
2.23.0


