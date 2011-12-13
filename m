Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVbL-00020s-Rc
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 17:53:11 +0100
Received: by mail-fx0-f47.google.com with SMTP id a20so369504faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=M58W0SUtVG41yWaQh8Gdoq5VhO6q++IrRBtJ1OJjPVQ=;
	b=MDMd7x4ZmlJgFY4h2JXrfBA2ZRmcvj4OHbCpqejRFTa5v9DqTuNaK+ge/XhKnIbLb0
	EafEBNw7N+9uyKGJR2mspZSP5/AxFC5DPIdW1fdrwnNAtejsxoXs2HrMsDMFlVIXvsOI
	7/ZlkuaSrLHjeTcSkW8LGDgONClogWqgpEtL4=
Received: by 10.180.7.161 with SMTP id k1mr27439002wia.23.1323794777269;
	Tue, 13 Dec 2011 08:46:17 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	n9sm27277056wbo.16.2011.12.13.08.46.15 (version=SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 08:46:16 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:44:42 +0400
Message-Id: <1323794683-24233-6-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
References: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie 5/6] libopie2: make libopie2-dev package installable
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
X-List-Received-Date: Tue, 13 Dec 2011 16:53:11 -0000

For now libopie2-dev package depends on libopie2 package which doesn't
exist: libraries are split into the individual packages. Fix that by
making libopie2-dev depend on all generated library packages.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/libopie/libopie2.inc |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-opie/libopie/libopie2.inc b/recipes-opie/libopie/libopie2.inc
index fbe2fd6..af4385f 100644
--- a/recipes-opie/libopie/libopie2.inc
+++ b/recipes-opie/libopie/libopie2.inc
@@ -8,7 +8,7 @@ I18N_FILES = "libopiecore2.ts libopiesecurity2.ts"
 DEPENDS = "libqpe-opie libpcap sqlite3 bluez4"
 PROVIDES = "libopiecore2 libopiedb2 libopiemm2 libopiesecurity2 libopienet2 libopiepim2 libopieui2"
 
-INC_PR = "r16"
+INC_PR = "r17"
 
 S = "${WORKDIR}/libopie2"
 
@@ -98,7 +98,9 @@ do_install() {
 
 FILES_${PN}-dev += "${palmtopdir}/include.pro"
 
-PACKAGES_prepend = " libopiecore2 libopiedb2 libopiesecurity2 libopiemm2 libopienet2 libopiepim2 libopieui2 libopiebluez2 "
+OPIE_LIBS = " libopiecore2 libopiedb2 libopiesecurity2 libopiemm2 libopienet2 libopiepim2 libopieui2 libopiebluez2 "
+PACKAGES_prepend = "${OPIE_LIBS}"
+RDEPENDS_${PN}-dev = "${OPIE_LIBS}"
 
 DESCRIPTION_libopiecore2 = "Opie Development Platform 1.x Core Library"
 FILES_libopiecore2 = "${libdir}/libopiecore2.so.*"
-- 
1.7.7.3



