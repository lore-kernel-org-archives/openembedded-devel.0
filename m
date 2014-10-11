Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6DE71400
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 10:12:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9BACPvh016209
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Oct 2014 03:12:25 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sat, 11 Oct 2014 03:12:24 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 11 Oct 2014 06:12:22 -0400
Message-ID: <cover.1413021995.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1 v2][meta-networking] ntp: fix path to drift file
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
X-List-Received-Date: Sat, 11 Oct 2014 10:12:26 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

v2 changes:

Update the commit logs:
-----------------------
* fix the path to drift file:

The default path of ntp drift file is /etc/ntp.drift, ntp daemon
maybe fails to create this file since the user ntp is not always
permitted to write /etc.

Refer to other distributions such as RedHat, Debian, just moving
the file to /var/lib/ntp which the home dir of user ntp.

* add tmpfile support:

Make sure the /var/lib/ntp is always created by sysvinit/systemd.
------------------------

The following changes since commit a4bdcbdbca05bbb4a452e06982038f0a38bcb91f:

  openldap: use PN for PACKAGES_DYNAMIC (2014-10-10 12:47:35 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/ntp-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ntp-fix

Wenzong Fan (1):
  ntp: fix path to drift file

 meta-networking/recipes-support/ntp/ntp.inc |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
1.7.9.5


