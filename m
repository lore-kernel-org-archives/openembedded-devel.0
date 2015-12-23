Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6256731A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 10:03:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBNA3cd9006971
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2015 02:03:38 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Dec 2015 02:03:37 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Dec 2015 18:03:48 +0800
Message-ID: <cover.1450864063.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH 0/2] openjdk-8-native: fix do_install and PROVIDES
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
X-List-Received-Date: Wed, 23 Dec 2015 10:03:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

I asked about this issue two days ago but no response, please carefully
review and correct me if anyone have better understanding.

My tests includes building openjdk7 and openjdk8 on qemux86-64
with/without sstate cache.

--
The following changes since commit 35739fca028996c594b1efa2225a77c8d6038193:

  openjdk-8: Use zero mode on arm (2015-12-17 10:39:21 -0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_jdk8-fix_151223_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_jdk8-fix_151223_0

Jackie Huang (2):
  Revert "meta-java: rely on well known bootstrap-path"
  openjdk-8-native: fix improper do_install and PROVIDES

 README                                             | 12 ++++++++--
 classes/java-bootstrap-components.bbclass          |  7 ------
 classes/java-library.bbclass                       |  3 +--
 recipes-core/ant/ant-native_1.8.1.bb               |  2 +-
 recipes-core/antlr/antlr_2.7.7.bb                  |  2 +-
 recipes-core/cacao/cacao_1.6.1.bb                  |  6 ++---
 recipes-core/classpath/classpath.inc               |  4 ++--
 recipes-core/classpathx/gnujaf_1.1.1.bb            |  2 +-
 recipes-core/classpathx/gnumail_1.1.2.bb           |  2 +-
 recipes-core/classpathx/inetlib_1.1.1.bb           |  2 +-
 recipes-core/cup/cup_0.10k.bb                      |  2 +-
 recipes-core/ecj/ecj-bootstrap-native.bb           |  4 +++-
 recipes-core/ecj/libecj-bootstrap.inc              |  2 +-
 recipes-core/icedtea/icedtea7-native.inc           |  2 +-
 recipes-core/jacl/jacl_1.4.1.bb                    |  2 +-
 .../jakarta-commons/commons-logging_1.1.1.bb       |  2 --
 recipes-core/jakarta-commons/commons-net_1.4.1.bb  |  2 --
 .../jakarta-libs/avalon-framework-api_4.3.bb       |  2 +-
 recipes-core/jakarta-libs/bsf_2.4.0.bb             |  2 +-
 recipes-core/jakarta-libs/log4j1.2_1.2.17.bb       |  2 +-
 recipes-core/jakarta-libs/logkit_1.2.2.bb          |  2 +-
 recipes-core/jakarta-libs/oro_2.0.8.bb             |  2 +-
 recipes-core/jakarta-libs/poi_3.0.bb               |  2 +-
 recipes-core/jakarta-libs/regexp_1.5.bb            |  2 +-
 recipes-core/jamvm/jamvm.inc                       |  4 ++--
 recipes-core/jcraft/jsch_0.1.40.bb                 |  2 +-
 recipes-core/jcraft/jzlib_1.0.7.bb                 |  2 +-
 recipes-core/jdepend/jdepend_2.9.1.bb              |  2 +-
 recipes-core/jlex/jlex_1.2.6.bb                    |  2 +-
 recipes-core/junit/junit4_4.3.1.bb                 |  4 +++-
 recipes-core/junit/junit_3.8.2.bb                  |  2 +-
 recipes-core/openjdk/openjdk-8-native.inc          | 13 +++++------
 recipes-core/openjdk/openjdk-8-native_72b05.bb     | 26 ----------------------
 recipes-core/rhino/rhino_1.7r4.bb                  |  2 +-
 recipes-core/servlet-api/servlet2.3_4.1.37.bb      |  4 +++-
 recipes-core/servlet-api/servlet2.4_5.5.26.bb      |  2 ++
 recipes-core/xalan-j/xalan-j_2.7.1.bb              |  2 +-
 recipes-core/xerces-j/xerces-j_2.11.0.bb           |  6 ++---
 recipes-core/xml-commons/jaxp1.3_1.4.01.bb         |  4 +++-
 .../xml-commons/xml-commons-resolver1.1_1.2.bb     |  6 ++---
 recipes-core/xml-commons/xpp2_2.1.10.bb            |  2 ++
 recipes-core/xml-commons/xpp3_1.1.3.4.O.bb         |  2 ++
 42 files changed, 69 insertions(+), 90 deletions(-)
 delete mode 100644 classes/java-bootstrap-components.bbclass

-- 
1.9.1


