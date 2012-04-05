Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1SFfcv-0007Ni-Fh
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 07:52:57 +0200
Received: from localhost (193.235.91.228) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.245.1; Thu, 5 Apr 2012
	07:42:38 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Apr 2012 07:42:16 +0200
Message-ID: <cover.1333604512.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] Fix issue re-running sqlite configure step
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
X-List-Received-Date: Thu, 05 Apr 2012 05:52:57 -0000
Content-Type: text/plain


A recent update of meta-oe and oe-core force a rebuild of e.g. sqlite in 
my tree. This made sqlite error out in the configure step, as it couldn't
find sqlite.pc, which had already been moved in a prior run of do_configure.


The following changes since commit a6790d602eb91069b1f618697e66a38619bcd690:

  v4l-utils: correct license delimiter (2012-04-04 20:36:48 +0200)

are available in the git repository at:
  git://github.com/darander/meta-oe sqlite-configure
  https://github.com/darander/meta-oe/tree/sqlite-configure

Anders Darander (1):
  sqlite: cp instead of mv in do_configure

 meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.4



