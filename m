Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U8VAJ-0001LH-0c
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 13:22:24 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id ACDE8D22B3; Thu, 21 Feb 2013 13:06:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 74700D22B3;
	Thu, 21 Feb 2013 13:05:39 +0100 (CET)
Message-ID: <51260D8D.7040702@linaro.org>
Date: Thu, 21 Feb 2013 13:05:33 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Building with gcc-4.6 is not working
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
X-List-Received-Date: Thu, 21 Feb 2013 12:22:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi

OE moved some time ago to gcc-4.7 as default. But for some
builds I need to use older version which is now in
meta-openembedded/toolchain-layer.
But such builds fail for both gcc-linaro-4.6 and gcc-4.6:

NOTE: Executing RunQueue Tasks
ERROR: Error executing a python function in
/tmp/del/oe46/meta-linaro/recipes-devtools/gcc/gcc-cross-initial_linaro-4.6.bb:
CalledProcessError: Command 'tar -cf - -C
/tmp/del/oe46/build/tmp-eglibc/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gcc-cross-initial/linaro-4.6-r5/pkgdata
-ps . | tar -xf - -C
/tmp/del/oe46/build/tmp-eglibc/pkgdata/armv7ahf-vfp-neon-oe-linux-gnueabi'
returned non-zero exit status 2 with output tar:
/tmp/del/oe46/build/tmp-eglibc/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gcc-cross-initial/linaro-4.6-r5/pkgdata:
Cannot chdir: No such file or directory
tar: Error is not recoverable: exiting now
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors


ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "sstate_task_postfunc", line 10, in <module>
ERROR: ERROR:   File "sstate_task_postfunc", line 4, in sstate_task_postfunc
ERROR: ERROR:   File "sstate.bbclass", line 76, in sstate_install
ERROR: ERROR:   File
"/tmp/del/oe46/openembedded-core/meta/lib/oe/path.py", line 85, in copytree
ERROR:     check_output(cmd, shell=True, stderr=subprocess.STDOUT)
ERROR: ERROR:   File
"/tmp/del/oe46/openembedded-core/meta/lib/oe/path.py", line 155, in
check_output
ERROR:     raise CalledProcessError(retcode, cmd, output=output)
ERROR: ERROR: The code that was being executed was:
ERROR:      0006:        bb.build.exec_func(intercept, d)
ERROR:      0007:    sstate_package(shared_state, d)
ERROR:      0008:
ERROR:      0009:
ERROR:  *** 0010:sstate_task_postfunc(d)
ERROR:      0011:
ERROR: [From file: 'sstate_task_postfunc', lineno: 10, function: <module>]
ERROR:      0001:
ERROR:      0002:def sstate_task_postfunc(d):
ERROR:      0003:    shared_state = sstate_state_fromvars(d)
ERROR:  *** 0004:    sstate_install(shared_state, d)
ERROR:      0005:    for intercept in shared_state['interceptfuncs']:
ERROR:      0006:        bb.build.exec_func(intercept, d)
ERROR:      0007:    sstate_package(shared_state, d)
ERROR:      0008:
ERROR: [From file: 'sstate_task_postfunc', lineno: 4, function:
sstate_task_postfunc]
ERROR:      0072:    f.close()
ERROR:      0073:
ERROR:      0074:    # Run the actual file install
ERROR:      0075:    for state in ss['dirs']:
ERROR:  *** 0076:        oe.path.copytree(state[1], state[2])
ERROR:      0077:
ERROR:      0078:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS',
True) or '').split():
ERROR:      0079:        bb.build.exec_func(postinst, d)
ERROR:      0080:
ERROR: [From file: 'sstate.bbclass', lineno: 76, function: sstate_install]
ERROR: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in:
/tmp/del/oe46/build/tmp-eglibc/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gcc-cross-initial/linaro-4.6-r5/temp/log.do_packagedata.1989
ERROR: Task 9
(/tmp/del/oe46/meta-linaro/recipes-devtools/gcc/gcc-cross-initial_linaro-4.6.bb,
do_packagedata) failed with exit code '1'
NOTE: Tasks Summary: Attempted 206 tasks of which 205 didn't need to be
rerun and 1 failed.
No currently running tasks (204 of 211)

Summary: 1 task failed:

/tmp/del/oe46/meta-linaro/recipes-devtools/gcc/gcc-cross-initial_linaro-4.6.bb,
do_packagedata

12:40 hrw@puchatek:build$ cat
tmp-eglibc/work/armv7ahf-vfp-neon-oe-linux-gnueabi/gcc-cross-initial/linaro-4.6-r5/temp/log.task_order
do_fetch (29286): log.do_fetch.29286
do_populate_lic (7366): log.do_populate_lic.7366
do_configure (8396): log.do_configure.8396
do_compile (10582): log.do_compile.10582
do_install (1146): log.do_install.1146
do_packagedata (1706): log.do_packagedata.1706
do_populate_sysroot (1707): log.do_populate_sysroot.1707
do_packagedata (1989): log.do_packagedata.1989

But when I do same build with gcc-linaro-4.7 task order is different:

aarch64-oe-linux/ x86_64-linux/     12:46 hrw@puchatek:build$ cat
tmp-eglibc/work/aarch64-oe-linux/gcc-cross-initial/linaro-4.7-r9/temp/log.task_order
do_cleansstate (3000): log.do_cleansstate.3000
do_fetch (3632): log.do_fetch.3632
do_configure (4335): log.do_configure.4335
do_populate_lic (4336): log.do_populate_lic.4336
do_compile (5923): log.do_compile.5923
do_install (29169): log.do_install.29169
do_populate_sysroot (29707): log.do_populate_sysroot.29707


How to solve the problem?



