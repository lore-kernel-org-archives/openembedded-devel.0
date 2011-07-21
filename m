Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qjyxa-0006nb-Go
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 21:31:02 +0200
Received: by fxh10 with SMTP id 10so4077570fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 12:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=j4XTdPqvy0n+uogfKKZI7sSzswcekWbcCCe4OkStylc=;
	b=hFIT1vLo2qRL9eL1D3YtMR+/7VFFHDWmCDAkQhq7bal+Bs9cDSZaQIyaLlI7Y66F3j
	Nay8t9Ae79VwzuaXl7hmKnm6d3Sw8Y1oxbbWiuQPls1A7nxPUn106uFEB09pHBeAzBjZ
	BeRXR+I0b+CenJBXvkszOzuDWnbkJ1wXUMR24=
Received: by 10.223.85.155 with SMTP id o27mr744256fal.109.1311276191335;
	Thu, 21 Jul 2011 12:23:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p17sm1586779fak.25.2011.07.21.12.23.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 12:23:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2011 21:23:00 +0200
Message-Id: <cover.1311276122.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-oe][PATCH 0/4] Pull request #19
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
X-List-Received-Date: Thu, 21 Jul 2011 19:31:02 -0000

The following changes since commit 059369b22fddb5e69536d37c29cb064c3d1372ae:

  gconf: inherit perlnative (2011-07-21 08:26:14 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe

Martin Jansa (4):
  connman: remove if_alg.h test from configure
  tangogps: fix build with curl-7.21.8 and newer
  foxtrotgps: fix build with curl-7.21.8 and newer
  xf86-video-glamo: bump SRCREV, remove upstream applied patch

 .../recipes-connectivity/connman/connman_0.76.bb   |    4 +-
 ...efine-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch |   66 --------------------
 .../xorg-driver/xf86-video-glamo_git.bb            |    5 +-
 .../foxtrotgps-1.0.1/remove.unused.header.patch    |   40 ++++++++++++
 .../foxtrotgps/foxtrotgps_1.0.1.bb                 |    6 +-
 .../tangogps-0.99.4/remove.unused.header.patch     |   37 +++++++++++
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |    4 +-
 7 files changed, 89 insertions(+), 73 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0001-glamo-drm-define-GLAMO_CMDQ_MAX_COUNT-instead-of-mag.patch
 create mode 100644 meta-oe/recipes-navigation/foxtrotgps/foxtrotgps-1.0.1/remove.unused.header.patch
 create mode 100644 meta-oe/recipes-navigation/tangogps/tangogps-0.99.4/remove.unused.header.patch

-- 
1.7.6



