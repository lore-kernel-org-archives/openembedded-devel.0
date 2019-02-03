Return-Path: <scottellis.developer@gmail.com>
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
	[209.85.219.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5938A6C10E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Feb 2019 13:38:05 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 64so4598826ybf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Feb 2019 05:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UJCQLUUK9fDhYfcZwLxDOidhLT37WYjEkWvwm7Et70Y=;
	b=Bj+vDZkDIFD5AqJPZvxgq9gLb3D/AAnuVosVRVKZyxKvLFyUvnYxGqNnHSJup8M75A
	MMr0NeoO3J82u+eGwecz/NNEzmaxNBpn3fAcDpXxZoF/RVqJAbxD9BBtVHRgBuSj/9t2
	YPJww0vuyulvIE05REcsBD0kwGnXR8YzWGkXgHAeLbmZkeVfU0FuAWhi/8e8LwZtydaf
	cwBCjsp3TnsedPeHbwsZwrD+ohj3LaF3w1y58NHtJHWF9c2+Ic8lOfJue2nY11HukMfG
	eeiQO67cqrqPYka5np3/9HVBkRfTey71JGOdcs79Sq84taCE/XV29vj80/GUIgrjeAAs
	GfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UJCQLUUK9fDhYfcZwLxDOidhLT37WYjEkWvwm7Et70Y=;
	b=EY2WJGfw35HLdovJx5ZTBPXbePOJBNEfg8glJjm8qrTt6rMRc9y+qhlrqxSM15K9a6
	wvOiELjUeZrpWJw2MWGQhYp83mYvN+mQze62fnmdjN65k8jOJrSqs5kukBP3NxkGg08a
	rp5NbI9WaC5V0ZlhvtAT/gHVWtCPQagOqY49/hVJVR5jVSOF1CK1VIORWwCoqqmxL/5T
	n+iPf5SXKh8uY4xCjJoq3sQV40YcbswQ6df3L905zGuycCpu1tex8L/P3vU40yIrkgA2
	T8DyM9j2P1oYQZOU5x91UMrv/z+b7tDZoIkunqIsPeA0nxlUsK623YjfzQg4CRO572uS
	jHhw==
X-Gm-Message-State: AJcUukf+a0Jtm6rlIQEnKLq3NIAZrATiLd8GVL0/w03VMjOWvNesVOXt
	AhBnYUZZgx+w6qEquas5k9dm8E8M
X-Google-Smtp-Source: ALg8bN78YxUzeoaxj3sDyWgIgfkmhOq14EXiTDMfRHGvMCMrFujVwTJIY3BCbvboLz3G5qJ44X4Zrg==
X-Received: by 2002:a25:2801:: with SMTP id o1mr38657459ybo.298.1549201086122; 
	Sun, 03 Feb 2019 05:38:06 -0800 (PST)
Received: from fractal.jumpnow (c-73-234-253-132.hsd1.me.comcast.net.
	[73.234.253.132]) by smtp.gmail.com with ESMTPSA id
	z74sm6186557ywz.51.2019.02.03.05.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Feb 2019 05:38:05 -0800 (PST)
From: Scott Ellis <scottellis.developer@gmail.com>
X-Google-Original-From: Scott Ellis <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Feb 2019 08:37:52 -0500
Message-Id: <1549201073-6116-1-git-send-email-scott@jumpnowtek.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] nmap: Fix typo in pcre PACKAGECONFIG
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
X-List-Received-Date: Sun, 03 Feb 2019 13:38:05 -0000

Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
---
 meta-oe/recipes-security/nmap/nmap_7.70.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.70.bb b/meta-oe/recipes-security/nmap/nmap_7.70.bb
index 01be151..1b4163a 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.70.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.70.bb
@@ -18,7 +18,7 @@ inherit autotools-brokensep pkgconfig pythonnative
 PACKAGECONFIG ?= "ncat nping ndiff pcap"
 
 PACKAGECONFIG[pcap] = "--with-pcap=linux, --without-pcap, libpcap, libpcap"
-PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpre"
+PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpcre"
 PACKAGECONFIG[ssl] = "--with-openssl=${STAGING_LIBDIR}/.., --without-openssl, openssl, openssl"
 PACKAGECONFIG[ssh2] = "--with-openssh2=${STAGING_LIBDIR}/.., --without-openssh2, libssh2, libssh2"
 PACKAGECONFIG[libz] = "--with-libz=${STAGING_LIBDIR}/.., --without-libz, zlib, zlib"
-- 
2.7.4


