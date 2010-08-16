Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ol4sb-0005R9-Sg
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 20:57:54 +0200
Received: by gwb15 with SMTP id 15so2109572gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 11:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WEIe0kYgoUGTpItkK6gRhKnBKDDVLWHu5CfCyr6mg0g=;
	b=KdK/Jk5vm29ymSrwJDzvzDmJUJBmvcqjFlRQwboqPQZGSSfDmo6Dm2C7MJWjWaa8+H
	i5MWnMVFXl+hEaQ9YDoBnRsTjMzGmqV6gW8LHUB9Fh4v3szsDmO1ZeJaziHDtG1MaPsQ
	5Ur8lIXI3u1pCm+b6DJxUFbgmSoijn6EpZerQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=f5RNMN9MGU9/ee2zWynS0fhRzTVJDKvSjk0n0vK8ZwLyxlf4Jry7SgPyGo1zSi07r/
	STepPrJZ+pY+euPfeSO6OD/UiXP1MrJr6+JoRib0RUaBYqlRvuE35gROoaEayKT7wP6z
	4fAjgp4NYV2uchBQs0Wes69s8gCW1IkjU89KI=
MIME-Version: 1.0
Received: by 10.101.28.16 with SMTP id f16mr6306168anj.59.1281985055564; Mon,
	16 Aug 2010 11:57:35 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 11:57:35 -0700 (PDT)
In-Reply-To: <1281975262-31559-1-git-send-email-jkridner@beagleboard.org>
References: <1281975262-31559-1-git-send-email-jkridner@beagleboard.org>
Date: Mon, 16 Aug 2010 20:57:35 +0200
Message-ID: <AANLkTi=8-cC=3rYTeDpWmD837QPy90RcPhLNpMN1Mpyp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libgcrypt: Add symlink for mpi files
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
X-List-Received-Date: Mon, 16 Aug 2010 18:57:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/16 Jason Kridner <jkridner@beagleboard.org>:
> 'configure' doesn't seem to include the necessary '../mpi' in the
> symlinks that get generated. =A0This hack will make the symlinks that do
> get created work.
>
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> ---
> =A0recipes/libgcrypt/libgcrypt.inc | =A0 =A06 ++++++
> =A01 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/libgcrypt/libgcrypt.inc b/recipes/libgcrypt/libgcryp=
t.inc
> index f29dc8d..0c44fff 100644
> --- a/recipes/libgcrypt/libgcrypt.inc
> +++ b/recipes/libgcrypt/libgcrypt.inc
> @@ -4,6 +4,8 @@ PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL LGPL FDL"
> =A0DEPENDS =3D "libgpg-error"
>
> +PR =3D "r1"
> +
> =A0SRC_URI =3D "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.=
gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://add-pkgconfig-support.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://mips-h-constraint.patch"
> @@ -14,6 +16,10 @@ EXTRA_OECONF =3D "--without-pth --disable-asm --with-c=
apabilities"
>
> =A0ARM_INSTRUCTION_SET =3D "arm"
>
> +do_configure_append() {
> + =A0 =A0 =A0 ln -s ${S}/mpi ${S}/mpi/mpi
> +}
> +
> =A0do_install_append() {
> =A0 =A0 =A0 =A0install -d ${D}/${libdir}/pkgconfig/
> =A0 =A0 =A0 =A0cp ${S}/src/*.pc ${D}/${libdir}/pkgconfig/
> --
> 1.5.6.4

I have some concerns with this patch.
Jason mentioned this problem on irc last sunday. I peeked into it and
I could not reproduce is (and for me the symlinks were created
properly)
I guess others have no problem with it either (I'm fairly sure the
koens autobuilder will also build this (as gtk+ depends on libgcrypt).

Jason, have you tested rebuilding from scratch on dev head with no
local patches/changes ? Does the problem then still occur ???
(or in other words: are you sure it is nothing local)

Frans.


