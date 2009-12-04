Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NGUzQ-000096-FH for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 11:02:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NGUxt-0004kA-9V
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 11:00:41 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 11:00:41 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 11:00:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 04 Dec 2009 11:00:17 +0100
Message-ID: <hfamji$7nr$1@ger.gmane.org>
References: <20091204090048.GA3233@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <20091204090048.GA3233@jama>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] sane-providers.inc with default providers for all distributions
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
X-List-Received-Date: Fri, 04 Dec 2009 10:02:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-09 10:00, Martin Jansa wrote:
> I would like to create new file conf/distro/include/sane-providers.inc
> where we could store all default providers.

If it's the same for everyone, can't it be put in bitbake.conf? I'm 
growing a bit tired of mandatory sane-* files to include.

regards,

Koen


> Every distro should include this file and probably should drop own
> PREFERRED_PROVIDERS if preferring same provider as sane-providers.inc.
>
> I already prepared something, but not sure if its worth finishing. So I
> need your opinion.
>
> With this file it would be easier to add PROVIDES to new recipe while
> forcing old provider in sane-providers for all other distributions
> (something like what happen with fso-apm in shr).
>
> Maybe it will be nice to have all options in comment above the default
> provider.
>
> I would use weak assignments in this file, but it means that this file
> needs to be included after all distro prefered providers, because distro
> config use weak assignments too (and also other includes like eglibc.inc).
>
> As opkg have patch from cworth now I would add
> PROVIDERS=update-alternatives to opkg and change preferred u-a provider
> to opkg (removing 2 u-a scripts on target).
>
> This process seems a bit error prone to me, so I can prepare patch for
> shr and angstrom where I can test with rebuild that "nothing" changed.
> For other distributions it would be nice to include sane-providers by
> distro maintainers.
>
> Can I go ahead and send patches for this or do you see some dead-end as
> with SRCPV? :).
>
> Regards,
>




