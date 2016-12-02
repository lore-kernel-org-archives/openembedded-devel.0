Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9346069C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 08:30:09 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so1509404wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 00:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=22aufro3f6Nrj/iAyI9Q+5aPpLHpN7bYXtkDXfwgSM4=;
	b=HlxIglab2vnULLf+rrqnCqG9EXt4u4ortexnBOe6wvLV+KYZ4bo2SuOoktfiyfn88U
	81NfSZJSOCWpjwbvJABoTagfhH7OhE6QyNadjJcI1A8wh/3G5C3ONsaZigxIVp2uB9U6
	lu74ZH+7diULs8whjPvUSPZYAuYlEfe0iO5rzclvTRly0h4U4fzaVZDfObP9gj18/n07
	jmS0QwAx/u0FMqgUhMv4+IKXAKHmcAsHc3impDWsLqqYcng2lvJhfsh/3xTW/2dWpgsk
	gkKqjMBBWkYZeY1xyPVCtkaLgXPgQ1WzKUnDhtdLLlwr13kC/CEs4bXRaK2gkgmrXbys
	THGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=22aufro3f6Nrj/iAyI9Q+5aPpLHpN7bYXtkDXfwgSM4=;
	b=ldA6E2tgdR8UmEbpynITZQwm6WuZCYhT0IAbYp+eq3zjldHkuC+1cUIwiu4ZTTJYte
	mCdfni0uDjS2WQkDfgCJujJgSGIbhpL+8f8X1dGHAAplBSR9M6bpy8JnaesSKm6Nyq/U
	GRP/U68f8yWMPrZ7Zjimfn3GqNSDbIZHfTVXQg+suDcNPBy1b9gezvlShPxWQkpexR28
	pvT/TnPaUmfoQux87XHsr6jKLWfgY+CX6DAetDKIyKNeDSD/a3b2e9KIJYWKVVys8yaQ
	d38B72xvJb1KCV3ytJeLU7ZA3mnYhmlhf8nOyHQ31ceFjA0M8CfXXdxrS0O77I0ouLLQ
	Ou7w==
X-Gm-Message-State: AKaTC00xpIKptAq/oFs5AU6dBW1bE6fHeVX0NB1OMB5BgtQRLxIbiqT+3/MsSOZ+eAYGOg==
X-Received: by 10.28.13.9 with SMTP id 9mr1650878wmn.50.1480667410564;
	Fri, 02 Dec 2016 00:30:10 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l67sm1947723wmf.20.2016.12.02.00.30.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Dec 2016 00:30:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 2 Dec 2016 09:30:09 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161202083009.GB3721@jama>
References: <4717571.f7GXZOAcRz@peggleto-mobl.ger.corp.intel.com>
	<20161129204327.GG2546@bill-the-cat>
	<d93f4841-0154-2232-1802-2b8fcc85a81c@linux.intel.com>
	<19E9BF3F-664F-42A4-A170-5B7BB473ED80@gmail.com>
	<53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <53ca2ead-1b75-ff6d-30c1-abb16330bad3@linux.intel.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Cc: Tom Rini <trini@konsulko.com>, Patrick Ohly <patrick.ohly@intel.com>,
	Michael Halstead <michael@yoctoproject.org>
Subject: Re: meta-openembedded patchwork git hook
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Dec 2016 08:30:11 -0000
X-Groupsio-MsgNum: 64201
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline

--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2016 at 12:41:20PM -0600, Jose Lamego wrote:
>=20
>=20
> On 11/29/2016 07:50 PM, Khem Raj wrote:
> >=20
> >> On Nov 29, 2016, at 2:34 PM, Jose Lamego <jose.a.lamego@linux.intel.co=
m> wrote:
> >>
> >>
> >>
> >> On 11/29/2016 02:43 PM, Tom Rini wrote:
> >>> On Wed, Nov 30, 2016 at 06:52:46AM +1300, Paul Eggleton wrote:
> >>>
> >>>> Hi folks,
> >>>>
> >>>> Martin just brought to my attention that the git hook for the=20
> >>>> meta-openembedded repository that's supposed to update patchwork sti=
ll isn't=20
> >>>> working and hasn't done so for a very long time. I thought we'd fixe=
d this so=20
> >>>> that merged patches get marked as "Accepted", but at least for meta-
> >>>> openembedded it seems like that's not the case.
> >>>>
> >>>> Jose / Michael - can you look into this if you haven't already? Plea=
se let me=20
> >>>> know if you need any help.
> >>
> >> The git hook was configured to update OE-core only, Michael will help =
us
> >> to include meta-openembedded.
> >>
> >=20
> > There are more repos using patchwork beyond OE-core and meta-opemebedded
> > please enable it for all of them  as well.
> >=20
>=20
> Now all of the projects are enabled to receive automatic updates from
> the git-hook (Thanks Michael). Please let me know if any undesired
> behavior is detected.

