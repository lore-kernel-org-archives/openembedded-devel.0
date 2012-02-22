Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S07nR-0004ac-C5 for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 09:43:33 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S07fO-0005W2-5q for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 09:35:14 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 09:35:14 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 09:35:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Feb 2012 09:35:09 +0100
Message-ID: <ji29bo$1nd$1@dough.gmane.org>
References: <cover.1329775974.git.Martin.Jansa@gmail.com>
	<39ee8c2d0d24a2c80eca0afdff9b19ced16f6034.1329775974.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <39ee8c2d0d24a2c80eca0afdff9b19ced16f6034.1329775974.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][meta-efl][PATCH 1/2] polkit: enable and disable systemd/consolekit support explicitly
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
X-List-Received-Date: Wed, 22 Feb 2012 08:43:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-02-12 23:13, Martin Jansa schreef:
> * people using sysvinit already have or can set something like 
> task-core-boot.bb does VIRTUAL-RUNTIME_init_manager ?= "sysvinit" to
> disable systemd explicitly (so it's not picked by shlib when it's 
> available because other packages). * and for the rest it will disable
> consolekit and enable systemd explititly
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> .../recipes-extended/polkit/polkit_0.104.bbappend  |    7 +++++-- 1 files
> changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend index
> 3c43970..d649f61 100644 ---
> a/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend +++
> b/meta-oe/recipes-extended/polkit/polkit_0.104.bbappend @@ -1,3 +1,6 @@ 
> -DEPENDS += "systemd" +PRINC := "${@int(PRINC) + 3}"
> 
> -PRINC = "1" +PACKAGECONFIG ??=
> "${@base_contains('VIRTUAL-RUNTIME_init_manager', 'sysvinit',
> 'consolekit', 'systemd', d)}" +PACKAGECONFIG[systemd] =
> "--enable-systemd,--disable-systemd,systemd" +# there is no
> --enable/--disable option for consolekit and it's not picked by shlibs,
> so add it to RDEPENDS +PACKAGECONFIG[consolekit] = ",,,consolekit"

I really don't want to use runtime vars to trigger buildtime deps :(
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9EqLAACgkQMkyGM64RGpF9nACeJIMiWeUkdZ1f7HlDT669DohK
xaEAoIbezxgzLUg97K500qpxDn1rPzH8
=XcOs
-----END PGP SIGNATURE-----



