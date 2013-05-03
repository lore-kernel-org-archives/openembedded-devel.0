Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UYDzP-00074L-Bv
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 13:17:24 +0200
Received: by mail-ee0-f52.google.com with SMTP id d41so663352eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 03:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Y7OYlUibky1gHjz6h7WoTZGRnSmqWoVHwoABQCfWGB8=;
	b=RE97savKjcq5QvI/UvvheHhH348TAhJLO9wuc3g1v4wwiQrHuk26Xf9jkFWBFLVYOt
	ozfV9LsQw7LBTvJCyHABgq+xxlbhm7RjyqxbeKvJPxz+lhPaQIFJoUM9edSqsorEx+K/
	Dxlk6isfZZQXjF0fEGRhlbSG7lAr0vHyqnBnz3DsG36UJVL0bGjIe1itNeY7NFdai4Za
	BEWm9P4ntIbyu94DHbIxDtwlJlrC7icU+tv3OQHNGoKtHQ3bOlYM1rbLtKV8Vby0CNEd
	oNoJt4gF/tphy+l3mK1Dx85XbWam74Jj5p8v7jMEMU5KrMcmdThu4kTGyjQLOj0Zl2jx
	0qvg==
X-Received: by 10.14.3.137 with SMTP id 9mr18618054eeh.0.1367578768799;
	Fri, 03 May 2013 03:59:28 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id n7sm15205167eeo.0.2013.05.03.03.59.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 03 May 2013 03:59:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 May 2013 12:56:59 +0200
Message-Id: <1367578619-19890-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367578619-19890-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367578619-19890-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/master 3/3] geany: update to 1.23 to fix build with glib 2.36
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
X-List-Received-Date: Fri, 03 May 2013 11:17:32 -0000
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



