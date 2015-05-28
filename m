Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9B28D60962
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 10:49:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 28 May 2015 03:49:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,512,1427785200"; d="scan'208";a="701501376"
Received: from ecurley-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.28.106])
	by orsmga001.jf.intel.com with ESMTP; 28 May 2015 03:49:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 May 2015 11:49:22 +0100
Message-ID: <1766894.osXu7KzV3v@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <CALbNGRS6mWddxw+L76PSt9HMUkhtJL9Q=zDOXtE91rsbyKz2Og@mail.gmail.com>
References: <20150528103631.GF2383@jama>
	<CALbNGRS6mWddxw+L76PSt9HMUkhtJL9Q=zDOXtE91rsbyKz2Og@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Dropping tarball recipes from meta-qt5
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
X-List-Received-Date: Thu, 28 May 2015 10:49:23 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 28 May 2015 12:46:33 Andreas M=FCller wrote:
> On Thu, May 28, 2015 at 12:36 PM, Martin Jansa <martin.jansa@gmail.co=
m>=20
wrote:
> > I'm still working on finishing 5.5-beta1 recipes for qt5, I'm getti=
ng
> > tired of maintaining 2 sets of patches and 2 versions of recipes in=
 the
> > same layer branch.
> >=20
> > 1) Would people mind dropping 5.4 support in master branch (who wan=
ts to
> > use 5.4 can continue to use "fido" branch of meta-qt5, there are pa=
tches
> > for 5.4.2 git recipes as well).
>=20
> As soon as 5.5 is out I have no problem.
>=20
> > 2) Would people mind having only git recipes? It will be easier to
> > update them. Only disadvantages I can think of are the need to clon=
e
> > from git and not being aligned with exact release for long time (gi=
t
> > recipes usually track newer revisions in e.g. 5.4 branch than 5.4.0=
 or
> > 5.4.1 tarbal recipes.
>=20
> Advantage for me would be that recipe-wise changing versions for test=

> is easier - so no I appreciate.

Indeed, it sounds reasonable. My only question though would be is there=
 a=20
significant penalty in terms of do_fetch time? We've had complaints abo=
ut other=20
recipes that fetch large git repos taking ridiculously long to fetch.

> > If we all use the same version from the same recipes then we can te=
st it
> > better and it will be much easier to maintain.
>=20
> I think it's time to mention: Thanks for maintaining qt5 and other
> layers - you do an excellent job!

Seconded!!

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

