Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1ZB5-00083C-7G
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 09:09:55 +0100
Received: by eaae1 with SMTP id e1so160716eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 00:01:30 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.124.211 as permitted sender) client-ip=10.14.124.211; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.124.211 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.124.211])
	by 10.14.124.211 with SMTP id x59mr5313916eeh.51.1330243290781
	(num_hops = 1); Sun, 26 Feb 2012 00:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=bJYmh5xdII19ZTbLoL3XBSebmfjllUTGPWWaPmChtzg=;
	b=aelNaqa2H4SX9Mzg7Erc4uo6ZrhYJvEi+09F/oxbo6KRQcUvlrNkz5A/RAnUpvA5ng
	WuevObAjw7VPlYhK72ruzkWnEyOuXElBBunpJHZtFFuf5IVfcUz54KSxfthpzaSz8dAY
	Jm1pqTlQaoO9j6G1EQW1MO/hTTINnlYVXsyLw=
Received: by 10.14.124.211 with SMTP id x59mr4013391eeh.51.1330243290695;
	Sun, 26 Feb 2012 00:01:30 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm41873462eei.3.2012.02.26.00.01.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 00:01:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 09:01:21 +0100
Message-Id: <cover.1330243124.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][meta-efl][PATCH 0/5] EFL upgrade and small sstate improvements
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
X-List-Received-Date: Sun, 26 Feb 2012 08:09:55 -0000

The following changes since commit 504f2e084cfd14778f223c807ab5250becd32a7a:

  systemd.bbclass: fix regression caused by c9f5703aded (2012-02-25 09:51:54 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (5):
  wmiconfig: don't export CC
  layer.conf: add task-x11-server to SIGGEN_EXCLUDERECIPES_ABISAFE
  e-base: bump EFL_SRCREV again
  e-tasks: addapt to newer elementary
  e-wm: fix memory usage with illume causing OOM

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../e-tasks/0001-depend-on-eina-not-eina-0.patch   |   26 ++
 ...mentary-genlist_item_insert_before-API-c.patch} |   23 ++-
 ...API.patch => 0003-adapt-to-newer-elm-API.patch} |    8 +-
 ....patch => 0004-fix-changed-callback-name.patch} |    8 +-
 .../e-tasks/0005-adapt-to-even-newer-elm-API.patch |  182 ++++++++++++
 .../e17/e-tasks/0006-remove-deprecated-API.patch   |  296 ++++++++++++++++++++
 .../e17/e-tasks/0007-db_sqlite-fix-warning.patch   |   35 +++
 ...-warning-about-incompatible-pointer-types.patch |   79 ++++++
 .../recipes-efl/e17/e-tasks/depends.eina.patch     |   12 -
 meta-efl/recipes-efl/e17/e-tasks_svn.bb            |   15 +-
 ...ume-Remove-the-popup.-It-s-not-needed-now.patch |  135 +++++++++
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    3 +-
 meta-efl/recipes-efl/e17/eve_svn.bb                |    3 +-
 meta-oe/conf/layer.conf                            |    1 +
 meta-oe/recipes-support/wmiconfig/wmiconfig_svn.bb |    4 +-
 16 files changed, 795 insertions(+), 37 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0001-depend-on-eina-not-eina-0.patch
 rename meta-efl/recipes-efl/e17/e-tasks/{genlist_item_insert_before.api.patch => 0002-adapt-to-elementary-genlist_item_insert_before-API-c.patch} (41%)
 rename meta-efl/recipes-efl/e17/e-tasks/{0001-adapt-to-newer-elm-API.patch => 0003-adapt-to-newer-elm-API.patch} (99%)
 rename meta-efl/recipes-efl/e17/e-tasks/{0001-fix-changed-callback-name.patch => 0004-fix-changed-callback-name.patch} (88%)
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0005-adapt-to-even-newer-elm-API.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0006-remove-deprecated-API.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0007-db_sqlite-fix-warning.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-tasks/0008-fix-warning-about-incompatible-pointer-types.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks/depends.eina.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-Revert-Illume-Remove-the-popup.-It-s-not-needed-now.patch

-- 
1.7.8.4



