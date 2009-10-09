Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MwBT3-00012X-FD
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 11:08:56 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id C59BB16E235
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2009 11:08:04 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 83BAC2A426F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2009 11:08:04 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 9 Oct 2009 11:09:33 +0200
Message-ID: <4ACEFD4C.6060606@dresearch.de>
Date: Fri, 09 Oct 2009 11:07:24 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 09 Oct 2009 09:09:33.0734 (UTC)
	FILETIME=[379B8460:01CA48C0]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: build exception in sgmlspl-native
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
X-List-Received-Date: Fri, 09 Oct 2009 09:08:56 -0000
Content-Type: multipart/mixed; boundary="------------050509000709020507050804"

--------------050509000709020507050804
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

'bitbake sgmlspl-native' fails in dev-branch (with last commit
b696acdd7296726efce684e3434f6a6445ddd992) with this exception:

ERROR: Error in executing:
/home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'

For details see attached log. Could this be a linux vs. linux-gnu
related problem?

Steffen
/opt/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets module is deprecated
  import types, sets
/opt/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets module is deprecated
  import types, sets
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to increase performance.
Parsing .bb files, please wait...done.
NOTE: Parsing finished. 7033 cached, 6 parsed, 295 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 142 of 303 (ID: 1, /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_setscene)
NOTE: Running task 143 of 303 (ID: 2, /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_fetch)
NOTE: Running task 144 of 303 (ID: 3, /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_unpack)
NOTE: Unpacking ../../../sources/SGMLSpm-1.03ii.tar.gz to tmp.3/work/i686-linux/sgmlspl-native-1.03ii-r0/
NOTE: Running task 170 of 303 (ID: 4, /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_patch)
NOTE: Applying patch 'combined.patch' (../../openembedded/recipes/sgmlspl/files/combined.patch)
NOTE: Running task 171 of 303 (ID: 5, /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_configure)
NOTE: Running task 184 of 303 (ID: 6, /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_qa_configure)
NOTE: Running task 185 of 303 (ID: 7, /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_compile)
NOTE: Running task 186 of 303 (ID: 8, /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_install)
NOTE: Running task 202 of 303 (ID: 12, /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_package)
ERROR: Error in executing: /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'
ERROR: Printing the environment of the function
ERROR: 	0005:    packages = bb.data.getVar('PACKAGES',d, True)
ERROR: 	0006:
ERROR: 	0007:    # no packages should be scanned
ERROR: 	0008:    if not packages:
ERROR: 	0009:        return
ERROR: 	0010:
ERROR: 	0011:    checks = [package_qa_check_rpath, package_qa_check_dev,
ERROR: 	0012:              package_qa_check_perm, package_qa_check_arch,
ERROR: 	0013:              package_qa_check_desktop, package_qa_hash_style,
ERROR: Error in executing: /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'
ERROR: Printing the environment of the function
ERROR: 	0005:		return
ERROR: 	0006:
ERROR: 	0007:	for f in (bb.data.getVar('PACKAGEFUNCS', d, 1) or '').split():
ERROR: 	0008:		bb.build.exec_func(f, d)
ERROR: 	0009:		package_run_hooks(f, d)
ERROR: 	0010:
ERROR: Error in executing: /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'
ERROR: Printing the environment of the function
ERROR: Error in executing: /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'
ERROR: Printing the environment of the function
ERROR: Build of /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb do_package failed
Traceback (most recent call last):
  File "/opt/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/opt/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/opt/bitbake/lib/bb/cooker.py", line 644, in cook
    return self.buildTargets(pkgs_to_build)
  File "/opt/bitbake/lib/bb/cooker.py", line 551, in buildTargets
    failures = rq.execute_runqueue()
  File "/opt/bitbake/lib/bb/runqueue.py", line 842, in execute_runqueue
    self.execute_runqueue_internal()
  File "/opt/bitbake/lib/bb/runqueue.py", line 951, in execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/opt/bitbake/lib/bb/cooker.py", line 137, in tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
  File "/opt/bitbake/lib/bb/cooker.py", line 111, in tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/opt/bitbake/lib/bb/build.py", line 278, in exec_task
    exec_func(task, localdata)
  File "/opt/bitbake/lib/bb/build.py", line 113, in exec_func
    exec_func_python(func, d)
  File "/opt/bitbake/lib/bb/build.py", line 136, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/opt/bitbake/lib/bb/utils.py", line 171, in better_exec
    exec code in context
  File "do_package", line 4, in <module>
  File "do_package", line 2, in do_package
  File "/opt/bitbake/lib/bb/build.py", line 113, in exec_func
    exec_func_python(func, d)
  File "/opt/bitbake/lib/bb/build.py", line 136, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/opt/bitbake/lib/bb/utils.py", line 171, in better_exec
    exec code in context
  File "insane_do_package", line 4, in <module>
  File "insane_do_package", line 2, in insane_do_package
  File "/opt/bitbake/lib/bb/build.py", line 113, in exec_func
    exec_func_python(func, d)
  File "/opt/bitbake/lib/bb/build.py", line 136, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/opt/bitbake/lib/bb/utils.py", line 171, in better_exec
    exec code in context
  File "package_do_package", line 11, in <module>
  File "package_do_package", line 8, in package_do_package
  File "/opt/bitbake/lib/bb/build.py", line 113, in exec_func
    exec_func_python(func, d)
  File "/opt/bitbake/lib/bb/build.py", line 136, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/opt/bitbake/lib/bb/utils.py", line 171, in better_exec
    exec code in context
  File "do_package_qa", line 33, in <module>
  File "do_package_qa", line 24, in do_package_qa
  File "<bb>", line 9, in package_qa_walk
KeyError: 'linux'
ERROR: Task 12 (/home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb, do_package) failed
NOTE: Tasks Summary: Attempted 201 tasks of which 193 didn't need to be rerun and 1 failed.
ERROR: '/home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb' failed

--------------050509000709020507050804--
