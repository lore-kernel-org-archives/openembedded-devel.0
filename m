Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N88V8-0004gr-MP
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 09:24:29 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3A9911B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 08:33:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 09:22:49 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
MIME-Version: 1.0
Message-Id: <200911110922.49285.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: pkgconfig-sdk breakage
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
X-List-Received-Date: Wed, 11 Nov 2009 08:24:29 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

my current meta-toolchain builds breaks on some python code
executed while building pkg-config-sdk. Any ideas?


here the log message...

NOTE: Legacy staging mode for /data/openembedded/openembedded/recipes/pkgconfig/pkgconfig-sdk_0.23.bb
ERROR: Error in executing: /data/openembedded/openembedded/recipes/pkgconfig/pkgconfig-sdk_0.23.bb
ERROR: Exception:<type 'exceptions.TypeError'> Message:argument of type 'NoneType' is not iterable
ERROR: Printing the environment of the function
ERROR: Build of /data/openembedded/openembedded/recipes/pkgconfig/pkgconfig-sdk_0.23.bb do_populate_staging failed
Traceback (most recent call last):
  File "/data/openembedded/bitbake/bin/bitbake", line 146, in <module>
    main()
  File "/data/openembedded/bitbake/bin/bitbake", line 143, in main
    cooker.cook()
  File "/data/openembedded/bitbake/lib/bb/cooker.py", line 643, in cook
    return self.buildTargets(pkgs_to_build)
  File "/data/openembedded/bitbake/lib/bb/cooker.py", line 547, in buildTargets
    failures = rq.execute_runqueue()
  File "/data/openembedded/bitbake/lib/bb/runqueue.py", line 803, in execute_runqueue
    self.execute_runqueue_internal()
  File "/data/openembedded/bitbake/lib/bb/runqueue.py", line 912, in execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/data/openembedded/bitbake/lib/bb/cooker.py", line 136, in tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
  File "/data/openembedded/bitbake/lib/bb/cooker.py", line 110, in tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/data/openembedded/bitbake/lib/bb/build.py", line 286, in exec_task
    exec_func(task, localdata)
  File "/data/openembedded/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/data/openembedded/bitbake/lib/bb/build.py", line 140, in exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/data/openembedded/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "do_populate_staging", line 39, in <module>
  File "do_populate_staging", line 18, in do_populate_staging
  File "/data/openembedded/bitbake/lib/bb/build.py", line 86, in exec_func
    if not item in flags:
TypeError: argument of type 'NoneType' is not iterable


