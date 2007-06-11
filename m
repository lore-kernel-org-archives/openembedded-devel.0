Received: from [64.233.162.224] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1HxpwO-0005Dd-3h
	for openembedded-devel@openembedded.org; Mon, 11 Jun 2007 21:52:40 +0200
Received: by nz-out-0506.google.com with SMTP id 9so1170916nzo
	for <openembedded-devel@openembedded.org>;
	Mon, 11 Jun 2007 12:49:46 -0700 (PDT)
Received: by 10.115.111.1 with SMTP id o1mr5841918wam.1181591385393;
	Mon, 11 Jun 2007 12:49:45 -0700 (PDT)
Received: by 10.115.75.15 with HTTP; Mon, 11 Jun 2007 12:49:45 -0700 (PDT)
Message-ID: <bdb0025f0706111249n4b28df89p9cbaffa43de7ee06@mail.gmail.com>
Date: Mon, 11 Jun 2007 16:49:45 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: strange error when coding a bbclass
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
X-List-Received-Date: Mon, 11 Jun 2007 19:52:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm getting a strange error when coding a bbclass.

I've already built all packages that I need so the tmp dir is full.

Then I clean the bash package, for example, and try to build it again
and it builds fine without trying to build any other depends, but when
I include my dummyclass.bbclass it starts to build all depends
breaking in some points

I have this dummy function in dummyclass.bbclass

python do_blah () {
    print "teste"
}

just it...

The strangest thing is that the error depends where I add this task:
* addtask blah before do_patch  # it breaks do_patch of quilt-native
* addtask blah before do_configure # it breaks do_stage of quilt-native
* addtask blah before do_install # it breaks do_configure of linux-libc-headers
# All logs are in the end of this e-mail.

This is a very stupid and almost empty function that does nothing
important but the build breaks...

I did this because I was getting strange errors like these ones when
trying to use sourcepkg.bbclass and trying to code my
sourcedsc.bbclass. Then I started to minimize the function of bbclass
to see what was the problem, then I got this: an almost empty function
breaking the build in some packages...

Does any body have any idea?

btw: I'm using bitbake1.8 from svn.

Regards,
vivijim
PS: the logs:

########################
##### Error adding it before do_patch
########################

NOTE: package quilt-native-0.45-r1: task do_patch: started
NOTE: Applying patch 'install.patch'
NOTE: self._current is None
NOTE: patches is [{'remote': 'file://install.patch', 'strippath': '1',
'file': '/indt/mamona/openembedded/org.openembedded.dev/packages/quilt/files/install.patch',
'filemd5': '60ecbf58a966a383f093b21ac6f65ca5'}]
NOTE: applying patch {'remote': 'file://install.patch', 'strippath':
'1', 'file': '/indt/mamona/openembedded/org.openembedded.dev/packages/quilt/files/install.patch',
'filemd5': '60ecbf58a966a383f093b21ac6f65ca5'}
ERROR: Error in executing:
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit
status: 1  Output:
patching file Makefile.in
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file Makefile.in.rej
ERROR: Printing the environment of the function
ERROR: Error in executing:
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit
status: 1  Output:
patching file Makefile.in
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file Makefile.in.rej
ERROR: Printing the environment of the function
ERROR: Error in executing:
ERROR: Exception:<class 'CmdError'> Message:Command Error: exit
status: 1  Output:
patching file Makefile.in
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file Makefile.in.rej
ERROR: Printing the environment of the function
ERROR: Build of
/indt/mamona/openembedded/org.openembedded.dev/packages/quilt/quilt-native_0.45.bb
do_patch failed
Traceback (most recent call last):
  File "/indt/mamona/openembedded/bitbake/bin/bitbake", line 117, in <module>
    main()
  File "/indt/mamona/openembedded/bitbake/bin/bitbake", line 113, in main
    cooker.cook()
  File "/indt/mamona/openembedded/bitbake/lib/bb/cooker.py", line 526, in cook
    return self.buildTargets(pkgs_to_build)
  File "/indt/mamona/openembedded/bitbake/lib/bb/cooker.py", line 440,
