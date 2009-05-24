Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8Lkb-00042S-JG
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 00:01:01 +0200
Received: by fxm20 with SMTP id 20so2787311fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 May 2009 14:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=AtNTahJKRbtDwfX9k6uMDpGFfWNt6mG/zenOHxdbcy0=;
	b=p2WIYe/YaMpmIqaP8z9wf4ekh3EWtrUNZH4fcLZ1pz4dNL4Rh5OGUAZwZNoIYGH3HO
	7OPQ3OZQEJLkTkAkcadShevSNdwmCMmmgRh0DSUGahYcZK9tYWVNKOS0W5MiN6LVY1QP
	DK26Ixg1QOI9RPWJze3Rbju4OSpYD/fU9n1Wg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=TmYOT5YTYKRTF/3CuPYyxUoO0pLH3RW5ma2KZXKZfkKDNMRMgaw/xyG/2Bg48ozosN
	KzqO1kCXQG12t2y88c8xmhau6TJSeJEIIoorAtsW/raKkuRLr/VIJbrMUIVmTy/Mkj+C
	y0DMnKKLY22yqnFoNUDo6ELu7dR7HsEh8HzOs=
Received: by 10.103.121.19 with SMTP id y19mr2234075mum.107.1243201983909;
	Sun, 24 May 2009 14:53:03 -0700 (PDT)
Received: from localhost ([80.249.91.57])
	by mx.google.com with ESMTPS id g1sm1749501muf.26.2009.05.24.14.53.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 May 2009 14:53:03 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2009 00:52:59 +0300
Message-Id: <1243201979-12136-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
Subject: [PATCH] qt4: fixed pattern matching for gfxdrivers packaging.
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
X-List-Received-Date: Sun, 24 May 2009 22:01:01 -0000

The current pattern doesn't include gfxdrivers packages for directfb and
qvfb.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index 3deffa6..7c83625 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -173,7 +173,7 @@ python populate_packages_prepend() {
 	qtopia_split('codecs',      'codec',       '^libq(.*)\.so$')
 	qtopia_split('decorations', 'decoration',  '^libqdecoration(.*)\.so$')
 	qtopia_split('designer',    'designer',    '^lib(.*)\.so$')
-	qtopia_split('gfxdrivers',  'gfxdriver',   '^libqgfx(.*)\.so$')
+	qtopia_split('gfxdrivers',  'gfxdriver',   '^libq(.*)\.so$')
 	qtopia_split('mousedrivers','mousedriver', '^libq(.*)mousedriver\.so$')
 	qtopia_split('iconengines', 'iconengine',  '^libq(.*)\.so$')
 	qtopia_split('imageformats','imageformat', '^libq(.*)\.so$')
-- 
1.6.3.1



