Received: from [17.148.16.86] (helo=asmtpout011.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MDk9l-0001fW-DB
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 21:05:17 +0200
MIME-version: 1.0
Received: from [87.201.169.95] by asmtp011.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKX00GLGOKSH250@asmtp011.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	08 Jun 2009 11:55:45 -0700 (PDT)
Message-id: <E55E97D8-DE3D-4AA9-8979-4C9168EF035C@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1244402413.4151.36.camel@lenovo.internal.reciva.com>
Date: Mon, 08 Jun 2009 22:55:34 +0400
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
	<1244402010.4463.36.camel@utx.utx.cz>
	<1244402413.4151.36.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: e2fsprogs-libs failed	on	latest	org.openembedded.dev	branch
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
X-List-Received-Date: Mon, 08 Jun 2009 19:05:17 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	I too am getting the same error. I am using the latest  
org.openembedded.dev , sync just a few minutes ago.

What can I do to resolve this error?

Best regards,

Elvis

ERROR: Error in executing: /tool/overo-oe/org.openembedded.dev/recipes/ 
e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such  
file or directory: '/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/util-linux-ng-2.15-r3/install/e2fsprogs-libs-dbg'
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
ERROR: Error in executing: /tool/overo-oe/org.openembedded.dev/recipes/ 
e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such  
file or directory: '/tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/util-linux-ng-2.15-r3/install/e2fsprogs-libs-dbg'
ERROR: Printing the environment of the function
ERROR: Build of /tool/overo-oe/org.openembedded.dev/recipes/e2fsprogs- 
libs/e2fsprogs-libs_1.41.5.bb do_package_write_ipk failed
Traceback (most recent call last):
   File "/tool/overo-oe/bitbake/bin/bitbake", line 143, in <module>
     main()
   File "/tool/overo-oe/bitbake/bin/bitbake", line 140, in main
     cooker.cook()
   File "/tool/overo-oe/bitbake/lib/bb/cooker.py", line 643, in cook
     return self.buildTargets(pkgs_to_build)
   File "/tool/overo-oe/bitbake/lib/bb/cooker.py", line 550, in  
buildTargets
     failures = rq.execute_runqueue()
   File "/tool/overo-oe/bitbake/lib/bb/runqueue.py", line 841, in  
execute_runqueue
     self.execute_runqueue_internal()
   File "/tool/overo-oe/bitbake/lib/bb/runqueue.py", line 950, in  
execute_runqueue_internal
     self.cooker.tryBuild(fn)
   File "/tool/overo-oe/bitbake/lib/bb/cooker.py", line 136, in tryBuild
     return self.tryBuildPackage(fn, item, self.configuration.cmd,  
the_data)
   File "/tool/overo-oe/bitbake/lib/bb/cooker.py", line 110, in  
tryBuildPackage
     bb.build.exec_task('do_%s' % task, the_data)
   File "/tool/overo-oe/bitbake/lib/bb/build.py", line 278, in exec_task
     exec_func(task, localdata)
   File "/tool/overo-oe/bitbake/lib/bb/build.py", line 113, in exec_func
     exec_func_python(func, d)
   File "/tool/overo-oe/bitbake/lib/bb/build.py", line 136, in  
exec_func_python
     utils.better_exec(comp, g, tmp, bbfile)
   File "/tool/overo-oe/bitbake/lib/bb/utils.py", line 171, in  
better_exec
     exec code in context
   File "do_package_write_ipk", line 11, in <module>
   File "do_package_write_ipk", line 9, in do_package_write_ipk
   File "/tool/overo-oe/bitbake/lib/bb/build.py", line 113, in exec_func
     exec_func_python(func, d)
   File "/tool/overo-oe/bitbake/lib/bb/build.py", line 136, in  
exec_func_python
     utils.better_exec(comp, g, tmp, bbfile)
   File "/tool/overo-oe/bitbake/lib/bb/utils.py", line 171, in  
better_exec
     exec code in context
   File "do_package_ipk", line 174, in <module>
   File "do_package_ipk", line 52, in do_package_ipk
OSError: [Errno 2] No such file or directory: '/tool/overo-oe/tmp/work/ 
armv7a-angstrom-linux-gnueabi/util-linux-ng-2.15-r3/install/e2fsprogs- 
libs-dbg'



