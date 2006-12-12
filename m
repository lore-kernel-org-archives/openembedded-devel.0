Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1GuApm-0005v9-AW
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Dec 2006 17:50:26 +0100
Received: by an-out-0708.google.com with SMTP id c5so371153anc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2006 08:48:50 -0800 (PST)
Received: by 10.78.178.5 with SMTP id a5mr4146328huf.1165942129665;
	Tue, 12 Dec 2006 08:48:49 -0800 (PST)
Received: by 10.78.159.2 with HTTP; Tue, 12 Dec 2006 08:48:49 -0800 (PST)
Message-ID: <d46153c40612120848t81f6129l5860a9678553eb0b@mail.gmail.com>
Date: Tue, 12 Dec 2006 10:48:49 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <7b4fff750612120832t2688cd5ft4e3be102faf75d24@mail.gmail.com>
MIME-Version: 1.0
References: <7b4fff750612120832t2688cd5ft4e3be102faf75d24@mail.gmail.com>
Subject: Re: "bitburn nano" fails: ERROR: function do_stage failed
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
X-List-Received-Date: Tue, 12 Dec 2006 16:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 12/12/06, Sam Green <samgreen@gmail.com> wrote:
> I am trying to cross-compile on OE for my iPAQ 3800/Familiar PDA. I have
> carefully followed http://www.openembedded.org/wiki/GettingStarted, but I
> can not get past the "bitbake nano" step. I get:
>
> ###################################################
> sbgree@ubuntu:/openembedded/build$ bitbake nano
> NOTE: Using cache in '/openembedded/build/tmp/cache/h3800'
> NOTE: Handling BitBake files: \ (4092/4092) [100 %]
> NOTE: Parsing finished. 0 cached, 3919 parsed, 173 skipped, 0 masked.
>
> NOTE: build 200612121006: started
>
> OE Build Configuration:
> BB_VERSION     = "1.6.3"
> OE_REVISION    = "d3a4f1285a8d621925836a8a2ea609ea62d1cc9d"
> TARGET_ARCH    = "arm"
> TARGET_OS      = "linux"
> MACHINE        = "h3800"
> DISTRO         = "familiar"
> DISTRO_VERSION = ""
> TARGET_FPU     = "soft"
>
> NOTE: package quilt-native-0.45: started
> NOTE: package quilt-native-0.45-r0: task do_populate_staging: started
> NOTE: SITE files /openembedded/org.openembedded.dev/site/endian-little
> /openembedded/org.openembedded.dev/site/ix86-common
> ERROR: function do_stage failed
> ERROR: log data follows (/openembedded/build/tmp/work/quilt-native-0.45-r0
> /temp/log.do_stage.5991)
> | NOTE: make install
> | make: *** No rule to make target `install'. Stop.
> | FATAL: oe_runmake failed
> NOTE: Task failed: /openembedded/build/tmp/work/quilt-native-0.45-r0
> /temp/log.do_stage.5991
> NOTE: package quilt-native-0.45-r0: task do_populate_staging: failed
> ERROR: TaskFailed event exception, aborting
> NOTE: package quilt-native-0.45: failed
> ERROR: Build of nano failed
> ###################################################

I think I got around this by installing gcc-3.4 on my Ubuntu build system.


