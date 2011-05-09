Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJW06-0002s5-EM
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:20:14 +0200
Received: by mail-gx0-f175.google.com with SMTP id 3so1287155gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=tkTqdhvSBIX/V7cgpgdmsIgawYHgEqehCngL8Tnt62o=;
	b=gnLx+Mkhm5skNlvFlqLs2VxfFeRHEFX3uTiOzgxT3+X49/79PPJBHCJIUrYziM6CTG
	8qticJxw7aso3Cojizj//2UA47uAdOR5SuE5kFI/zRTFIojcLdCfHy+oMqWN0xxbiOTL
	odZaL6iURBMuPwTBs1fuy+uyI+5BewQSarfxo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=hYek6d692H5hOGh8/BG7J3cBd/1uWnIyyYCPp676LMK+IETb2jkeDruCGV8h2rccVC
	D8GHXsNiApnxDFf15HXExFpohfzkLnpbaYTbw6WrJqZlZcicgolmYzIxri8cU/aI98Rd
	ab/5xUrQfLpo1H2+ozbJtLVu9NnDJrXqpnaCM=
Received: by 10.151.87.2 with SMTP id p2mr6014833ybl.99.1304968651832;
	Mon, 09 May 2011 12:17:31 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:52 +0000
Message-Id: <1304968617-4949-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 07/12] libiconv: drop hack since gettext was being inherited
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
X-List-Received-Date: Mon, 09 May 2011 19:20:14 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-support/libiconv/libiconv_1.13.1.bb    |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
index 4db70cb..868314b 100644
--- a/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
+++ b/meta-oe/recipes-support/libiconv/libiconv_1.13.1.bb
@@ -8,10 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 BBCLASSEXTEND = "native nativesdk"
 
 PROVIDES = "virtual/libiconv"
-PR = "r1"
-
-#gettext.class cant be inherit here so use this hack
-DEPENDS = "${@['','gettext-native'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
+PR = "r2"
 
 EXTRA_OECONF +=  "${@['--disable-nls','--enable-nls'][bb.data.getVar('USE_NLS', d, 1) == 'yes']}"
 
-- 
1.7.2.5



