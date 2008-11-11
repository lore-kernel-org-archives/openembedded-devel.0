Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1KziKC-00052T-Bd
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Nov 2008 02:45:48 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 6D317402C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2008 21:18:03 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id B0FB0C1AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2008 23:17:19 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 7928D610058; Mon, 10 Nov 2008 23:13:36 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Mon, 10 Nov 2008 23:13:36 -0200
In-Reply-To: <200806061502.02821.mickey@vanille-media.de> (Michael Lauer's
	message of "Fri\, 6 Jun 2008 15\:02\:02 +0200")
Message-ID: <87iqqvvzcv.fsf_-_@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
References: <48486D5B.4060000@nospam.arcornews.de>
	<200806061502.02821.mickey@vanille-media.de>
MIME-Version: 1.0
Subject: Weird build failures
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
X-List-Received-Date: Tue, 11 Nov 2008 01:45:48 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

Bellow goes a weird build failure that I see no reason for it. It
fails but if I rebuild the package it works. It has happened to many
packages while I were building my image and I would like to know if
someone has a tip where the problem is.

,----
| otavio@neumann:~/hacking/ossystems/oe$ ../../bitbake/bin/bitbake angstrom-version
| NOTE: Handling BitBake files: | (6168/6168) [100 %]
| NOTE: Parsing finished. 5911 cached, 0 parsed, 257 skipped, 0 masked.
| NOTE: Cache is clean, not saving.
| NOTE: build 200811102310: started
| 
| OE Build Configuration:
| BB_VERSION        = "1.8.11"
| METADATA_BRANCH   = "master"
| METADATA_REVISION = "0e42d3070e612a4c90f0f13ccd7e20bf0e823863"
| TARGET_ARCH       = "i586"
| TARGET_OS         = "linux"
| MACHINE           = "oppitz-lx800"
| DISTRO            = "ossystems"
| DISTRO_VERSION    = "7.1-20081111"
| TARGET_FPU        = ""
| 
| NOTE: Resolving any missing task queue dependencies
| NOTE: Preparing runqueue
| NOTE: Executing runqueue
| NOTE: Running task 333 of 460 (ID: 9, /home/otavio/hacking/ossystems/oe/packages/angstrom/angstrom-version.bb, do_populate_staging)
| NOTE: Running task 335 of 460 (ID: 15, /home/otavio/hacking/ossystems/oe/packages/angstrom/angstrom-version.bb, do_package_write_ipk)
| NOTE: package angstrom-version-7.1-20081111: started
| NOTE: package angstrom-version-1_7.1-20081111-r1: task do_populate_staging: started
| NOTE: package angstrom-version-7.1-20081111: started
| NOTE: package angstrom-version-1_7.1-20081111-r1: task do_package_write_ipk: started
| ERROR: Error in executing: /home/otavio/hacking/ossystems/oe/packages/angstrom/angstrom-version.bb
| ERROR: Exception:<type 'exceptions.IOError'> Message:[Errno 2] No such file or directory: '/home/otavio/hacking/ossystems/oe/tmp/work/oppitz-lx800-ossystems-linux/angstrom-version-1_7.1-20081111-r1/install/angstrom-version.lock'
| ERROR: Printing the environment of the function
| ERROR: Error in executing: /home/otavio/hacking/ossystems/oe/packages/angstrom/angstrom-version.bb
| ERROR: Exception:<type 'exceptions.IOError'> Message:[Errno 2] No such file or directory: '/home/otavio/hacking/ossystems/oe/tmp/work/oppitz-lx800-ossystems-linux/angstrom-version-1_7.1-20081111-r1/install/angstrom-version.lock'
| ERROR: Printing the environment of the function
| ERROR: Build of /home/otavio/hacking/ossystems/oe/packages/angstrom/angstrom-version.bb do_package_write_ipk failed
| Traceback (most recent call last):
|   File "/home/otavio/hacking/bitbake/bin/bitbake", line 136, in <module>
|     main()
|   File "/home/otavio/hacking/bitbake/bin/bitbake", line 133, in main
|     cooker.cook()
|   File "../../bitbake/lib/bb/cooker.py", line 641, in cook
|   File "../../bitbake/lib/bb/cooker.py", line 551, in buildTargets
|   File "../../bitbake/lib/bb/runqueue.py", line 842, in execute_runqueue
|   File "../../bitbake/lib/bb/runqueue.py", line 951, in execute_runqueue_internal
|   File "../../bitbake/lib/bb/cooker.py", line 137, in tryBuild
|   File "../../bitbake/lib/bb/cooker.py", line 111, in tryBuildPackage
|   File "../../bitbake/lib/bb/build.py", line 278, in exec_task
|   File "../../bitbake/lib/bb/build.py", line 113, in exec_func
|   File "../../bitbake/lib/bb/build.py", line 136, in exec_func_python
|   File "../../bitbake/lib/bb/utils.py", line 171, in better_exec
|   File "do_package_write_ipk", line 11, in <module>
|   File "do_package_write_ipk", line 9, in do_package_write_ipk
|   File "../../bitbake/lib/bb/build.py", line 113, in exec_func
|   File "../../bitbake/lib/bb/build.py", line 136, in exec_func_python
|   File "../../bitbake/lib/bb/utils.py", line 171, in better_exec
|   File "do_package_ipk", line 182, in <module>
|   File "do_package_ipk", line 32, in do_package_ipk
|   File "../../bitbake/lib/bb/utils.py", line 249, in lockfile
| IOError: [Errno 2] No such file or directory: '/home/otavio/hacking/ossystems/oe/tmp/work/oppitz-lx800-ossystems-linux/angstrom-version-1_7.1-20081111-r1/install/angstrom-version.lock'
| ERROR: Task 15 (/home/otavio/hacking/ossystems/oe/packages/angstrom/angstrom-version.bb, do_package_write_ipk) failed
| NOTE: Waiting for 1 active tasks to finish
| NOTE: 1: /home/otavio/hacking/ossystems/oe/packages/angstrom/angstrom-version.bb, do_populate_staging (24297)
| NOTE: package angstrom-version-1_7.1-20081111-r1: task do_populate_staging: completed
| NOTE: package angstrom-version-7.1-20081111: completed
| NOTE: Tasks Summary: Attempted 453 tasks of which 453 didn't need to be rerun and 1 failed.
| ERROR: '/home/otavio/hacking/ossystems/oe/packages/angstrom/angstrom-version.bb' failed
| NOTE: build 200811102310: completed
`----

Cheers,

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


