Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pq9MX-0003jB-Cv
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 20:18:01 +0100
Received: by qyk8 with SMTP id 8so4631842qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 11:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=r5qbr1F+lj4UmHt/WtUwRZNwWbwGl3kQdnCsq3MWXGo=;
	b=ryLqIx6neit3DcTV3eVkefkyQYQNuudVjg9z7o5Y/waLn31ZYXOnm+wqEG97IUKUCw
	eAX8QZvu5M/7O0D/TnMxgYHs/xsNsq4WPnl2sLMR9hAZHdnCjXJ8xS7JUuXW2wfI0KGi
	8oBrg7MF2xiooRpP640zJ5Xc66rdTV2dBNvK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ActeIW3EaXc2ovKHMrt+hIcjjGAUbvIFS7Clx76FhAuSoPM7XYfY0ACGijQpXnxFYw
	WbgYX6PHUu7bLFaHNGOoW8YjrPEs/Ma+LkWalBHTPGMzNwI396rLcwvhBPjOHLhZL8GS
	2tnIQIHEQ5a7PyaqfRkXNfP1M9ZC+0CRJ2Y3c=
MIME-Version: 1.0
Received: by 10.229.6.207 with SMTP id a15mr2664919qca.298.1297970207715; Thu,
	17 Feb 2011 11:16:47 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Thu, 17 Feb 2011 11:16:47 -0800 (PST)
In-Reply-To: <AANLkTikjzq=jS=+RTpZ=uxeA_5++CfZT3RetB9et29nS@mail.gmail.com>
References: <AANLkTikjzq=jS=+RTpZ=uxeA_5++CfZT3RetB9et29nS@mail.gmail.com>
Date: Thu, 17 Feb 2011 20:16:47 +0100
Message-ID: <AANLkTi=s8iUBkh+ZRDGPdafL4H6oQeSgTUf62DY1Xzu7@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Broken kernel module dependencies
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
X-List-Received-Date: Thu, 17 Feb 2011 19:18:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

BTW, I am using linux-jlime-jornada7xx_2.6.34+git.bb to build the kernel.

On 2/17/11, Filip Zyzniewski <filip.zyzniewski@gmail.com> wrote:
> Hi,
>
> lately I have noticed that the bootstrap image I build contains the
> orinoco-cs.ko kernel module, but doesn't contain orinoco.ko (which is
> depended on by orinoco-cs.ko).
>
> The problem is that package has only these dependencies:
> update-modules, kernel-2.6.34
>
> AFAIK dependencies between modules are retrieved by parse_depmod()
> from kernel.bbclass.
>
> Here it returns things like:
>
> { 'kernel/drivers/net/wireless/orinoco/orinoco_cs.ko':
>   ['kernel/drivers/net/wireless/orinoco/orinoco.ko',
>     'kernel/net/wireless/cfg80211.ko'],
> }
>
> It is later used by get_dependencies() in the same file.
> This function does something like this:
>
> file = file.replace(bb.data.getVar('PKGD', d, 1) or '', '', 1)
> if module_deps.has_key(file):
> [...]
>
> File value in my case (after replacing) is:
> /lib/modules/2.6.34/kernel/drivers/net/wireless/orinoco/orinoco_cs.ko
>
> Of course  'kernel/drivers/net/wireless/orinoco/orinoco_cs.ko' !=
> '/lib/modules/2.6.34/kernel/drivers/net/wireless/orinoco/orinoco_cs.ko'
> which causes my problem.
>
> What can be done to fix this? How did it get broken (last week or so)?
>
> bye,
> Filip Zyzniewski
>


