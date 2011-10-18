Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGASi-00069x-OU
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:16:12 +0200
Received: by bkat8 with SMTP id t8so923474bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sFlujaMr4G1omQg8kmA9C/r290F7YxkQdHD8dujiA5Q=;
	b=dZGz7ynJZhxTbpOB8aC1yHGOFATm8br9lAopkU5p94VNjMiyU7646UCiDl6/Or0NIY
	EBPTJAuBgx+FvsetJLn941588KRnkmtU0MxtwAwp09N66/jf++UNwMXn6p+R8Uii7oTp
	TfTMOvg7sFp1CabPnIGEdC9jECRoe6XvlFHm8=
Received: by 10.204.130.9 with SMTP id q9mr1943354bks.43.1318947023036;
	Tue, 18 Oct 2011 07:10:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x3sm2317346bkn.1.2011.10.18.07.10.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 07:10:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 16:10:12 +0200
Message-Id: <cover.1318946821.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [meta-efl 0/3] EFL upgrade and lightmediascanner
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
X-List-Received-Date: Tue, 18 Oct 2011 14:16:12 -0000

My eve patches were applied upstream, so we can use newer 
webkit-efl without those patches in OE.

Webkit-efl build depends on fixed fontconfig see
http://patches.openembedded.org/patch/13371/

The following changes since commit 2631ed9f4c987192749960bc7a2209b5f5bbfa78:

  epdfview: add initial recipe with version 0.1.8 (2011-10-18 13:47:21 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (2):
  e-base: bump EFL_SRCREV
  webkit-efl: upgrade to 1.6.1

pespin (1):
  lightmediascanner: Add version 0.4.4 (initial recipe)

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../webkit/webkit-efl/revert.r78057.patch          |   19 --------------
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   11 +------
 .../lightmediascanner/lightmediascanner_0.4.4.bb   |   27 ++++++++++++++++++++
 4 files changed, 30 insertions(+), 29 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch
 create mode 100644 meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb

-- 
1.7.7



