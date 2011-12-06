Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXsTM-0006iA-65
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:42:04 +0100
Received: by eaac1 with SMTP id c1so1403429eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 02:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=+u3EFg7PLfgjR5iOFVtYfgmTOW7tLjenMgVudqMSwvc=;
	b=S9jPKkjl/LBmdBIXtzhk/7xgI9lTQKDIGrwkR5eDG6vu5jq7LZRmy0Zzzp/MtVsCRg
	vJnw+PbEUymEjq16ynP3fgLlnRySDXpK90mpFNqGo+q3C4aQb5wfB6N0mxkv9nZEL/dQ
	IHC523lusOPggmLal4Mi9UA0RWPNUYTYOdzCU=
Received: by 10.213.22.133 with SMTP id n5mr922232ebb.128.1323167716738;
	Tue, 06 Dec 2011 02:35:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c9sm67703425eeb.0.2011.12.06.02.35.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:35:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 11:35:07 +0100
Message-Id: <cover.1323167378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
Subject: [PATCH][meta-oe 0/5] Small fixes
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
X-List-Received-Date: Tue, 06 Dec 2011 10:42:04 -0000

The following changes since commit 084fc20cd5377827a7f5a16e5f7179b89fd26886:

  testlab: only use basename for license info to avoid diff churn (2011-12-06 08:41:58 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (5):
  mplayer2: drop omapfb patch and support, this can be applied from bsp
    layer if needed
  mplayer2: enable mplayer-common
  vala-terminal: upgrade to 1.3
  syslog-ng: upgrade to latest version from 3.2 series and rework
    modules.conf fix
  syslog-ng: enable systemd support

 .../0001-video-out-for-omapfb-support.patch        |  826 --------------------
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |   19 +-
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   24 +-
 .../recipes-support/syslog-ng/syslog-ng_3.2.2.bb   |   10 -
 .../recipes-support/syslog-ng/syslog-ng_3.2.5.bb   |   10 +
 .../vala-terminal/vala-terminal_git.bb             |    5 +-
 6 files changed, 31 insertions(+), 863 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer2/0001-video-out-for-omapfb-support.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb

-- 
1.7.8



