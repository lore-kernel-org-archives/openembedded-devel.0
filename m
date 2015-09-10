Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D7D2473243
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 07:26:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8A7Q6vF004166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2015 00:26:06 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 10 Sep 2015 00:26:06 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Sep 2015 03:26:02 -0400
Message-ID: <cover.1441869690.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2][meta-initramfs] dracut: RDEPEND on systemd optionally & install modules to /usr/lib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Sep 2015 07:26:07 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* Get dracut RDEPEND on systemd optionally;
* install modules to /usr/lib for fixing runtime issues.

The following changes since commit d36e2d1066f50036080f978583a58fe79ecfac54:

  libunique: add a recipe from oe-core (2015-09-08 16:30:24 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/dracut
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/dracut

Robert Yang (1):
  dracut: RDEPEND on systemd optionally

Wenzong Fan (1):
  dracut: install modules to /usr/lib

 meta-initramfs/recipes-devtools/dracut/dracut_git.bb | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

-- 
1.9.1


