Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JGada-0007Yf-Pr
	for openembedded-devel@openembedded.org; Sun, 20 Jan 2008 14:55:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0KDt24A015577;
	Sun, 20 Jan 2008 13:55:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15518-02; Sun, 20 Jan 2008 13:54:54 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0KDsrdw015562
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 20 Jan 2008 13:54:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Sun, 20 Jan 2008 13:54:52 +0000
Message-Id: <1200837292.4656.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Bitbake 1.8.10 released!
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Jan 2008 13:55:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Bitbake 1.8.10 has been released.

http://prdownload.berlios.de/bitbake/bitbake-1.8.10.tar.gz

This release contains many important bugfixes and some feature
enhancements.

The bugfixes include:

  * SRCREV handling updates, improvements and fixes
  * Psyco is x86 only
  * bb.decodeurl bug (#1530)
  * Warn about malformed PREFERRED_PROVIDERS (#1072)
  * Sort initial providers list by default preference (#1145, #2024)
  * prefered versions have preference over latest versions (#768)
  * Handle paths in svn fetcher module parameter
  * Fix bogus preferred_version return values
  * Fix 'depends' flag splitting
  * Fix unexport handling (#3135)
  * Disable task number acceleration since it can allow the tasks to 
    run out of sequence
  * Use git-fetch instead of git-pull removing any need for merges when 
    fetching (we don't care about the index). Fixes fetch errors.
  * Fix shell showdata command (#3259)
  * Fix shell data updating problems (#1880)
  * Properly raise errors for invalid source URI protocols

The new features include:

  * bzr fetcher
  * mercurial fetcher
  * git branch support
  * BB_NICE_LEVEL option (#1627)
  * Detect builds of tasks with overlapping providers (#1359)
  * Add a known safe overlap whitelist (MULTI_PROVIDER_WHITELIST)
  * Support the syntax "export VARIABLE"
  * Add support for cleaning directories before a task runs:
     (do_taskname[cleandirs] = "dir")
  * Add bb.copyfile function similar to bb.movefile 
  * Allow multiple options for deptask flag
  * Add BB_GENERATE_MIRROR_TARBALLS option, set to 0 to make git 
    fetches  faster at the expense of not creating mirror tarballs.
  * Add bb.utils.lockfile() and bb.utils.unlockfile()
  * Add support for task selfstamp and lockfiles flags
  * Add norecurse and fullpath options to cvs fetcher
  * Add support for "-e target" (#3432)
  * Task scheduler abstraction and some example schedulers

There were also some improvements in user interaction, something I'm
hoping will improve a lot more in future releases:

  * Don't give a stacktrace for invalid tasks, have a user friendly 
    message (#3431)
  * Make taskdata and runqueue errors more user friendly
  * Improve runqueue code comments
  * Improve circular dependency chain debugging code and user feedback
  * Check sqlite verison and provide a useful error message

Hopefully this is the best version of bitbake yet, enjoy!

Cheers,

Richard



