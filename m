Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NPuMY-0006P1-TU for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 09:57:05 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NPuKf-0005K3-Ia
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Dec 2009 09:55:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 09:55:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2009 09:55:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 30 Dec 2009 09:49:48 +0100
Message-ID: <hhf47c$n7h$3@ger.gmane.org>
References: <1262129957.3447.37.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <1262129957.3447.37.camel@mattotaupa.wohnung.familie-menzel.net>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [`bitbake initramfs-kexecboot-image`] [kexecboot_git.bb] ERROR: function do_compile failed
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
X-List-Received-Date: Wed, 30 Dec 2009 08:57:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-12-09 00:39, Paul Menzel wrote:
> Dear OpenEmbedded hackers,
> 
> 
> after reading Koen’s reply [1] I tried to `bitbake
> initramfs-kexecboot-image`. But do_compile failed for kexecboot_git.bb.
> Here is the snippet from the error log.
> 
>         […]
>         In file included from util.h:24,
>                          from cfgparser.c:40:
>         /oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/lib/klibc/include/asm/setup.h:143: error: expected specifier-qualifier-list before 'u8'

For armv7a builds you need to change that 'u8' to '__u8'

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLOxQsMkyGM64RGpERArQwAJ4snzYppULW2fmTpZulujV4NM3QrgCgkfqI
h3EVq0rhye+z9XZIuO7yIHk=
=NIcd
-----END PGP SIGNATURE-----



