Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AFAE7713BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:27:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s89GRwlZ014919
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 09:27:58 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 09:27:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:27:44 -0700
Message-ID: <cover.1410279874.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/14 V2] fix RDEPENDS issues
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
X-List-Received-Date: Tue, 09 Sep 2014 16:28:01 -0000
Content-Type: text/plain

* Changes of V2:
  - Add fix for webmin.
  - apache2: split apache2-scripts as Olof Johansson suggested. 
  - sdparm: split sdparm-scripts subpkg as Randy suggested

// Robert

The following changes since commit 28e26a9b0ad37d0c92ba42b2727215eef1edf5a2:

  tcpslice: add recipe under tcpdump (2014-09-09 10:32:51 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib rbt/rdeps
  http://cgit.openembedded.org/cgit.cgi//log/?h=rbt/rdeps

Robert Yang (14):
  aoetools: no bashism in aoe-stat
  autofs: add bash to RDEPENDS_autofs
  arptables: add bash to RDEPENDS_arptables
  ndisc6: add perl to RDEPENDS_ndisc6-misc
  stunnel: add perl to RDEPENDS_stunnel
  proftpd: add perl to RDEPENDS_proftpd
  memcached: add bash to RDEPENDS_memcached
  phpmyadmin: add bash to RDEPENDS_phpmyadmin
  apache2: split apache2-scripts subpkg
  sg3-utils: add bash to RDEPENDS_sg3-utils
  sdparm: split sdparm-scripts subpkg
  bonnie++: add perl to RDEPENDS_bonnie-scripts
  rrdtool: use rrdtool rather than PN
  webmin: fix hardcode of python2.3

 .../recipes-daemons/autofs/autofs_5.1.0.bb         |    1 +
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    2 ++
 .../aoetools/aoetools/aoe-stat-no-bashism.patch    |   27 ++++++++++++++++++++
 .../recipes-support/aoetools/aoetools_36.bb        |    4 ++-
 .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 +-
 .../recipes-support/memcached/memcached_1.4.17.bb  |    4 ++-
 .../recipes-support/ndisc6/ndisc6_1.0.2.bb         |    1 +
 .../recipes-support/stunnel/stunnel_4.56.bb        |    2 ++
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb |    2 ++
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb  |    2 +-
 meta-oe/recipes-support/sdparm/sdparm_1.08.bb      |    6 +++++
 .../recipes-support/sg3-utils/sg3-utils_1.38.bb    |    2 ++
 .../recipes-httpd/apache2/apache2_2.4.10.bb        |   10 ++++++--
 .../recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb     |    1 +
 .../webmin/files/remove-python2.3.patch            |   25 ++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.700.bb        |    4 ++-
 16 files changed, 88 insertions(+), 7 deletions(-)
 create mode 100644 meta-networking/recipes-support/aoetools/aoetools/aoe-stat-no-bashism.patch
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/remove-python2.3.patch

-- 
1.7.9.5


