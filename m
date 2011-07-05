Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qe4In-0007eU-5j
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jul 2011 14:00:29 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Tue, 5 Jul 2011
	13:55:25 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Jul 2011 13:55:20 +0200
Message-ID: <cover.1309866872.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] Fix external module compilations
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
X-List-Received-Date: Tue, 05 Jul 2011 12:00:29 -0000
Content-Type: text/plain


When compiling an external module, the compilation errors out, when
scripts/basic/fixdep and later on scripts/mod/modpost is being requested. The
removal of 'make -C $kerneldir _mrproper_scripts' fixes these problems.

The following changes since commit 340cc366c7feff983a85f9e9ae8ae1f537239f5b:

  gcc-4.5: Edit defaults.h in ${B} instead of ${S}, and t-oe in ${B} (2011-07-02 22:40:22 +0200)

are available in the git repository at:
  git://github.com/darander/meta-oe fixdep
  https://github.com/darander/meta-oe/tree/fixdep

Anders Darander (1):
  kernel.bbclass: make external module compile

 meta-oe/classes/kernel.bbclass |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

-- 
1.7.4.1



