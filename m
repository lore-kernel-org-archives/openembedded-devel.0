Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RPsNG-0003Hq-Jk for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 09:58:43 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RPsH9-0002HH-Ap for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 09:52:23 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 09:52:23 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 09:52:23 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 14 Nov 2011 09:52:12 +0100
Message-ID: <j9qkrr$lcr$1@dough.gmane.org>
References: <201111131827.00994.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <201111131827.00994.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.3
Subject: Re: How to avoid oe complaining for .so symlink
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
X-List-Received-Date: Mon, 14 Nov 2011 08:58:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-11-11 18:27, Andreas Müller schreef:
> Hi,
> 
> I am preparing a recipe for tumbler (xfce). The package itself installs a
>  symlink which seems required on a .so. OE QA complains
> 
> | ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so:
>  tumbler path
> '/work/armv7a-angstrom-linux-gnueabi/tumbler-0.1.22-r0/packages- 
> split/tumbler/usr/lib/tumbler-1/plugins/cache/tumbler-cache-plugin.so'
> 
> I could workaround by removing symlink on do_install_append and adding it
> again at pkg_postinst but this seems crap.
> 
> The better method seems telling QA not to check for so-symlinks.
> 
> In insane.bbclass I find
> 
> ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch la2 pkgconfig la
> perms"
> 
> so I could set in recipe
> 
> ERROR_QA = "debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
> 
> but this makes recipe immune to ERROR_QA in insane.bbclass. Is there a
> way to remove 'dev-so' from ERROR_QA?

INSANE_SKIP_${PN} = "dev-so"

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7A1rkACgkQMkyGM64RGpHI7gCgnH3LnoFE1VOrLvOm2gvWdR7s
BQMAoKxo/N4PfCfaHlSFWEA3nbXreXIV
=eMjv
-----END PGP SIGNATURE-----



