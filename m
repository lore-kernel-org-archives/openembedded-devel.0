Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNnQY-0002sy-IL
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 15:12:59 +0100
Received: by iwn8 with SMTP id 8so5873579iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 06:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RSiGxW6tooeXorhq3/aFMkwhM/2GSxj7+S4hEBtI0ss=;
	b=mX6cDOhEJBhUZ2MQU58GKDorPjIsYITk++ElK6hJHPXbGAIWzc8NDoGygLPtOLLvX4
	zSeeh+YtT1UtmnWENel6H2VqXetfAktaPW3vq+RzJb8nPiZ7kRLvYHw/qFJWFc6lYZmC
	sih1Db5kFUL1cdjn20JL528rIqkvBlLjDBpJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=B0y7rbwnCUSwmn2oI/gC7JkcY+3lK1N9xeFmqHGbbAF2jyePZgO9EPgIhCWtbD1dLP
	YrVaEWp+EB8jPTDipZPbAHapYmEOM4tbcWlieGiZd3RLVL9nz2vpLIGAZ67IY0SFVV7O
	wZ1/EbPiC0xmUgFkVxOLX+77cNSHYJ5hB83Ag=
MIME-Version: 1.0
Received: by 10.231.13.203 with SMTP id d11mr9044418iba.157.1291212697511;
	Wed, 01 Dec 2010 06:11:37 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 1 Dec 2010 06:11:37 -0800 (PST)
In-Reply-To: <1291211567-2520-1-git-send-email-Martin.Jansa@gmail.com>
References: <1291211567-2520-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 1 Dec 2010 15:11:37 +0100
Message-ID: <AANLkTikkpAXLe9ZAvp=CPC1gVjngeGfQHqV2-sCtjwPG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] module-init-tools: fix multiple runtime providers
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
X-List-Received-Date: Wed, 01 Dec 2010 14:12:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/1 Martin Jansa <martin.jansa@gmail.com>:
> * NOTE: multiple providers are available for runtime module-init-tools-de=
pmod (module-init-tools, module-init-tools-cross)
> =A0NOTE: consider defining a PREFERRED_PROVIDER entry to match module-ini=
t-tools-depmod
> ---
> =A0recipes/module-init-tools/module-init-tools.inc | =A0 10 +++++-----
> =A01 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/recipes/module-init-tools/module-init-tools.inc b/recipes/mo=
dule-init-tools/module-init-tools.inc
> index 3cfaf11..247b39a 100644
> --- a/recipes/module-init-tools/module-init-tools.inc
> +++ b/recipes/module-init-tools/module-init-tools.inc
> @@ -3,13 +3,13 @@ removing kernel modules for Linux (versions 2.5.48 and =
above). It serves \
> =A0the same function that the modutils package serves for Linux 2.4."
> =A0LICENSE =3D "GPLv2"
> =A0SECTION =3D "base"
> -PR =3D "r5"
> +PR =3D "r6"
>
> -PACKAGES =3D+ "module-init-tools-insmod-static module-init-tools-depmod"
> -RDEPENDS_${PN} +=3D "module-init-tools-depmod"
> +PACKAGES =3D+ "${PN}-insmod-static ${PN}-depmod"
> +RDEPENDS_${PN} +=3D "${PN}-depmod"
>
> -FILES_module-init-tools-depmod =3D "${sbindir}/depmod.26"
> -FILES_module-init-tools-insmod-static =3D "${sbindir}/insmod.static"
> +FILES_${PN}-depmod =3D "${sbindir}/depmod.26"
> +FILES_${PN}-insmod-static =3D "${sbindir}/insmod.static"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/utils/kernel/module-init-to=
ols/module-init-tools-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0 file://ignore_arch_directory;apply=3Dyes \
> --

Thanks for the patch!
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

still not really sure why we have module-init-tools-cross though.
A quick search did not give me a user (but maybe the search was too quick)
And still unsure why a cross recipe should produce a  package.
And maybe it should be module-init-tools-native ?

Frans (puzzled)


