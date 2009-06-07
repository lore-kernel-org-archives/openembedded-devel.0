Received: from [220.181.12.13] (helo=m12-13.163.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lida_mail@163.com>) id 1MDEdQ-0007kc-1a
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 11:25:48 +0200
Received: from [192.168.58.100] (unknown [116.227.147.186])
	by smtp9 (Coremail) with SMTP id DcCowLCrBTZohStKgccrBA--.12955S2;
	Sun, 07 Jun 2009 17:16:27 +0800 (CST)
From: "Daniel.Li" <lida_mail@163.com>
To: openembedded-issues <openembedded-devel@lists.openembedded.org>
Organization: PALFocus (http://palfocus.oicp.net)
Date: Sun, 07 Jun 2009 17:16:11 +0800
Message-Id: <1244366174.4412.11.camel@daniel-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-CM-TRANSID: DcCowLCrBTZohStKgccrBA--.12955S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw1xWFykArWUGryDtr4kXrb_yoWrKw1rp3
	WYgF1vqw4akay2qr97WF4F9w15Wr18Gay5Jr4Dtr4DAFnIk3yvqrya934Yqw15Kr9Iva40
	vF1FvrZrZ34UCFJanT9S1TB71UUUUUUv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UU
	U5E7k042IEc7kJM7k042IE42xK82IY6r43WwAYjxAI6xAIw28IcVAK0I8IjxAxM7k042IE
	4IxYO2xFxVAqjxCEw4Av424lb7Iv0xC_Jr1lb4IE77IF4wAFYI0v6xAqj4kS57xkM7AC8V
	AFwI0_Jr0_Gr1l1I0E4x80FVCIwcAKzIAtM7C26IkvcIIF6IxKo4kEV4yl1IIY67AEw4v_
	Jr0_Jr4l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26rxl6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kK67kvxFCE548m6r1fGryUXwAawVAC0I8062xK64kEc2Ij6c8GOVWUur45Jr
	yln4vE4SsYQasFAVCIc41l57IF6s8CjcxG0xyl52xGzVA2a4k0FcxF6xCjrcI26cIUMc02
	F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI
	0_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFVAaXTZC67ZELSn0mTvEwaV2v3VFvVW8Mx02cVAK
	zwCY1Ik26cxK620vw7xCY7Wlc7Ca8VAvwVCjb41lc2xSY4AK67AK6r4fMxkI7II2jI8vz4
	vEwIxGrwCF04k20xvY0x0EwIxGrwCF72vE52k0Y41lx4CE17CEb7AF67AKxVWUJVWUXbIY
	CTnIWIevJa73UjIFyTuYvjxUgGQDUUUUU
X-CM-SenderInfo: 5olgtshpdlzqqrwthudrp/
Subject: e2fsprogs-libs failed on latest org.openembedded.dev branch
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
X-List-Received-Date: Sun, 07 Jun 2009 09:25:49 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi List,

What's wrong with this? How can I fix the problem?

$ bitbake e2fsprogs-libs
/home/daniel/work4/oe_fr/bitbake/lib/bb/COW.py:29: DeprecationWarning:
the sets module is deprecated
  import types, sets
NOTE: Handling BitBake files: / (6859/6859) [100 %]
NOTE: Parsing finished. 6582 cached, 0 parsed, 277 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 338 of 461 (ID:
16, /home/daniel/work4/oe_fr/openembedded/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb, do_package_write_ipk)
ERROR: Error in
executing: /home/daniel/work4/oe_fr/openembedded/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such
file or directory:
'/home/daniel/work4/oe_fr/tmp/work/armv4t-angstrom-linux-gnueabi/util-linux-ng-2.15-r3/install/e2fsprogs-libs-dbg'
ERROR: Printing the environment of the function
ERROR: 	0048:		basedir = os.path.join(os.path.dirname(root))
ERROR: 	0049:		arch = bb.data.getVar('PACKAGE_ARCH', localdata, 1)
ERROR: 	0050:		pkgoutdir = "%s/%s" % (outdir, arch)
ERROR: 	0051:		bb.mkdirhier(pkgoutdir)
ERROR: 	0052:		os.chdir(root)
ERROR: 	0053:		from glob import glob
ERROR: 	0054:		g = glob('*')
ERROR: 	0055:		try:
ERROR: 	0056:			del g[g.index('CONTROL')]
ERROR: Error in
executing: /home/daniel/work4/oe_fr/openembedded/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such
file or directory:
'/home/daniel/work4/oe_fr/tmp/work/armv4t-angstrom-linux-gnueabi/util-linux-ng-2.15-r3/install/e2fsprogs-libs-dbg'
ERROR: Printing the environment of the function
ERROR: Build
of /home/daniel/work4/oe_fr/openembedded/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb do_package_write_ipk failed
Traceback (most recent call last):
  File "/home/daniel/work4/oe_fr/bitbake/bin/bitbake", line 143, in
<module>
    main()
  File "/home/daniel/work4/oe_fr/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/cooker.py", line 644, in
cook
    return self.buildTargets(pkgs_to_build)
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/cooker.py", line 551, in
buildTargets
    failures = rq.execute_runqueue()
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/runqueue.py", line 842,
in execute_runqueue
    self.execute_runqueue_internal()
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/runqueue.py", line 951,
in execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/cooker.py", line 137, in
tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd,
the_data)
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/cooker.py", line 111, in
tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/build.py", line 278, in
exec_task
    exec_func(task, localdata)
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/build.py", line 113, in
exec_func
    exec_func_python(func, d)
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/build.py", line 136, in
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/utils.py", line 171, in
better_exec
    exec code in context
  File "do_package_write_ipk", line 11, in <module>
  File "do_package_write_ipk", line 9, in do_package_write_ipk
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/build.py", line 113, in
exec_func
    exec_func_python(func, d)
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/build.py", line 136, in
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/daniel/work4/oe_fr/bitbake/lib/bb/utils.py", line 171, in
better_exec
    exec code in context
  File "do_package_ipk", line 174, in <module>
  File "do_package_ipk", line 52, in do_package_ipk
OSError: [Errno 2] No such file or directory:
'/home/daniel/work4/oe_fr/tmp/work/armv4t-angstrom-linux-gnueabi/util-linux-ng-2.15-r3/install/e2fsprogs-libs-dbg'
ERROR: Task 16
(/home/daniel/work4/oe_fr/openembedded/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb, do_package_write_ipk) failed
NOTE: Tasks Summary: Attempted 337 tasks of which 337 didn't need to be
rerun and 1 failed.
ERROR:
'/home/daniel/work4/oe_fr/openembedded/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb' failed

-- 
Daniel.Li




