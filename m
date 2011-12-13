Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RaPwm-00055r-4y
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 11:50:57 +0100
Received: by yenm12 with SMTP id m12so4873540yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 02:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=fRh2IuM576AWHIWNT4CPaKFrWKo4ayh+jIOi5qpayFg=;
	b=YMitRlTl6mvMxGFsY7Hebb4D56HjY4gwduCtCagyBO/09ZsIWUBUEODadpSXsTpyWM
	Fs9JkqNrgumBdeOj/oiphlCSFhSf2ASBSZe2GRSrM/AqbiXCQ1hrtBFADEfYA6GF51U9
	0ru4qGNKfxBv2vHRLMVWK34cDhRy99p6lD+2w=
Received: by 10.236.173.131 with SMTP id v3mr2418243yhl.112.1323773037190;
	Tue, 13 Dec 2011 02:43:57 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 37sm33437204anu.21.2011.12.13.02.43.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Dec 2011 02:43:56 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 10:43:42 +0000
Message-Id: <cover.1323772986.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/4] systemd related fixes and qconnman bump
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
X-List-Received-Date: Tue, 13 Dec 2011 10:50:57 -0000

The following changes since commit 7ad9db8b3b6dd8fb9f85032b02344036015a9698:

  gnome-panel : Fix format of LICENSE field. (2011-12-12 18:45:06 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (4):
  systemd-systemctl-native: add support to recursive services
  dropbear: convert PR to use PRINC on bbappend
  dropbear: bump epoch to ensure an upgrade path and cleanup packaging
  qconnman: bump SRCREV

 .../dropbear/dropbear_2011.54.bbappend             |   13 ++++---------
 .../systemd/systemd-systemctl-native.bb            |    2 ++
 .../systemd/systemd-systemctl-native/systemctl     |    8 ++++++++
 meta-oe/recipes-qt/qconnman/qconnman.inc           |    2 +-
 4 files changed, 15 insertions(+), 10 deletions(-)

-- 
1.7.2.5



