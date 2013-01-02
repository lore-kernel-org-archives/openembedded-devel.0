Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TqPKB-0006mr-9A
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 15:29:43 +0100
Received: by mail-ee0-f41.google.com with SMTP id d41so7103968eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 06:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=WVjrWiwtNVJBTD3WoYjKakC+4O9gpe93PQYI9nYTgeA=;
	b=bp3suK+eATPK5+J0Euqg13HahegPHitQAlvLRMzoqgrGDqXSL6pYKmZ0RuvJC6hzXi
	ALITqnx0Iskr5GuK1SIqtuZs5fH6I5OpDkiRQmUC6S2ePartUVV3jkxknfjFqDL5E5l5
	Y4ne97Ry7ZTB1mN1GGsP5JOiX5/MDlYNkIx+uYnI9y6o7ILytyd5HDduWD5NHQYlTwcE
	AIB5blyzmyyB54lvuJtx/EOqRPI6+kSEb7EJWgzfNRULiIo2dJ/o3c12W/q9ggs9xeEK
	B9sFI1oV7UfZWiNoSpA+G+QMLIzi3SMn+79acs7ew37JCVYvASJ7iGZT5QEkSzEtJa6r
	VmTg==
X-Received: by 10.14.223.200 with SMTP id v48mr126043088eep.24.1357136081093; 
	Wed, 02 Jan 2013 06:14:41 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm97848402eep.15.2013.01.02.06.14.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 06:14:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 15:14:42 +0100
Message-Id: <6357209b3ac106c5c126a7eab4256f086aa1fbda.1357135909.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/6] sip-native: upgrade to 4.14.2
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
X-List-Received-Date: Wed, 02 Jan 2013 14:29:43 -0000

* only copyright year updated in LIC_FILES_CHKSUM

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../sip/{sip-native_4.13.3.bb => sip-native_4.14.2.bb}             | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/sip/{sip-native_4.13.3.bb => sip-native_4.14.2.bb} (82%)

diff --git a/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb b/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
similarity index 82%
rename from meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
rename to meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
index ddd132a..32579c0 100644
--- a/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
+++ b/meta-oe/recipes-extended/sip/sip-native_4.14.2.bb
@@ -3,15 +3,14 @@ AUTHOR = "Phil Thompson"
 HOMEPAGE = "http://www.riverbankcomputing.co.uk/sip"
 SECTION = "devel"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://sipgen.sbf;endline=15;md5=88e887a386c18a01240d8d055da4e441"
+LIC_FILES_CHKSUM = "file://sipgen.sbf;endline=15;md5=61b2ce7ddd624968411804d2fa9d776c"
 
 # riverbankcomputing is upstream, but keeps only latest version, sf usually have few older
 #SRC_URI = "http://www.riverbankcomputing.com/static/Downloads/sip4/sip-${PV}.tar.gz"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${PV}.tar.gz"
-SRC_URI[md5sum] = "76192829cc42ec558db46e4f9e1d8ba9"
-SRC_URI[sha256sum] = "ec295f71ef339c5b98db5650865f2c6c1200c4085b7a3f33f284111e1f534ac1"
+SRC_URI[md5sum] = "b93442e745b3be2fad89de0686a76ce9"
+SRC_URI[sha256sum] = "1a9d3bf26c821f369c175f8e68946b79bc994da4f96e8f5ecff06e6ee7ac0528"
 S = "${WORKDIR}/sip-${PV}/sipgen"
-PR = "r1"
 
 inherit qmake2 native python-dir
 
-- 
1.8.0.2



