Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lr0S7-0004a4-Ad
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 03:50:17 +0200
Received: by qw-out-1920.google.com with SMTP id 5so1775341qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Apr 2009 18:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:user-agent:x-url:x-attribution:date:message-id
	:mime-version:content-type;
	bh=M6FImHz2Lr2zJfsjc+n3S/QVAr9Bfn8PNDwYTnHL6+k=;
	b=nfmyuRlJEoQa/KrHUiuFwhFhE7B+Lt8RY7+kuE8wbENRDcQktDEej3qbQfszMEGc3h
	3ohE4FH1PO8EZRjdQHTeDPvE4tYJjlL67LR32bkXT0Oj5+9M1PI/gaNTCO2beq+2jWvn
	wwQ6ek5pO6v8Mvzi2hbUCskBWAUcC8QsDDlIs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:user-agent:x-url:x-attribution
	:date:message-id:mime-version:content-type;
	b=xSAScVKxWDFizBSZeCIg5W70v+fZ46QlQt2uvP+bW5cxAEAdarryy/ZW/gt02cj97w
	wQiogjV5pFenjP3LLGBKz+z2qA1t4FNhXvAFnLIifeuyCI373NiJwdbr4Kjq7XOTIT+k
	jXwlaCkdAiVAwmEVEMgV/vCeoquNe3RP6eMCA=
Received: by 10.220.44.204 with SMTP id b12mr4874306vcf.42.1239068841327;
	Mon, 06 Apr 2009 18:47:21 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 4sm1202503yxd.36.2009.04.06.18.47.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 06 Apr 2009 18:47:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 50C1D6101F5; Mon,  6 Apr 2009 22:47:38 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Development Mailing List
	<openembedded-devel@lists.openembedded.org>
Organization: O.S. Systems Ltda.
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 06 Apr 2009 22:47:37 -0300
Message-ID: <87bpr92q12.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.92.149
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFH] Strange bug during full build
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
X-List-Received-Date: Tue, 07 Apr 2009 01:50:17 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

Since our last update, we updated to stable/2009 branch, we started to
have few strange breakage from time to time on our tree. Bellow is an
example of one of them.

Do someone have any idea of what it can be? The strange thing is that if
we clean and rebuild the package it works.

NOTE: package lxde-common-0.3.2.1-r0: task do_package_write_ipk: started
ERROR: Error in executing: /home/otavio/hacking/ossystems/oe/recipes/lxde/lxde-common_0.3.2.1.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such file or directory: '/home/otavio/hacking/ossystems/oe/tmp/work/geode-ossystems-linux/openbox-3.4.7.2-r0/install/lxde-common-dbg'
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
ERROR: Error in executing: /home/otavio/hacking/ossystems/oe/recipes/lxde/lxde-common_0.3.2.1.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such file or directory: '/home/otavio/hacking/ossystems/oe/tmp/work/geode-ossystems-linux/openbox-3.4.7.2-r0/install/lxde-common-dbg'
ERROR: Printing the environment of the function
ERROR: Build of /home/otavio/hacking/ossystems/oe/recipes/lxde/lxde-common_0.3.2.1.bb do_package_write_ipk failed
Traceback (most recent call last):
  File "/home/otavio/hacking/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/home/otavio/hacking/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/home/otavio/hacking/bitbake/lib/bb/cooker.py", line 644, in cook
    return self.buildTargets(pkgs_to_build)
  File "/home/otavio/hacking/bitbake/lib/bb/cooker.py", line 551, in buildTargets
    failures = rq.execute_runqueue()
  File "../../bitbake/lib/bb/runqueue.py", line 842, in execute_runqueue
  File "../../bitbake/lib/bb/runqueue.py", line 951, in execute_runqueue_internal
  File "/home/otavio/hacking/bitbake/lib/bb/cooker.py", line 137, in tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
  File "/home/otavio/hacking/bitbake/lib/bb/cooker.py", line 111, in tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "../../bitbake/lib/bb/build.py", line 278, in exec_task
  File "../../bitbake/lib/bb/build.py", line 113, in exec_func
  File "../../bitbake/lib/bb/build.py", line 136, in exec_func_python
  File "../../bitbake/lib/bb/utils.py", line 171, in better_exec
  File "do_package_write_ipk", line 11, in <module>
  File "do_package_write_ipk", line 9, in do_package_write_ipk
  File "../../bitbake/lib/bb/build.py", line 113, in exec_func
  File "../../bitbake/lib/bb/build.py", line 136, in exec_func_python
  File "../../bitbake/lib/bb/utils.py", line 171, in better_exec
  File "do_package_ipk", line 174, in <module>
  File "do_package_ipk", line 52, in do_package_ipk
OSError: [Errno 2] No such file or directory: '/home/otavio/hacking/ossystems/oe/tmp/work/geode-ossystems-linux/openbox-3.4.7.2-r0/install/lxde-common-dbg'
ERROR: Task 16 (/home/otavio/hacking/ossystems/oe/recipes/lxde/lxde-common_0.3.2.1.bb, do_package_write_ipk) failed
NOTE: Tasks Summary: Attempted 456 tasks of which 456 didn't need to be rerun and 1 failed.
ERROR: '/home/otavio/hacking/ossystems/oe/recipes/lxde/lxde-common_0.3.2.1.bb' failed
NOTE: build 200904062241: completed

Cheers,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


