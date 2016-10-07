Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 100C16071F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 22:12:59 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 190so3456310pfv.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 15:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=sAFAck/32C0c8G05L55pucSoOYgefk9A/zeySy++rdI=;
	b=bpGHNGbp8rYGKOCXd2Wx5OA5+6/YvxVJ3ju6ORF4diYJqLHpsVX5RPiM0PaTxhnjMW
	cp36iUBP4b151WHSjmpzchJUxE56bR43IdcabzJQ4YA2GkLD1ZI0tmvyzihNqhwTRfw+
	TbN+teiuo0QpmdjcYVyYDHm7mtYeSU2YrE1JXXCKM4QrHYsddiho785TcvDiRL6AGngk
	sOdPSPHrRuPnL0ilytWLnsxhGXeg66qlYZEDbKdj66X/dbSZCR6nyeI5mxTWbeo3KxEg
	Dq7b1L9vykZzI5Pphkzxyg8ot9qRhxQP+IlKTHwbEO94afGu48HmLYWcHcX5PiVDOJP6
	uhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=sAFAck/32C0c8G05L55pucSoOYgefk9A/zeySy++rdI=;
	b=ai48B83avxKtA8nCszOj1B77Tn9M2siIqenpmZM9lizxnr+A5ulAmDjvQk9yGsDssV
	c3/52wbC7nQzxXoH4ABuJQxbphCe/dWqzMDfViHmFIMuh70DZuKUSRU9hJU2HHRRVUtj
	3yy9i9LXp4Ynoc/Hmv9bJwCbOYwp2H9WRRE9pjD2+gz+WUx1QEQmrdaWN0E3szgjHrxD
	jAPasGmzNbtRxgCT3Mqx6lfWVGOYZEby+LUxNB23rfnH61lgmJan76vUxqzVewrYeVBC
	qtMj0LhSFq2Wl8J9tXQ8Kc3dNO8KxEV1Ozgs29pcfD8W8iEIErhRioO8Hc74jhc7bPdo
	+PzA==
X-Gm-Message-State: AA6/9Rm991Qzgb1beyXQ+HYdT8Zxf/9GXssAQT5lwnOiN5DtBBiXhg5T0du1bX3VNm8qhw==
X-Received: by 10.98.77.2 with SMTP id a2mr32166499pfb.138.1475878381017;
	Fri, 07 Oct 2016 15:13:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:bda6:ebf7:604d:7ac6?
	([2601:646:8882:b8c:bda6:ebf7:604d:7ac6])
	by smtp.gmail.com with ESMTPSA id yx8sm486999pac.29.2016.10.07.15.13.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Oct 2016 15:13:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRRL2t1anoyHUMtBdWx8+7OkP=GkkdVDYH_Bne6+c7DAXg@mail.gmail.com>
Date: Fri, 7 Oct 2016 15:12:55 -0700
Message-Id: <22CD53EF-6069-450F-8F54-A5A6FB0FF71D@gmail.com>
References: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
	<1475831964-1993-2-git-send-email-schnitzeltony@googlemail.com>
	<E5E0F819-27C7-4FFD-9639-39BF2B9BE459@gmail.com>
	<CALbNGRRL2t1anoyHUMtBdWx8+7OkP=GkkdVDYH_Bne6+c7DAXg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 2/5] jack: remove portaudio PACKAGECONFIG
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
X-List-Received-Date: Fri, 07 Oct 2016 22:13:00 -0000
X-Groupsio-MsgNum: 63421
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D0BF89F4-FD6E-4957-A367-4112A1976700";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D0BF89F4-FD6E-4957-A367-4112A1976700
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 7, 2016, at 9:23 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> On Fri, Oct 7, 2016 at 5:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Oct 7, 2016, at 2:19 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>>>=20
>>> portaudio backend is only available for windows builds - see README =
(and if set
>>> it would cause a cyclic dependency with portaudio's jack =
PACKAGECONFIG)
>>=20
>> should be unconditionally keep =E2=80=94portaudio=3Dno ?
> As long as we are not building for windows: No

does it default to no ? may be its better to be explicit

--Apple-Mail=_D0BF89F4-FD6E-4957-A367-4112A1976700
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlf4HesACgkQuwUzVZGdMxQgPgCfUxe5+4aiLdGEIERd5HVjHfDw
oosAmQGQV6Jw8aE4peGpVi6EimZjiohb
=Tgxl
-----END PGP SIGNATURE-----

--Apple-Mail=_D0BF89F4-FD6E-4957-A367-4112A1976700--
