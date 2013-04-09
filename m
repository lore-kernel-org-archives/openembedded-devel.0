Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UPSyi-0002Ak-8E
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 09:28:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r397B7xh023416
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Apr 2013 00:11:07 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Apr 2013 00:11:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Apr 2013 15:11:03 +0800
Message-ID: <cover.1365489405.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com
Subject: [meta-webserver][PATCH 0/2] modphp: enable mysql option in PACKAGECONFIG
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
X-List-Received-Date: Tue, 09 Apr 2013 07:29:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The patches are for the LAMP feature in our layer, to enable mysql option in
PACKAGECONFIG works but the old libtool used by modphp doesn't support
"--with-libtool-sysroot" which causes a host contamination issue. So this work
also includes fixes to support autoconf 2.59+ to avoid the libtool issue.

I think not all people want to enale mysql as default, if so, I think we can
only add the fixes, and I will only enable mysql option in our layer.

---
The following changes since commit b07f0a239e7ee2b81157399b6befa811a5009813:

  gd: Add mirror for when libgd.org is down (2013-04-08 14:12:24 +0200)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_modphp_lamp_0409_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_modphp_lamp_0409_0

Jackie Huang (2):
  modphp: revert pthread-check.patch and add one against threads.m4
  modphp: enable mysql option in PACKAGECONFIG

 .../modphp/files/php-5.3.14-aconf259.patch         |  209 ++++++++++++++++++++
 .../modphp/files/pthread-check-threads-m4.patch    |   30 +++
 .../recipes-php/modphp/files/pthread-check.patch   |   64 ------
 meta-webserver/recipes-php/modphp/modphp5.inc      |   26 ++--
 4 files changed, 252 insertions(+), 77 deletions(-)
 create mode 100644 meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch
 create mode 100644 meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch
 delete mode 100644 meta-webserver/recipes-php/modphp/files/pthread-check.patch

-- 
1.7.4.1



