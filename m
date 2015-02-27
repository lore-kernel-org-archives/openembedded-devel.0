Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id BF81972491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:47:00 +0000 (UTC)
Received: by wesw55 with SMTP id w55so18410385wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WrXlDya5y3F45Ig4t6fCP6OGr3nj2YvYVHd6QlBLRxg=;
	b=VEw2n/+uFL6JBUI08i4T6nunS6PDgvYV+1sdd7Ok4QsyQMyA9e6vIkZT/c6paO4tra
	WgHZ654xTTwdiV3ybxipQxdP44MKYoUSqpXFH/no0vT+fCvZUC+22eCzDIWmJ97TB8Xo
	iezMnMvONNJDYoWDVjfUX+qNxTO4bJcofP39bH4xjkYPW3v2veYfIV9RW4RH/LQOUFza
	icdKyaP8/wXtf1RAu3noCjaq9z05cLjb1hwxncIdtgZbC1TNy2EsVkhHwCjYtAAXIkjB
	5Lnwgqc9y327Zt5UiCQ3U8SwIV5jMJr36lnoG6EoFC3yyzPfGTCliMgtD07rG7GVBOAH
	B8kQ==
X-Received: by 10.180.126.69 with SMTP id mw5mr4453414wib.12.1425026820795;
	Fri, 27 Feb 2015 00:47:00 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dn1sm1803566wid.11.2015.02.27.00.46.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 00:46:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Feb 2015 09:47:16 +0100
Message-Id: <1425026836-25251-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-oe][PATCH] vim: fix up for /bin/vi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Feb 2015 08:47:01 -0000

* it was changed in:
  Commit: 95dc2ddce7a0ee4d16d6c69fd123e4e6921bdf2e
  URL:    http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=95dc2ddce7a0ee4d16d6c69fd123e4e6921bdf2e
  Author: Jackie Huang <jackie.huang@windriver.com>
  Date:   Thu Nov  6 03:22:27 2014 -0500
  Subject: vim: add recipe for vim-tiny

  but busybox still registers /bin/vi, so u-a was broken
  update-alternatives: Error: cannot register alternative vi to
  /usr/bin/vi since it is already registered to /bin/vi

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vim/vim_7.4.481.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
index 7490229..afdea84 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
@@ -104,6 +104,6 @@ RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-commo
 
 ALTERNATIVE_${PN} = "vi vim"
 ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
-ALTERNATIVE_LINK_NAME[vi] = "${bindir}/vi"
+ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
 ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
 ALTERNATIVE_PRIORITY = "100"
-- 
2.3.1


