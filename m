Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id DE3EE77375
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 16:19:27 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id b205so206824066wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 08:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EoL7uM3xLDfSiKSxwp3cp9B6NVBwBxXWb83x+eeL//c=;
	b=QfpkHEoq2AFUFo18H9KqmkqbfhdUwCEub2XDSmiAhulfgSUOLWVmfNec8GiHQKg/nu
	mZr2H5hyzV9jZ/QYrhF8PXMxuAXN0lP8+6apwJ5y/H7eyYr4NLbRJVqXtCe1iArUkoly
	1VynatnNXXY0dS7mzUW6IuJRn21YDddlymJ0BK8thHdnA7PfHeeFJKMXB0csyxwf2Rw8
	0W/2l5+tT4ZGS6l44oBNn7Wa+5dkvowuLLtE/f8ojyt1NUJfkrr4HwnjyywZKPTw0Ry+
	I8bOC72T1dDX8+v4tb06eCU/euYbqnR9lD/hssH7G3ciUTE1N+CEHZe5rhKQab3MXpId
	8CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EoL7uM3xLDfSiKSxwp3cp9B6NVBwBxXWb83x+eeL//c=;
	b=gB6lbpGkseGxylUD4J78B2GBOXCGRVBG1pwvPr35sC3dmwOy1CYY0ajQdOxd44/bEM
	4TPUvfNdJ0cs1M+8MY9sa0PMVOHz9hK2ZXBO1ZPl6RiOgykEgilEW0TidEzFvZrkEje3
	NkVrp6VWreoztIzm6OtFGgbIyOUkxRgupnegHMWXyjSzv6KaLAM1taJftAYTnpS4nyLq
	FD6NL50rEybvTpnMV46bsjJY2b7zPwF6tWG7ukgUFRUqHixwxqi7XtBYwy2ilyvOm7qi
	d50ZFeL9gxPMMwuyEofhQ/qeAq9ygxW0n18vcbwmNpuviVS7vuhCyHEEEBr88A5PWS0i
	Rl9Q==
X-Gm-Message-State: AG10YORpn4fDOoXGYTOU2mT3XMw1UpgXi3L4Mxuj7pCCLnQCdeJA7CxIxuvgInFvwJfVAA==
X-Received: by 10.194.94.138 with SMTP id dc10mr40559187wjb.37.1456244368063; 
	Tue, 23 Feb 2016 08:19:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hh8sm30398005wjc.42.2016.02.23.08.19.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 08:19:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 17:20:26 +0100
Message-Id: <1456244426-24446-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe] concurrencykit: drop trailing continuation character in do_configure
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
X-List-Received-Date: Tue, 23 Feb 2016 16:19:28 -0000

* with newer bitbake it parses it differently and task fails:
  concurrencykit/0.4.3+gitAUTOINC+900d203aa9-r0/temp/run.do_configure.13244:
  Syntax error: end of file unexpected (expecting "}")

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index eebccf0..b4ac9c9 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -29,7 +29,7 @@ do_configure () {
     ${S}/configure \
     --prefix=${prefix} \
     --includedir=${includedir} \
-    --libdir=${libdir} \
+    --libdir=${libdir}
 }
 
 do_compile () {
-- 
2.7.1


