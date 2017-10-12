Return-Path: <net147@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8176D71974
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 07:25:07 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z80so4964054pff.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 00:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cnz7wvL8+PyxsWf1q2yYAvlRV94AcSlVfT2RdQwonwM=;
	b=j0sLMvKFAerfRy9FpLSIdmvSs0h/yG7DbgEijYg84YzbZqlcZhW2UFuKxEqB7r+BDa
	3WsrRCQzIx3mEYQJfEdRb1bm3ERVI69NSgTaoVlvAl12qMTsHB4LxMZsZK/XxMhns8iy
	tO46sCIsjrfvsZ05NG47Hq0vKTI5EHCd0QpTiKjj6mLxdZeGTwDICYLiUumluFa5cPO7
	eU4BBBSPvFf5Jo8V7Sx3op/Elba0NGN8Fns9erHZjjoxrlaZ0nmkTCbdHlgbBzvhpsmL
	TYFBOlqHH5Ynbf1cG2+5YzwdiUVoSpZ5FhZ+Zm2ssE7LKmRKEp0gfHi1i5nnQOGKdMJd
	Wx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cnz7wvL8+PyxsWf1q2yYAvlRV94AcSlVfT2RdQwonwM=;
	b=rK0PEdkunjBPkWVt4tjmwYOs9lT6dAJJ04bGlgSCYaf9mb5Fhv7HSyxYeEpu5/B7xD
	IIbgEMZHYWgO8xQt5RBpkYUm/oR+dJ8MmjL1CVPO+0hndSUM6sEhwTfk3loAbTXfzneA
	000VazsYtRYaBdtXHzyiN3MEPDG6pJBmwv+zhPHQpahsIFyOYyOVggd71z9D5DvhefU+
	Eu987/nA8WA6BuaPomzJIsl/hq6xrNNwDJxbltSjac2ucIZ6J9k0SyZeVgMqWdx59LWo
	Bjw0uL6e8arIqIHsqrBHR3d/Vs4Q+I+jFtfnIy/y0jPxgoB2TkasoCSRiag9tqFUchq+
	g5eA==
X-Gm-Message-State: AMCzsaV+r46heXDjYtN57MfyY+3V45nFJmswnfx8bOzDo01xANGiyuvc
	aAabNT480F5zWADSgtaQuEQ=
X-Google-Smtp-Source: AOwi7QBDePqSnpX7sW34huT0QrzPCDugWDVlqVXjOi4Ktsn8EYfNp2cYV1UFivc0e1xSE1qwBYOeMg==
X-Received: by 10.99.63.199 with SMTP id m190mr1302113pga.273.1507793108589;
	Thu, 12 Oct 2017 00:25:08 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	p17sm14873597pgc.66.2017.10.12.00.25.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 Oct 2017 00:25:07 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Oct 2017 18:25:44 +1100
Message-Id: <20171012072544.18509-1-net147@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-oe][PATCH] nodejs: Add npx to nodejs-npm package
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
X-List-Received-Date: Thu, 12 Oct 2017 07:25:07 -0000

${bindir}/npx is a symbolic link to npm-cli.js in the npm module.
This avoids the nodejs package depending on nodejs-npm.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
index 5c580fb72..5bcbc0007 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
@@ -79,7 +79,7 @@ do_install_append_class-target() {
 }
 
 PACKAGES =+ "${PN}-npm"
-FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm"
+FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"
 RDEPENDS_${PN}-npm = "bash python-shell python-datetime python-subprocess python-textutils"
 
 PACKAGES =+ "${PN}-systemtap"
-- 
2.14.2


