Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PIPBu-0002Yn-Em
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 18:19:37 +0100
Received: by pxi17 with SMTP id 17so223707pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 09:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CX5oZiuWf/rH2M2yJHf+mRhJZsITQue6BU68lpT3UaY=;
	b=aS65BSCyOydoZBHRa+eNRNub7R8E/nwWzepRGZhYaFERryg/3jXxhmPDDpScLD2Lx3
	yA4TSPDmgoti0f6GY3Ye/E9QCziBV4A9wFlM6ysR+pZ9XDJUcJdMgphA2TTjrPh/i7Wz
	LCeQ9KOfMnVZWlxgaMAW983gjzjwNV7UE4aIs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=C2yPY/6jAoaCs00M/LtPuyjrUwJPbtgeq1W2bKB4pQalIVV3WbsD+azUS8cIt/rHQi
	mMU3rU1iuT+XzTaptE2uD2XsJk5zyoEoGiBfuobmQwoCBpM815f69maFAvr12MU0CdE8
	NldYaTTq2DRmjlTjHobYufwzmWYwmgPVy24wU=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr5968214iba.1.1289927907153; Tue,
	16 Nov 2010 09:18:27 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Tue, 16 Nov 2010 09:18:27 -0800 (PST)
In-Reply-To: <1289916799-21803-2-git-send-email-Martin.Jansa@gmail.com>
References: <1289916799-21803-1-git-send-email-Martin.Jansa@gmail.com>
	<1289916799-21803-2-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 16 Nov 2010 18:18:27 +0100
Message-ID: <AANLkTikaoXdcDSG53cehEf=3ccjOJnbo==k5gT6bxYGa@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] jlime,dzen2,puzzles: use RDEPENDS_${PN}
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
X-List-Received-Date: Tue, 16 Nov 2010 17:19:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/11/16 Martin Jansa <martin.jansa@gmail.com>:
> * it was fixed in whole tree about half year ago
> =A0http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-June/0203=
84.html
> =A0http://comments.gmane.org/gmane.comp.handhelds.openembedded/33440
> * then again about month ago
> =A0http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/=
msg11356.html
> * please follow OE packaging guidelines in new recipes
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/dzen2/dzen2_svn.bb =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++--
> =A0recipes/jlime/fileselector_1.1.bb =A0 | =A0 =A04 ++--
> =A0recipes/jlime/fnkey_1.0.bb =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++--
> =A0recipes/jlime/jlime-extras_1.0.1.bb | =A0 =A04 ++--
> =A0recipes/puzzles/stppc2x_svn.bb =A0 =A0 =A0| =A0 =A04 ++--
> =A05 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/recipes/dzen2/dzen2_svn.bb b/recipes/dzen2/dzen2_svn.bb
> index fa10724..1ad6e82 100644
> --- a/recipes/dzen2/dzen2_svn.bb
> +++ b/recipes/dzen2/dzen2_svn.bb
> @@ -1,11 +1,11 @@
> =A0DESCRIPTION =3D "dzen is a general purpose messaging, notification and=
 menu program."
> =A0LICENSE =3D "MIT"
> =A0DEPENDS =3D "virtual/libx11 libxft"
> -RDEPENDS =3D "ttf-dejavu-sans xrandr"
> +RDEPENDS_${PN} =3D "ttf-dejavu-sans xrandr"
>
> =A0SRCREV =3D "271"
> =A0PV =3D "0.8.5+svnr${SRCPV}"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D "svn://dzen.googlecode.com/svn/;module=3Dtrunk;proto=3Dhtt=
p \
> =A0 =A0 =A0 =A0 =A0 file://dzen-extras.tar.gz \
> diff --git a/recipes/jlime/fileselector_1.1.bb b/recipes/jlime/fileselect=
or_1.1.bb
> index 6a4929d..e5e01cc 100644
> --- a/recipes/jlime/fileselector_1.1.bb
> +++ b/recipes/jlime/fileselector_1.1.bb
> @@ -1,9 +1,9 @@
> =A0DESCRIPTION =3D "Fileselector is an SDL-based file chooser dialog"
> =A0LICENSE =3D "GPLv2"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0DEPENDS =3D "virtual/libsdl libsdl-ttf"
> -RDEPENDS =3D "ttf-dejavu-sans-condensed"
> +RDEPENDS_${PN} =3D "ttf-dejavu-sans-condensed"
>
> =A0SRC_URI =3D "http://jlime.com/downloads/development/software/fileselec=
tor-${PV}.tar.gz"
>
> diff --git a/recipes/jlime/fnkey_1.0.bb b/recipes/jlime/fnkey_1.0.bb
> index fc09eeb..6f24da4 100644
> --- a/recipes/jlime/fnkey_1.0.bb
> +++ b/recipes/jlime/fnkey_1.0.bb
> @@ -1,8 +1,8 @@
> =A0DESCRIPTION =3D "Emulates Fn key by simulating multiple keypresses."
> =A0LICENSE =3D "GPLv2"
> -PR =3D "r0"
> +PR =3D "r1"
>
> -RDEPENDS =3D "xdotool"
> +RDEPENDS_${PN} =3D "xdotool"
>
> =A0SRC_URI =3D "file://fnkey.c"
>
> diff --git a/recipes/jlime/jlime-extras_1.0.1.bb b/recipes/jlime/jlime-ex=
tras_1.0.1.bb
> index 9b7b907..c3dd483 100644
> --- a/recipes/jlime/jlime-extras_1.0.1.bb
> +++ b/recipes/jlime/jlime-extras_1.0.1.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Various extras for the Jlime userlands"
> -PR =3D "r0"
> +PR =3D "r1"
>
> -RRECOMMENDS =3D "jlime-extras-${MACHINE}"
> +RRECOMMENDS_${PN} =3D "jlime-extras-${MACHINE}"
>
> =A0PACKAGE_ARCH =3D "all"
> =A0SRC_URI =3D "http://jlime.com/downloads/development/software/${PN}-${P=
V}.tar.gz"
> diff --git a/recipes/puzzles/stppc2x_svn.bb b/recipes/puzzles/stppc2x_svn=
.bb
> index 380a753..8e6d4f2 100644
> --- a/recipes/puzzles/stppc2x_svn.bb
> +++ b/recipes/puzzles/stppc2x_svn.bb
> @@ -2,11 +2,11 @@ DESCRIPTION =3D "stppc2x is an SDL port of Simon Tatham=
's Portable Puzzle Collecti
> =A0LICENSE =3D "GPLv2"
>
> =A0DEPENDS =3D "virtual/libsdl libsdl-image libsdl-ttf"
> -RDEPENDS =3D "ttf-dejavu-sans-condensed"
> +RDEPENDS_${PN} =3D "ttf-dejavu-sans-condensed"
>
> =A0SRCREV =3D "185"
> =A0PV =3D "1.0+svnr${SRCPV}"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0FILES_${PN} =3D "/usr/bin /usr/share"
>
> --
> 1.7.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


