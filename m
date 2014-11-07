Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB89D65C87
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 08:08:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA788C8h007358
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 7 Nov 2014 00:08:12 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 00:08:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Nov 2014 16:08:05 +0800
Message-ID: <cover.1415347548.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3][meta-networking]fix install package "curlpp pimd ssmping" to image failed
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
X-List-Received-Date: Fri, 07 Nov 2014 08:08:15 -0000
Content-Type: text/plain

vim local.conf
...
IMAGE_INSTALL_append = " curlpp pimd ssmping"
...

bitbake core-image-minimal

//Hongxu

The following changes since commit 34ca3aeef1a8ff74de548c427fff8dc94f4b720a:

  vpnc: use nativeperl to run perl scripts (2014-11-04 16:02:44 -0500)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-mete-networking
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-mete-networking

Hongxu Jia (3):
  curlpp: use libcurlpp as curlpp's provider
  pimd: add do_install to pimd
  ssmping: add do_install to ssmping

 .../recipes-support/curlpp/curlpp_0.7.3.bb         |  1 +
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb |  7 +++++
 .../files/0001-Makefile-tweak-install-dir.patch    | 35 ++++++++++++++++++++++
 .../recipes-support/ssmping/ssmping_0.9.1.bb       |  8 ++++-
 4 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ssmping/files/0001-Makefile-tweak-install-dir.patch

-- 
1.9.1


