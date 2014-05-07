Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id D6722606E0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 12:19:36 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Wi0ow-00051l-Qj for openembedded-devel@lists.openembedded.org;
	Wed, 07 May 2014 14:19:34 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 14:19:34 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 14:19:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 07 May 2014 14:19:23 +0200
Message-ID: <lkd8cb$5n2$1@ger.gmane.org>
References: <1399463007-14787-1-git-send-email-Matthieu.Crapet@ingenico.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <1399463007-14787-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] xdelta3: add optional lzma support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 May 2014 12:19:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matthieu Crapet schreef op 07-05-14 13:43:
> Using PACKAGECONFIG. Disabled by default.
> 
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com> --- 
> meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb | 4 ++++ 1 file changed, 
> 4 insertions(+)
> 
> diff --git a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb 
> b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb index 16a72ee..f3b4754 
> 100644 --- a/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb +++ 
> b/meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb @@ -13,3 +13,7 @@ 
> SRC_URI[md5sum] = "c3ae3286ce4193de8e03d5bcaccf3bc3" SRC_URI[sha256sum]
> = "3a86f29c95664fb44b8a40ff22d9bcc3e87aa8c01f0ff75931a7fa78ed3d2e55"
> 
> inherit autotools + +# Optional secondary compression +PACKAGECONFIG ?= 
> "" +PACKAGECONFIG[lzma] = ",,xz"

If there's not configure switch for it, add it to DEPENDS to avoid suprises.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTaiTLMkyGM64RGpERAglxAKCBVh+CyLipm+C+VJeQFQ3UZc1LSQCfdeVH
3sFkaMpsdr6M977BEM4EVDQ=
=Gnvt
-----END PGP SIGNATURE-----


