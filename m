Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SFPXT-00078p-VL
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 14:42:16 +0200
Received: by ggcy3 with SMTP id y3so65910ggc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=2wUADmuQJi4METc0kbD/7mDubrg+NzN74QMPCIogne0=;
	b=eXWuk+CNPhZEvg+ur4y6CbolPsQuFUGFxtCOWXKav6VQ7sY/KtkY9p5ZuhoqTJgw0h
	EudS6w9MGl2Zwz5uygzmxM4XipdSPZ+yNJca2RhI2BHTi1cuPz2yyK9j2MuqZPXxIZGD
	lamWldTxjGRfCEc19KRkusHV9wcJQ/vAez658Lcuhskd7u+ihV2csWuna7LgCY80x2lj
	7lGEY9Yv8jZ1RHMrpkW7t72HgT0UkKEmSiBsxk03DNDtHNxKI0BCoxQuNKcMujV0Zmed
	8CTmEbx/wv3wo5idH8rrb7apgtw+a4JLntQo+Lp/iiBfzcTzGLaFDoPNhZuBVSarem2+
	3K2Q==
Received: by 10.236.79.195 with SMTP id i43mr14547268yhe.53.1333542784978;
	Wed, 04 Apr 2012 05:33:04 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d25sm2044087yhe.4.2012.04.04.05.33.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 05:33:03 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Apr 2012 12:32:51 +0000
Message-Id: <cover.1333542709.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH][meta-oe 0/3] Pending patches from O.S. Systems' tree
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
X-List-Received-Date: Wed, 04 Apr 2012 12:42:16 -0000

The following changes since commit d248ea6ada38ba9070f45f4fd2ab107bc6ed0246:

  libedit: Remove files folder as no patch was being used (2012-03-31 16:48:43 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  xbitmaps: add 1.1.1 version
  openmotif: add 2.3.3
  systemd-systemctl-native: add support to disable services

 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |   32 +++++++++++++----
 .../recipes-graphics/xorg-data/xbitmaps_1.1.1.bb   |   10 +++++
 .../xorg-data/xorg-data-common.inc                 |   10 +++++
 .../openmotif/openmotif/configure.patch            |   15 ++++++++
 .../recipes-support/openmotif/openmotif_2.3.3.bb   |   38 ++++++++++++++++++++
 6 files changed, 99 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-data/xbitmaps_1.1.1.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
 create mode 100644 meta-oe/recipes-support/openmotif/openmotif/configure.patch
 create mode 100644 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb

-- 
1.7.2.5



