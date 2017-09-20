Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id BBC3D77E8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 15:11:54 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r66so1863154qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 08:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=L10aLtr+Jppt44wOhIy+/MZ3VBSPkx9LF6+kOkcW0WU=;
	b=pGs9See7ShVal7G2PjxYOsbL/AyXgWAfVGlRejTPLty3FJ1tuzrgpWDIRcJyJZroWe
	h0ZRnerm43IkJxwvL++jja1+IpDdu4KMTDmzvDN+iOMi7kh5dLpqMjk14EvRGN4K86Wp
	ZGk4NC+7Fh8sk5Dl+Z8zZECks/l/Qe0NczMCbqLG/0/nnWmeQUulyj8Iu/a8rLgjdW+K
	1MOieB0BkwlnOvSi+pNUM6DzUYEs+E4culMDaxnF3tPDGqqJH21KNfZOtxb16/WklSE0
	USj5q9q0aYhbwUZW5Vn4eAJYm8fRHh7jSuBJ+zdO/61lMLkn7PPPQ1jFJxF/H32Jcis1
	FUIA==
X-Gm-Message-State: AHPjjUjHlf31xdOp9uaehf70mcpZngfi61gmXTXW5HeLeUNUotj6asH4
	62u8tWrx88W9rlYMv1JpOIbABuLw
X-Google-Smtp-Source: AOwi7QBwJdi2YX58GjMn8Px58ZWc816thbfwURTtILCzml0M2zo9iECGaQSdySr7WckqTrhElRRkzg==
X-Received: by 10.55.2.131 with SMTP id v3mr7351967qkg.16.1505920315046;
	Wed, 20 Sep 2017 08:11:55 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	e64sm1436547qkc.15.2017.09.20.08.11.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Sep 2017 08:11:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Sep 2017 11:11:33 -0400
Message-Id: <1505920293-28115-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505920293-28115-1-git-send-email-derek@asterius.io>
References: <1505920293-28115-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCH 3/3] php: add libgcc to the runtime depends
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
X-List-Received-Date: Wed, 20 Sep 2017 15:11:55 -0000

Avoids issues with 'libgcc_s.so.1 must be installed for pthread_cancel to work'

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/php/php.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 0e55020..283d630 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -203,6 +203,7 @@ MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp
 
 PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
 
+RDEPENDS_${PN} += "libgcc"
 RDEPENDS_${PN}-pear = "${PN}"
 RDEPENDS_${PN}-phar = "${PN}-cli"
 RDEPENDS_${PN}-cli = "${PN}"
-- 
2.7.4


