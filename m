Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygn-0001z7-EN
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:26 +0100
Received: by mail-pb0-f45.google.com with SMTP id mc8so8886134pbc.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=xRv9nsQpFhSpHMuQAW9nfp9rTIcvUenpq516MtMPMnQ=;
	b=rww1XIjqaJ37xAtYi8vLQ+bLdJYVQE6UvAtqv6pJsZTLIa27w+WS4hgESnpyB6O2Na
	LbqsRFqXrycJVD0jnXuYI/SteavbyAQFlTD96oK0BOBVpaCzBgTSh0IQw1anCKmcdbg8
	Fa6KgnTx5D35618Zs71fEzjkp+jeZkwmVpYP1fxN4Pa4cZ2mJjX5fPTYfnhfhjO79Kag
	wyioldYBJ1l5hWdx7XoiqKhcDeV2FqxPccYsmaKVMr/Xmio2o/elP7jjfihOVhcOk8XT
	A+knsstx4AUKPA4j0tEyL2UIzEr2zZYmmHlRRDD1nfWs6YmqZASsoIeIpIiCfMOu5lZj
	WcOA==
X-Received: by 10.68.130.161 with SMTP id of1mr140027101pbb.32.1357272020231; 
	Thu, 03 Jan 2013 20:00:20 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:29 -0800
Message-Id: <1357271974-3317-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/13] jansson_2.3.1.bb: Fix multilib use BPN in SRC_URI instead of PN
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 04:15:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/jansson/jansson_2.3.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb b/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
index 85aade4..8c7a11e 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.digip.org/jansson/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6946b728e700de875e60ebb453cc3a20"
 
-SRC_URI = "http://www.digip.org/jansson/releases/${PN}-${PV}.tar.gz"
+SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "28848fbc02d7657d930f97ce74f80d93"
 SRC_URI[sha256sum] = "5f2ebf63580c73cc115634861b5da1c919499dde37d2e73b16e28b0c8ddc3921"
-- 
1.7.9.5



