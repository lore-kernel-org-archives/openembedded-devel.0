Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2134360290
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 10:07:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKA7MKE001577
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 02:07:23 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 02:05:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 02:05:07 -0800
Message-ID: <cover.1448012203.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/7 V2] meta-openembedded: fix QA issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Nov 2015 10:07:22 -0000
Content-Type: text/plain

* V2:
  Fix commit messages.

// Robert

The following changes since commit ea319464b673cbf9a416b582dc4766faeb998430:

  vlc: add PACKAGECONFIG for samba, upnp, dvdnav, sftp, vorbis, dc1394, dv1394, svg, svgdec (2015-11-16 21:50:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib rbt/7fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=rbt/7fixes

Robert Yang (7):
  lldpad: fix installed-vs-shipped
  nbd: use BPN in Files
  dracut: fix host-user-contaminated
  cim-schema-exper: fix host-user-contaminated
  ctdb: RDEPENDS on bash
  ctdb: add PACKAGECONFIG for libtdb
  netkit-ftp: fixed invalid symlink

 .../recipes-devtools/dracut/dracut_git.bb          |    3 +++
 .../recipes-daemons/lldpad/lldpad_0.9.46.bb        |    2 +-
 .../recipes-netkit/netkit-ftp/netkit-ftp_0.17.bb   |    2 +-
 .../cim-schema/cim-schema-exper_2.39.0.bb          |    1 +
 .../cim-schema/cim-schema-final_2.40.0.bb          |    1 +
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |    4 ++++
 meta-networking/recipes-support/nbd/nbd_3.11.bb    |    6 +++---
 7 files changed, 14 insertions(+), 5 deletions(-)

-- 
1.7.9.5


