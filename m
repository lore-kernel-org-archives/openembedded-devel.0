Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pakm8-0003Rc-8L for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 09:00:48 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pakll-00009t-I1 for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 09:00:25 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 09:00:25 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 09:00:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 06 Jan 2011 09:00:08 +0100
Message-ID: <ig3sq8$g6s$1@dough.gmane.org>
References: <1294259972-3430-1-git-send-email-Chase.Maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294259972-3430-1-git-send-email-Chase.Maupin@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/3] linux-omap-psp: add OCF support
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
X-List-Received-Date: Thu, 06 Jan 2011 08:00:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-01-11 21:39, Chase Maupin wrote:
> * Add a patch to put OCF support into the linux-omap-psp kernel
>   for am37x-evm devices, which is the only device that this has
>   been validated on.
> * Add support to the defconfig file for am37x-evm for OCF

NAK! This patch should be added globally so machine maintainers only
have to turn it on in the defconfig. It makes no sense to have a SoC
specific patch tied to a specific machine. To make it worse, the exact
same machine dm37x-evm isn't getting patched.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNJXaIMkyGM64RGpERAseVAJ4wqHpDmMUcB+XVjcMJhCYQVhmi1wCdFHun
J3b4vSPeiDH303I94fLFt9A=
=LTLk
-----END PGP SIGNATURE-----



