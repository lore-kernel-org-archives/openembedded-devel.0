Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5EyT-0000Vt-Ev
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 12:19:35 +0200
Received: by bwz5 with SMTP id 5so1699154bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Gf8AoMYzX5wElCWh+KzvBOOTCX4oLfE5AasLD/DNOMA=;
	b=bHl+6cW7iQXOJNEtF9O0QaIIBQirPY16ZZCg2+qn2Zexj9EjnnvvrD33Hh8sh2BeAf
	8hSqzltaome9CtblWHsgxdrmrxcphVehAmba4zjBbOXZamwy24Ww5j9bM2v+BoiHWqMa
	XOybgSywb0B52s/NHSNaW7fYnH9JOyAq7uPKw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=F+S/1kdEW11UP6A0+6mGsak3xnSUPfPeHA1EF3alYfPC/bm55nHM/oCbplxjcWCSJ/
	NWs0WB4Nc614mQPKjbVMnOnK+YFqMg/F6cS0EghVsO8mcrJgSnktxcsj2DTvkVBp95PS
	kYyNMUVs7LbXh9cfwfUOkXcqwHnMufDjoevas=
Received: by 10.204.82.143 with SMTP id b15mr2237681bkl.118.1301566651995;
	Thu, 31 Mar 2011 03:17:31 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm635511bkt.5.2011.03.31.03.17.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:17:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:17:29 +0200
Message-Id: <eaec45e0d96688532c6eb1dc78a4e17330d1a5cb.1301560589.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/8] elementary: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 10:19:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 6276d00..2fdd0dd 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "EFL based widget set for mobile devices"
-LICENSE = "LGPL"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=620edc2399d9155fc180a0adc2b0ab7c"
 DEPENDS = "eet-native efreet evas ecore edje eet edbus ethumb"
 PV = "0.7.0+svnr${SRCPV}"
 PR = "r11"
-- 
1.7.4.1



