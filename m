Return-Path: <thilo.cestonaro@ts.fujitsu.com>
Received: from dgate10.ts.fujitsu.com (dgate10.ts.fujitsu.com [80.70.172.49])
	by mail.openembedded.org (Postfix) with ESMTP id ADBDD61663
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 08:18:25 +0000 (UTC)
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding;
	b=Qw48KlENEC0Dy5PbWYQ1M3w1CHrNdZERXoPUQFBjABrOreGRIuhBMXcR
	GH1ToeyVQorxGjE0wxLztiltAc+g6lGXQ8ffgdPL1qI5Ji2SKENfWt+sq
	maBSLwD5pRfQZjk4QbV0TIqZ1a5+zVQ3/ID+UaLWYmca9oDFpG6cZ0LCE
	ImzvTX155GDHxKFFMSyX1cKkwUelSMYCD98yoHAEJn/RmPqqVWuinCyPw
	gO7YJOgtb1zGfvEWV+n61bLIgMxbv;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=@ts.fujitsu.com; q=dns/txt;
	s=s1536b; t=1372925908; x=1404461908;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=1Ut8ijFiFLHwBPqy9J/RM0eqQWTonb1rholDA2cpyF0=;
	b=XKqSzFj4V4387lXavU9bA7Np2VagTchZrHbYx7CJBXbHIE0sW1y2wxdp
	bceiLKgDfbnZElZjIlsChXeS2MNzV8D8kPd6uTT5uWnuonzxYxvLxYdm2
	Zk00Osupj43pGId+bT+EbyfrMcheN0/XiEoR707QuXNeqIHL16Bic5yDE
	uDDboluzZKU9usw4JVHE3aFTLNVuKTcHMP+neIk61Vo2adkD14UtnBDKQ
	OZaj0ktmeMP+mjm2H6tay3TCmO377;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.87,993,1363129200"; d="scan'208";a="152000490"
Received: from unknown (HELO abgdate50u.abg.fsc.net) ([172.25.138.66])
	by dgate10u.abg.fsc.net with ESMTP; 04 Jul 2013 10:18:25 +0200
X-IronPort-AV: E=Sophos;i="4.87,993,1363129200"; d="scan'208";a="13796222"
Received: from unknown (HELO [192.168.0.34]) ([172.25.162.11])
	by abgdate50u.abg.fsc.net with ESMTP; 04 Jul 2013 10:18:25 +0200
Message-ID: <51D52FD8.8060801@ts.fujitsu.com>
Date: Thu, 04 Jul 2013 10:18:32 +0200
From: Cestonaro Thilo <thilo.cestonaro@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <51D42561.8060907@ts.fujitsu.com>
In-Reply-To: <51D42561.8060907@ts.fujitsu.com>
Subject: Re: bitbake dies with an python exception | AttributeError: 'NoneType' object has no attribute 'rfind'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jul 2013 08:18:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

hey,

found it. The Var "FAKEROOTCMD" wasn't set so bitbake died as executing 
"None" doesn't work.

Added
FAKEROOTCMD="fakeroot"
to my local.conf and it worked.

But anyway, shouldn't this be the default?!

Greetings
Thilo

