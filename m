Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sa3Fz-0000sk-Rn
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 13:09:31 +0200
Received: by bkcjm2 with SMTP id jm2so710494bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=Jl9Ozwr4NTHPGXROSePx98vl4CPxJ1rHrHD+s6OiMXg=;
	b=JSG6zh4ECYe22G0wkQntGC80XQqgpvlOQj9DXTeF/1VeE2AR4YNgwbM0mcjCaeCCcP
	B6w969Ej7Mynat30u4Uz0PgS8U/tRSs7VCEZasRMgUSV6h6wQXWkzHnE+e3qJliS1g9+
	yyD/pdTUpr6mIhnic6izb65fWtzFKEgE1OKy839jA2CCWf2OnAulZU/yxjAOv1mUs3rq
	VeVgAi4Wp4cR1de7PDfe3ssLjeYdJUMCSgcvVl/5+C7qcLtDljtmNE8PqjILndmtsXke
	vA63rxvU7/veVrrVWkm5v6LbBjBaUdOqNISniYhLgTvbZO6M3zNuLFFYml/2GlaQX3f8
	o+/Q==
Received: by 10.204.151.82 with SMTP id b18mr11353406bkw.132.1338461951923;
	Thu, 31 May 2012 03:59:11 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id ig1sm2794600bkc.4.2012.05.31.03.59.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 03:59:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 12:58:56 +0200
Message-Id: <1338461940-3040-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe 0/4] systemd.bbclass fixes
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
X-List-Received-Date: Thu, 31 May 2012 11:09:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series superseeds [1-2]. It supersedes Martin's suggestion [3]
and includes his PR bump [4].

It was build tested and the results were checked with buildhistory.

[1] http://patches.openembedded.org/patch/28843/
[2] http://patches.openembedded.org/patch/28841/
[3] http://patches.openembedded.org/patch/28939/
[4] http://patches.openembedded.org/patch/28943/

Andreas Müller (3):
  systemd-systemctl-native: Add additional messages for better
    debugging
  systemd.bbclass: remove unused code
  systemd.bbclass: extract SYSTEMD_SERVICE properly

Martin Jansa (1):
  recipes: bump PR to fix -systemd postinsts where SYSTEMD_SERVICE was
    used without PN* suffix

 meta-efl/recipes-efl/efl/elsa_svn.bb               |    2 +
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    2 +-
 meta-oe/classes/systemd.bbclass                    |   27 ++++++++++++-------
 meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend   |    2 +-
 .../cherokee/cherokee_1.2.98.bb                    |    2 +-
 .../recipes-connectivity/gateone/gateone_git.bb    |    2 +-
 .../networkmanager/networkmanager_0.9.2.0.bb       |    2 +-
 .../openssh/openssh_6.0p1.bbappend                 |    2 +-
 .../systemd/systemd-machine-units_1.0.bb           |    2 +
 .../systemd/systemd-systemctl-native.bb            |    2 +-
 .../systemd/systemd-systemctl-native/systemctl     |    5 +++
 meta-oe/recipes-extended/rsyslog/rsyslog.inc       |    2 +-
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    2 +-
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |    2 +
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |    2 +
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |    2 +
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    2 +-
 17 files changed, 42 insertions(+), 20 deletions(-)

-- 
1.7.6.5



