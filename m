Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi4s-0002l7-Rr
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:17:42 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926297eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sEXe+xT4Pfx6JZiPsNVZpMklMl63Qqoka4IUnTPfRX8=;
	b=wMda0PqFpZAQbmsNZRUUXLbZxPMOs5Ex+4uV6muXUKsgGH56ysL1iZKNTQuJR3KCh7
	GMcLSpiyfenWDw47ME/SxQfTnreIQTEUcYs9JYxp06atZwODkKXldqyTd3GBdUpLpG/U
	V62BSfiyLfH483xm5ySJJbQChNIOQ04GXTI79/f3ajggJ0oILmgVaRZCsH166Spf6IxX
	/2AVGm8cshRfgAY7t5wsutYP3zYqyvOPpZ+RLAcc/zNnQYMP4G0XtaI3D6Dol4XyK2+A
	THM+lTaKRNTImCKYfC1uBRfku6oFaBES8hvejeHyvjTlo8ntErMfUdoEZI2234GATxyK
	g/Kg==
Received: by 10.14.199.5 with SMTP id w5mr17073763een.31.1354586603281;
	Mon, 03 Dec 2012 18:03:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 44sm25516872eek.0.2012.12.03.18.03.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:03:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:00 +0100
Message-Id: <f67355564a62fca82a3a6189008fda46640cfd3f.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 27/58] epeg: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:17:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/epeg_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/epeg_svn.bb b/meta-efl/recipes-efl/efl/epeg_svn.bb
index fc2a896..41152ff 100644
--- a/meta-efl/recipes-efl/efl/epeg_svn.bb
+++ b/meta-efl/recipes-efl/efl/epeg_svn.bb
@@ -1,5 +1,8 @@
 DESCRIPTION = "Epeg is a small library for handling thumbnails."
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
+                    file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
+
 DEPENDS = "jpeg"
 PV = "0.9.0+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
-- 
1.8.0



