Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFRVN-0008RB-AS
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Sep 2012 17:20:29 +0200
Received: by wibhn17 with SMTP id hn17so2665757wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Sep 2012 08:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=zCuJ+FJWndWOVpoXTkaaxu1LiKH9SEapgeUWN75ZOao=;
	b=JCiAXQK7I30D4VG11Mf4lRf7VnstKJGsn3eMgLR3CEP6C2+xcfMLcqfnhGjaX7p31b
	QN8+IAToNgkL3ys1DRh7xgCkt2c+5osqsoc7K/cMmh6VkW08hUqvXXvJf5MQbysfK0Sd
	y464LSYhDfd8Azl2w2uDvpTBBABy4FNvufWcKWKJhgkVEQ+LX/oXpD5lmwrK3Hq5hSLH
	tAJ6ZPTUSR+PPQlrd6tSqBGZGsYBWK+4OCJv06Am9DyPFeGXS6+99mk7Q7T/jcic7JMp
	mODizHesO3ZCakWDrSTZ/vkRfBC+x/YckwtLIAOXxzNCNfHlrIFKotsDjEvHMuMZY8/4
	edGg==
Received: by 10.216.30.20 with SMTP id j20mr4625999wea.78.1348326463965;
	Sat, 22 Sep 2012 08:07:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t7sm4608302wix.6.2012.09.22.08.07.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:07:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Sep 2012 17:07:39 +0200
Message-Id: <cover.1348320947.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][PATCH 0/3] Smaller fixes
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
X-List-Received-Date: Sat, 22 Sep 2012 15:20:29 -0000

The following changes since commit b232837c402cdbc5f2f1bd2afee5200df1383373:

  gnome-themes: inherit perlnative (2012-09-20 10:05:54 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (3):
  gtk+: drop .bbappend with native BBCLASSEXTEND
  lzma: replace oe.process.run with subprocess.call in do_unpack, drop
    NATIVE_INSTALL_WORKS
  emacs: fix X11DEPENDS and build without x11 enabled at all

 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend |   3 -
 meta-oe/recipes-support/emacs/emacs.inc            | 114 ++++++++++++---------
 meta-oe/recipes-support/emacs/emacs_23.4.bb        |   2 +-
 meta-oe/recipes-support/lzma/lzma.inc              |   9 +-
 4 files changed, 68 insertions(+), 60 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gtk+/gtk+_2.24.8.bbappend

-- 
1.7.12



