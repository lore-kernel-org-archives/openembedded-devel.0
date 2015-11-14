Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D65557737C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 10:22:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAEAMVPJ006313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 02:22:31 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 14 Nov 2015 02:22:30 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 14 Nov 2015 05:22:25 -0500
Message-ID: <cover.1447495903.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4][meta-oe] krb5: fix CVEs
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
X-List-Received-Date: Sat, 14 Nov 2015 10:22:35 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix CVEs:

  CVE-2015-2695
  CVE-2015-2696
  CVE-2015-2697
  CVE-2015-2698

The following changes since commit 721a2cabf352085d34dd14c22e71914d3429ca59:

  ntp: upgrade 4.2.8p3 -> 4.2.8p4 (2015-11-11 12:12:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/krb5-new
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/krb5-new

Wenzong Fan (4):
  krb5: fix CVE-2015-2695
  krb5: fix CVE-2015-2696
  krb5: fix CVE-2015-2697
  krb5: fix CVE-2015-2698

 ...AKERB-context-aliasing-bugs-CVE-2015-2696.patch | 739 +++++++++++++++++++++
 ...AKERB-context-export-import-CVE-2015-2698.patch | 134 ++++
 ...PNEGO-context-aliasing-bugs-CVE-2015-2695.patch | 572 ++++++++++++++++
 ...-build_principal-memory-bug-CVE-2015-2697.patch |  58 ++
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb   |   4 +
 5 files changed, 1507 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-context-aliasing-bugs-CVE-2015-2696.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-IAKERB-context-export-import-CVE-2015-2698.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-SPNEGO-context-aliasing-bugs-CVE-2015-2695.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/Fix-build_principal-memory-bug-CVE-2015-2697.patch

-- 
1.9.1


