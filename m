Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id E8A746B812
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:31 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so181078ead.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=RYXq+6mqzJRoY7u8DugiMsCkK0kWwjGdnWd3Gwans2c=;
	b=xXimgzMGW4DB8z6420NJQQwKDdOwlviGY8zGtfA425sixCVIRhKuAxj0VIWckHmmnR
	W5sW27LwxThHxlkoDoo8G9U5MsVMEmGixwj7Uoe5n2jbOSapO1tTjvJKSHCdmT6GPry+
	AIA1Nf96XwDUuXuu1pe/l2Vrhkk03VLatTUYTaBOaAUuilN6yF8yLn1uFP43zXWFWbA4
	P/jdy0deNcnAr0J5Vf+HshnWEG3UwsZf3Fp8mHrqcyAmCrnfksRPkP4pV7Zom7WEb15P
	X8IbjxX6scnMNgOy6gvH5LB5ZnTftuaTiuCLTQ7pWhfY80X12w5X5+i7tClt8ucw5aI9
	q1tw==
X-Received: by 10.14.29.67 with SMTP id h43mr20790675eea.7.1376551172386;
	Thu, 15 Aug 2013 00:19:32 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm81948287eel.12.2013.08.15.00.19.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:10 +0200
Message-Id: <eea7c0579e4fa9c505501c0c879c823cc7df4d71.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 30/60] vim: add PACKAGECONFIG for acl
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:32 -0000

* it's autodetected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vim/vim.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
index 12e8c1e..d7336c2 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -32,6 +32,7 @@ do_configure () {
 PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
+PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
 PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
 PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
 
-- 
1.8.3.2


