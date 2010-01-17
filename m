Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1NWcEu-0007ZL-0S
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 22:00:55 +0100
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 0D7A4CA8ED3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 21:51:45 +0100 (CET)
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 24A62D4801A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 21:51:42 +0100 (CET)
Received: from [192.168.1.15] (tal33-2-82-228-175-43.fbx.proxad.net
	[82.228.175.43])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 34AA9D480C4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 21:51:40 +0100 (CET)
Message-ID: <4B53785C.40606@eukrea.com>
Date: Sun, 17 Jan 2010 21:51:40 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.5) Gecko/20091204 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1263760344-26105-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1263760344-26105-1-git-send-email-eric@eukrea.com>
X-SA-Exim-Connect-IP: 212.27.42.10
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] barebox: Add recipe for this new bootloader
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
X-List-Received-Date: Sun, 17 Jan 2010 21:00:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

Le 17/01/2010 21:32, Eric Benard a =E9crit :
> * barebox is "a bootloader that inherits the best of U-Boot and the Lin=
ux kernel"
> * add recipe for v2009.12.0 (last stable)
> * add recipe for git repository
>
Please review carefully this recipe as this is my first public recipe so=20
I may have misunderstood some variable's usage.

It's based on u-boot & linux recipes.
inherit kernel-arch is here in order to get the ARCH variable set

I'll send patches for a machine using barebox in a few days/weeks.

One question : is there a clean way to handle several config files for=20
the bootloader (or for the kernel) for one machine (example :=20
mymachine_with_128M_ram, mymachine_with_256M_ran) in order to compile=20
several binaries which can be used depending on the hardware=20
configuration used by the customer ?

Thanks,
Eric


