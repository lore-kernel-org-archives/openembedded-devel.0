Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>)
	id 1LD73z-0007uy-Gw; Thu, 18 Dec 2008 01:48:27 +0100
Received: from [92.117.79.155] (helo=tamarin.localnet)
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>)
	id 1LD6zW-0003O3-0a; Thu, 18 Dec 2008 01:43:54 +0100
From: Holger Freyther <zecke@selfish.org>
To: bitbake-dev@lists.berlios.de
Date: Thu, 18 Dec 2008 01:42:10 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-9-generic; KDE/4.1.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200812180142.10804.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.79.155
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-announce@lists.openembedded.org
Subject: Bitbake 1.8.12 released as tarball to the wild
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
X-List-Received-Date: Thu, 18 Dec 2008 00:48:27 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

after almost a year it is more than time to release another stable Bitbake 
update. There has been many many patches all over the place to fix bugs, 
improve speed, sanitize operations. While most things are just working as 
before, some are not. The known changes are the cleaning of the environment, 
there is an option to get the old behavior (bitbake --help) and a white list 
one can specify.

Bitbake 1.8.12 can be downloaded here[1]. We will plan to make new tarballs 
available more often, I did build a fso-image with the tarball. Have fun 
testing things and send issues to the bitbake-dev or the openembedded-devel 
mailinglist or find us on irc.

z.


The full ChangeLog :


Changes in BitBake 1.8.12:
	- Fix -f (force) in conjunction with -b
	- Fix exit code for build failures in --continue mode
	- Fix git branch tags fetching
	- Change parseConfigurationFile so it works on real data, not a copy
	- Handle 'base' inherit and all other INHERITs from parseConfigurationFile 
	  instead of BBHandler
	- Fix getVarFlags bug in data_smart
	- Optmise cache handling by more quickly detecting an invalid cache, only 
	  saving the cache when its changed, moving the cache validity check into
	  the parsing loop and factoring some getVar calls outside a for loop
	- Cooker: Remove a debug message from the parsing loop to lower overhead
	- Convert build.py exec_task to use getVarFlags
	- Update shell to use cooker.buildFile
	- Add StampUpdate event
	- Convert -b option to use taskdata/runqueue
	- Remove digraph and switch to new stamp checking code. exec_task no longer
	  honours dependencies
	- Make fetcher timestamp updating non-fatal when permissions don't allow 
	  updates
	- Add BB_SCHEDULER variable/option ("completion" or "speed") controlling
	  the way bitbake schedules tasks
	- Add BB_STAMP_POLICY variable/option ("perfile" or "full") controlling
	  how extensively stamps are looked at for validity
	- When handling build target failures make sure idepends are checked and
	  failed where needed. Fixes --continue mode crashes.
	- Fix problems with recrdeptask handling where some idepends weren't handled
	  correctly.
	- Work around refs/HEAD issues with git over http (#3410)
	- Add proxy support to the CVS fetcher (from Cyril Chemparathy)
	- Improve runfetchcmd so errors are seen and various GIT variables are 
exported
	- Add ability to fetchers to check URL validity without downloading
	- Improve runtime PREFERRED_PROVIDERS warning message
	- Add BB_STAMP_WHITELIST option which contains a list of stamps to ignore 
when
	  checking stamp dependencies and using a BB_STAMP_POLICY of "whitelist"
	- No longer weight providers on the basis of a package being "already 
staged". This
	  leads to builds being non-deterministic.
	- Flush stdout/stderr before forking to fix duplicate console output
	- Make sure recrdeps tasks include all inter-task dependencies of a given fn
	- Add bb.runqueue.check_stamp_fn() for use by packaged-staging
	- Add PERSISTENT_DIR to store the PersistData in a persistent
	  directory != the cache dir.
	- Add md5 and sha256 checksum generation functions to utils.py
	- Make sure Build Completed events are generated even when tasks fail
	- Correctly handle '-' characters in class names (#2958)
	- Make sure expandKeys has been called on the data dictonary before running 
tasks
	- Correctly add a task override in the form task-TASKNAME.
	- Revert the '-' character fix in class names since it breaks things
	- When a regexp fails to compile for PACKAGES_DYNAMIC, print a more useful 
error (#4444)
	- Allow to checkout CVS by Date and Time. Just add HHmm to the SRCDATE.
	- Move prunedir function to utils.py and add explode_dep_versions function
	- Raise an exception if SRCREV == 'INVALID'
	- Fix hg fetcher username/password handling and fix crash
	- Fix PACKAGES_DYNAMIC handling of packages with '++' in the name
	- Rename __depends to __base_depends after configuration parsing so we don't
	  recheck the validity of the config files time after time
	- Add better environmental variable handling. By default it will now only 
pass certain 
	  whitelisted variables into the data store. If BB_PRESERVE_ENV is set 
bitbake will use
	  all variable from the environment. If BB_ENV_WHITELIST is set, that 
whitelist will be
	  used instead of the internal bitbake one. Alternatively, BB_ENV_EXTRAWHITE 
can be used
	  to extend the internal whitelist.
	- Perforce fetcher fix to use commandline options instead of being overriden 
by the environment
	- use @rev when doing a svn checkout
	- Add osc fetcher (from Joshua Lock in Poky)
	- When SRCREV autorevisioning for a recipe is in use, don't cache the recipe
	- Add tryaltconfigs option to control whether bitbake trys using alternative 
providers
	  to fulfil failed dependencies. It defaults to off, changing the default since 
this
	  behaviour confuses many users and isn't often useful.
	- Improve lock file function error handling
	- Add username handling to the git fetcher (Robert Bragg)
	- Add support for HTTP_PROXY and HTTP_PROXY_IGNORE variables to the wget 
fetcher
	- Export more variables to the fetcher commands to allow ssh checkouts and 
checkouts through 
	  proxies to work better. (from Poky)
	- Also allow user and pswd options in SRC_URIs globally (from Poky)
	- Improve proxy handling when using mirrors (from Poky)






[1] http://prdownload.berlios.de/bitbake/bitbake-1.8.12.tar.gz