in buildTargets
    failures = rq.execute_runqueue()
  File "/indt/mamona/openembedded/bitbake/lib/bb/runqueue.py", line
383, in execute_runqueue
    self.execute_runqueue_internal()
  File "/indt/mamona/openembedded/bitbake/lib/bb/runqueue.py", line
498, in execute_runqueue_internal
    self.cooker.tryBuild(fn, False)
  File "/indt/mamona/openembedded/bitbake/lib/bb/cooker.py", line 112,
in tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd,
the_data, build_depends)
  File "/indt/mamona/openembedded/bitbake/lib/bb/cooker.py", line 85,
in tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/indt/mamona/openembedded/bitbake/lib/bb/build.py", line 292,
in exec_task
    execute(None, task)
  File "/indt/mamona/openembedded/bitbake/lib/bb/build.py", line 281, in execute
    exec_func(item, localdata)
  File "/indt/mamona/openembedded/bitbake/lib/bb/build.py", line 98,
in exec_func
    exec_func_python(func, d)
  File "/indt/mamona/openembedded/bitbake/lib/bb/build.py", line 117,
in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/indt/mamona/openembedded/bitbake/lib/bb/utils.py", line 144,
in better_exec
    exec code in context
  File "do_patch", line 4, in <module>
  File "do_patch", line 2, in do_patch
  File "/indt/mamona/openembedded/bitbake/lib/bb/build.py", line 98,
in exec_func
    exec_func_python(func, d)
  File "/indt/mamona/openembedded/bitbake/lib/bb/build.py", line 117,
in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/indt/mamona/openembedded/bitbake/lib/bb/utils.py", line 144,
in better_exec
    exec code in context
  File "base_do_patch", line 4, in <module>
  File "base_do_patch", line 2, in base_do_patch
  File "/indt/mamona/openembedded/bitbake/lib/bb/build.py", line 98,
in exec_func
    exec_func_python(func, d)
  File "/indt/mamona/openembedded/bitbake/lib/bb/build.py", line 117,
in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/indt/mamona/openembedded/bitbake/lib/bb/utils.py", line 144,
in better_exec
    exec code in context
  File "patch_do_patch", line 98, in <module>
  File "patch_do_patch", line 96, in patch_do_patch
  File "<bb>", line 340, in Resolve
__builtin__.CmdError: Command Error: exit status: 1  Output:
patching file Makefile.in
Reversed (or previously applied) patch detected!  Assume -R? [n]
Apply anyway? [n]
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file Makefile.in.rej
ERROR: Task 55 (/indt/mamona/openembedded/org.openembedded.dev/packages/quilt/quilt-native_0.45.bb,
do_patch) failed
NOTE: Tasks Summary: Attempted 15 tasks of which 8 didn't need to be
rerun and 1 failed.
ERROR: '/indt/mamona/openembedded/org.openembedded.dev/packages/quilt/quilt-native_0.45.bb'
failed

