Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Obr7h-0006oY-M1
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 10:27:46 +0200
Received: from guest185.ibr.cs.tu-bs.de ([134.169.35.185] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Obr75-0005MN-FT by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 10:26:59 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Obr6s-0007kU-Re
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 10:26:30 +0200
Date: Thu, 22 Jul 2010 10:26:30 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100722082630.GB10442@excalibur.local>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
	<1279721232-24744-17-git-send-email-heinold@inf.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <1279721232-24744-17-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 16/21] fastjar: backport 0.98 version from openembedded-dev
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
X-List-Received-Date: Thu, 22 Jul 2010 08:27:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-07-21 at 16:07, heinold@inf.fu-berlin.de wrote:
> From: Henning Heinold <h.heinold@tarent.de>
> 
> ---
>  conf/checksums.ini                     |    4 +
>  recipes/fastjar/fastjar-native.inc     |   18 +++++
>  recipes/fastjar/fastjar-native_0.98.bb |    4 +
>  recipes/fastjar/fastjar.inc            |   18 +++++
>  recipes/fastjar/fastjar_0.98.bb        |    1 +
>  recipes/fastjar/files/jartool.patch    |  112 ++++++++++++++++++++++++++++++++


I was going to test the whole patchset on stable. (The last two patches replaced
with the updates versions posted).

I'm running into a problem where the patching of jartool.patch fails though.
This is on planin stable/2009 without any overlay.

NOTE: Running task 88 of 147 (ID: 13,
/home/stefan/openjdk-stable-test/oe/recipes/fastjar/fastjar-native_0.98.bb,
do_distribute_sources)
ERROR: Error in executing:
/home/stefan/openjdk-stable-test/oe/recipes/fastjar/fastjar-native_0.98.bb
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1
Output:
Applying patch jartool.patch
patching file jartool.c
Hunk #4 FAILED at 1749.
Hunk #5 succeeded at 1779 with fuzz 1.
Hunk #6 succeeded at 1796 with fuzz 1.
1 out of 8 hunks FAILED -- rejects in file jartool.c
Patch jartool.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/stefan/openjdk-stable-test/oe/recipes/fastjar/fastjar-native_0.98.bb
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1
Output:
Applying patch jartool.patch
patching file jartool.c
Hunk #4 FAILED at 1749.
Hunk #5 succeeded at 1779 with fuzz 1.
Hunk #6 succeeded at 1796 with fuzz 1.
1 out of 8 hunks FAILED -- rejects in file jartool.c
Patch jartool.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/stefan/openjdk-stable-test/oe/recipes/fastjar/fastjar-native_0.98.bb
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status: 1
Output:
Applying patch jartool.patch
patching file jartool.c
Hunk #4 FAILED at 1749.
Hunk #5 succeeded at 1779 with fuzz 1.
Hunk #6 succeeded at 1796 with fuzz 1.
1 out of 8 hunks FAILED -- rejects in file jartool.c
Patch jartool.patch does not apply (enforce with -f)
ERROR: Printing the environment of the function
ERROR: Build of
/home/stefan/openjdk-stable-test/oe/recipes/fastjar/fastjar-native_0.98.bb
do_patch failed
Traceback (most recent call last):
  File "/home/stefan/openjdk-stable-test/oe/bitbake/bin/bitbake", line 143, in
<module>
    main()
  File "/home/stefan/openjdk-stable-test/oe/bitbake/bin/bitbake", line 140, in
main
    cooker.cook()
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/cooker.py", line 643,
in cook
    return self.buildTargets(pkgs_to_build)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/cooker.py", line 550,
in buildTargets
    failures = rq.execute_runqueue()
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/runqueue.py", line
841, in execute_runqueue
    self.execute_runqueue_internal()
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/runqueue.py", line
950, in execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/cooker.py", line 136,
in tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/cooker.py", line 110,
in tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/build.py", line 278,
in exec_task
    exec_func(task, localdata)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/build.py", line 113,
in exec_func
    exec_func_python(func, d)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/build.py", line 136,
in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/utils.py", line 171,
in better_exec
    exec code in context
  File "do_patch", line 4, in <module>
  File "do_patch", line 2, in do_patch
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/build.py", line 113,
in exec_func
    exec_func_python(func, d)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/build.py", line 136,
in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/utils.py", line 171,
in better_exec
    exec code in context
  File "base_do_patch", line 4, in <module>
  File "base_do_patch", line 2, in base_do_patch
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/build.py", line 113,
in exec_func
    exec_func_python(func, d)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/build.py", line 136,
in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/stefan/openjdk-stable-test/oe/bitbake/lib/bb/utils.py", line 171,
in better_exec
    exec code in context
  File "patch_do_patch", line 100, in <module>
  File "patch_do_patch", line 98, in patch_do_patch
  File "<bb>", line 347, in Resolve
__builtin__.CmdError: Command Error: exit status: 1  Output:
Applying patch jartool.patch
patching file jartool.c
Hunk #4 FAILED at 1749.
Hunk #5 succeeded at 1779 with fuzz 1.
Hunk #6 succeeded at 1796 with fuzz 1.
1 out of 8 hunks FAILED -- rejects in file jartool.c
Patch jartool.patch does not apply (enforce with -f)
NOTE: Running task 89 of 147 (ID: 107,
/home/stefan/openjdk-stable-test/oe/recipes/gnu-config/gnu-config-native_20050701.bb,
do_package_write_ipk)
ERROR: Task 4
(/home/stefan/openjdk-stable-test/oe/recipes/fastjar/fastjar-native_0.98.bb,
do_patch) failed

regards
Stefan Schmidt


