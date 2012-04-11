Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1SHr0e-00084p-Oj
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 08:26:28 +0200
Received: from localhost (193.235.91.228) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.245.1; Wed, 11 Apr 2012
	08:17:09 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Apr 2012 08:16:48 +0200
Message-ID: <cover.1334124991.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH v2 0/1] Fix issue re-running sqlite configure step
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
X-List-Received-Date: Wed, 11 Apr 2012 06:26:28 -0000
Content-Type: text/plain


A recent update of meta-oe and oe-core force a rebuild of e.g. sqlite in 
my tree. This made sqlite error out in the configure step, as it couldn't
find sqlite.pc, which had already been moved in a prior run of do_configure.

V2: I'm resending this, the only differences is that I this time remembered 
    to add meta-oe to the subject and that this one is rebased...

    Otavio ack'ed the original submission.

The following changes since commit 8a9e1dc63d9aadb3da17edfd31da9ccf833bfeb1:

  midori: add librsvg-native to DEPENDS (2012-04-10 09:35:45 +0200)

are available in the git repository at:
  git://github.com/darander/meta-oe sqlite-configure
  https://github.com/darander/meta-oe/tree/sqlite-configure

Anders Darander (1):
  sqlite: cp instead of mv in do_configure

 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.4



