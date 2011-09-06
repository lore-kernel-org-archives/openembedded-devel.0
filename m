Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R0qRZ-0000AJ-Es
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 09:51:41 +0200
Received: by ewy5 with SMTP id 5so2463833ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aXljyISthFgq3+wMYdI3B/lTq0CY+Ak6AA0HeO4HoHk=;
	b=h/oBk3W+RD8+ns6yhCIfH6DDgywm3rMH1gq/eg5PdBGfyfZWCj8+AAimj6jaO5zdfD
	0nRH9ZNeXkxPx57zUe9K5eXprZeCUt4o6yuGc/1kyQ9vdx4aUiHdDzCVpA4B9Pf77bF9
	1rRp0Iuy6puIRMnF0LP5XkMcVdfNADJzjTw2E=
Received: by 10.213.25.211 with SMTP id a19mr1344415ebc.58.1315295200499;
	Tue, 06 Sep 2011 00:46:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u14sm13168099eeh.1.2011.09.06.00.46.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 00:46:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Sep 2011 09:46:31 +0200
Message-Id: <cover.1315295093.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [meta-efl][PATCH 0/6] Pull request #11
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
X-List-Received-Date: Tue, 06 Sep 2011 07:51:41 -0000

Small changes mostly to packaging and update LIC_FILES_CHKSUM after Copyright changes

The following changes since commit 08513a79f6a54201b38a0c5ee6c086a7cff15dde:

  dbus-c++: use openembedded-core versions (2011-09-04 09:20:12 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-efl

Martin Jansa (6):
  e-base: bump EFL_SRCREV
  recipes-efl: remove EFL_SRCREV_1.0.0
  imlib2: package also /usr/src/debug files to ${PN}-dbg
  e-wm: ignore autopoint errors
  ecore: add ie /usr/lib/ecore/immodules/xim.so to ${PN}-dev
  recipes-efl: update LIC_FILES_CHKSUM, Copyright was updated in r63187

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |    2 +-
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    4 ++--
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |    2 +-
 meta-efl/recipes-efl/efl/ecore.inc                 |    3 ++-
 meta-efl/recipes-efl/efl/edb_svn.bb                |    2 +-
 meta-efl/recipes-efl/efl/edbus.inc                 |    2 +-
 meta-efl/recipes-efl/efl/eet.inc                   |    2 +-
 meta-efl/recipes-efl/efl/eeze.inc                  |    2 +-
 meta-efl/recipes-efl/efl/efreet.inc                |    2 +-
 meta-efl/recipes-efl/efl/eina.inc                  |    2 +-
 .../efl/elementary-theme-efenniht_svn.bb           |    4 ++--
 meta-efl/recipes-efl/efl/elementary_svn.bb         |    2 +-
 meta-efl/recipes-efl/efl/embryo.inc                |    2 +-
 meta-efl/recipes-efl/efl/engrave_svn.bb            |    2 +-
 meta-efl/recipes-efl/efl/epeg_svn.bb               |    2 +-
 meta-efl/recipes-efl/efl/evas.inc                  |    2 +-
 meta-efl/recipes-efl/efl/imlib2_svn.bb             |    2 +-
 18 files changed, 21 insertions(+), 20 deletions(-)

-- 
1.7.6.1



