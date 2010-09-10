Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1Ou2g2-00035Y-Jf
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Sep 2010 14:26:07 +0200
Received: by eyb7 with SMTP id 7so1656628eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Sep 2010 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=B4WDaqEmqX/2pl8H0UfXu61v037b+4O7W2KFF0gsJwU=;
	b=waX8V8H3CNCl/odz24ROCKGnkOOiFxdSU1GLUl423Xj6I92qGTaD8LdVjScmF2bsO5
	WGMdggroj0tKw4ZDEkhhEIvEshjSCnSkToqR1EO3P5nUWeJAwyvUXSa2huetJftTNKN7
	ryz/aH0mYbvacQDkXrY4l3BwsQoQXvXONUsJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cQET+iXFv4laIYbpzLOQzc9qH0Bi56GiPQH+SvIfmS9Hatjhb6FdUuUTcAhUICqecV
	KYwuouA9Xc6+Je7dDlBDiUjIxsaJeq74gxT7FVBbzSTkJQ5zCWttMpKbg18r4N1s2xec
	woKqs0GQwTx0m9L+9rH6rl1mc8YadwACzUS2U=
Received: by 10.14.119.2 with SMTP id m2mr271125eeh.43.1284121513359;
	Fri, 10 Sep 2010 05:25:13 -0700 (PDT)
Received: from localhost.localdomain ([86.57.155.118])
	by mx.google.com with ESMTPS id a48sm3809956eei.13.2010.09.10.05.25.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 10 Sep 2010 05:25:12 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Sep 2010 15:24:16 +0300
Message-Id: <1284121456-10573-1-git-send-email-anarsoul@gmail.com>
X-Mailer: git-send-email 1.7.2.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gettext-0.18: use included libcroco, not system
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
X-List-Received-Date: Fri, 10 Sep 2010 12:26:07 -0000

gettext-native uses system libcroco if it's available, and breaks
compilation in this case.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 recipes/gettext/gettext_0.18.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_0.18.bb
index b295afb..992467e 100644
--- a/recipes/gettext/gettext_0.18.bb
+++ b/recipes/gettext/gettext_0.18.bb
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



