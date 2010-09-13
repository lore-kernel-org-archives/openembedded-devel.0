Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1OvG8X-0002ey-U7
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 23:00:57 +0200
Received: by ewy7 with SMTP id 7so2995873ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 13:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=JADXVi5YtSRilEFXWbBpjIywxmXrKZXjcIr+UWjN1Ag=;
	b=g4R1oRhvnTtXBmxVfPzRyxrfR0ou8YH6MBttvZfBXwfEDs3yUFCjftx2QLGtfS/ijE
	eksMEyO8FKn/9DdwtKGhg6B7BVR/W6HIaOfJMGMA4xSWgvqAnH+MCx/rMaoL0C6rKCZq
	JPl7sgXNUVTuukea2BtDgHLtYisnjfV48n7mk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=l2BQBs7VP8YaTZtcmoetETxCjibLu6y7hcgLaWS1CuX/P+k05nRyxkGyEDcHyY0TP3
	GzhcU7t47+ps7+xmTWZlKiXK+1bfBz9TaGcA1Hd718oVi7TY7ayXAlZsUPC4Jdp3up/P
	MwjM8er0Y9PukfmdzHi6iDQ3UM7lgOoSqVUz8=
Received: by 10.14.119.8 with SMTP id m8mr3126441eeh.18.1284411580637;
	Mon, 13 Sep 2010 13:59:40 -0700 (PDT)
Received: from localhost.localdomain ([80.249.95.150])
	by mx.google.com with ESMTPS id a48sm9858575eei.7.2010.09.13.13.59.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Sep 2010 13:59:39 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 23:57:30 +0300
Message-Id: <1284411450-20841-1-git-send-email-anarsoul@gmail.com>
X-Mailer: git-send-email 1.7.2.2
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] gettext-0.18: use included libcroco, not system
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
X-List-Received-Date: Mon, 13 Sep 2010 21:00:59 -0000

gettext-native uses system libcroco if it's available, and breaks
compilation in this case.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 recipes/gettext/gettext_0.18.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_0.18.bb
index b295afb..5ad6459 100644
--- a/recipes/gettext/gettext_0.18.bb
+++ b/recipes/gettext/gettext_0.18.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The GNU internationalization library."
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
 LICENSE = "GPLv3"
-PR = "r2"
+PR = "r3"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl"
@@ -31,6 +31,7 @@ EXTRA_OECONF += "--without-lispdir \
 		 --disable-openmp \
 		 --with-included-glib \
 		 --without-emacs \
+		 --with-included-libcroco \
 	        "
 acpaths = '-I ${S}/gnulib-local/m4/ \
 	   -I ${S}/gettext-runtime/m4 \
-- 
1.7.2.2



