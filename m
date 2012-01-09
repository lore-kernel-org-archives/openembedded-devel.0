Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkFD8-0006jX-9f
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 14:24:26 +0100
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.213.0; Mon, 9 Jan 2012
	14:16:57 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Jan 2012 14:16:50 +0100
Message-ID: <cover.1326114932.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.8.2
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/2] systemd: SRC_URI fix + package split
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
X-List-Received-Date: Mon, 09 Jan 2012 13:24:26 -0000
Content-Type: text/plain

Systemd's git repo has moved on freedesktop.org, thus fix the SRC_URI.

At least while using rpm-packaging, the systemd package (rpm) got a dependency
on python, as systemd-analyze needs this (in the shebang). When trying to
create a small image using systemd, this isn't always desirable. Thus the
splitting of systemd-analyze to a separate package.



The following changes since commit 9c855444d025a85f28196bfeae25dd48e44510c5:

  xf86-video-fbdev: remove, driver is now in oe-core (2012-01-09 10:31:00 +0100)

are available in the git repository at:
  git://github.com/darander/meta-oe systemd-move
  https://github.com/darander/meta-oe/tree/systemd-move

Anders Darander (2):
  systemd: git repo moved
  systemd: split out systemd-analyze

 meta-oe/recipes-core/systemd/systemd_git.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

-- 
1.7.8.2



