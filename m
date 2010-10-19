Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P8Hp5-00014Z-Vp
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 21:26:13 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAJ00JPRXXMY113@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	19 Oct 2010 14:25:04 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6AA7714AF64; Tue,
	19 Oct 2010 15:24:58 -0400 (EDT)
Date: Tue, 19 Oct 2010 15:24:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101019192458.GB6202@denix.org>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
	<AANLkTimWmTWAkCPAabOagq2S5gtfMztov8xiBcK7q_Vh@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F0803110B3140@dlee06.ent.ti.com>
MIME-version: 1.0
In-reply-to: <131E5DFBE7373E4C8D813795A6AA7F0803110B3140@dlee06.ent.ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to	OVERRIDES when it's empty
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
X-List-Received-Date: Tue, 19 Oct 2010 19:26:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 19, 2010 at 02:18:25PM -0500, Maupin, Chase wrote:
> > > I saw this issue in my overlay of having a "::" in my OVERRIDES which
> > > caused my parsing to fail in angstrom.inc.  Applying this fix from
> > Martin
> > > resolves the parsing issue.  My OVERRIDES appear to be in the correct
> > order
> > > with this change:
> > 
> > Can you explain this?  "caused my parsing to fail" is not very useful
> > information.  What exactly failed?
> 
> Chris,
> 
> Sorry, I thought this was an understood issue.  I have put the error output 
> I got below.  Basically, when I got to line 509 of data.py the variables had 
> the following values:
> 
> vars = set(['__functions_', '_', '__functions__'])
> 
> var = '__functions__'
> 
> overrides = ['pn-angstrom', 'fail-fast', 'build-linux', 'arm', 'INVALID', 'angstrom-2008.1', '', 'am37x-evm', 'local']
>  
> o = ''
> 
> OVERRIDES = 'pn-angstrom:fail-fast:build-linux:arm:INVALID:angstrom-2008.1::am37x-evm:local'
> 
> The current override being evaluated was the '' one.
> 
> The line being evaluated in my overlay was USERDISTRO := "${DISTRO}" in my 
> copy of angstrom.inc

Chris,

FYI, the below "RuntimeError: Set changed size during iteration" exception 
happens in bitbake 1.8.18 but not the 1.10/mainline.

-- 
Denys

> The output from my build was:
> 
> a0271661@sdit-build01:~/projects/arago-multi-build$ bitbake helloworldTraceback (most recent call last):
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/bin/bitbake", line 143, in <module>
>     main()
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/bin/bitbake", line 123, in main
>     cooker.parseConfiguration()
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/cooker.py", line 68, in parseConfiguration
>     self.parseConfigurationFile( os.path.join( "conf", "bitbake.conf" ) )
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/cooker.py", line 390, in parseConfigurationFile
>     self.configuration.data = bb.parse.handle( afile, self.configuration.data )
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/__init__.py", line 75, in handle
>     return h['handle'](fn, data, include)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 167, in handle
>     feeder(lineno, s, fn, data)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 215, in feeder
>     include(fn, s, data, False)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 114, in include
>     ret = handle(fn, data, True)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/__init__.py", line 75, in handle
>     return h['handle'](fn, data, include)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 167, in handle
>     feeder(lineno, s, fn, data)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 221, in feeder
>     include(fn, s, data, "include required")
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 114, in include
>     ret = handle(fn, data, True)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/__init__.py", line 75, in handle
>     return h['handle'](fn, data, include)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/parse_py/BBHandler.py", line 175, in handle
>     feeder(lineno, s, fn, base_name, d)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/parse_py/BBHandler.py", line 381, in feeder
>     return ConfHandler.feeder(lineno, s, fn, d)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 192, in feeder
>     bb.data.update_data(e)
>   File "/home/a0271661/projects/arago-multi-build/arago-bitbake/lib/bb/data.py", line 509, in update_data
>     for var in vars:
> RuntimeError: Set changed size during iteration


