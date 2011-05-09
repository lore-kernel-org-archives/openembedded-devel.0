Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJW07-0002vL-63
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:20:15 +0200
Received: by gwb11 with SMTP id 11so2078209gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=qc3XzUau0m52Ztcstk5lNxlZOrseU+sMt2ut7fZeMEM=;
	b=sYSgFlfAEYnwSnYXBxFXi2SiTFDvRpZ8zb0xUT/qorEJWkeNYxXs4MqR3uOJmp2AfS
	dukmdSwLR5b+uZVPz2BXxxXg3SuhR0gCXrZAVqt6cFOntrG8zeslcUjLn8fiAIwQbJ/A
	j0kdIGI1Cr0YCYXDJ+2DgEQartBVHyXvGVgYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=MmegWqUf0QaCTFG+/xzuP3caCXMi7NATFPJS93kClnFsyvAR2+9mOQEw8oF3Enujrm
	qXuQ3PYRlLT99/L0rIloJnBpRZXfU0ggINVKMBQP6Rh7Wy2m+u3jYlhg3EoxXGW6MDH8
	WNxj75OUQ4Be7XwvhVr6ccfamBhjTteKcYdMM=
Received: by 10.151.59.19 with SMTP id m19mr6321687ybk.349.1304968645359;
	Mon, 09 May 2011 12:17:25 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:23 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:50 +0000
Message-Id: <1304968617-4949-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 05/12] pixman.inc: use Xorg mirror
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
X-List-Received-Date: Mon, 09 May 2011 19:20:15 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-graphics/xorg-lib/pixman.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman.inc b/meta-oe/recipes-graphics/xorg-lib/pixman.inc
index 539a33a..5661fae 100644
--- a/meta-oe/recipes-graphics/xorg-lib/pixman.inc
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman.inc
@@ -7,7 +7,7 @@ DEPENDS = "perl-native"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI = "http://cairographics.org/releases/${BPN}-${PV}.tar.gz;name=archive "
+SRC_URI = "${XORG_MIRROR}/individual/lib/${BPN}-${PV}.tar.gz;name=archive "
 
 INC_PR = "r5"
 
-- 
1.7.2.5



