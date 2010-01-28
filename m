Received: from mail-yw0-f195.google.com ([209.85.211.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NachD-00007d-7F
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 23:18:42 +0100
Received: by ywh33 with SMTP id 33so1220285ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 14:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oQX0japK+KPhFwhXY3QuYM6vgVB3RVeJwH3WuQ+vAak=;
	b=TMN31zWCqKXIVdnOB5E9x5b5Z6t3SbUl+fjfyIpsQNH6yCqtIuaPgWyIXiTvvya6gx
	klvpRc3toemDE7aUnbVpPAiZF5XWtQrtcYqNaIwQbYNwuA870i50l+wZZzzuDc70Z8LI
	+JRuG40xiDKKS8WlRW7u8XBn0oCp8JE1jgf7w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WYwixTlH85IczoilkwmMj6sSLgTkCMNfZVewj+Ag0gDQLJOTi/qd/id3+YkVzttqdU
	L3rfUTjXdnb4FsYozIkGI3qPrWPQIs6LgMYW8bhKLPJZZratV/zoSD09IPjV3jPBCJ3R
	NiH4zqAlyZx2hG8Ojh/kW6YTesSYQnJnsdcP8=
MIME-Version: 1.0
Received: by 10.101.130.35 with SMTP id h35mr951021ann.109.1264716975678; Thu, 
	28 Jan 2010 14:16:15 -0800 (PST)
In-Reply-To: <1264716847-1311-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1264716847-1311-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Thu, 28 Jan 2010 23:16:15 +0100
Message-ID: <ac9c93b11001281416s527924b3qc1c70aee15f93771@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.195
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] kernel.bbclass only install image in do_deploy if not installing from packaged staging
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
X-List-Received-Date: Thu, 28 Jan 2010 22:18:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/28 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_=
NAME}.bin
> expands to
> install -m 0644 arch/arm/boot/uImage .../deploy/glibc/images/beagleboard/=
uImage-2.6.29-r51-beagleboard.bin
> but of course arch/arm/boot/uImage does not exist since we are using pack=
aged staging so we get
> the error:
> install: cannot stat `arch/arm/boot/uImage': No such file or directory
> This patch only installs if not using packaged staging
> ---
> =A0classes/kernel.bbclass | =A0 =A04 +++-
> =A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 53ea252..fa48a43 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -537,7 +537,9 @@ MODULES_IMAGE_BASE_NAME ?=3D modules-${PV}-${PR}-${MA=
CHINE}
>
> =A0do_deploy() {
> =A0 =A0 =A0 =A0install -d ${DEPLOY_DIR_IMAGE}
> - =A0 =A0 =A0 install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERN=
EL_IMAGE_BASE_NAME}.bin
> + =A0 =A0 =A0 if [ "$PSTAGING_ACTIVE" =3D "0" ]; then
> + =A0 =A0 =A0 =A0 =A0 install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE=
}/${KERNEL_IMAGE_BASE_NAME}.bin
> + =A0 =A0 =A0 fi
> =A0 =A0 =A0 =A0package_stagefile_shell ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE=
_BASE_NAME}.bin
>
> =A0 =A0 =A0 =A0if [ -d "${PKGD}/lib" ]; then
> --
> 1.6.4.2
>
>

This patch supersedes the first one, which had junk added.
Kudo's to the people in #oe who helped me getting this into a proper submis=
sion.

Frans


