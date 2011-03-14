Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PzAmr-0001P3-2X
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 17:38:29 +0100
Received: by bwz10 with SMTP id 10so4301584bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=U43GCx4rmUQWW5G7yNNfoFRha5wGGigElQLPOAK/nys=;
	b=Qcv7ERMiS6hPNd+eYqbcnvbF02jfD1luwiDUNAB/Upg6VAi4qPBdgT64BIGOWuLBCx
	c/f6AkfDL/6qqF6CiZbpN0OglHDKT0ZhuQ9Il1t5I8y22rbyTdIGzYPKZlcaGULCr+3d
	CMTTPlgXtPBdzapGTJpmo6hOFm3RjsDSjP4ck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=TzSsOiYe+mKDSz7kBsgDAh0GhHBf/7p7IvwnX5n976ATRBPgaJMGMSFwIKCa2SKdtK
	ga8zoLsKLksrds2RaLQqMsNJF/bqogdIZmhl8FBMb3shiWjzltoFecyKY/tlfQghkKuQ
	kE3wKE/ZFWFsHur1YUuV0iEkOex0LiYJXEgr8=
Received: by 10.204.81.213 with SMTP id y21mr6088467bkk.63.1300120607799;
	Mon, 14 Mar 2011 09:36:47 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b7sm5284649bkb.6.2011.03.14.09.36.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Mar 2011 09:36:46 -0700 (PDT)
Date: Mon, 14 Mar 2011 17:36:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110314163639.GA3375@jama.jama.net>
References: <4D7E3B34.5050100@mentor.com>
	<AANLkTikqSLJd90dhRx8NwoEb37B-ZSQ4NcfKe_vVXpm2@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikqSLJd90dhRx8NwoEb37B-ZSQ4NcfKe_vVXpm2@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Discussion: Version retention policy in oe-core
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
X-List-Received-Date: Mon, 14 Mar 2011 16:38:29 -0000
X-Groupsio-MsgNum: 30190
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2011 at 09:09:52AM -0700, Chris Larson wrote:
> On Mon, Mar 14, 2011 at 8:58 AM, Tom Rini <tom_rini@mentor.com> wrote:
> > The TSC has discussed this item at the request of the community and has=
 come
> > up with the following recommendation which we are looking for feedback
> > (positive/negative/neutral) before putting this up on the wiki.
> >
> > -------- Original Message --------
> > Subject: Re: Discussion: Version retention policy in oe-core
> > Date: Thu, 24 Feb 2011 15:05:25 -0600
> > From: Mark Hatle <mark.hatle@windriver.com>
> > Reply-To: tsc@lists.openembedded.org
> > Organization: Wind River Systems
> > To: <tsc@lists.openembedded.org>
> >
> > This is a follow on to Tom's original post. =A0The attempt is to merge =
his
> > original thoughts with my own.
> >
> > ---
> >
> > As has been discussed in a few places, there needs to be a policy that
> > is followed about how long to retain (or when to replace) old recipes
> > within the oe-core repository as well as what to do with older versions=
 of
> > things.
> >
> > It is expected that OE will have a related meta-oe or similar layers wh=
ich
> > older components can be moved into while they are still useful and desi=
rable
> > to maintain. =A0However, these will be alternative versions and not the=
 "core"
> > version any longer.
> >
> > Within the oe-core we can divide the components into two classes. Criti=
cal
> > infrastructure components and standard components. =A0The critical comp=
onents
> > include the toolchain, autotools, and key libraries. =A0Virtually every=
thing
> > else fits into the standard components bucket.
> >
> > We also have use cases such as:
> > - Upstream provides provides support (new releases) and clear guidelines
> > on upgrading for version 4.0 (current), version 3.8 (previous and stabl=
e)
> > and version 3.6 (further previous, stable). =A0Upstream is also working=
 on
> > version 4.1.x (unstable, active development).
> > - Upstream provides no clear policy about what's supported other than
> > current.
> > - Community standards indicate a specific version should be used rather=
 then
> > the latest for some reason
> > - An architecture requires specific versions.
> >
> > We would like to propose the following:
> >
> > The goal of oe-core is to remain a stable, yet up-to-date set of softwa=
re
> > that forms the foundation of the Open Embedded world. =A0While not ever=
yone
> > will be able to agree on a broad definition of "stable, yet up-to-date"=
 the
> > following guidelines will help define the rules for the inclusion and/or
> > replacement of different versions into the oe-core.
> >
> > First, each of the packages need to be divided into two categories: Cri=
tical
> > Infrastructure and Core components. =A0If an item is neither of these, =
then
> > the oe-core is likely the wrong place for the component.
> >
> > By default we want to use the latest stable version of each component. =
The
> > latest stable version of each component is defined by the component's
> > upstream. When there is no clear policy from upstream we simply have to
> > apply best judgment.
> >
> > There of course will be exceptions to the default policy. =A0However, w=
hen an
> > exception occurs it must be clearly stated and documented when and why =
we
> > did not use the latest stable version -- or why we may have multiple
> > versions available of a given component. =A0This will allow us to reeva=
luate
> > the exceptions on a timely basis and decide the exception is no longer
> > reasonable.
> >
> > Most of these exceptions will be located in the critical infrastructure
> > components, specifically the toolchains. =A0In many cases we will need =
to
> > support variants of these components either for stability or architectu=
ral
> > reasons.
> >
> > Another common exception is to meet specific policy or compatibility
> > objectives within the system, such as the need to support both GPLv2 and
> > GPLv3 versions of selected components.
> >
> > If multiple versions are provided, usually the latest stable version wi=
ll be
> > preferred, however best judgment will be used to determine the preferred
> > version.
> >
> > As existing versions of removed, if they are still desirable, they shou=
ld be
> > moved into meta-oe or a suitable layer.
> >
> > We also have the issue of upcoming development versions it is suggested=
 that
> > upcoming development versions of software be worked on in specific
> > development layers until they have reach sufficient maturity to be
> > considered stable and ready for inclusion in oe-core.
> >
> > Related to this are:
> > - We want to encourage distributions that are tracking the latest to tr=
y and
> > stay with the latest.
> > - We want to encourage recipes which people are interested in to be
> > maintained long term to be maintained, long term, in meta-oe.
> > - We want to encourage distributions to work with and add to / maintain=
 the
> > core rather than deciding we have too frequent of an unhelpful churn (w=
hich
> > is to say 4.0.1 -> 4.0.2 of $whatever is good, 4.0.1 -> 4.4.3 of $whate=
ver
> > is not).
>=20
> This feedback probably won't be helpful, but this seems like a sane
> plan all around to me.

I agree

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1+RBcACgkQN1Ujt2V2gBxHsACgtHJDx8I6T58E3nNefBsygsKF
+AIAnA31iXsuHw7O7g+ao6qX+pomkJ2Y
=Bcku
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
