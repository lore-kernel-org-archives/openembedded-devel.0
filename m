Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR2Mq-0003KI-BQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 17:28:23 +0200
Received: by mail-pb0-f46.google.com with SMTP id rp8so1857333pbb.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 08:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=DL9IM6TD/aNtxQdzcbMslGF95Yc1EmyqbWGQxeFlgzM=;
	b=Gcei2t3jkt+H+8kYD9jiMDTODTlBxjOX+r558qjZR9BWvaceElyQKhOBca7y/5ZQm/
	P8vZOF4fE3zzYEtRZ1knOIngKXNkT17TcE85N8/mGBAaSkDVi08HigjujkgaGuYcjuMR
	Xy6A3LamKk98AByit0GN/aLkoZOld8NDPczqfK6B7P1fInnyZYFVs1Ng6aAdq2lZmchx
	l7L9kiSNsRFEcZag63AQjPQWfarZg5gT2tr6QvL2eLX2m3nZDQ8105j+LnJJ13jsdbuX
	TKb2Q5zgufqO6p4aPomQSq9XN/Y4Yljf+fvcw0h93+95lK0pT0lOJc7e2+bW4csoHKER
	gDog==
X-Received: by 10.66.245.75 with SMTP id xm11mr20977699pac.40.1365865825619;
	Sat, 13 Apr 2013 08:10:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ce16sm14186089pac.5.2013.04.13.08.10.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 08:10:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 17:10:19 +0200
Message-Id: <1365865819-23608-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <20130313161800.GK3260@jama>
References: <20130313161800.GK3260@jama>
Subject: [meta-oe][PATCH] minidlna: move to nonworking directory
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
X-List-Received-Date: Sat, 13 Apr 2013 15:28:29 -0000

* distro-less build for qemuarm fails:
| Linking minidlna
| arm-oe-linux-gnueabi-gcc: error: getifaddr.o: No such file or directory
| arm-oe-linux-gnueabi-gcc: error: sql.o: No such file or directory
| arm-oe-linux-gnueabi-gcc: error: inotify.o: No such file or directory
| make: *** [minidlna] Error 1

* http://comments.gmane.org/gmane.comp.handhelds.openembedded/56989

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{ => nonworking}/minidlna/minidlna/fix-makefile.patch                 | 0
 .../minidlna/minidlna/search-for-headers-in-staging-dir.patch             | 0
 meta-oe/recipes-multimedia/{ => nonworking}/minidlna/minidlna_1.0.25.bb   | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-multimedia/{ => nonworking}/minidlna/minidlna/fix-makefile.patch (100%)
 rename meta-oe/recipes-multimedia/{ => nonworking}/minidlna/minidlna/search-for-headers-in-staging-dir.patch (100%)
 rename meta-oe/recipes-multimedia/{ => nonworking}/minidlna/minidlna_1.0.25.bb (100%)

diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/fix-makefile.patch b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
similarity index 100%
rename from meta-oe/recipes-multimedia/minidlna/minidlna/fix-makefile.patch
rename to meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/fix-makefile.patch
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna/search-for-headers-in-staging-dir.patch b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
similarity index 100%
rename from meta-oe/recipes-multimedia/minidlna/minidlna/search-for-headers-in-staging-dir.patch
rename to meta-oe/recipes-multimedia/nonworking/minidlna/minidlna/search-for-headers-in-staging-dir.patch
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.0.25.bb b/meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
similarity index 100%
rename from meta-oe/recipes-multimedia/minidlna/minidlna_1.0.25.bb
rename to meta-oe/recipes-multimedia/nonworking/minidlna/minidlna_1.0.25.bb
-- 
1.8.1.5



