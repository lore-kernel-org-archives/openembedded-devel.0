Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GHr3E-0002sa-5u
	for openembedded-devel@openembedded.org; Tue, 29 Aug 2006 02:01:57 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 7B382AD8DB
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 09:59:54 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15532-09 for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 09:59:52 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 08FABAD5D9
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Aug 2006 09:59:52 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id EE047EFEFE2; Tue, 29 Aug 2006 09:59:51 +1000 (EST)
Date: Tue, 29 Aug 2006 09:59:51 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@openembedded.org
Message-ID: <20060828235951.GA16344@twibble.org>
Mime-Version: 1.0
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: patcher changes - quilt patching breakage?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2006 00:01:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've got huge amounts of breakage from quilt due to the patching
related changs. Is anyone else seeing this. It looks like I can't
apply any patches more than one.. which is rather wierd.

Example:

[nynaeve][ 9:41AM]/data/oe/build/titan-glibc-24%> ./bb -b packages/iputils/iputils_20020927.bb
NOTE: package iputils-20020927: started
NOTE: package iputils-20020927-r4: task do_fetch: started
NOTE: package iputils-20020927-r4: task do_fetch: completed
Updating /data/oe/build/titan-glibc-24/tmp/stamps/iputils-20020927-r4.do_fetch
NOTE: package iputils-20020927-r4: task do_unpack: started
NOTE: Unpacking /data/oe/sources/iputils-ss020927.tar.gz to /data/oe/build/titan-glibc-24/tmp/work/iputils-20020927-r4/
NOTE: package iputils-20020927-r4: task do_unpack: completed
Updating /data/oe/build/titan-glibc-24/tmp/stamps/iputils-20020927-r4.do_unpack
NOTE: package iputils-20020927-r4: task do_patch: started
NOTE: Applying patch 'debian-fixes.patch'
ERROR: Error in executing: /data/oe/build/titan-glibc-24/packages/iputils/iputils_20020927.bb
ERROR: Exception:exceptions.IOError Message:[Errno 2] No such file or directory: '/data/oe/build/titan-glibc-24/tmp/work/iputils-20020927-r4/iputils/patches/debian-fixes.patch'
ERROR: Printing the environment of the function
ERROR:  0003:   import bb.fetch
ERROR:  0004:
ERROR:  0005:   patch_init(d)
ERROR:  0006:
ERROR:  0007:   src_uri = (bb.data.getVar('SRC_URI', d, 1) or '').split()
ERROR:  0008:   if not src_uri:
ERROR:  0009:           return
ERROR:  0010:
ERROR:  0011:   patchsetmap = {
ERROR: Error in executing: /data/oe/build/titan-glibc-24/packages/iputils/iputils_20020927.bb
ERROR: Exception:exceptions.IOError Message:[Errno 2] No such file or directory: '/data/oe/build/titan-glibc-24/tmp/work/iputils-20020927-r4/iputils/patches/debian-fixes.patch'
ERROR: Printing the environment of the function
ERROR:  0003:
ERROR: Error in executing: /data/oe/build/titan-glibc-24/packages/iputils/iputils_20020927.bb
ERROR: Exception:exceptions.IOError Message:[Errno 2] No such file or directory: '/data/oe/build/titan-glibc-24/tmp/work/iputils-20020927-r4/iputils/patches/debian-fixes.patch'
ERROR: Printing the environment of the function
ERROR:  0003:
Traceback (most recent call last):
  File "/data/oe/src/bitbake/latest/bin/bitbake", line 1161, in ?
    main()
  File "/data/oe/src/bitbake/latest/bin/bitbake", line 1156, in main
    cooker.cook( BBConfiguration( options ), args[1:] )
  File "/data/oe/src/bitbake/latest/bin/bitbake", line 899, in cook
    self.tryBuildPackage( bf, item, bbfile_data )
  File "/data/oe/src/bitbake/latest/bin/bitbake", line 233, in tryBuildPackage
    bb.build.exec_task('do_%s' % self.configuration.cmd, the_data)
  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 285, in exec_task
    task_graph.walkdown(task, execute)
  File "/usr/lib64/python2.4/site-packages/PIL/__init__.py", line 1193, in walkdown

  File "/usr/lib64/python2.4/site-packages/PIL/__init__.py", line 1193, in walkdown

  File "/usr/lib64/python2.4/site-packages/PIL/__init__.py", line 1193, in walkdown

  File "/usr/lib64/python2.4/site-packages/PIL/__init__.py", line 1193, in walkdown

  File "/usr/lib64/python2.4/site-packages/PIL/__init__.py", line 1193, in walkdown

  File "/usr/lib64/python2.4/site-packages/PIL/__init__.py", line 1193, in walkdown

  File "/usr/lib64/python2.4/site-packages/PIL/__init__.py", line 1198, in walkdown

  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 264, in execute
    exec_task(item, d)
  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 285, in exec_task
    task_graph.walkdown(task, execute)
  File "/usr/lib64/python2.4/site-packages/PIL/__init__.py", line 1198, in walkdown

  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 274, in execute
    exec_func(item, localdata)
  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 98, in exec_func
    exec_func_python(func, d)
  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 117, in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "./lib/bb/utils.py", line 142, in better_exec
  File "do_patch", line 4, in ?
  File "do_patch", line 2, in do_patch
  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 98, in exec_func
    exec_func_python(func, d)
  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 117, in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "./lib/bb/utils.py", line 142, in better_exec
  File "base_do_patch", line 4, in ?
  File "base_do_patch", line 2, in base_do_patch
  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 98, in exec_func
    exec_func_python(func, d)
  File "/data/oe/src/bitbake/bitbake-1.6.0/lib/bb/build.py", line 117, in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "./lib/bb/utils.py", line 142, in better_exec
  File "patch_do_patch", line 97, in ?
  File "patch_do_patch", line 91, in patch_do_patch
  File "<bb>", line 230, in Import
  File "<bb>", line 7, in md5sum
IOError: [Errno 2] No such file or directory: '/data/oe/build/titan-glibc-24/tmp/work/iputils-20020927-r4/iputils/patches/debian-fixes.patch'
[nynaeve][ 9:41AM]/data/oe/build/titan-glibc-24%>

-- 
 Jamie Lenehan <lenehan@twibble.org>


