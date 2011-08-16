Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtJuX-0001Fu-7S
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 15:42:29 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	15:37:51 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2011 15:37:58 +0200
Message-ID: <cover.1313501855.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 0/1] connman: conditionally enable bluetooth and wifi
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
X-List-Received-Date: Tue, 16 Aug 2011 13:42:29 -0000
Content-Type: text/plain


Let connman depend and enable wifi and bluetooth, only when these are set in
the DISTRO_FEATURES. 

This reduces build-time, and make a non-x11 build succeed, as bluez4 currently
depends on x11 through a dependency chain. (This could/should be fixed in a
later patch). 

The following changes since commit 6d424db5a0f952956a218e82a3ef0c43ebaafd5a:

  xcb: add missing bbappends (2011-08-16 13:07:31 +0200)

are available in the git repository at:
  git://github.com/darander/meta-oe connman
  https://github.com/darander/meta-oe/tree/connman

Anders Darander (1):
  connman: conditionally enable wifi and bluetooth

 meta-oe/recipes-connectivity/connman/connman.inc   |    7 ++++++-
 .../recipes-connectivity/connman/connman_0.76.bb   |    4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
1.7.5.4