########################
##### Error adding it before do_configure
########################
NOTE: package quilt-native-0.45-r1: task do_populate_staging: started
ERROR: function do_stage failed
ERROR: log data follows
(/indt/mamona/openembedded/tmp/work/quilt-native-0.45-r1/temp/log.do_stage.14285)
| NOTE: make install
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -d
/indt/mamona/openembedded/tmp/staging/i686-linux/bin
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -m
755 bin/quilt bin/guards
/indt/mamona/openembedded/tmp/staging/i686-linux/bin/
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -d
/indt/mamona/openembedded/tmp/staging/i686-linux/share/quilt
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -m
755 quilt/add quilt/annotate quilt/applied quilt/delete quilt/diff
quilt/edit quilt/files quilt/fold quilt/fork quilt/graph quilt/grep
quilt/header quilt/import quilt/mail quilt/new quilt/next
quilt/patches quilt/pop quilt/previous quilt/push quilt/refresh
quilt/remove quilt/rename quilt/series quilt/setup quilt/snapshot
quilt/top quilt/unapplied quilt/upgrade
/indt/mamona/openembedded/tmp/staging/i686-linux/share/quilt/
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -d
/indt/mamona/openembedded/tmp/staging/i686-linux/share/quilt/scripts
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -m
755 quilt/scripts/parse-patch quilt/scripts/inspect
quilt/scripts/dependency-graph quilt/scripts/edmail
quilt/scripts/remove-trailing-ws           \
|
/indt/mamona/openembedded/tmp/staging/i686-linux/share/quilt/scripts
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -m
644 quilt/scripts/patchfns                 \
|
/indt/mamona/openembedded/tmp/staging/i686-linux/share/quilt/scripts
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -d
/indt/mamona/openembedded/tmp/staging/i686-linux/lib/quilt
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -m
755 lib/backup-files
/indt/mamona/openembedded/tmp/staging/i686-linux/lib/quilt/
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -d
/indt/mamona/openembedded/tmp/staging/i686-linux/share/doc/quilt-0.45/
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -m
644 doc/README                                     \
|
/indt/mamona/openembedded/tmp/staging/i686-linux/share/doc/quilt-0.45/
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -m
644 doc/quilt.pdf doc/README.MAIL                  \
|
/indt/mamona/openembedded/tmp/staging/i686-linux/share/doc/quilt-0.45/
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -d
/indt/mamona/openembedded/tmp/staging/i686-linux/share/man/man1
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -m
644 bin/guards.1 doc/quilt.1
/indt/mamona/openembedded/tmp/staging/i686-linux/share/man/man1/
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -d
/indt/mamona/openembedded/tmp/staging/etc
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -d
/indt/mamona/openembedded/tmp/staging/etc/bash_completion.d
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install -c -m
644 bash_completion                                \
|
/indt/mamona/openembedded/tmp/staging/etc/bash_completion.d/quilt
| /indt/mamona/openembedded/tmp/staging/i686-linux/bin/install: cannot
stat `bash_completion': No such file or directory
| make: *** [install-main] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed:
/indt/mamona/openembedded/tmp/work/quilt-native-0.45-r1/temp/log.do_stage.14285
NOTE: package quilt-native-0.45-r1: task do_populate_staging: failed
ERROR: TaskFailed event exception, aborting
NOTE: package quilt-native-0.45: failed
ERROR: Build of
/indt/mamona/openembedded/org.openembedded.dev/packages/quilt/quilt-native_0.45.bb
do_populate_staging failed
ERROR: Task 58 (/indt/mamona/openembedded/org.openembedded.dev/packages/quilt/quilt-native_0.45.bb,
do_populate_staging) failed
NOTE: Tasks Summary: Attempted 21 tasks of which 15 didn't need to be
rerun and 1 failed.
ERROR: '/indt/mamona/openembedded/org.openembedded.dev/packages/quilt/quilt-native_0.45.bb'
failed

########################
##### Error adding it before do_install
########################

NOTE: package linux-libc-headers-2.6.15.99-r4: task do_configure: started
ERROR: function do_configure failed
ERROR: log data follows
(/indt/mamona/openembedded/tmp/work/linux-libc-headers-2.6.15.99-r4/temp/log.do_configure.20518)
| rm: cannot remove `include/asm': Is a directory
NOTE: Task failed:
/indt/mamona/openembedded/tmp/work/linux-libc-headers-2.6.15.99-r4/temp/log.do_configure.20518
NOTE: package linux-libc-headers-2.6.15.99-r4: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package linux-libc-headers-2.6.15.99: failed
ERROR: Build of
/indt/mamona/openembedded/org.openembedded.dev/packages/linux-libc-headers/linux-libc-headers_2.6.15.99.bb
do_configure failed
ERROR: Task 167
(/indt/mamona/openembedded/org.openembedded.dev/packages/linux-libc-headers/linux-libc-headers_2.6.15.99.bb,
do_configure) failed
NOTE: Tasks Summary: Attempted 187 tasks of which 79 didn't need to be
rerun and 1 failed.
ERROR: '/indt/mamona/openembedded/org.openembedded.dev/packages/linux-libc-headers/linux-libc-headers_2.6.15.99.bb'
failed


