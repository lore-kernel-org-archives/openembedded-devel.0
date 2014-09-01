Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD811712FD
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIaYM026578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:36 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:22 -0700
Message-ID: <cover.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/13] fix RDEPENDS issues
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:37 -0000
Content-Type: text/plain

Hello,

Feel free to let me know if you think that we need split the package
into a <pkg>-script (or other) sub pkg, then we can fix the RDEPENDS for
the sub pkg.

// Robert

The following changes since commit 6b881ba6fd3e828021c266d3bd9c7a606d120858:

  libmodule-pluggable-perl: add 5.1 (2014-09-01 11:37:12 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib rbt/rdeps

Robert Yang (13):
  aoetools: no bashism in aoe-stat
  autofs: add bash to RDEPENDS_autofs
  arptables: add bash to RDEPENDS_arptables
  ndisc6: add perl to RDEPENDS_ndisc6-misc
  stunnel: add perl to RDEPENDS_stunnel
  proftpd: add perl to RDEPENDS_proftpd
  memcached: add bash to RDEPENDS_memcached
  phpmyadmin: add bash to RDEPENDS_phpmyadmin
  apache2: add perl to RDEPENDS_apache2
  sg3-utils: add bash to RDEPENDS_sg3-utils
  sdparm: add bash to RDEPENDS_sdparm
  bonnie: add perl to RDEPENDS_bonnie-scripts
  rrdtool: use rrdtool rather than PN

 .../recipes-daemons/autofs/autofs_5.1.0.bb         |    1 +
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    2 ++
 .../aoetools/aoe-stat-no-checkbashism.patch        |   27 ++++++++++++++++++++
 .../recipes-support/aoetools/aoetools_34.bb        |    6 ++++-
 .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 +-
 .../recipes-support/memcached/memcached_1.4.17.bb  |    4 ++-
 .../recipes-support/ndisc6/ndisc6_1.0.2.bb         |    1 +
 .../recipes-support/stunnel/stunnel_4.56.bb        |    2 ++
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb |    2 ++
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb  |    2 +-
 meta-oe/recipes-support/sdparm/sdparm_1.08.bb      |    2 ++
 .../recipes-support/sg3-utils/sg3-utils_1.38.bb    |    2 ++
 .../recipes-httpd/apache2/apache2_2.4.10.bb        |    2 +-
 .../recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb     |    1 +
 14 files changed, 51 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-checkbashism.patch

-- 
1.7.9.5


