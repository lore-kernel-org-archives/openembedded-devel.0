Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5eOU-0007El-Ao
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 14:55:53 +0200
Received: by iwn2 with SMTP id 2so1029449iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lMdnhNSN0styVHFisDkVOqyflrd26WTOHi/Gl8l4wiI=;
	b=qFHtSawR5k1RVoALQFBIPiyuMnX2rAi3gBiLaBsSVumLQVauoDa0RGEhXN7FX62D+8
	dGbIh3Xr4kR7do+plyoCBkUjeZk6qq7RQCKWsWX97S4RbFQpsGEW8RrQymzO7m3LHytD
	TLOvZ82ZPhGFzqf6t1ZhtvvS1QkRh+aJuv+FU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qAAXncTSGKwBb8BEU169boZOGr8RxxAaAIsGBR3sCbJUv98JXC/7QARQ40isJpectp
	weR2GKfHrtV2JTR4XEnIUnpYzeLcr11VJsPm7Xb7XC2WMaE2xmnwI8JobyRbF8NRiZOZ
	HlxAgk1YEXJi3cXUDZNs9sTZvhEI2gp/iJb2M=
MIME-Version: 1.0
Received: by 10.42.191.140 with SMTP id dm12mr2834177icb.513.1286888124649;
	Tue, 12 Oct 2010 05:55:24 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 12 Oct 2010 05:55:24 -0700 (PDT)
In-Reply-To: <1286783755-19145-2-git-send-email-koen@openembedded.org>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>
	<1286783755-19145-2-git-send-email-koen@openembedded.org>
Date: Tue, 12 Oct 2010 14:55:24 +0200
Message-ID: <AANLkTinTQX6jOi=wVcLt4MsN9-L7rjft2n2pW6qt52J6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv3 2/3] kernel bbclass: make 'kernel-modules' meta-package use RRECOMMENDS to please insane.bbclass
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
X-List-Received-Date: Tue, 12 Oct 2010 12:55:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Koen Kooi <koen.kooi@gmail.com>:
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
> =A0classes/kernel.bbclass | =A0 =A08 ++++----
> =A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 83e3f44..7039d27 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -489,12 +489,12 @@ python populate_packages_prepend () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for i in l:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pkg =3D module_pattern % l=
egitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1)=
)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0blacklist.append(pkg)
> - =A0 =A0 =A0 metapkg_rdepends =3D []
> + =A0 =A0 =A0 metapkg_rrecommends =3D []
> =A0 =A0 =A0 =A0packages =3D bb.data.getVar('PACKAGES', d, 1).split()
> =A0 =A0 =A0 =A0for pkg in packages[1:]:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not pkg in blacklist and not pkg in meta=
pkg_rdepends and not any(pkg.endswith(post) for post in depchains):
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 metapkg_rdepends.append(pkg=
)
> - =A0 =A0 =A0 bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdep=
ends), d)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if not pkg in blacklist and not pkg in meta=
pkg_rrecommends and not any(pkg.endswith(post) for post in depchains):
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 metapkg_rrecommends.append(=
pkg)
> + =A0 =A0 =A0 bb.data.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_r=
recommends), d)
> =A0 =A0 =A0 =A0bb.data.setVar('DESCRIPTION_' + metapkg, 'Kernel modules m=
eta package', d)
> =A0 =A0 =A0 =A0packages.append(metapkg)
> =A0 =A0 =A0 =A0bb.data.setVar('PACKAGES', ' '.join(packages), d)
> --
> 1.6.6.1

 Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


