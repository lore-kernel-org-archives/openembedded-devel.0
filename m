Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.5880.1595052928295827943
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 23:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@stusta.de header.s=default header.b=Dkv/d+Rh;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=vpnl=a5=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B7yQh1tFyz4R;
	Sat, 18 Jul 2020 08:15:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1595052924;
	bh=7osqBNxa2g9SDX2AGTquSSpVqjv7YSlG4tK2jiUM53Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dkv/d+Rh+U0fQODkQ1O1BdLDdj2w2uA3vAPprVPR0caSer2Fgq7LxzhbpKe6f84BT
	 y/Rgz3y0GoVFceJu33lI7hi5yZFJaF7FVKuJafgSuuVmwXyUfFRfZd/e6d3vpmDBtC
	 ZW/AntkozbS+T4Aw5QtG1n933IViSDoCXxT+cLklRVF2n2FuC+2KVnSa2on1RRP8g9
	 sL/WNBqRdkVp4JUt+Su0QCOF0QPw6Ffk2K2BPBoT91sFUQ071ot+KtKXTjSHwbKmzu
	 TgEum1vRyrFFJRofKVWzXmThrNNI1kzU7wxm/lbt7M72TIqJyDMfs/khj0wGlQsE2+
	 Q8ruJ5Vca5YJ/cu4JhsiahRree0Fs5JBzCLaMucva5Uy775wr3r5wLurU/gl4i58Ez
	 1bN6Hkyne+eEZzCOIDJDRZEfwENzhT0VUCpPzMY9chn/MyAFhqqzM93b+LuOQzOGOQ
	 oWSzZcCdiIdAKterhjDImf6mqSBgi+KXrMgi0gqWFF6HwSLYMOgdWmoZESb8C+h4ve
	 aNRTFsng7FV+bDqx9vkUCbYUor2k5cV8Asb5P6YWqibFj5n1zEKGKgqFQBt1Ute+sf
	 cwaxByRseFwydBgtfqJFJh+2aaTwsmQszsVSdgDSYgNVli4gEvDMHnfFzhBKRoiQmf
	 ODF6owVSj9xmFAU2C8owRhNU=
Date: Sat, 18 Jul 2020 09:15:22 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [dunfell 1/2] Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
Message-ID: <20200718061522.GH1229@localhost>
References: <cover.1594999160.git.akuster808@gmail.com>
 <0e0b4892f50808b87223a1e8dbcd13d4e16368cf.1594999160.git.akuster808@gmail.com>
 <20200717172458.GF1229@localhost>
 <29d972cb-bd13-bae4-9668-57a65c48b938@gmail.com>
 <20200717195356.GG1229@localhost>
 <ca9b789c-1aed-fb2e-207e-3312ff3d293f@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ca9b789c-1aed-fb2e-207e-3312ff3d293f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 01:57:24PM -0700, akuster808 wrote:
>=20
>=20
> On 7/17/20 12:53 PM, Adrian Bunk wrote:
> > On Fri, Jul 17, 2020 at 12:16:10PM -0700, akuster808 wrote:
> >>
> >> On 7/17/20 10:24 AM, Adrian Bunk wrote:
> >>> On Fri, Jul 17, 2020 at 08:20:54AM -0700, akuster wrote:
> >>>> ...
> >>>> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
> >>>> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
> >>>> ...
> >>> This would make the version going backwards, please add
> >>>   PV =3D "1.9.3+really1.9.2"
> >> right.=C2=A0 Wouldn't EP =3D "1"=C2=A0 do the same?
> > PE (not EP) would also solve this.
> right.
> >
> > The problem with an epoch is that it is permanent while
> > a +really version will go away with 1.9.4.
> I don't expect to every update to 1.9.4 as .3 may have introduced ABI
> changes otherwise I would not have reverted this to begin with.

Not in dunfell.

PE would have to stay forever in master.

cu
Adrian
