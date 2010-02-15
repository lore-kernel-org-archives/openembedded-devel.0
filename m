Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1Nh2r6-0002m0-JP
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 16:27:27 +0100
Received: (qmail 23730 invoked by uid 1003); 15 Feb 2010 15:24:45 -0000
Received: from localhost (HELO ?192.168.1.25?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 15 Feb 2010 15:24:45 -0000
Message-ID: <4B79673B.50108@balister.org>
Date: Mon, 15 Feb 2010 07:24:43 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.7) Gecko/20100120 Fedora/3.0.1-1.fc11 Thunderbird/3.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100214135613.GF5364@jama>
In-Reply-To: <20100214135613.GF5364@jama>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Mon, 15 Feb 2010 15:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/14/2010 05:56 AM, Martin Jansa wrote:
> Hi,
>
> I'm just thinking about using bitbake only in minimalistic chroot.
>
> What are advantages/disadvantages?
>
> How I see it:
>
> Advantages:
> 1) more secure (I started to use separate user for bitbake, when I
>     started to play with bitbake master instead release - because that
>     warning it said), but chroot is even better.
> 2) less problems when autotools pick some header or lib from buildhost
>     instead of staging
> 3) easier to check, that -native package is missing for some important
>     lib
>
> Disadvantages:
> 1) Few more MB for building environment (extra libc, gcc, binutils, git,
>     svn, sh, etc. installed in chroot
> 2) More administrative to keep chroot system updated
> 3) harder to check, that autotools won't pick something from buildhost
>     in normal environment before pushing new version/recipe (ie I won't
>     have SDL libs installed in chroot, but everybody else will and maybe
>     build will fail for them after I push some recipe.

I see this as a good thing :)

Philip


>
> If nobody points some big disadvantage I didn't think about, I'll give
> it a try (with precompilled gentoo stage tarball it's task for half an
> hour using cp :)).
>
> Using some sofisticated sandbox setting (as gentoo ebuilds do) would be
> also good alternative, is someone trying that?
>
> Regards,
>


