Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 47977738D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 21:32:02 +0000 (UTC)
Received: by wevl61 with SMTP id l61so55697818wev.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 13:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9FnekA0Nhw8FepxxP4k1dSg9o75ttA9r/GaTDTCH/JQ=;
	b=rawIMaadqqdtWediVs9/kFW5qZ7cQ54wHE9H8T7I3jALnooFHNKf/VUH+ijEDLPbgP
	1yRtsN/ic19rJRFf7XtlE7cI7KSjsxE8QSR6tg7TDobWxkvpyJeBd1nvk2iAVMHQCCwY
	LmbYIhmJ99jLdY6wsE8xn2NjHNEeiQnkpklRfvklsM6ph59NrB1o98rxXAhx4LzTT39O
	wv0g9Dbe5N+vrZTSeJf8ybLpEpSmQK38AZ9IzmL7l/KAUWw52nIWAIzqPy1YLSO88XNs
	TU17Uvu31KRy7drAXqpNXE92vaWg7AqyHdWuIucC67+aMKzE8BkYge7oUnnh6asnexxb
	UIaw==
X-Received: by 10.194.24.103 with SMTP id t7mr22291334wjf.15.1425591123253;
	Thu, 05 Mar 2015 13:32:03 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	yr10sm9382224wjc.0.2015.03.05.13.32.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 13:32:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 22:32:07 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150305213207.GA2337@jama>
References: <1425248624-2993-1-git-send-email-schnitzeltony@googlemail.com>
	<20150305180120.GX2337@jama>
	<CALbNGRSb40o4eW=keqYx+3Ty04f-DHPj53h9bysC_WfhxgG_gA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSb40o4eW=keqYx+3Ty04f-DHPj53h9bysC_WfhxgG_gA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] qt-creator: avoid conflicts with meta-qt5's qt5-creator
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
X-List-Received-Date: Thu, 05 Mar 2015 21:32:03 -0000
X-Groupsio-MsgNum: 54669
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RQRqO9v0HfCoqppm"
Content-Disposition: inline

--RQRqO9v0HfCoqppm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2015 at 09:57:37PM +0100, Andreas M=FCller wrote:
> On Thu, Mar 5, 2015 at 7:01 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Sun, Mar 01, 2015 at 11:23:44PM +0100, Andreas M=FCller wrote:
> >> We avoid conflicts by installing no files to sysroot. This causes no f=
allout
> >> because nothing depends on qt5-creator (if something included later de=
pending
> >> on qt-creator it should depend on qt5-creator).
> >> Note that
> >>
> >> | WARNING: QA Issue: qt5-creator rdepends on qt-creator, but it isn't =
a build dependency? [build-deps]
> >>
> >> is a false positve because the names of the libraries are same as for
> >> qt5-creator (see test below).
> >
> > This isn't enough to resolve the warning (but it resolves the sysroot
> > conflict which is good).
> >
> > qt-creator is still recorded as runtime provider for couple of
> > libraries, we can list them all in PRIVATE_LIBS (if we can assume that
> > nothing will link against them - which is already assumed by not staging
> > them).
> >
> > Here is the list from qt5-creator log.do_package:
> >
> > $ grep "requires package qt-creator" log.do_package
> > DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libQmlJSTools.so)
> Very interesting:
>=20
> * qt5-creator complains for libs it has installed itself (see qt5 in path)
> * how should someone link against libraries that are not in sysroot?

See the code for shlibs providers in package.bbclass, this warning and
this whole issue originates there.

shlibs providers record all installed libraries (not staged in sysroot),
so that it can automatically add RDEPENDS in case some other package
will require already found library.

This happens with qt*-creators, there are plans to improve it by
including the whole path, but that doesn't work yet with current
package.bbclass.

> * during my tests for sysroot patch I have build qt-creator from
> scratch and then an image with qt5-creator included. If this warning
> would be true the image creation would have failed because qt5-creator
> RCONFLICTS qt-creator (error occured when starting the last patch)
>=20
> Problem seems that that the instance creating (have not looked
> further) these warnings just checks the name of the library without
> path. Library names are same for both versions of qt-creator.
>=20
> We could try it with PRIVATE_LIBS but I'd suggest to simply ignore
> these false warnings.

I was suggesting PRIVATE_LIBS because it sort of matches with skipping
the staging of the libraries.

The warning is still valid in cases when someone builds qt-creator
first, then qt5-creator which will automatically get RDEPENDS on
qt-creator, so installing qt5-creator from package feed will bring both
of them :(.

If we set PRIVATE_LIBS in qt-creator, it won't ever be registered as
shlib provider, so qt5-creator won't get the RDEPENDS.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RQRqO9v0HfCoqppm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4y1cACgkQN1Ujt2V2gByUyACfW1Yt+IaQLkukIX5JplwsJg9g
fRMAnRNiMLKPqsdV4SL+II/buQe5L4kj
=LAQ0
-----END PGP SIGNATURE-----

--RQRqO9v0HfCoqppm--
