Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HJYCj-0006H9-P0
	for openembedded-devel@openembedded.org; Tue, 20 Feb 2007 17:51:04 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HJYCj-0006AS-0p
	for openembedded-devel@openembedded.org; Tue, 20 Feb 2007 17:51:01 +0100
Received: from cm74.kappa84.maxonline.com.sg ([58.182.84.74])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 20 Feb 2007 17:51:01 +0100
Received: from robk by cm74.kappa84.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 20 Feb 2007 17:51:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Wed, 21 Feb 2007 00:50:49 +0800
Message-ID: <erf8tc$c5d$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: cm74.kappa84.maxonline.com.sg
User-Agent: KNode/0.10.4
Sender: news <news@sea.gmane.org>
Subject: Image problem.
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
X-List-Received-Date: Tue, 20 Feb 2007 16:51:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Hia,

I'm converting my image to the new-style metadata (*_FEATURES, etc), and I'm
having trouble figuring out where the error below originates. It can't find
a -dbg install directory, or something. I have the feeling I've forgotten
to convert something, or neglected to add a new variable. 

Can anyone tell me where to start looking? Clearing the cache and rebuilding
doesn't help. Using Bitbake 1.6 svn head.

Cheers!

    Rob


[wrobbie] ~/oe/dev/build-epia> bitbake display-image
NOTE: Using cache in '/bulk/home/rob/oe/dev/build-epia/tmp/cache/rob-epia'
NOTE: Handling BitBake files: | (4243/4243) [100 %]
NOTE: Parsing finished. 3316 cached, 0 parsed, 196 skipped, 731 masked.

NOTE: build 200702210039: started

OE Build Configuration:
BB_VERSION     = "1.6.7"
OE_REVISION    = "<unknown>"
TARGET_ARCH    = "i586"
TARGET_OS      = "linux"
MACHINE        = "rob-epia"
DISTRO         = "rob-epia"
DISTRO_VERSION = "v1.0b-20070220"
TARGET_FPU     = ""

NOTE: package display-image-1.0: started
NOTE: package display-image-1.0-r0: task do_package_write: started
ERROR: Error in
executing: /home/rob/oe/dev/rob-packages/display-image/display-image.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such file
or
directory: '/bulk/home/rob/oe/dev/build-epia/tmp/work/display-image-1.0-r0/install/display-image-dbg'
ERROR: Printing the environment of the function
ERROR:  0055:           bb.data.update_data(localdata)
ERROR:  0056:           basedir = os.path.join(os.path.dirname(root))
ERROR:  0057:           pkgoutdir = outdir
ERROR:  0058:           bb.mkdirhier(pkgoutdir)
ERROR:  0059:           os.chdir(root)
ERROR:  0060:           from glob import glob
ERROR:  0061:           g = glob('*')
ERROR:  0062:           try:
ERROR:  0063:                   del g[g.index('CONTROL')]
ERROR: Error in
executing: /home/rob/oe/dev/rob-packages/display-image/display-image.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such file
or
directory: '/bulk/home/rob/oe/dev/build-epia/tmp/work/display-image-1.0-r0/install/display-image-dbg'
ERROR: Printing the environment of the function
ERROR: Error in
executing: /home/rob/oe/dev/rob-packages/display-image/display-image.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such file
or
directory: '/bulk/home/rob/oe/dev/build-epia/tmp/work/display-image-1.0-r0/install/display-image-dbg'
ERROR: Printing the environment of the function
ERROR: Error in
executing: /home/rob/oe/dev/rob-packages/display-image/display-image.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such file
or
directory: '/bulk/home/rob/oe/dev/build-epia/tmp/work/display-image-1.0-r0/install/display-image-dbg'
ERROR: Printing the environment of the function
Traceback (most recent call last):
  File "/home/rob/oe/bitbake/bin/bitbake", line 1163, in <module>
    main()
  File "/home/rob/oe/bitbake/bin/bitbake", line 1158, in main
    cooker.cook( BBConfiguration( options ), args[1:] )
  File "/home/rob/oe/bitbake/bin/bitbake", line 974, in cook
    if self.buildProvider( k , False ) == 0:
  File "/home/rob/oe/bitbake/bin/bitbake", line 609, in buildProvider
    if self.tryBuild(fn, item, buildAllDeps, build_depends + [fn]):
  File "/home/rob/oe/bitbake/bin/bitbake", line 329, in tryBuild
    return self.tryBuildPackage( fn, item, the_data )
  File "/home/rob/oe/bitbake/bin/bitbake", line 235, in tryBuildPackage
    bb.build.exec_task('do_%s' % self.configuration.cmd, the_data)
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 288, in exec_task
    task_graph.walkdown(task, execute)
  File "/home/rob/oe/bitbake/lib/bb/__init__.py", line 1191, in walkdown
    ret = self.walkdown(p, callback, debug, usecache)
  File "/home/rob/oe/bitbake/lib/bb/__init__.py", line 1191, in walkdown
    ret = self.walkdown(p, callback, debug, usecache)
  File "/home/rob/oe/bitbake/lib/bb/__init__.py", line 1196, in walkdown
    return callback(self, item)
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 267, in execute
    exec_task(item, d)
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 288, in exec_task
    task_graph.walkdown(task, execute)
  File "/home/rob/oe/bitbake/lib/bb/__init__.py", line 1196, in walkdown
    return callback(self, item)
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 277, in execute
    exec_func(item, localdata)
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 98, in exec_func
    exec_func_python(func, d)
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 117, in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/home/rob/oe/bitbake/lib/bb/utils.py", line 142, in better_exec
    exec code in context
  File "do_package_write", line 4, in <module>
  File "do_package_write", line 2, in do_package_write
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 98, in exec_func
    exec_func_python(func, d)
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 117, in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/home/rob/oe/bitbake/lib/bb/utils.py", line 142, in better_exec
    exec code in context
  File "package_ipk_do_package_write", line 4, in <module>
  File "package_ipk_do_package_write", line 2, in
package_ipk_do_package_write
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 98, in exec_func
    exec_func_python(func, d)
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 117, in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/home/rob/oe/bitbake/lib/bb/utils.py", line 142, in better_exec
    exec code in context
  File "package_do_package_write", line 5, in <module>
  File "package_do_package_write", line 3, in package_do_package_write
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 98, in exec_func
    exec_func_python(func, d)
  File "/home/rob/oe/bitbake/lib/bb/build.py", line 117, in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/home/rob/oe/bitbake/lib/bb/utils.py", line 142, in better_exec
    exec code in context
  File "do_package_ipk", line 177, in <module>
  File "do_package_ipk", line 59, in do_package_ipk
OSError: [Errno 2] No such file or
directory: '/bulk/home/rob/oe/dev/build-epia/tmp/work/display-image-1.0-r0/install/display-image-dbg'




