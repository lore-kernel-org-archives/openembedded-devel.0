Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7946C70D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 09:01:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 21 Oct 2013 01:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,537,1378882800"; d="scan'208";a="414358098"
Received: from pauljbro-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.219])
	by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2013 02:01:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Oct 2013 10:01:07 +0100
Message-ID: <1734982.Eo3HTheTAh@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <544da34b-acbf-44ca-8f84-fd993db893f4@email.android.com>
References: <2478778.XBk41EpSZr@koontz>
	<544da34b-acbf-44ca-8f84-fd993db893f4@email.android.com>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: Regarding layers and their versioning.
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
X-List-Received-Date: Mon, 21 Oct 2013 09:01:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday 21 October 2013 09:29:27 Anders Darander wrote:
> "S=F8ren Holm" <sgh@sgh.dk> wrote:
> >What is the best way to manage a private repo with recipes as well a=
s
> >meta-oe,
> >meta-core and meta-angstrom.
> >
> >Currently I have a private repo that has the layers attached as
> >submodules. Is that a crazy setup or what?
>=20
> We're doing the same internally at ChargeStorm. One benefit is that w=
e're
> having our "master" repo keeping track of all the layers that we're u=
sing
> and which revision of those layers.
>=20
> Other people / projects just use a shell script checking out the desi=
red
> layers. Some people combines layers into one huge repo (though I'd
> personally not recommend that approach). (That'd be similar to how Po=
ky is
> being managed).
>
> Yet other people / projects use repo.=20
>
> It's up to what you're comfortable with in the end.=20

Just to clarify, we use the combo-layer script (scripts/combo-layer) to=
 manage=20
the Poky repository. It can combine multiple repositories or even parts=
 of=20
repositories into one and keep it up-to-date. It works well for our pur=
poses,=20
i.e. providing a single repository that people can download containing =
all of=20
the needed basic components. However, it's just one of a number of diff=
erent=20
solutions in this area and you'd have to evaluate which tool works best=
 for=20
your situation.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

