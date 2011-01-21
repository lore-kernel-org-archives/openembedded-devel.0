Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PgEmq-0002Rg-Kz for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 12:04:13 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PgEmC-0005qS-5a for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 12:03:32 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 12:03:32 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 12:03:32 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 21 Jan 2011 12:03:08 +0100
Message-ID: <ihbp5c$4ov$1@dough.gmane.org>
References: <20110120181233.GA1789@lit.local.igalia.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110120181233.GA1789@lit.local.igalia.com>
X-Enigmail-Version: 1.0.1
Subject: Re: problems compiling glibc_2.9-r37.4 under Angstrom
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
X-List-Received-Date: Fri, 21 Jan 2011 11:04:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-01-11 19:12, Víctor M. Jáquez L. wrote:
> 
> In order to build native-sdk-image recipe, I found my self compiling
> glibc_2.9-r37.4, because it is the real provider of virtual-libc-dev (the
> toolchain does not truly provide it -but that is another bug [1]-).
> 
> But the glibc_2.9-r37.4 configuration fails using the canonical
> arm-angstrom-linux-gnueabi- toolchain

If you're using angstrom 2008, glibc 2.9 is built by default. Trying to
rebuild it won't work because it will be missing headers due to all the
- -initial and -intermedia shuffle.
If you're using angstrom 2010, eglibc is built by default and should
providing virtual-libc-dev

Switching to minimal will only get you anguish, since it's broken by design.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNOWfsMkyGM64RGpERAsqfAKC2L5KDSLLBSC0tES2r+Axm+rxGoQCfVssG
IDR7J61eU9hEKOTT2+CRW9M=
=R8yc
-----END PGP SIGNATURE-----



