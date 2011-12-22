Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RdiUq-00039s-Bp
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Dec 2011 14:15:44 +0100
Received: by yhoo47 with SMTP id o47so5542552yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2011 05:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=J3q8L4M1WmDPsyHAS0/e0I9M+TejvTYAsa5rmkEChLw=;
	b=VxcLpr36bLPnHns43T+4ed6bxRb/tZn0mCw3cJdMCcX4Lnc44IMkunByHpDpB9Saoi
	9ZVpXBbTTEWaupGFr+1nOfxFMEVJRQ+ZUX8ejyB3WGM8UI6jszWDOK7N1FqHG2SHtCci
	rOm5mN0r9x/a9Y+dR8WWD9jClkwWynK1dKEnI=
Received: by 10.236.178.33 with SMTP id e21mr15246231yhm.4.1324559317792;
	Thu, 22 Dec 2011 05:08:37 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm14603838yhk.1.2011.12.22.05.08.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 05:08:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2011 13:08:21 +0000
Message-Id: <cover.1324559278.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/3] Misc fixes
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
X-List-Received-Date: Thu, 22 Dec 2011 13:15:44 -0000

The following changes since commit 87a35d203278d220e6c730dc551af11a060798cd:

  gdm 2.32.2: add missing source checksums (2011-12-22 10:10:55 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  pcsc-lite: ccid downgraded to a runtime recommendation
  rsyslog: move systemd support to rsyslog-systemd
  systemd: depends on intltool-native

 meta-oe/recipes-core/systemd/systemd_git.bb        |    4 +-
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   23 +++++++-------------
 .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |    5 ++-
 3 files changed, 13 insertions(+), 19 deletions(-)

-- 
1.7.2.5



