Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UYFSV-0000Io-2q
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 14:51:33 +0200
Received: by mail-ee0-f43.google.com with SMTP id b15so759007eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 05:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Y7OYlUibky1gHjz6h7WoTZGRnSmqWoVHwoABQCfWGB8=;
	b=1AhHzE4o7rNOH9Y1RWybIuL9zGdQfX8qaq6bfV93qce52gp5gOYd+h4FgVykxI4ny3
	vMhc/G1mxx7s0uFpaGI/A06SjGQy7IknSxtmpqXM0sxsgOoGC69z+FOXhgMBF8xxJdB2
	RxmcKRAVtz7/kwuTMjTIkx6tnWkDw4Vl53O6YnDrBoarnonQ/LHaIT33iTEjxhaFdhz1
	yTQCxXvh91K0iPYJGNoQ0XflHSkKT391RHfXAARGFrMKu3+bE7OKslDVzu3idWtsPcqA
	bKuyNdLmfOWDmC1S0laFpCjPllL1qHW7oLGryxe5mMKGp+V52nse9vmSzEnOb0afAp/w
	gqhA==
X-Received: by 10.15.23.69 with SMTP id g45mr30865240eeu.25.1367584416203;
	Fri, 03 May 2013 05:33:36 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	bk42sm15658333eeb.3.2013.05.03.05.33.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 03 May 2013 05:33:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 May 2013 14:31:07 +0200
Message-Id: <1367584267-8767-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367584267-8767-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367584267-8767-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/master, V2 4/4] geany: update to 1.23 to fix build with glib 2.36
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
X-List-Received-Date: Fri, 03 May 2013 12:51:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

license change of FSF address only

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../geany/{geany_1.22.bb => geany_1.23.bb}         |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.22.bb => geany_1.23.bb} (58%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.22.bb b/meta-oe/recipes-devtools/geany/geany_1.23.bb
similarity index 58%
rename from meta-oe/recipes-devtools/geany/geany_1.22.bb
rename to meta-oe/recipes-devtools/geany/geany_1.23.bb
index f56c8f3..604c7c2 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.22.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.23.bb
@@ -1,9 +1,8 @@
 DESCRIPTION = "A fast and lightweight IDE"
 HOMEPAGE = "http://www.geany.org/"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
 DEPENDS = "gtk+"
-PR = "r2"
 
 inherit autotools pkgconfig perlnative
 
@@ -11,7 +10,7 @@ SRC_URI = " \
     http://download.geany.org/${PN}-${PV}.tar.bz2 \
     file://0001-configure.ac-remove-additional-c-test.patch \
 "
-SRC_URI[md5sum] = "0672077fe83e2a739aa0eaca426aacf0"
-SRC_URI[sha256sum] = "901a35a7395ef10a80fb10b3ab63bae3871693a4e82d56388e9521a27877577e"
+SRC_URI[md5sum] = "4290e8c32305e916f57bb0f0233bbec2"
+SRC_URI[sha256sum] = "cdd4a772694803c837ae59e56f7bdc2faba174509317211f522e7d25dfcbe8b0"
 
 FILES_${PN} += "${datadir}/icons"
-- 
1.7.6.5



