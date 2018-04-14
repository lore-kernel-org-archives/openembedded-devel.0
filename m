Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3A43F7458A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 23:50:20 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id t12so2213898pgp.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 16:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0pZnGMgLrkSl0dLQmMdJscelNfE4Fu3dnRnSc+gj6tI=;
	b=bXOYeS1YdCzD3AILqeUPMVeWed0U8eQMt8jcF5xtekpooq3USMJxBqGE2AfWyW0juc
	W1H/eFe3i8WFjRuyx8kOOCwIiw2Xc2xAP3kIk7G07yL8AyvMzJIYDzT4kONIYNlj7v9N
	GDBBqsFkK52GEJkCKhfoLsqY26s6PxGUn1+7QFaurpWUPridITPgsXXFpaxBCJ2LOhPc
	XV1qMU0Y2Xm2jxaiQtwFseybd3B55uYPvBJIXQr0VY4waFQ+cG3oWmfQ9KieWhVLAlku
	0SAFJt21qCmKiF7p2zJkAsdgWTQ1RMr+d8LsXhvwHrDDuzAhpu1GSefkPEPKOGyqtnNT
	DTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0pZnGMgLrkSl0dLQmMdJscelNfE4Fu3dnRnSc+gj6tI=;
	b=p5YjDJafWx69CUkIDv2gLJYaNSrgeJXnk0G3fBEj3bHT4CIi3Xo0ciI9mYsxsLz9p2
	k7TIYJSk8KiJRBvEXWerUtbObC5ukCTnmywMNMCAjMQ5J0Oodn2XvnZyGD2d/Ax/NLvA
	+ZlN+yL22n3Dixcmc7QMjzAqLML5H/RcDeuakPICliKn4CoEi3zcLXZbZrjpeg5z5+OM
	KWDh0DMb9gWZjLVZhMb/LcBTXKMrsA/psUfI/e8IyL3qzxZPS8SUHXcgjuVMA0HkKqAk
	ofBp4AJ3twcQwED5Yr8achCJsFFzIKI602Cg6qaL+Nx6VRk7Y4ub7Y/k385DIZ+UnpU+
	61EQ==
X-Gm-Message-State: ALQs6tAhexbm+WOy6RKgHsiS1Z4dToJfKTnOqRkVIjjL14mh535gjNcd
	pDdcG8cpCIrmy9WKiqzh5d4=
X-Google-Smtp-Source: AIpwx48zhppV1Gj6X1rsNZn0I2H18NxFveGuxWouONiEsLRniKouuoTetEaLsVix5DkihtzFFwbqfw==
X-Received: by 10.167.129.86 with SMTP id d22mr2921638pfn.21.1523749821819;
	Sat, 14 Apr 2018 16:50:21 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:19e4:d7e5:ee20:78ac])
	by smtp.gmail.com with ESMTPSA id
	f126sm19551000pfg.25.2018.04.14.16.50.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 14 Apr 2018 16:50:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 14 Apr 2018 16:50:19 -0700
Message-Id: <1523749819-31207-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523749819-31207-1-git-send-email-akuster808@gmail.com>
References: <1523749819-31207-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] librcf: BLACKLIST compile failed.
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
X-List-Received-Date: Sat, 14 Apr 2018 23:50:21 -0000

errror: conflicting declaration 'typedef class boost::asio::io_context boost::asio::io_service'
error: no matching function for call to 'boost::asio::basic_deadline_timer<boost::posix_time::ptime>::basic_deadline_timer(RCF::AsioIoService&)'
error: invalid use of incomplete type 'RCF::AsioIoService {aka class boost::asio::io_service}'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
index 43eff72..267c0e7 100644
--- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
+++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
@@ -50,3 +50,5 @@ FILES_${PN}-demos = "${bindir}/*"
 FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibRcf.cmake"
 
 BBCLASSEXTEND = "nativesdk"
+
+PNBLACKLIST[librcf] = " error: invalid use of incomplete type 'RCF::AsioIoService {aka class boost::asio::io_service}; among others?" 
-- 
2.7.4


