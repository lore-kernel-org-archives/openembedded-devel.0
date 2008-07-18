Received: from [81.228.8.179] (helo=av9-1-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1KJvAa-0006Im-2C
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jul 2008 20:59:08 +0200
Received: by av9-1-sn2.hy.skanova.net (Postfix, from userid 502)
	id 6349D3803F; Fri, 18 Jul 2008 20:58:16 +0200 (CEST)
Received: from smtp4-1-sn2.hy.skanova.net (smtp4-1-sn2.hy.skanova.net
	[81.228.8.92])
	by av9-1-sn2.hy.skanova.net (Postfix) with ESMTP id 18B3638006
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2008 20:58:16 +0200 (CEST)
Received: from [10.175.196.221] (213-67-42-101-no158.tbcn.telia.com
	[213.67.42.101])
	by smtp4-1-sn2.hy.skanova.net (Postfix) with ESMTP id 00C4B37E44
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2008 20:58:15 +0200 (CEST)
Message-ID: <4880E6BF.3070102@atmel.com>
Date: Fri, 18 Jul 2008 20:53:51 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080421)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4880715F.80707@atmel.com> <g5qjd2$5tg$1@ger.gmane.org>
In-Reply-To: <g5qjd2$5tg$1@ger.gmane.org>
X-Enigmail-Version: 0.95.6
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
X-List-Received-Date: Fri, 18 Jul 2008 18:59:08 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi skrev:
| Ulf Samuelsson wrote:
| I have built "gpe-image" for AT91SAM9263EK
| after fixing libsvg-cairo manually due to the LT_VERSION problem.
|
| I would like to upgrade the kernel for AT91SAM9263EK.
| I created a recipe for linux-2.6.25.10 called
| "packages/linux/linux-atmel_2.6.25.10.bb" (found below)
|
|> Yuck! There is *absolutely* no need to define
|>
linux-we-are-so-cool-we-have-our-company-name-the-kernel-recipe-filename.bb
|> files, you should be perfectly able to reuse the linux_2.6.25 recipe, as
|> avr32 already does.
|

You do not need to edit (and possibly destroy)
work done and used by others, but I do not have any problem
with using the linux_2.6.25 recipe, except is is 2.6.25
and not 2.6.25.10.

The AVR32 should be updated to patch with 2.6.25.10 as well...

If you have a number of linux_<version>, some with and some
without support for your board, then it is harder to
get an overview which kernels are supported.

Drawback would be if you lose out on interesting features
added by others by using a proprietary recipe.

Very few machines seems to use the vanilla linux.
Is there any move to merge current boards into vanilla linux_<version> ?


BR
Ulf Samuelsson



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIgOa/AyRRH5cXxqwRAvyPAKCHZUsROJ9+dx59KslBd/zvxH2fkwCgjZsF
1BnWC6QuiFRXZ7n+jX9Ga58=
=EChk
-----END PGP SIGNATURE-----


