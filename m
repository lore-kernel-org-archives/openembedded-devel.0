Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PjDuG-0005Dc-8c for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 17:44:13 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PjDtS-00078N-UN for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 17:43:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 17:43:22 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 17:43:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 29 Jan 2011 17:43:12 +0100
Message-ID: <ii1g30$n90$1@dough.gmane.org>
References: <1296316693.5925.10.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1296316693.5925.10.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [REGRESSION] omap3-sgx-modules: `NOTE: Runtime target 'kernel-' is unbuildable, removing...`
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
X-List-Received-Date: Sat, 29 Jan 2011 16:44:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-01-11 16:58, Paul Menzel wrote:
> Dear Andreas and OE folks,
> 
> 
>         commit 2dac84b9a7b820466ed626420fec120093b56e16
>         Author: Andreas Oberritter <obi@opendreambox.org>
>         Date:   Sat Jan 29 00:51:25 2011 +0000
>         
>             module.bbclass: depend on kernel-${KERNEL_VERSION} instead of kernel (= ${KERNEL_VERSION})
>             
>             * As a special case, kernel modules must depend on
>               kernel-${KERNEL_VERSION}, which gets runtime provided by the kernel
>               package. The reason is, that the package version can be different
>               from ${KERNEL_VERSION}, because the latter depends on the kernel
>               configuration, e.g. CONFIG_LOCALVERSION.
>             
>             Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> 
> [1] seems to have broken `omap3-sgx-modules`.

I'm in favour of reverting that till people have actually ACKed a patch
to kernel.bbclass.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNREOfMkyGM64RGpERApN6AJ9s/E+sd1CfU4Q91BuaeOWQX7wq4ACffxhu
epf5mUCAdxWO12qYBGM9ukY=
=FzLs
-----END PGP SIGNATURE-----