Still doesn't mark anything as accepted:

OE @ ~/meta-openembedded $ git push origin master
Counting objects: 293, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (257/257), done.
Writing objects: 100% (293/293), 48.83 KiB | 0 bytes/s, done.
Total 293 (delta 179), reused 68 (delta 18)
remote: E: failed to find patch for rev efd3696e70a6603f1a45faa4a172433514f=
0a487.
remote: E: failed to find patch for rev 8c720146b718aae3bc194621f3e095cf11e=
cb2ed.
remote: E: failed to find patch for rev fc2fc9097b2fa437d4af0338e418692b4dd=
6c989.
remote: E: failed to find patch for rev 533826b7652a2cf86ca7b665c25b98c89af=
c266e.
remote: E: failed to find patch for rev 6afb85d29286aaa4cdd892460f6adf68912=
917a5.
remote: E: failed to find patch for rev a7f3ec87f957ff35b8a853cd0e04c6b18ba=
c0ece.
remote: E: failed to find patch for rev 877e52fd75c7d3b88add94691df3beb5e0c=
54529.
remote: E: failed to find patch for rev 2f6e45baba961629bfe023599144be6cfcd=
45728.
remote: E: failed to find patch for rev 86fed80d80bc33f0a3cdbf719c00ee5f05e=
d4d19.
remote: E: failed to find patch for rev 41d7bac5d50091cab835eac0a5eaa6c431f=
b2023.
remote: E: failed to find patch for rev a85e12928131fce057f777daa76a7f0c75c=
ffa14.
remote: E: failed to find patch for rev 45837e6c567b1b9ff9d152a7e2a752488d3=
13455.
remote: E: failed to find patch for rev 119e75e48dbf0539b4e440417901458ffff=
79b38.
remote: E: failed to find patch for rev a4251575f41fa5aafe5072e562497b05c11=
b6702.
remote: E: failed to find patch for rev b6ea2c0bacb21b83bae3605ef4da080de0c=
ad15e.
remote: E: failed to find patch for rev 4580e5ae201b320ed407eae26f58655b876=
8b387.
remote: E: failed to find patch for rev c476219e845934f767927e81fe60dbaa157=
df9ee.
remote: E: failed to find patch for rev 0288b204f3c12af1561218fa0cfcdfb9a55=
08b47.
remote: E: failed to find patch for rev 5596b52d64c30d8e66ec6e379cf69a9fc94=
07fb1.
remote: E: failed to find patch for rev 24e51a6a106bc10a8838b23e4bf9ea63043=
14bca.
remote: E: failed to find patch for rev aac6bf8bf911c3f14ff9dce08f0f011838f=
5a426.
remote: I: 0 patch(es) updated to state Accepted.
remote: Sending notification emails to: openembedded-commits@lists.openembe=
dded.org.
To git.openembedded.org:meta-openembedded
   761639b..aac6bf8  master -> master

> >>>
> >>> Since I brought this up on IRC, I wanted to chime in here.  First, if
> >>> you want to use top-of-tree patchwork you'll also want to grab
> >>> https://patchwork.ozlabs.org/bundle/stephenfin/post-receive%20fixes/
> >>
> >>
> >> Hi Tom, nice meeting you. OE-Patchwork is using a fork in [1] from
> >> freedesktop.org's patchwork at [2]. I will look at the hook fixes you
> >> mentioned at the first chance, thanks for the tip.
> >>
> >>> (and fwiw, I also have been setting the DJANGO part to 'dev' rather t=
han
> >>> production for my use-case).  Second, I think part of the problem is
> >>> that there are just some cases where the hashing fails, which for me =
is
> >>> around 10% of the time.  Depending on how much one uses bundles and
> >>> tracks what ends up being committed this may or may not be a problem.
> >>> And I'm sure upstream patchwork would appreciate any changes to impro=
ve
> >>> hashing success :)
> >>>
> >>
> >> Regards
> >> Jose
> >>
> >> --=20
> >> Jose Lamego | OTC Embedded Platforms & Tools | GDC
> >>
> >> --=20
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
>=20
> --=20
> Jose Lamego | OTC Embedded Platforms & Tools | GDC
>=20




> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEExEQAKCRA3VSO3ZXaA
HOZFAJ42tZV9JpyvWCzrTdWIPZnr5onFTgCdE3FLfeEgdi8dkgOJzXi2E24i26M=
=JeOC
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