On 03.07.2013 15:21, Cestonaro Thilo wrote:
> hey,
>
> can someone point me in the right direction what actually goes wrong?
>
> Looks very strange, so no recipe or compile error but rather than a bug
> in bitbake.
>
> Greetings
> Thilo
>
> ------------------------------------------------------------------------------------------------------------------
> bitbake linux-libc-headers
>
>
> Loading cache: 100%
> |########################################################################################################################################################################|
> ETA:  00:00:00
> Loaded 2155 entries from dependency cache.
>
> Build Configuration:
> BB_VERSION        = "1.19.1"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-13.04"
> TARGET_SYS        = "arm-magna-linux-gnueabi"
> MACHINE           = "dm814x-evm"
> DISTRO            = "magna"
> DISTRO_VERSION    = "2012.1"
> TUNE_FEATURES     = "armv7a vfp neon"
> TARGET_FPU        = "vfp-neon"
> meta-angstrom     =
> "angstrom-v2013.06-yocto1.4:0f9be94e05c19b94433431e8354bb1c4884008b4"
> meta-oe
> meta-systemd
> meta-efl
> meta-gpe
> meta-gnome
> meta-xfce
> meta-initramfs
> toolchain-layer
> meta-multimedia
> meta-networking
> meta-webserver
> meta-ruby         = "master:14082ab64805cf9571309f674c036f4856029204"
> meta-browser      = "danny:de6eb680c0efe0df9ed12526380a10d3aab4359a"
> meta-ti           =
> "angstrom-staging-yocto1.4:7d06930ee8c9a9a7138b9b13fc85aef23729292d"
> meta-magna        = "<unknown>:<unknown>"
> meta              = "master:3472c1f7ab409cd91c1d4782d9e00880b84e3ae8"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> No currently running tasks (483 of 491)
> ERROR: An uncaught exception occured in runqueue, please see the failure
> below:
> ERROR: Running idle function
> Traceback (most recent call last):
>     File
> "/home/magna/Projects/magna/setup-scripts/sources/bitbake/lib/bb/runqueue.py",
> line 1354, in RunQueueExecuteTasks.execute():
>                        if not self.rq.fakeworker:
>       >                    self.rq.start_fakeworker(self)
> self.rq.fakeworker.stdin.write("<runtask>" + pickle.dumps((fn, task,
> taskname, False, self.cooker.collection.get_file_appends(fn))) +
> "</runtask>")
>     File
> "/home/magna/Projects/magna/setup-scripts/sources/bitbake/lib/bb/runqueue.py",
> line 874, in
> RunQueue.start_fakeworker(rqexec=<bb.runqueue.RunQueueExecuteTasks
> instance at 0xa2bfef0>):
>                if not self.fakeworker:
>       >            self.fakeworker, self.fakeworkerpipe =
> self._start_worker(True, rqexec)
>
>     File
> "/home/magna/Projects/magna/setup-scripts/sources/bitbake/lib/bb/runqueue.py",
> line 826, in RunQueue._start_worker(fakeroot=True,
> rqexec=<bb.runqueue.RunQueueExecuteTasks instance at 0xa2bfef0>):
>                        env[key] = value
>       >            worker = subprocess.Popen([fakerootcmd,
> "bitbake-worker", "decafbad"], stdout=subprocess.PIPE,
> stdin=subprocess.PIPE, env=env)
>                else:
>     File "/usr/lib/python2.7/subprocess.py", line 711, in
> Popen.__init__(args=[None, 'bitbake-worker', 'decafbad'], bufsize=0,
> executable=None, stdin=-1, stdout=-1, stderr=None, preexec_fn=None,
> close_fds=False, shell=False, cwd=None, env={'GIT_PROXY_COMMAND':
> '/home/magna/bin/gitProxyCommand.sh', 'TERM': 'screen', 'SHELL':
> '/bin/bash', 'PSEUDO_BUILD': '2', 'http_proxy':
> 'http://172.25.159.7:81/', 'ftp_proxy': 'http://172.25.159.7:81/',
> 'BBPATH':
> '/home/magna/Projects/magna/setup-scripts:/home/magna/Projects/magna/setup-scripts/sources/openembedded-core/meta',
> 'https_proxy': 'http://172.25.159.7:81/', 'PWD':
> '/home/magna/Projects/magna/setup-scripts', 'LOGNAME': 'magna', 'USER':
> 'magna', 'PATH':
> '/home/magna/Projects/magna/setup-scripts/sources/openembedded-core/scripts:/home/magna/Projects/magna/setup-scripts/sources/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/cestonarot/bin/ti/ccsv5/eclipse/jre/bin:/opt/toolchain/bin:/home/cestonarot/Projects/depot_tools',
> 'HOME': '/home/magna', 'DISTRO': 'angstrom-v2012.12', 'PSEUDO_DISABLED':
> '1', 'BB_ENV_EXTRAWHITE': 'PSEUDO_BUILD PSEUDO_DISABLED MACHINE DISTRO
> TCLIBC TCMODE GIT_PROXY_COMMAND http_proxy ftp_proxy https_proxy
> all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK
> BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS'},
> universal_newlines=False, startupinfo=None, creationflags=0):
>                                        c2pread, c2pwrite,
>       >                                errread, errwrite)
>                except Exception:
>     File "/usr/lib/python2.7/subprocess.py", line 1309, in
> Popen._execute_child(args=[None, 'bitbake-worker', 'decafbad'],
> executable=None, preexec_fn=None, close_fds=False, cwd=None,
> env={'GIT_PROXY_COMMAND': '/home/magna/bin/gitProxyCommand.sh', 'TERM':
> 'screen', 'SHELL': '/bin/bash', 'PSEUDO_BUILD': '2', 'http_proxy':
> 'http://172.25.159.7:81/', 'ftp_proxy': 'http://172.25.159.7:81/',
> 'BBPATH':
> '/home/magna/Projects/magna/setup-scripts:/home/magna/Projects/magna/setup-scripts/sources/openembedded-core/meta',
> 'https_proxy': 'http://172.25.159.7:81/', 'PWD':
> '/home/magna/Projects/magna/setup-scripts', 'LOGNAME': 'magna', 'USER':
> 'magna', 'PATH':
> '/home/magna/Projects/magna/setup-scripts/sources/openembedded-core/scripts:/home/magna/Projects/magna/setup-scripts/sources/bitbake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/cestonarot/bin/ti/ccsv5/eclipse/jre/bin:/opt/toolchain/bin:/home/cestonarot/Projects/depot_tools',
> 'HOME': '/home/magna', 'DISTRO': 'angstrom-v2012.12', 'PSEUDO_DISABLED':
> '1', 'BB_ENV_EXTRAWHITE': 'PSEUDO_BUILD PSEUDO_DISABLED MACHINE DISTRO
> TCLIBC TCMODE GIT_PROXY_COMMAND http_proxy ftp_proxy https_proxy
> all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK
> BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS'},
> universal_newlines=False, startupinfo=None, creationflags=0,
> shell=False, p2cread=11, p2cwrite=14, c2pread=15, c2pwrite=16,
> errread=None, errwrite=None):
>                   print child_exception
>       >                raise child_exception
>
> AttributeError: 'NoneType' object has no attribute 'rfind'
>
> NOTE: Tasks Summary: Attempted 482 tasks of which 469 didn't need to be
> rerun and all succeeded.
> No currently running tasks (483 of 491)
>
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> ------------------------------------------------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


