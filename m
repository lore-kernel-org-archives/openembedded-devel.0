Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id DC1D378E00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 20:39:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j5-v6so5271674wrr.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 13:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=x5HDEGAGVSUVPK5ynRQXrjLdWVASi0ckr4eym5tOwXU=;
	b=jwyKOiOXAtgf+K0JtQ8BFz5M1oD5K2G+I1995j9LYDcG9wjDd9GTuvbrDOUGHQ+Aty
	03xfn1Oso3nyRQr8iq8isrOjFydF6oJ4XjTd4QYwlmI0EJhcA47FHWLva0l4Hp59wZWd
	DQiBthqqxn1UH3b29VdoDseyn50xLDYYXPQUcMAtS40JOE47e1id7o08ivB28QnlEvjG
	VVwERf7dvI3bzk9qdspSvjVpgqbm8xniN1IIMIUOoBImnMJtRfPlfAdczVnoJRsdeBJH
	E1ojdYRFK6bbkCY6kk/JdODTimdIAWKknymlWSEnuArzfJ4oOx8ISHxMwcjZAzYJN0dz
	GQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x5HDEGAGVSUVPK5ynRQXrjLdWVASi0ckr4eym5tOwXU=;
	b=rsl4Hu7krJjFabMr+qtWhzEiMTUvVaOiDoHoYcXVWdSX3TTv8KLsHSuBzgkOWMRm0s
	EQHXI5Nhk0Uy1J8nHykoEqN3zl4ghUebdBnXhfH5hwJ4KxjEtDVSh5khb86rWh+kokln
	pklzZOeGEO3T6KfBGDAQsLO9UKtXoHjWv4DKjUACx/ye8FuLFY3nJEYePpK4oWN9Jfew
	1hF2jbqgSzpRcEHWG9tNO4JU6kCswG0J5Zp5OrWPwbxPT0duvP71bzFoLQtGBuQGdlZe
	i4qxboMIew2jYXyLdRnkKv4tLZLJmWCSeEr6nRhPNdth0187DM8v20Nv7vSDkAxwERo8
	cx3Q==
X-Gm-Message-State: AOUpUlGAj+rr0/q+mrFPEaIcrFfObY5PKNMAjkq0q35OUDm/t5yh6h0F
	KrfSjbglp/Mr+PUZZkD+ir83qSID
X-Google-Smtp-Source: AA+uWPy0pBbuwV78/oPaDVYhMyOHf1/ZSKH7dWNRSkG3Ewps1B62sels46Dim+awO90VESK04vpcxQ==
X-Received: by 2002:a5d:6381:: with SMTP id
	p1-v6mr2584868wru.106.1534451959303; 
	Thu, 16 Aug 2018 13:39:19 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i15-v6sm187350wro.7.2018.08.16.13.39.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 13:39:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:39:15 +0000
Message-Id: <20180816203920.464-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][meta-networking][PATCH 1/6] inetutils: fix build with glibc-2.28
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
X-List-Received-Date: Thu, 16 Aug 2018 20:39:19 -0000

* fixes:
  ../../inetutils-1.9.4/src/uucpd.c:236: error: undefined reference to 'crypt'
  ../../inetutils-1.9.4/src/rexecd.c:378: error: undefined reference to 'crypt'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/inetutils/inetutils_1.9.4.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 190cd5f142..a27dbae2e6 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -4,7 +4,7 @@ rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
 talkd, telnet, telnetd, tftp, tftpd, and uucpd."
 HOMEPAGE = "http://www.gnu.org/software/inetutils"
 SECTION = "net"
-DEPENDS = "ncurses netbase readline"
+DEPENDS = "ncurses netbase readline virtual/crypt"
 
 LICENSE = "GPLv3"
 
-- 
2.17.1


