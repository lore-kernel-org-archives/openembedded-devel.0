Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRAz7-00057g-C2
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:07:41 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so770653wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=qN/E9HpAmlmBKBFUUctrYNSNBcDQrmyv5nUwRITaIvc=;
	b=EzdKOtssCi38BQz/yK9+k8XgfuD2UaVu6gWblcpaHpSWEHoz67W7hZSFGGpR3xaiEm
	vckGN41FNhSXcWpoQYp/c5hhJu+pU3rB1FPooasPCkeP08l9kPc8nAl5pZOu7DCJZuMf
	a8k3P59dqc2xGskwhQoonnspuNcL4o74mbxtI+qlOghjbiCRO7Ur1Z3ddubhlA3+aRVT
	GphcBAwHfJagNBzIf7d94ibQmh2HTtVV/uDvEbHrG51AsaStkPI13NdeynPyThwxUkiQ
	kNEtzBoxfVGnRC4PPzF2tBLkHOudAoaFNmp/v9/TkKl+YJaYSad+++mmIID/2UpWEnhM
	Gf+g==
Received: by 10.216.204.19 with SMTP id g19mr9606617weo.189.1351122853213;
	Wed, 24 Oct 2012 16:54:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cn6sm7861871wib.9.2012.10.24.16.54.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 16:54:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:54:21 +0200
Message-Id: <cover.1351122431.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-oe][PATCH 0/8] Small changes #102
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
X-List-Received-Date: Thu, 25 Oct 2012 00:07:41 -0000

The following changes since commit 55855cd569fbff7182974ca08b1de8435bf0f597:

  pimlico: remove Poky overrides (2012-10-24 19:34:31 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (8):
  foxtrotgps: inherit gconf
  tangogps: inherit gconf
  imlib2: inherit binconfig
  midori: inherit vala
  vala-terminal: inherit vala
  loudmouth: depend on libcheck instead of check
  check: drop from meta-oe, there is libcheck in oe-core
  python-pyqt: don't bypass sstate with sip files

 meta-efl/recipes-efl/efl/imlib2_svn.bb             |  8 ++-----
 .../loudmouth/loudmouth_1.4.3.bb                   |  4 ++--
 .../recipes-connectivity/midori/midori_0.4.6.bb    |  6 ++---
 .../recipes-devtools/python/python-pyqt_4.9.5.bb   | 14 ++++--------
 .../foxtrotgps/foxtrotgps_1.1.1.bb                 |  6 ++---
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |  6 ++---
 .../check/check-0.9.8/fix.automake-1.12.x.patch    | 26 ----------------------
 meta-oe/recipes-support/check/check_0.9.8.bb       | 15 -------------
 .../vala-terminal/vala-terminal_git.bb             |  5 +++--
 9 files changed, 20 insertions(+), 70 deletions(-)
 delete mode 100644 meta-oe/recipes-support/check/check-0.9.8/fix.automake-1.12.x.patch
 delete mode 100644 meta-oe/recipes-support/check/check_0.9.8.bb

-- 
1.7.12.4



