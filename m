Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5Dyw-0006xr-9V
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 11:15:59 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1664409bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 02:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=5QB5sB48xh6n1ijhM/wnjBEuqN8dCSXmDubWOd097Q4=;
	b=ZFXwnLdmpWynqpoB1ACFQxAUPb2FCQGiXudp88ok3uZ8jbDY4Ye0WdLtyKatYKyuBj
	BcsbfCd47fcRxeEO8eQwfLLAG8a4U2VidFuwp/CrOUPjYkY1oSjhB6DKPIMCfm4TJmS9
	26cFF9iZnZOKgkcW/PKsqoOn9ce6VY6n/HG04=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=d7OsruewQpBANvTGI6uUOhkkONjUEr9ygc1j4iyS3I5oJbhBFTMHHVL+M+i1vxjHxu
	+JJ+nB8WeatIWE4zfO7JBL1r2vDA7n2ueb6eu6/hlsSDwtINN1ejAY8N+IV6fs41YTRB
	pH09mAlAkXT/DVrA1oH0eqv2a44s9LNsum7IM=
Received: by 10.204.49.87 with SMTP id u23mr2128957bkf.171.1301562840230;
	Thu, 31 Mar 2011 02:14:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b6sm584707bkb.22.2011.03.31.02.13.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 02:13:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 11:13:52 +0200
Message-Id: <44ead8d4c9a5a985a0b878d4b166dc552f5896b8.1301562689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301562689.git.Martin.Jansa@gmail.com>
References: <cover.1301562689.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] ttf-sazanami: fix LICENSE and add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 09:15:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../ttf-fonts/ttf-sazanami_20040629.bb             |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 1b9a01b..1ee1c9c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -5,7 +5,8 @@ DESCRIPTION_ttf-sazanami-gothic = "Sazanami Gothic Japanese TrueType font"
 DESCRIPTION_ttf-sazanami-mincho = "Sazanami Mincho Japanese TrueType font"
 AUTHOR = "Electronic Font Open Laboratory (/efont/)"
 HOMEPAGE = "http://sourceforge.jp/projects/efont/"
-LICENSE = "${PN}"
+LICENSE = "Public domain"
+LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-japanese-font"
 PR = "r5"
-- 
1.7.4.1



