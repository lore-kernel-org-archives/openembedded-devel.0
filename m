Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RgfcM-00066h-Aq
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 17:47:42 +0100
Received: by ghrr17 with SMTP id r17so6012070ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 08:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=K+N2gxEMA/vIOGfC66+8rZOBW1psDm/33+e+k+/AljM=;
	b=i0QFRUQ6tgxS0ijcFRJPIcDi3CwlgSvMFRxJdbB2hCnMRgujtinecpzqBuhv5hbxUo
	SB2Bk/jE+2FSMy6UhxQ27S9am5HRZmOtwpGap4ZxEAafGGWyi5fLH0AtGxEsHSr+EElt
	ZjsyfRNoXXdNFPGKz5HFW7H6xqHyWrgnuk3lg=
Received: by 10.236.131.1 with SMTP id l1mr53101711yhi.82.1325263225793;
	Fri, 30 Dec 2011 08:40:25 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v8sm8400410yhi.10.2011.12.30.08.40.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 08:40:24 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2011 16:40:10 +0000
Message-Id: <cover.1325263010.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH v3 0/3] Move xserver-nodm-init systemd support to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 16:47:42 -0000

With this patchset version addresses the complains done on mailing
list. For people using sysvinit at list a task-x11 needs a virtual
runtime override to avoid bringing systemd as dependency.

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
 meta-oe/recipes-core/tasks/task-x11_1.0.bb         |    6 ++--
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   30 +++++++++----------
 3 files changed, 20 insertions(+), 22 deletions(-)

-- 
1.7.2.5



