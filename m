Received: from [61.129.64.66] (helo=mail.og-int.com)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <yangtf@envision.com.cn>) id 1IPxXz-0004Fp-QQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2007 11:39:44 +0200
Received: from [218.80.208.102]; Tue, 28 Aug 2007 17:37:45 +0800
From: "Tongfeng.Yang" <yangtf@envision.com.cn>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Aug 2007 17:39:00 +0800
Message-Id: <1188293940.3521.12.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.3 (2.8.3-2.fc6) 
Subject: I got a err : AttributeError: 'FetchData' object has no attribute	'method'
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
X-List-Received-Date: Tue, 28 Aug 2007 09:39:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello EveryOne: 
      when I build Openmoko ,I got the error below .First Time the error
occur when do_fetch ,then i add an empty do_fetch and run again ,but It
has error when do_unpack this time .So I think it's not deal with
downloader .  
     I read the source of bitbake : bb/fetch/__init__.py .the if-branch
which 'FetchData' run is all right ,when bitbake fetch other package .
    so I think the err must be in libgsmd_svn.bb .but there same to have
no error :
11 SRC_URI =
"svn://svn.openmoko.org/trunk/src/target;module=gsm;proto=http \
12            file://gsmd \
13            file://default"\
14            file://fix-mlbuf.patch;patch=1

help me .

Tongfeng.Yang 
 ----------------------------------
The Error : 

ERROR: Build of /work/oe/openembedded/packages/gsm/libgsmd_svn.bb
do_unpack failed
Traceback (most recent call last):
  File "/work/oe/bitbake/bin/bitbake", line 134, in ?
    main()
  File "/work/oe/bitbake/bin/bitbake", line 131, in main
    cooker.cook()
  File "lib/bb/cooker.py", line 565, in cook
  File "lib/bb/cooker.py", line 477, in buildTargets
  File "lib/bb/runqueue.py", line 427, in execute_runqueue
  File "lib/bb/runqueue.py", line 555, in execute_runqueue_internal
  File "lib/bb/cooker.py", line 132, in tryBuild
  File "lib/bb/cooker.py", line 105, in tryBuildPackage
  File "/work/oe/bitbake/lib/bb/build.py", line 292, in exec_task
    execute(None, task)
  File "/work/oe/bitbake/lib/bb/build.py", line 281, in execute
    exec_func(item, localdata)
  File "/work/oe/bitbake/lib/bb/build.py", line 98, in exec_func
    exec_func_python(func, d)
  File "/work/oe/bitbake/lib/bb/build.py", line 117, in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/work/oe/bitbake/lib/bb/utils.py", line 144, in better_exec
    exec code in context
  File "do_unpack", line 4, in ?
  File "do_unpack", line 2, in do_unpack
  File "/work/oe/bitbake/lib/bb/build.py", line 98, in exec_func
    exec_func_python(func, d)
  File "/work/oe/bitbake/lib/bb/build.py", line 117, in exec_func_python
    utils.better_exec(comp,g,tmp, bb.data.getVar('FILE',d,1))
  File "/work/oe/bitbake/lib/bb/utils.py", line 144, in better_exec
    exec code in context
  File "base_do_unpack", line 25, in ?
  File "base_do_unpack", line 13, in base_do_unpack
  File "/work/oe/bitbake/lib/bb/fetch/__init__.py", line 219, in
localpath
    ud = init([url], d)
  File "/work/oe/bitbake/lib/bb/fetch/__init__.py", line 123, in init
    urldata[url].setup_localpath(d) 
  File "/work/oe/bitbake/lib/bb/fetch/__init__.py", line 280, in
setup_localpath
    self.localpath = self.method.localpath(self.url, self, d)
AttributeError: 'FetchData' object has no attribute 'method'

----------------------------------



