Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 62E9277032
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Oct 2015 12:00:31 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so80574932wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Oct 2015 05:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=3EU5j94hOVY/4ktU7Em5jZWsAU1/epfXM66qan2arNQ=;
	b=bu2W1ftsuLPDk5mZYsTVzYN02nhEIXLvptbM0c9U3Fkn5ufDdYU4y9Gf4ezNrBu0fy
	HeiBrCcHqELE0QoicLVGj8JQarRuGGCL86ezmkPQcqTMESJlFRki9NQLuR+SJayz5LlL
	7DRXMhDNuA+Y+ncajzlmfF470GKNu7lMs02Yw+cJ5VaucpVTFV9XbbwmVqg38Z1vcC31
	qD7NkcGwuzhGR+71IA4Rkh5v2lIu9a1zSKluxEm6Bzn6ILABNjipaW9spRoqGMFYMvLK
	L6OnQU+E777tm9iAMeafsAWms4LkRWhuKm1HfcoE5bV0wexljIsPaaf3pQK0+ivHAHqy
	+79Q==
MIME-Version: 1.0
X-Received: by 10.180.198.109 with SMTP id jb13mr6456988wic.17.1443960031030; 
	Sun, 04 Oct 2015 05:00:31 -0700 (PDT)
Received: by 10.194.15.6 with HTTP; Sun, 4 Oct 2015 05:00:30 -0700 (PDT)
In-Reply-To: <CANTDXNe_e8ia1ZsXdrOCqBrLAvnE-kGrzKKygxkaP+3gdC+Bjw@mail.gmail.com>
References: <1443907359-22569-1-git-send-email-manuel.bachmann@iot.bzh>
	<muqhen$di2$1@ger.gmane.org>
	<CANTDXNe_e8ia1ZsXdrOCqBrLAvnE-kGrzKKygxkaP+3gdC+Bjw@mail.gmail.com>
Date: Sun, 4 Oct 2015 14:00:30 +0200
Message-ID: <CA+chaQdYECvJ5v71OOeWJd6jigx9VVbG2F=9fTwVo45tfebcTQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sun, 04 Oct 2015 12:00:32 -0000
Content-Type: text/plain; charset=UTF-8

Was gitsm:// fetcher improved to use premirror for submodules? The initial
version didn't and I don't remember seeing it fixed/improved.

On Sun, Oct 4, 2015 at 12:16 PM, Manuel Bachmann <manuel.bachmann@iot.bzh>
wrote:

> Hi Koen,
>
> Thanks for the hint, I didn't know you could do that ! There are very few
> examples, though, and I always get a "cannot stat <repo>.git/modules" when
> I try to use it. Still trying...
>
> Anyways, as the master git repo doesn't specify hashes in its .gitmodules
> (you always fetch the latest rev), I guess it's the same as ${AUTOREV}, but
> cleaner/shorter ? And then the "always refreshes and consumes bandwidth"
> problem Martin mentioned would still apply ; having SRCREVs is better and
> more stable in this case IMHO.
>
> Regards,
>
> *Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *
>
>
> 2015-10-04 8:37 GMT+02:00 Koen Kooi <koen@dominion.thruhere.net>:
>
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 03-10-15 om 23:22 schreef Manuel Bachmann:
> > > mkvtoolnix does not compile with newest Boost 1.58, mostly due to the
> > > following bugs : https://github.com/mbunkus/mkvtoolnix/issues/1172
> > > https://github.com/mbunkus/mkvtoolnix/issues/1176
> > >
> > > Update to the version immediately subsequent to their fixes, and adapt
> > > configure steps accordingly.
> > >
> > > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh> ---
> > > meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 15
> > > +++++++++++---- 1 file changed, 11 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > > b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb index
> > > dd613b3..da10153 100644 ---
> > > a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb +++
> > > b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb @@ -6,9
> +6,16
> > > @@ LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> > >
> > > DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis
> > > bzip2 lzo file ruby-native"
> > >
> > > -PV = "7.1.0+git${SRCPV}" -SRCREV =
> > > "0c89ff941bfdd9f3378312f293a84f13cf3e2a96" -SRC_URI =
> > > "git://github.com/mbunkus/mkvtoolnix.git" +PV = "7.9.0+git${SRCPV}"
> > > +SRCREV_mkvtoolnix = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
> > > +SRCREV_libebml = "04b34b0dbded40e0cec93cafa6a4f4c8e90c3206"
> > > +SRCREV_libmatroska = "db5d627b5bf48516c9e0b540254c0d36595760c3"
> > > +SRCREV_FORMAT = "mkvtoolnix" +SRC_URI = " \ +
> > > git://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix \ +
> > > git://
> > github.com/Matroska-Org/libebml.git;name=libebml;destsuffix=git/lib/li
> > bebml
> > > \ +
> > > git://
> > github.com/Matroska-Org/libmatroska.git;name=libmatroska;destsuffix=gi
> > t/lib/libmatroska
> > > \ +          "
> >
> > Wouldn't:
> >
> > SRCREV = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
> > SRC_URI = "gitsm://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix"
> >
> > Be much easier to maintain?
> >
> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.5 (Darwin)
> > Comment: GPGTools - http://gpgtools.org
> >
> > iD8DBQFWEMkXMkyGM64RGpERAn7oAJsF+fflyuIAfXQ0VRUWDfucw7od7gCgquGN
> > MKNt3Fd8j7MicGjLPZsoyIA=
> > =ipI0
> > -----END PGP SIGNATURE-----
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

