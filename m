Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denys@ti.com>) id 1R1lJS-0000iD-9Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 22:35:06 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p88KR640016014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2011 15:27:07 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p88KR6oQ020640
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2011 15:27:06 -0500 (CDT)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p88KR6G2006342
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2011 15:27:06 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3; Thu, 8 Sep 2011
	15:27:06 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.100.100])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id p88KR6HJ017549	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2011 15:27:06 -0500
Date: Thu, 8 Sep 2011 16:27:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110908202705.GA17405@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: [2011.03-maintenance] Pull request 20110908
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
X-List-Received-Date: Thu, 08 Sep 2011 20:35:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Tom,

Please pull the following commit for gcc-4.5 that fixes ICE on i586 and adds
new Linaro patches, one of which fixes crash in Qt browser when rendering
JavaScript pages. This commit is a direct cherry-pick from OE.dev.


Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---


The following changes since commit bc8ddbf7944f82383936d88379619aa46c3954a2:
  Steffen Sledz (1):
        binutils-2.18: fix checksums

are available in the git repository at:

  git://arago-project.org/git/people/denix/openembedded 2011.03-maintenance

Khem Raj (1):
  gcc-4.5: Fix ICE on i586

 recipes/gcc/gcc-4.5.inc                            |   13 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch |  184 --------------------
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99351.patch |   20 +--
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99352.patch |   11 +-
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch |   74 ++++++++
 .../gcc-4.5-linaro-r99479.patch}                   |   42 ++---
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch |   64 +++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch |   40 +++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch |   84 +++++++++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch |   63 +++++++
 recipes/gcc/gcc-4.5/more-epilogues.patch           |   83 +++++++++
 11 files changed, 449 insertions(+), 229 deletions(-)
 delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99350.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99478.patch
 rename recipes/gcc/gcc-4.5/{tune-xscale-infinite-loop-PR45177.patch => linaro/gcc-4.5-linaro-r99479.patch} (68%)
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99480.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99481.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99482.patch
 create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99483.patch
 create mode 100644 recipes/gcc/gcc-4.5/more-epilogues.patch



