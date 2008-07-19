Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KK7S2-0003ff-OL
	for openembedded-devel@openembedded.org; Sat, 19 Jul 2008 10:06:00 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KK7R8-0004LD-FF
	for openembedded-devel@openembedded.org; Sat, 19 Jul 2008 08:05:02 +0000
Received: from host86-132-148-182.range86-132.btcentralplus.com
	([86.132.148.182]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 19 Jul 2008 08:05:02 +0000
Received: from k.kooi by host86-132-148-182.range86-132.btcentralplus.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 19 Jul 2008 08:05:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 19 Jul 2008 09:00:41 +0100
Message-ID: <g5s6v9$446$2@ger.gmane.org>
References: <4880715F.80707@atmel.com> <g5qjd2$5tg$1@ger.gmane.org>
	<4880E6BF.3070102@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: host86-132-148-182.range86-132.btcentralplus.com
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008062403)
In-Reply-To: <4880E6BF.3070102@atmel.com>
Sender: news <news@ger.gmane.org>
Subject: Re: How update kernel recipe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 19 Jul 2008 08:06:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Ulf Samuelsson wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Koen Kooi skrev:
> | Ulf Samuelsson wrote:
> | I have built "gpe-image" for AT91SAM9263EK
> | after fixing libsvg-cairo manually due to the LT_VERSION problem.
> |
> | I would like to upgrade the kernel for AT91SAM9263EK.
> | I created a recipe for linux-2.6.25.10 called
> | "packages/linux/linux-atmel_2.6.25.10.bb" (found below)
> |
> |> Yuck! There is *absolutely* no need to define
> |>
> linux-we-are-so-cool-we-have-our-company-name-the-kernel-recipe-filename.bb
> |> files, you should be perfectly able to reuse the linux_2.6.25 recipe, as
> |> avr32 already does.
> |
>
> You do not need to edit (and possibly destroy)
> work done and used by others, but I do not have any problem
> with using the linux_2.6.25 recipe, except is is 2.6.25
> and not 2.6.25.10.
>
> The AVR32 should be updated to patch with 2.6.25.10 as well...

2.6.25.10 for avr32 results in an unbootable kernel, so I'm leaving it 
at 2.6.25.6 as it is currently.



>
> If you have a number of linux_<version>, some with and some
> without support for your board, then it is harder to
> get an overview which kernels are supported.
>
> Drawback would be if you lose out on interesting features
> added by others by using a proprietary recipe.
>
> Very few machines seems to use the vanilla linux.
> Is there any move to merge current boards into vanilla linux_<version> ?
>
>
> BR
> Ulf Samuelsson
>
>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.4-svn0 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
>
> iD8DBQFIgOa/AyRRH5cXxqwRAvyPAKCHZUsROJ9+dx59KslBd/zvxH2fkwCgjZsF
> 1BnWC6QuiFRXZ7n+jX9Ga58=
> =EChk
> -----END PGP SIGNATURE-----




