Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5C81460588
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 20:55:01 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id 78so146545723pfw.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 12:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=xqH7FrFw6JKFTPNKYdwGKHFt/DctJ2n/MeOt9qBHpSw=;
	b=O3sUuVfo28j+oWv3wbKav21FJY76UVxxHaTVAEZ9qYwWzIfofxD0AKatWGGEw6R8IL
	vOEVCi7NAcMmT8M8x4/tZvcfDYydKgeM/qwOFa7Kk1Au7SquRN7sVAEDkh38mgyZP1HQ
	p/ZJcAtLReXXD8YXm/nJNe/yTfJYDKNKoj+lo3gbTAfbekWfYOsjn3A2OCj+Nt5u/2I+
	oSB74g9mNvuViwRFFMIUHdVR+QvOJ5t+TDdzGZbx64T0IysI4Ft5yhpb1ezJOjR1yxpF
	AISXJ2TlU+fVLL7nC8OTu8jy6swyCnV/pWceJV/cD3s+w9MtnArSULt76ycL/IiAxmWS
	8uMw==
X-Received: by 10.98.74.82 with SMTP id x79mr28911930pfa.163.1451508902365;
	Wed, 30 Dec 2015 12:55:02 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:30cb:380:8779:5f88?
	([2601:646:8802:5d5c:30cb:380:8779:5f88])
	by smtp.gmail.com with ESMTPSA id
	sg4sm96891354pac.48.2015.12.30.12.55.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Dec 2015 12:55:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5684329F.3090206@gmail.com>
Date: Wed, 30 Dec 2015 12:54:57 -0800
Message-Id: <C8D964A5-FC00-4FAD-B8BA-CA6AE5801970@gmail.com>
References: <56837748.6020903@gmail.com>
	<CAMKF1spcVXiHxyPnTg=nYUOM_2yc2vU6x+VwG6unWH3wdNKeag@mail.gmail.com>
	<5684329F.3090206@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: chromium 40.0.2214.91 doesn't like gcc5.3
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
X-List-Received-Date: Wed, 30 Dec 2015 20:55:04 -0000
X-Groupsio-MsgNum: 59243
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4FF66A93-E75B-4DB2-9D6B-93EC337DDD3D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4FF66A93-E75B-4DB2-9D6B-93EC337DDD3D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 30, 2015, at 11:38 AM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>=20
> Hi Khem,
>=20
> On 12/30/15 13:04, Khem Raj wrote:
>> can you backport and report back
>>=20
>> =
https://chromium.googlesource.com/v8/v8/+/e28183b5977a2d2732f7f8b9a2f26637=
c9566585%5E%21/#F0
>=20
> That diff includes 4 patches:
>    Index: src/bignum.cc
>    Index: src/compiler/ia32/code-generator-ia32.cc
>    Index: src/compiler/x64/code-generator-x64.cc
>    Index: test/cctest/compiler/test-js-typed-lowering.cc
>=20
> All of these patches only apply to the code in the "v8" folder.
>=20
> The 4th one doesn't apply because I can't find a
> "test-js-typed-lowering.cc" file anywhere in our version 40 sources.
>=20
> Although the files "v8/src/compiler/ia32/code-generator-ia32.cc" and
> "v8/src/compiler/x64/code-generator-x64.cc" exist, these two patches
> don't apply since the code in those files doesn't look anything like
> what these patches are trying to patch.
>=20
> The first patch does apply, with the file path change (add v8 to the
> front), and a 2 line offset.
>=20
> For some reason this bignum.cc source is found in both v8/src and
> third_party/WebKit/Source/wtf/dtoa and, apart from some extra =
namespace
> scope, is very similar (if not the same). So I added a second patch to
> this diff to also correctly patch the code in third_party/... .
>=20
> Replacing Max's solution for this one does cause this one file to
> compile fine, but other -Werror=3Dstrict-overflow problems are simply
> found later (see attached).
>=20
> Combining both Max's patch and this one causes this part of the build =
to
> succeed, but still causes the -Werror=3Duninitialized problem to =
happen as
> I reported earlier:

Suppressing a given Werror is a workaround. So I am more interested in =
code changes instead
if they are new so be it we can fix and send them over to chromium =
folks.

>=20
> |
> =
../../third_party/WebKit/Source/core/inspector/InspectorTimelineAgent.cpp:=
234:8:
> error: '<anonymous>.blink::TimelineThreadState::inKnownLayerTask' is
> used uninitialized in this function [-Werror=3Duninitialized]
>=20

This is easily fixable by helping compiler with defining this to 0 or =
something where its declared.


> Best regards,
>    Trevor
> <strict-overflow.txt>


--Apple-Mail=_4FF66A93-E75B-4DB2-9D6B-93EC337DDD3D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaERKQACgkQuwUzVZGdMxTCUACdEMKeta/UjaFF0XDlnW7qDyrD
TkAAniHVNZFMjQBa5+qUTlFFuDDgy+Eo
=pP2+
-----END PGP SIGNATURE-----

--Apple-Mail=_4FF66A93-E75B-4DB2-9D6B-93EC337DDD3D--
