Return-Path: <mbc@koumoul.net>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9A735759D5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 10:40:28 +0000 (UTC)
Received: by ioii196 with SMTP id i196so146529006ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Oct 2015 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=UzYQ6x8iaAyClG59XUKPVK3BZFzPyPTwvWxxkBpxseY=;
	b=WchAEtwj01omeYfw37yiONDFGJ/ZgMRI74heVX/hMvO18ghyZgQCnTYVMKYsZND7OT
	tps9o5MsxE0BmC/LTc5TugydZkJ9j1Slt3LLIwpJOB3pjeQzxxILSIAOk2vjywH8Obxs
	yIT+Lg7AVx84qudG8bZIsPLjextTGhPiToXgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=UzYQ6x8iaAyClG59XUKPVK3BZFzPyPTwvWxxkBpxseY=;
	b=YavaA3aOYGlRAYsMpq2UiNAndOaKHBPz8vuhRqGFgwmDbDb6vuA294yQUE0TRRrjDA
	1hhNsQOYj1anWXoXgNpAqfdsDBQcDdzwVIjG8J9pIMSk/B5XXOWVh/cey0fZDgtAYh51
	2nHGTKdvXkQaqYN9ro+1cRMLsG5eXRKgXVVzh/0VVEKgtOfd0ezptbJN9oHgWktFFLpm
	GRhSvfqGcI2fQQN2NfRL1VchzIP9XHlOFywPJlSmWH7g6U44pIUf5FirqW7uMQYBI29U
	ukPCjMhvxzevhaePRyQ9qLqME2n7URMD7v7C0rouV9f3Du8PwRY4WJ5/X45ijbBxAJYL
	P92Q==
X-Gm-Message-State: ALoCoQnfu8mPA/Z3G7B/MAcWm/TxKcol+rDe3zqzsBUNR0eJpBCWRRSQYhcix8OI7oXEQd8m9ZSd
MIME-Version: 1.0
X-Received: by 10.107.19.161 with SMTP id 33mr31811932iot.62.1444646428539;
	Mon, 12 Oct 2015 03:40:28 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.38.193 with HTTP; Mon, 12 Oct 2015 03:40:28 -0700 (PDT)
X-Originating-IP: [46.18.96.42]
In-Reply-To: <20151008104714.GK2385@jama>
References: <1443907359-22569-1-git-send-email-manuel.bachmann@iot.bzh>
	<20151008100330.GB2385@jama>
	<CANTDXNe25Maj_vYu2MGW=VoFUcAhyhokDE06ZsMtP1McX+1aqw@mail.gmail.com>
	<20151008104714.GK2385@jama>
Date: Mon, 12 Oct 2015 12:40:28 +0200
X-Google-Sender-Auth: jfVleBC2rlgv-HtJuP2KPnyn0UE
Message-ID: <CANTDXNchezhBSVQz0jEsehnO4g_J3m1H0o0=iKGw7Gz5V_6-nQ@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH v3][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
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
X-List-Received-Date: Mon, 12 Oct 2015 10:40:29 -0000
Content-Type: text/plain; charset=UTF-8

I found a way to enable it conditionally ; requires the latest version,
though.
Thus, sending a v2 with new title right now.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-08 12:47 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> On Thu, Oct 08, 2015 at 12:14:57PM +0200, Manuel Bachmann wrote:
> > Hmm, interesting, didn't try with meta-qt.
> > I guess it can be done ; will try and let you know.
>
> At least make it explicitly disabled, so that it doesn't fail when
> auto-detected from sysroot.
>
> >
> > Regards,
> >
> > *Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *
> >
> >
> > 2015-10-08 12:03 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> >
> > > On Sat, Oct 03, 2015 at 11:22:39PM +0200, Manuel Bachmann wrote:
> > > > mkvtoolnix does not compile with newest Boost 1.58, mostly
> > > > due to the following bugs :
> > > > https://github.com/mbunkus/mkvtoolnix/issues/1172
> > > > https://github.com/mbunkus/mkvtoolnix/issues/1176
> > > >
> > > > Update to the version immediately subsequent to their
> > > > fixes, and adapt configure steps accordingly.
> > > >
> > > > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > > > ---
> > > >  meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 15
> > > +++++++++++----
> > > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/
> mkvtoolnix_git.bb
> > > b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > > > index dd613b3..da10153 100644
> > > > --- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > > > +++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > > > @@ -6,9 +6,16 @@ LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > > >
> > > >  DEPENDS = "curl boost expat zlib libebml libmatroska libogg
> libvorbis
> > > bzip2 lzo file ruby-native"
> > > >
> > > > -PV = "7.1.0+git${SRCPV}"
> > > > -SRCREV = "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
> > > > -SRC_URI = "git://github.com/mbunkus/mkvtoolnix.git"
> > > > +PV = "7.9.0+git${SRCPV}"
> > > > +SRCREV_mkvtoolnix = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
> > > > +SRCREV_libebml = "04b34b0dbded40e0cec93cafa6a4f4c8e90c3206"
> > > > +SRCREV_libmatroska = "db5d627b5bf48516c9e0b540254c0d36595760c3"
> > > > +SRCREV_FORMAT = "mkvtoolnix"
> > > > +SRC_URI = " \
> > > > +           git://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix
> \
> > > > +           git://
> > >
> github.com/Matroska-Org/libebml.git;name=libebml;destsuffix=git/lib/libebml
> > > \
> > > > +           git://
> > >
> github.com/Matroska-Org/libmatroska.git;name=libmatroska;destsuffix=git/lib/libmatroska
> > > \
> > > > +          "
> > > >
> > > >  S = "${WORKDIR}/git"
> > > >
> > > > @@ -28,7 +35,7 @@ EXTRA_OECONF = "
> --with-boost-libdir=${STAGING_LIBDIR}
> > > \
> > > >
> > > >  # remove some hardcoded searchpaths
> > > >  do_configure_prepend() {
> > > > -    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> > > s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
> > > > +    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> > > s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/qt5.m4
> > >
> > > It still fails in do_configure
> > > configure:8231: checking for the Qt version
> > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/moc
> > > uses
> > > configure:8239: result: too old: 4.8.7
> > >
> > > Can we use some PACKAGECONFIGs to disable qt{4,5}?
> > >
> > > >  }
> > > >
> > > >  # Yeah, no makefile
> > > > --
> > > > 1.8.3.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

