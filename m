Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N9x7w-0006ob-0o for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 09:40:03 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N9x6c-0005KE-7J
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 09:38:38 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 09:38:38 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 09:38:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Nov 2009 09:38:15 +0100
Message-ID: <hdr31n$8b0$1@ger.gmane.org>
References: <20091115163618.GA3317@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <20091115163618.GA3317@jama>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Mon, 16 Nov 2009 08:40:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-11-09 17:36, Martin Jansa wrote:
> As I sent earlier as reply to [PATCH] bitbake.conf: SRCPV always upgradeable
> paths for git recipes.
>
> First few changes are already in martin_jansa/srcpv branch. All changes to svn.bb
> recipes seems safe, so I would like to push them really soon. For git.bb changes
> I need your advise/ack so please reply.
>
> Original e-mail:
>
> 1) svn recipes with +svnr{SRCREV} could be just replaced with
> +svnr{SRCPV} as the output should be the same
>
> 2) svn recipes with -r{SRCREV}, -svn{SRCREV}, -svnr{SRCREV}, +r{SRCREV},
> +svn{SRCREV} unified to +svnr{SRCPV}? I'm not sure if '+' will be sorted
> higher version wise, so do we need to bump PE?
>
> 3) git recipes with -git{SRCREV}, -gitr{SRCREV}, +git{SRCREV} unified to
> +gitr{SRCPV} with PE bump?

If something needs a PE bump, make sure you do it properly and bump PE 
on the non scm fetched entries as well. For the kernel I wouldn't bump 
PE, since too many machines can use different kernel recipes.

And can someone tell me how SRCPV works when you have multiple 
buildmachines across the world, how does one keep SRCPV in sync between 
all those machines?

How does SRCPV work when you have recipes for 1.2+gitrfoo, 1.3+gitrbar, etc?

IOW: will it create more work for me (like the proposed checksums 
changes) instead of making things easier?

regards,

Koen



