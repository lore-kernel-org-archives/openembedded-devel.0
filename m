Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIu0f-0007m6-13
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 04:46:17 +0200
Received: by mail-yx0-f175.google.com with SMTP id 22so1669985yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 19:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=qc3XzUau0m52Ztcstk5lNxlZOrseU+sMt2ut7fZeMEM=;
	b=XXbD2TXsinSBuDbXSaRVlA+hfU8kVgDHaLjern6eqclh1FUR0mjxl0Nug9YlcCwykC
	0n0F5/0Osq2wxTPIZs+mUmRax4057CXohuTjOjUGbXFGgZOAdfFZH1AJs3cpAY+HSU8w
	bWXRdqwKXyRQa/rjrS0N+/7Tsvwv/7DvY1ZfI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=KeAFTQxyLX4Ygh5x6WKzGDi4FMUX+CVfseDtKCRykqZHwbe0wNrAqbitFOC0WJ1Ezm
	xcaavPNt8fvxz2vwCjwa6CLDNI7vKEwerxqKl7Lrm7fLid7dsimrSGv1IBQujrYKerWh
	58TDkJNkaa6EW8XcImHvTXdxw0tBUZomSCeQU=
Received: by 10.101.137.17 with SMTP id p17mr3506561ann.10.1304822615388;
	Sat, 07 May 2011 19:43:35 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v1sm4837128anh.25.2011.05.07.19.43.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 19:43:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 02:43:00 +0000
Message-Id: <1304822586-14872-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 05/11] pixman.inc: use Xorg mirror
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
X-List-Received-Date: Sun, 08 May 2011 02:46:17 -0000

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



