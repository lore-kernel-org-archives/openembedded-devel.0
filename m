Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q6o1G-0002Ch-Jj for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 19:56:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q6nzH-0000JD-MZ for openembedded-devel@lists.openembedded.org;
	Mon, 04 Apr 2011 19:54:51 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 19:54:51 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2011 19:54:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 04 Apr 2011 19:54:40 +0200
Message-ID: <ind0l0$io$1@dough.gmane.org>
References: <1300981024-9111-2-git-send-email-obi@opendreambox.org>	<1300983264-16652-1-git-send-email-obi@opendreambox.org>	<4D99C0EA.5070902@opendreambox.org>	<inciqg$3vi$2@dough.gmane.org>
	<4D99E05E.9020100@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D99E05E.9020100@opendreambox.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCHv2] kernel/module-base: Append PR to MACHINE_KERNEL_PR
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
X-List-Received-Date: Mon, 04 Apr 2011 17:56:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-04-11 17:14, Andreas Oberritter wrote:
> On 04/04/2011 03:58 PM, Koen Kooi wrote:
>> On 04-04-11 15:00, Andreas Oberritter wrote:
>>> Ping. Any votes for or against this patch with either appended or
>>> prepended PR?
>>
>> I don't like this patch *at all*. Recipes can already do
>> MACHINE_KERNEL_PR_append = "something" if they need to.
> 
> The use of MACHINE_KERNEL_PR is optional, so it feels really wrong to
> append something to it in a recipe.
> 
>> Can you should me a specific example on how this would be an improvement?
> 
> With the version below. a distro can start to use MACHINE_KERNEL_PR any
> time without breaking updates.
> 
> The vast majority of modules do not use MACHINE_KERNEL_PR

It seems you don't understand how MACHINE_KERNEL_PR works. The *machine*
sets it. The distro has *no* say in it. Therefore the module recipes
don't need to set it, since it's automatic.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNmgXgMkyGM64RGpERAr9CAJ9urNa16wfGmCwh4/NvUZd4GOUm2wCfcCrV
Q4CvioBpYYMC4bjEHL4cUD0=
=t85H
-----END PGP SIGNATURE-----



