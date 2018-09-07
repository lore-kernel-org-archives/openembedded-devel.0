Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B7FD9602D9
	for <Openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 00:12:24 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id j8-v6so6082653pff.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 17:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Ttk73usuInwM6oeG3X2qyjGrKRL0ID3lsPQAFbwX4v8=;
	b=mC/3WbRH1LZl2J4lTxMeHvsF6485tQ7uzVKMKUEkSHiVZdj9qO9jwBjOQlPozbzqqE
	4FIBqBpAK9NYg0WUESjCyEHAwpDRAb3dU4OeNmfYSrg77+6h3t2uVyMcHrnN2zdzgXBk
	GOKjuSvBsMDctzSVrBve/hNmaCVNb4E5DBGcKuAItkBmFCNcqqdPo8tcPyiod+iWLWVE
	x34BvBdgGisgQoWp3Jtn9sMTn2iatTqNRVsyLWnHPycisprSyE3nvIlwYuGN8Jr+fhnw
	xONQq4/FfuTIz2TFMcDHGDH9QPzzHLcfiC3/nctLRusJhIz0ehkmuyyWZdGJng6whqMo
	CBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Ttk73usuInwM6oeG3X2qyjGrKRL0ID3lsPQAFbwX4v8=;
	b=rzMcjnu3oowsVeg2Krko/By4vrE+EvWp8fPy0BnbRfrbFySOcKVhfzb0L/ae5rYZpc
	RpzSVw+YdFSlQ2e37oIfygOPpgLSDU6uGF4qEwKMq9QTDx/5rWepJmeTvP88jkVMFOFr
	RJOze5U6gj+lKcHsErjA/BvcZtehl6uVKGQMD9R6Qf6YUjO86XnXp7txaP9PHKjb3180
	IOjvK1es5G4FeXD8uhTNdgQjJZ8W/fTYPwwyxK7VSFh2lBI3vz1diEbl907GTRyalFqX
	Ztp4R2xv8pFNcJDWx1wcd7ASK9dTILPAEaz/z8dOeLW4qJBM7hYwtzTZPkH0n5Ss9WJm
	ppMA==
X-Gm-Message-State: APzg51DAGxBTVdpxq+qC7aQde26ZbDNUnEBMQ9f7jCC5mdu4wTdELIiY
	bR7ADT8l/1rDr5gNu6K3siBtsGhv
X-Google-Smtp-Source: ANB0VdZZ0OsQ87CLOAeU3/q6dm/nzxo2MHZStpApkHKivIzODyblGfpBdkknbkXKaQg+hxSrEBteew==
X-Received: by 2002:a63:e841:: with SMTP id
	a1-v6mr5419961pgk.126.1536279145148; 
	Thu, 06 Sep 2018 17:12:25 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:fc25:43f8:d4d:d1b3])
	by smtp.gmail.com with ESMTPSA id
	o20-v6sm13565901pfj.35.2018.09.06.17.12.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 17:12:23 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <CAMKF1spYyj-18urxsniwFac5TV__ve_NY71L_ruyvF+XJ-H3_Q@mail.gmail.com>
	<20180905093027.GB1795@jama>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <a2124380-a155-6ab4-2569-b5f0c37c7b73@gmail.com>
Date: Thu, 6 Sep 2018 17:12:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180905093027.GB1795@jama>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-09-02
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
X-List-Received-Date: Fri, 07 Sep 2018 00:12:24 -0000
X-Groupsio-MsgNum: 74403
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Fhyy1XMfeXDdpFKXO7Iv0msn3WcHIF5Mc"

--Fhyy1XMfeXDdpFKXO7Iv0msn3WcHIF5Mc
Content-Type: multipart/mixed; boundary="B9bmLcMxyBGFN6ff0DS5h3AJEf35bEaES";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Message-ID: <a2124380-a155-6ab4-2569-b5f0c37c7b73@gmail.com>
Subject: Re: [oe] State of the world, 2018-09-02
References: <CAMKF1spYyj-18urxsniwFac5TV__ve_NY71L_ruyvF+XJ-H3_Q@mail.gmail.com>
 <20180905093027.GB1795@jama>
In-Reply-To: <20180905093027.GB1795@jama>

--B9bmLcMxyBGFN6ff0DS5h3AJEf35bEaES
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/5/18 2:30 AM, Martin Jansa wrote:
> On Sun, Sep 02, 2018 at 10:43:02PM -0700, Khem Raj wrote:
>> http://www.openembedded.org/wiki/Bitbake_World_Status
>>
>> =3D=3D Number of issues - stats =3D=3D
>> {| class=3D'wikitable'
>> !|Date     !!colspan=3D'4'|Failed tasks    !!|Signatures
>> !!colspan=3D'15'|QA !!Comment
>> |-
>> || ||qemuarm ||qemuarm64 ||qemux86 ||qemux86_64 ||all
>> ||already-stripped ||libdir ||textrel ||build-deps ||file-rdeps
>> ||version-going-backwards ||host-user-contaminated
>> ||installed-vs-shipped ||unknown-configure-option ||symlink-to-sysroot=

>> ||invalid-pkgconfig ||pkgname ||ldflags ||compile-host-path
>> ||qa_pseudo ||
>> |-
>> ||2018-09-02 ||38 ||38 ||46 ||36 ||9 ||0 ||0 ||6 ||2 ||0 ||32 ||0 ||0
>> ||1 ||0 ||0 ||0 ||0 ||0 ||0 ||
>> |}
>>
>=20
> Sadly looks very similar to previous openssl-1.1 upgrade in 2017:
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.2017081=
8_090627.log
>=20

yes :), I have sent few patches since, which should make things better
but other layers are going to go through same if other layer maintainers
are waiting for 2.6 to release then my suggestion would be to start a
bit earlier.


--B9bmLcMxyBGFN6ff0DS5h3AJEf35bEaES--

--Fhyy1XMfeXDdpFKXO7Iv0msn3WcHIF5Mc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW5HCXwAKCRC7BTNVkZ0z
FDVVAJ0ZAL8PpD9kYbCRxPJsCT+fLsqfqwCfZt//c/nBrpYZJEjQPpXDDAbfXHA=
=kGsc
-----END PGP SIGNATURE-----

--Fhyy1XMfeXDdpFKXO7Iv0msn3WcHIF5Mc--
