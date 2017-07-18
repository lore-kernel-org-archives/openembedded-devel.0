Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 71B8A77ECB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 09:51:00 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id z78so1225473lff.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rhb/ht+XapnfZfXIKB6wg4sBtFwrBubSvne9OwFrXYU=;
	b=jPhfFo7H99/fX76HQtqdYDw7faYFOXWfH1fpacMvlYY8XPoCNE8gOmRkGknWpVIbmI
	aDX7Zknzs8MuMKHXwogJ4ZFRhnPMgaFrY5DBkKbeHZjBu+dI2hDl8KsJJP4yL266ULtA
	Btx6cOE+S0un+m3J8QrZP4On6jS8NY8v1TKhvut55ULt6YhW4Xj8vs1GKgxsGLNAgggK
	Dw+TNdRbRDehvX0uFK1CKzYuzyvK+tbGBvwPbQCsTZlTmCWga4YkUgZed6BaQ7azdn/B
	BYYeC2dPtkq79/I8y01p/iH9GAieGJ/PqNkTuIzHS00JrCRpRenn800Mm7zan4InLjEd
	yfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rhb/ht+XapnfZfXIKB6wg4sBtFwrBubSvne9OwFrXYU=;
	b=FNxVLGZgFt2wvn/0lrCpGOVLKNt/l3MLlGyjXIONUCt4qeeTmGME955wKPF89xKPCk
	3VhBdBYICpY4leiQm1kitQfz+DOtcw+GMK7fFbjc2BEtwzh36VnV6Elj7fbtUSpZu0gj
	SgCTNhv97bYneNWDQLN3ZzKG8+zPuH8NlkJFns8J/KioCSBJTbFaLa+7dUbkhEP9JDYa
	ESShfu553wdOwfidVCChWtsQu+ItQJbhAwco8AfkO/eqS1b2alh85hc/gSOcIwDvu5dW
	cNlufdWCFucbZP/d00sKccoehYFcL//NOxNvIXm8fR04GeXRMK1rw9iC60P71drcweLU
	ivPA==
X-Gm-Message-State: AIVw113IzoWlvm0kHvXJkeUyCTTOHz9WwbhVsDQlFLjwqacuBFn5VaSy
	+xZbtoUWEuso9ERbmDs=
X-Received: by 10.46.22.22 with SMTP id w22mr381165ljd.76.1500371460852;
	Tue, 18 Jul 2017 02:51:00 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x62sm441459lfa.13.2017.07.18.02.50.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 02:50:59 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 11:50:53 +0200
Message-Id: <20170718095055.32249-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718095055.32249-1-ricardo.ribalda@gmail.com>
References: <20170718095055.32249-1-ricardo.ribalda@gmail.com>
Subject: [PATCH] clang: Fix name of .so file
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
X-List-Received-Date: Tue, 18 Jul 2017 09:51:00 -0000

When we are building an unreleased version the so name is:

libLLVM-MAJOR.MINORsvn.so
instead of just
libLLVM-MAJOR.MINOR.so

E.g.:

libLLVM-5.0svn.so

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-devtools/clang/clang_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index 6c7de15c480b..6690966085d9 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -131,6 +131,7 @@ FILES_${PN} += "\
 
 FILES_${PN}-libllvm += "\
   ${libdir}/libLLVM-${MAJOR_VER}.${MINOR_VER}.so \
+  ${libdir}/libLLVM-${MAJOR_VER}.${MINOR_VER}svn.so \
 "
 
 FILES_${PN}-dev += "\
-- 
2.13.2


