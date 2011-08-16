Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtDtG-0007Ip-VG
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 09:16:48 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	09:12:09 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2011 09:12:14 +0200
Message-ID: <cover.1313478102.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 0/1] Import ability for libx11 to skip itself
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
X-List-Received-Date: Tue, 16 Aug 2011 07:16:48 -0000
Content-Type: text/plain

As of commit 2f94ff4fdb66755ba2448794baea19315ff96273 in oe-core, libx11 skips
itself if x11 is not in DISTRO_FEATURES.

Meta-oe has its own copy of libx11.inc, thus the commit has to be applied to
meta-oe also. This patch does the import.

The following changes since commit ceb4a1deaabe81e0acaf9dd179d08736f598203e:

  libxcb 1.7: turn into bbappend (2011-08-15 16:40:14 +0200)

are available in the git repository at:
  git://github.com/darander/meta-oe libx11
  https://github.com/darander/meta-oe/tree/libx11

Anders Darander (1):
  libx11: skip self if x11 not in DISTRO_FEATURES

 meta-oe/recipes-graphics/xorg-lib/libx11.inc |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

-- 
1.7.5.4



