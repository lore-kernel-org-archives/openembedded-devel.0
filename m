Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rgbsm-000674-1C
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 13:48:24 +0100
Received: by ggnh1 with SMTP id h1so8885703ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 04:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=pTJyVCL1zg81buYE0QfCFpcQGxobgJxKBE1CuZv7/2Y=;
	b=Ak9xt6tc83jK+nmGO29oYY4ITCP0RKUC9W09C0q3Ve0nSbCkjkyb2oGLyzYMsxt4lT
	ziCWoF5gwIz9ErZG+/3+CTSHeM/9a8kEnZJz/TCEFwzMw26LWm5/h+WBrFBhcaTfCBfh
	3ijD34Yh45i2o038MDegmBSHrpuQK1o+08ZFI=
Received: by 10.101.184.12 with SMTP id l12mr3432373anp.81.1325248867070;
	Fri, 30 Dec 2011 04:41:07 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id j21sm92455611ann.0.2011.12.30.04.41.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 04:41:06 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2011 12:40:53 +0000
Message-Id: <cover.1325248824.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/3] Move xserver-nodm-init to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 12:48:24 -0000

The following changes since commit 2642db3615ea2d4196b9c73537d9ebff6c57de2d:

  dialog: add 1.1-20111020 recipe (dynamic and static) (2011-12-24 19:07:53 +0100)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  xserver-nodm-init: move systemd service to xserver-nodm-init-systemd
  meta-efl: elsa: rconflicts/rreplaces xserver-nodm-init-systemd
  task-x11: use xserver-nodm-init-systemd

 meta-efl/recipes-efl/efl/elsa_svn.bb               |    6 ++--
 meta-oe/recipes-core/tasks/task-x11_1.0.bb         |    4 +-
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   30 +++++++++----------
 3 files changed, 19 insertions(+), 21 deletions(-)

-- 
1.7.2.5



