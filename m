Return-Path: <mbc@koumoul.net>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id CE7FD77065
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Oct 2015 10:16:51 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so41025285igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Oct 2015 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=Yaf7QPeC1H1JKmJAV/1We/Q9FsT/4BKdUz95auLBm34=;
	b=A4+Vvt66oZrXCGDiJjvAf3AtCj0bwtK2ia7jgbtesenm/P9n0Luy9pBKqNNh68CXy4
	GQB3sY4nrlQZoI6wa9SOfJNIHQtsO8zH9XvDx6946U9mmqnW6kJ7hgP+E2439wfVG0NO
	/VdYXw4ACSSDV2fhBTggzH77JJ/nAAgBafdOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Yaf7QPeC1H1JKmJAV/1We/Q9FsT/4BKdUz95auLBm34=;
	b=FV1AJ4V4VfPoyOXFcdmh4swMsWHdMdnJt9yZ+pbZ/D+Sj4VVBDm9T+Q7x62obMj2os
	GqCE5Vhx22RDc0VoHmxphlsskMf9MzJk4BCOQL0BTipkwjXY8jdK5Q/+inRfTaoqR8Jo
	KIoKN4AP9M95tCZMBhbaKVe8upqaJqBrkFg/pnqGX/iTKtYl2seGiPpWbVzBt91WZuF6
	r1Q+BeJtFNjxKzOGeRPc6hbUIPCKog8dvo4PHHRi1hm6n5XrrD3T8HdYhh1pBI95o9ev
	edm8K8U2tKS7cgtx6frGlVCxTnaGxM20ef7ZNSHTYDe5Wux3FAzsdcrPkjHOQnPuEcC6
	S0sQ==
X-Gm-Message-State: ALoCoQl/Vcq07Bk2iTbOoeb6m1rbLho6OAaE0kRnFlL/qYxWZzy9S+8MMRi08de0s04cuW2RnmV9
MIME-Version: 1.0
X-Received: by 10.50.78.138 with SMTP id b10mr4554306igx.67.1443953811448;
	Sun, 04 Oct 2015 03:16:51 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.111.6 with HTTP; Sun, 4 Oct 2015 03:16:51 -0700 (PDT)
X-Originating-IP: [2.13.130.70]
In-Reply-To: <muqhen$di2$1@ger.gmane.org>
References: <1443907359-22569-1-git-send-email-manuel.bachmann@iot.bzh>
	<muqhen$di2$1@ger.gmane.org>
Date: Sun, 4 Oct 2015 12:16:51 +0200
X-Google-Sender-Auth: 4_c3RAtJG2WsGJ8BxFEsJQUKUko
Message-ID: <CANTDXNe_e8ia1ZsXdrOCqBrLAvnE-kGrzKKygxkaP+3gdC+Bjw@mail.gmail.com>
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
X-List-Received-Date: Sun, 04 Oct 2015 10:16:56 -0000
Content-Type: text/plain; charset=UTF-8

Hi Koen,

Thanks for the hint, I didn't know you could do that ! There are very few
examples, though, and I always get a "cannot stat <repo>.git/modules" when
I try to use it. Still trying...

Anyways, as the master git repo doesn't specify hashes in its .gitmodules
(you always fetch the latest rev), I guess it's the same as ${AUTOREV}, but
cleaner/shorter ? And then the "always refreshes and consumes bandwidth"
problem Martin mentioned would still apply ; having SRCREVs is better and
more stable in this case IMHO.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-04 8:37 GMT+02:00 Koen Kooi <koen@dominion.thruhere.net>:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 03-10-15 om 23:22 schreef Manuel Bachmann:
> > mkvtoolnix does not compile with newest Boost 1.58, mostly due to the
> > following bugs : https://github.com/mbunkus/mkvtoolnix/issues/1172
> > https://github.com/mbunkus/mkvtoolnix/issues/1176
> >
> > Update to the version immediately subsequent to their fixes, and adapt
> > configure steps accordingly.
> >
> > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh> ---
> > meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 15
> > +++++++++++---- 1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb index
> > dd613b3..da10153 100644 ---
> > a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb +++
> > b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb @@ -6,9 +6,16
> > @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >
> > DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis
> > bzip2 lzo file ruby-native"
> >
> > -PV = "7.1.0+git${SRCPV}" -SRCREV =
> > "0c89ff941bfdd9f3378312f293a84f13cf3e2a96" -SRC_URI =
> > "git://github.com/mbunkus/mkvtoolnix.git" +PV = "7.9.0+git${SRCPV}"
> > +SRCREV_mkvtoolnix = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
> > +SRCREV_libebml = "04b34b0dbded40e0cec93cafa6a4f4c8e90c3206"
> > +SRCREV_libmatroska = "db5d627b5bf48516c9e0b540254c0d36595760c3"
> > +SRCREV_FORMAT = "mkvtoolnix" +SRC_URI = " \ +
> > git://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix \ +
> > git://
> github.com/Matroska-Org/libebml.git;name=libebml;destsuffix=git/lib/li
> bebml
> > \ +
> > git://
> github.com/Matroska-Org/libmatroska.git;name=libmatroska;destsuffix=gi
> t/lib/libmatroska
> > \ +          "
>
> Wouldn't:
>
> SRCREV = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
> SRC_URI = "gitsm://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix"
>
> Be much easier to maintain?
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFWEMkXMkyGM64RGpERAn7oAJsF+fflyuIAfXQ0VRUWDfucw7od7gCgquGN
> MKNt3Fd8j7MicGjLPZsoyIA=
> =ipI0
> -----END PGP SIGNATURE-----
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

