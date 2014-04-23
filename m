Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (STOEXHUB03.domain01.net
	[83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id A8E7665D8E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 11:24:38 +0000 (UTC)
Received: from localhost (2.71.147.210) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.279.1; Wed, 23 Apr 2014
	13:24:34 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Apr 2014 13:24:28 +0200
Message-ID: <cover.1398252166.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.0.0.rc0
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 0/2] Breakpad fix and upgrade
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
X-List-Received-Date: Wed, 23 Apr 2014 11:24:46 -0000
Content-Type: text/plain

Fixing a build issue with an internal Qt based application.

Using qt4e, CFLAGS were used and thus the include files were
found. However, when porting to Qt5, CFLAGS seems to no longer 
be used, and thus we need to also set CXXFLAGS.

While looking at the recipe in question, I thought it was just 
as good to update it to the latest svn.

The following changes since commit 0f56bc4e2818a051a511ceb48596cbfa2f51ff3d:

  dejagnu: recipe taken from openembedded (2014-04-21 13:31:48 +0200)

are available in the git repository at:

  git://github.com/darander/meta-oe HEAD
  https://github.com/darander/meta-oe/tree/breakpad-cflags

Anders Darander (2):
  breakpad.bbclass: set includedir in CXXFLAGS
  breakpad: update to latest svn

 meta-oe/classes/breakpad.bbclass                  | 1 +
 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.0.0.rc0


