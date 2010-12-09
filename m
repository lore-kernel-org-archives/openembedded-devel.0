Received: from mail-iw0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PQaQK-0008QR-ID
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 07:56:18 +0100
Received: by iwn40 with SMTP id 40so2733519iwn.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Dec 2010 22:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=A2CBCLXrDSBbyJFYzpfBPVovh81NotPw3xbQ0pEVg0k=;
	b=vSYbHvBo903JGcvQJ4LHwc+Om6a9Jmu5uPwoog+TPAeRTdq4z/vi/+6uM/oeeNPIqa
	Wkw6MRLx4pEU8tSP/p1TP0oaeJ96MZZ9bbgF1/VY4f1KmAvo362wG/dtN04W6a5ecUZv
	WHZiPCebkpdOLgP3rdetYetcKf3NRjoJdmlRk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FJAAvVbbNofXw6lIoR2tDugNMvK+Bz6zRX2T9hwgvWHnSItwMQ4zfXv9W5ftZp5gFZ
	d1zahTcZqXIc7pUO+oaKciDK1BCAjtoLfIqIYWyC+BqnrVY2/quqOuAt1S8YacF0xHVO
	wwmQqFnivSOKK2Jk762syVGk3wK1YWkbeupwM=
MIME-Version: 1.0
Received: by 10.231.149.194 with SMTP id u2mr134159ibv.32.1291877687349; Wed,
	08 Dec 2010 22:54:47 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 8 Dec 2010 22:54:47 -0800 (PST)
In-Reply-To: <1291813320-24770-4-git-send-email-obi@opendreambox.org>
References: <1291813320-24770-1-git-send-email-obi@opendreambox.org>
	<1291813320-24770-4-git-send-email-obi@opendreambox.org>
Date: Thu, 9 Dec 2010 07:54:47 +0100
Message-ID: <AANLkTim=2PEWD3Sza=hJDZbxrZVg0wzOksZgoO30pfdb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.173
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/8] mythtv: depend on virtual/libsdl instead of libsdl-x11
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
X-List-Received-Date: Thu, 09 Dec 2010 06:56:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/8 Andreas Oberritter <obi@opendreambox.org>:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0recipes/mythtv/mythplugins_0.23+fixes.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/mythtv/mythplugins_0.23+fixes.bb b/recipes/mythtv/my=
thplugins_0.23+fixes.bb
> index c55d76d..0268673 100644
> --- a/recipes/mythtv/mythplugins_0.23+fixes.bb
> +++ b/recipes/mythtv/mythplugins_0.23+fixes.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "plugins for mythtv: A full featured pers=
onal video recorder syste
> =A0HOMEPAGE =3D "http://www.mythtv.org"
> =A0LICENSE =3D "GPLv2"
>
> -DEPENDS =3D "flac taglib mythtv libvorbis libexif libvisual libsdl-x11 l=
ibcdaudio cdparanoia"
> +DEPENDS =3D "flac taglib mythtv libvorbis libexif libvisual virtual/libs=
dl libcdaudio cdparanoia"
> =A0RDEPENDS_${PN} =3D "mytharchive mythbrowser mythgallery mythgame mythm=
ovies =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mythmusic mythnetvision mythnews myth=
video mythweather mythzoneminder"
> =A0RRECOMMENDS_${PN} =3D "mythweb-lighttpd"
> --
>
Applied, thank you.
Frans


