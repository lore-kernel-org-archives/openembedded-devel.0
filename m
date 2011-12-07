Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RYCL7-0002Jm-4B for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 08:54:53 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RYCEY-0000ZH-8Q for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 08:48:06 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 08:48:06 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Dec 2011 08:48:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 07 Dec 2011 08:47:58 +0100
Message-ID: <jbn5n9$ia9$1@dough.gmane.org>
References: <1323207144-440-1-git-send-email-Martin.Jansa@gmail.com>
	<1323207144-440-2-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1323207144-440-2-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH][meta-oe][meta-efl 2/2] mplayer2: fix DSO issue with new binutils
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
X-List-Received-Date: Wed, 07 Dec 2011 07:54:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-12-11 22:32, Martin Jansa schreef:
> *
> /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/ld:
>
> 
libmpdemux/demux_ogg.o: undefined reference to symbol '_ilog'
> /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/ld:
>
> 
note: '_ilog' is defined in DSO
> /OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/libvorbis.so.0 so try
> adding it to the linker command line 
> /OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/libvorbis.so.0: could
> not read symbols: Invalid operation
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

This one doesn't apply when I get it from patchwork :(
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7fGiwACgkQMkyGM64RGpFnPQCgq7c5zNJgq/zHo7xECShzVqQD
tJEAoKWFWrQqgsX2LYKrnm6b3feIYl2x
=jw30
-----END PGP SIGNATURE-----



