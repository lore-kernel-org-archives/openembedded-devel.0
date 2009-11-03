Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N5SHR-0000mt-PL
	for openembedded-devel@openembedded.org; Tue, 03 Nov 2009 23:55:16 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA3Mp5G0027200; Tue, 3 Nov 2009 22:51:05 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UseaxdYPj5Dg; Tue,  3 Nov 2009 22:51:05 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nA3Mp0El027194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 3 Nov 2009 22:51:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
X-Greylist: delayed 1650 seconds by postgrey-1.27 at bat; Sun, 20 Jan 2008
	15:23:54 CET
X-BeenThere: bitbake-dev@lists.berlios.de
X-Mailman-Version: 2.1.9
X-Virus-Scanned: amavisd-new at rpsys.net
Date: Tue, 03 Nov 2009 22:50:22 +0000
Message-Id: <1257288622.30217.78.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Bitbake 1.8.14 released!
X-BeenThere: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 03 Nov 2009 22:55:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Bitbake 1.8.14 has been released.

http://prdownload.berlios.de/bitbake/bitbake-1.8.14.tar.gz

This is a maintenance release and probably the last in the 1.8 series.
After this release a 1.10 series will be created aiming to be more like
the master branch without the code server/client code that is still
under development.

Changes since 1.8.12:

Chris Larson (9):
      BBPKGS: act as a default that can be overridden via the cmdline.
      BBMASK: survive a non-existant path and don't keep the dir after globbing.
      Make the bbpath change for includes temporary rather than permanent.
      bb.fetch: make try_mirror go through the dispatcher rather than using wget directly.
      bb.fetch.git: make empty host pass a file uri to git.
      bb.fetch.go: iterate over SRC_URI, not urldata.
      Fix rdepends in graphviz graph generation.
      taskdata: fix a possible infinite loop when multiple eligible providers aren't buildable
      Add .gitignore, ignore *.pyc.

Holger Hans Peter Freyther (3):
      Tag BitBake 1.8.12 (update versions, MANIFEST, ChangeLog)
      Clean up by Otavio Salvador
      [bb] Fix the tests by setting a debug level at start

Richard Purdie (15):
      utils.py: Add bb.utils.prune_suffix function
      BBHandler: Move handler finalisation code into a separate function
      cache.py: Simplfy logic (from Poky)
      cache.py: Fix whitespace damage
      fetch/hg.py: Fix hg checkouts of specific revisions (from Poky)
      fetch/wget.py: Fix wget fetching of urls with parameters specified (from Poky)
      fetch/git.py: Add username handling to git fetcher (from Poky)
      fetch/__init__.py: Set HOME environmental variable when running fetcher commands (from Poky)
      data.py: Make sure allowed variables inherited from the environment are exported again (from Poky)
      bitbake-1.8: Backport deprecated sets removal to remove warnings with python 2.6. Should be backwards compatible to python 2.4 and we don't support
      providers.py: Fix + character escaping from PACKAGES_DYNAMIC (thanks Otavio Salvador)
      Merge the BBCLASSEXTEND code from Poky. This allows once recipe to provide mutliple targets (e.g. -native and -sdk) and has been discussed on the O
      fetch/svk: Fix up breakage. Evidently nobody uses svk
      build.py: Add bb and os to __builtins__ backporting from trunk since we'd like to be able to depend on this behaviour in OE soon
      Release 1.8.14




