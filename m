Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A957E60053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 13:40:02 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1ZcCwM-0003HM-HK from Joe_MacDonald@mentor.com ;
	Wed, 16 Sep 2015 06:40:02 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Sep 2015 06:40:02 -0700
Received: by burninator (Postfix, from userid 1000)	id 91D8C58781C; Wed, 16
	Sep 2015 09:38:53 -0400 (EDT)
Date: Wed, 16 Sep 2015 09:38:53 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150916133853.GC10507@mentor.com>
References: <1441863496-7668-1-git-send-email-kai.kang@windriver.com>
	<20150914193728.GA8885@mentor.com> <55F7DC58.1050001@windriver.com>
	<CAMKF1sqP6OZbL+8-HrqMjV7FWz0+RPOSad8fO_+c7AgzvaCnuQ@mail.gmail.com>
	<20150915172429.GJ8885@mentor.com>
	<46D89522-87AA-48C1-9B6C-5408B26BA3BB@gmail.com>
MIME-Version: 1.0
In-Reply-To: <46D89522-87AA-48C1-9B6C-5408B26BA3BB@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Martin Jansa <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4
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
X-List-Received-Date: Wed, 16 Sep 2015 13:40:08 -0000
X-Groupsio-MsgNum: 57389
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEao7xgI/oilGqZ+"
Content-Disposition: inline

--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4] On 15.09.15 (=
Tue 13:17) Khem Raj wrote:

>=20
> > On Sep 15, 2015, at 10:24 AM, Joe MacDonald <Joe_MacDonald@mentor.com> =
wrote:
> >=20
> > [Re: [oe] [meta-networking][PATCH] iftop: 1.0pre2 -> 1.0pre4] On 15.09.=
15 (Tue 09:52) Khem Raj wrote:
> >=20
> >> On Tue, Sep 15, 2015 at 1:52 AM, Kang Kai <Kai.Kang@windriver.com> wro=
te:
> >>> Got it.
> >>>=20
> >>> For for iftop, it just update licensing text.
> >>>=20
> >>> ----------------------------
> >>> revision 1.3
> >>> date: 2014/01/01 14:50:05;  author: pdw;  state: Exp;  lines: +7 -8
> >>> Update to licensing text.  Patch by Robert Scheck <robert@fedoraproje=
ct.org>
> >>> ----------------------------
> >>>=20
> >>=20
> >> what was updated in essence is important here not logs
> >=20
> > Yeah, I had hoped that would've come through in either the earlier link
> > or my referencing it here.  I inspected the change myself and the
> > changes are limited to replacing 'library' with 'lesser' and the street
> > address of the FSF in the GPL text, which isn't surprising, but that's
> > really the information that should have been communicated in the commit
> > log itself.
>=20
> =E2=80=98library' GPL ( LGPL ) and =E2=80=98Lesser' GPL ( LGPL ) are they=
 same ? I think we need to find more

I don't remember exactly when it happened but I know it was a general
shift in the FSF to change the language for LGPL to mean "lesser" rather
than "library" in the early 2000s.  The thinking at the time was that
"library" implied the license would only apply to shared libraries due
to the wording, when really the intent was to be more BSD-ish.

In this case, though, the question isn't relevant because the change to
the license is actually the GPLv2 one which contains a reference to LGPL
by name (formerly library but now lesser).  The current text in Kai's
update is the text that comes from the FSF website when you look at the
GPLv2 license.  The package and the license is GPLv2, though, not LGPL,
so the semantics of that change don't matter.

In general I agree that Kai's commit log (and subsequent follow-up)
aren't sufficient at all, but I was feeling bad about all of the
back-and-forth with Wind River's China office lately and thought I'd go
the extra distance to do his research for him and merge the patch if
possible.

-J.

>=20
> >=20
> > --=20
> > -Joe MacDonald.
> > :wq
>=20

--=20
-Joe MacDonald.
:wq

--vEao7xgI/oilGqZ+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJV+XDnAAoJEEn8ffcsOfaWaSoIAMhV5N+B33tVwQguYVOjqted
WgAQSNNVBMw7vdt5TIzD7+qlyzdpgYbHUZtYvnPCqVTvJ7SQCHv4wrYOV7fVw1wT
oNAl1CiolwpyGQE675HvMN/E/xPviCQ9TONfXfmkUBH9QooZ4RPc0HrAMUhl/h8E
juPoKDGAnGw9XMuy+RWV4ueaGTEtGeZZb55MZUuLZ0Q8dIoH1+QtWBiXdxT7rikN
6y0kZh1VPfbXQfrfzgtBW+nKOAxlG9ryhNoT2sXRVYwW5sfmUp/w5yLjUQmKIz6+
J5om+l56QZsMQG/UnuqVZ57alPOXa5vuQTBlwIP5JfJL2SxgQQliswrsmUp+9ck=
=uQzy
-----END PGP SIGNATURE-----

--vEao7xgI/oilGqZ+--
