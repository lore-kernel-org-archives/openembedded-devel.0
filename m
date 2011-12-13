Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1RaVbG-00021B-KC
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 17:53:06 +0100
Received: by wgbds11 with SMTP id ds11so12091198wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 08:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qIGU6gsO6cotcE+leb8qIJeSZk0ZLdqSrWWpQ8+pSLU=;
	b=QwGPrekEe1SP+NCAV242LR68Fzgk171DA2O3Lxhi05UrxCHtOyaMGSX/upJiifQSfG
	36TiHzwb2XAWmfGd51LtpmBYpNWFexiwvqk5ewUYkkxnpXNDaOdKyA8rNiwTBv/V7A53
	gPaKYdJtR0FgUh6sKWZXnFQrBVoU+y7cJqpEo=
Received: by 10.227.209.146 with SMTP id gg18mr17586318wbb.6.1323794770876;
	Tue, 13 Dec 2011 08:46:10 -0800 (PST)
Received: from fangorn.rup.mentorg.com (nat-rup.mentorg.com. [139.181.168.34])
	by mx.google.com with ESMTPS id
	n9sm27277056wbo.16.2011.12.13.08.46.08 (version=SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 08:46:09 -0800 (PST)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 20:44:39 +0400
Message-Id: <1323794683-24233-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
References: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
Subject: [meta-opie 2/6] qmake: do also provide nativesdk variant
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
X-List-Received-Date: Tue, 13 Dec 2011 16:53:06 -0000

Opie SDK needs nativesdk version of qmake package. To achieve this, replace qmake-native
with qmake recipe, which can be built both as virtclass-native and virtclass-nativesdk.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../{qmake-native_1.07a.bb => qmake_1.07a.bb}      |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename recipes-qt/qmake/{qmake-native_1.07a.bb => qmake_1.07a.bb} (92%)

diff --git a/recipes-qt/qmake/qmake-native_1.07a.bb b/recipes-qt/qmake/qmake_1.07a.bb
similarity index 92%
rename from recipes-qt/qmake/qmake-native_1.07a.bb
rename to recipes-qt/qmake/qmake_1.07a.bb
index e4f0cd5..8bd57b2 100644
--- a/recipes-qt/qmake/qmake-native_1.07a.bb
+++ b/recipes-qt/qmake/qmake_1.07a.bb
@@ -13,10 +13,11 @@ S = "${WORKDIR}/${QTEVER}"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=629178675a7d49c9fa19dfe9f43ea256 \
                     file://README;beginline=1;endline=7;md5=a85582a7befb26735438461afd8559af"
 
-inherit autotools native
+inherit qmake_base
+BBCLASSEXTEND = "native nativesdk"
 
 export QTDIR = "${S}"
-EXTRA_OEMAKE = "-e"
+EXTRA_OECONF += "-platform ${HOST_OS}-oe-g++"
 
 do_configure() {
 	# Install the OE build templates
@@ -26,9 +27,6 @@ do_configure() {
 		install -m 0644 ${WORKDIR}/linux-oe-qmake.conf ${S}/mkspecs/$template/qmake.conf
 		ln -sf ../linux-g++/qplatformdefs.h ${S}/mkspecs/$template/qplatformdefs.h
 	done
-	QMAKESPEC=
-	PLATFORM=${HOST_OS}-oe-g++
-	export PLATFORM
 	bbnote ./configure ${EXTRA_OECONF}
 	echo yes | ./configure ${EXTRA_OECONF} || die "Configuring qt failed"
 }
-- 
1.7.7.3



