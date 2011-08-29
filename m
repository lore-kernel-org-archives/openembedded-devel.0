Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Qxx6v-0002Ng-J5
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 10:22:25 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Qxx2F-0007j4-5e from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 01:17:35 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 29 Aug 2011 10:17:33 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 13:17:48 +0500
Message-Id: <cover.1314603785.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 29 Aug 2011 08:17:33.0901 (UTC)
	FILETIME=[1AA887D0:01CC6624]
Subject: [meta-oe][PATCH v2 0/4] pull request #1 for benchmark recipes
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
X-List-Received-Date: Mon, 29 Aug 2011 08:22:25 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

The following changes since commit 3ebc55d38c82430d7275d457107dd3490b6c967d:
  Koen Kooi (1):
        connman: update to 0.77

are available in the git repository at:

  git://github.com/Noor-Ahsan/meta-oe master
  https://github.com/Noor-Ahsan/meta-oe/tree/master

Noor Ahsan (4):
  dbench: Add version 4.0 (initial recipe)
  iperf: Add version 2.0.4 (initial recipe)
  lmbench: Add version 3.0-a9 (initial recipe)
  tiobench: Add version 0.3.3 (initial recipe)

 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb     |   25 +++
 .../recipes-benchmark/dbench/files/destdir.patch   |   28 +++
 .../recipes-benchmark/dbench/files/makefile.patch  |   18 ++
 .../iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff |  164 ++++++++++++++++++
 .../001-cast-to-max_size_t-instead-of-int.patch    |   14 ++
 .../003-fix-hyphen-used-as-minus-sign.patch        |  178 ++++++++++++++++++++
 .../iperf/iperf-2.0.4/004-svn-r43-ro.patch         |  117 +++++++++++++
 .../iperf-2.0.4/005-iperf-die-on-bind-fail.patch   |   15 ++
 .../006-iperf-die-on-connect-fail.patch            |   15 ++
 .../iperf-2.0.4/007-iperf-reporter-deadlock.patch  |   68 ++++++++
 .../iperf/iperf-2.0.4/008-numofreport.patch        |   15 ++
 .../iperf/iperf-2.0.4/009-delayloop.patch          |   22 +++
 meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb     |   46 +++++
 .../lmbench/lmbench-3.0-a9/obey-ranlib.patch       |   30 ++++
 .../lmbench-3.0-a9/update-results-script.patch     |  160 ++++++++++++++++++
 .../recipes-benchmark/lmbench/lmbench/lmbench-run  |   23 +++
 .../lmbench/lmbench/rename-line-binary.patch       |   19 ++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |   54 ++++++
 .../tiobench-0.3.3/tiobench-makefile.patch         |   49 ++++++
 .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |   25 +++
 20 files changed, 1085 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
 create mode 100644 meta-oe/recipes-benchmark/dbench/files/destdir.patch
 create mode 100644 meta-oe/recipes-benchmark/dbench/files/makefile.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/000-Iperf_Fix-CPU-Usage.diff
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/001-cast-to-max_size_t-instead-of-int.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/003-fix-hyphen-used-as-minus-sign.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/004-svn-r43-ro.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/005-iperf-die-on-bind-fail.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/006-iperf-die-on-connect-fail.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/007-iperf-reporter-deadlock.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/008-numofreport.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf-2.0.4/009-delayloop.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf/iperf_2.0.4.bb
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/obey-ranlib.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/update-results-script.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/lmbench-run
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/rename-line-binary.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb



