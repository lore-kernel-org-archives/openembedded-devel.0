Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8E64F6012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 16:52:27 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so196347847pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 08:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=rEbjYanLVCmSlMNaglsa0KOEj8m9Onot+xgh/eHOgvw=;
	b=whNxLK8GE5WYzcZf/C2nsIxmeoEGAJQU566WlhdWANdbvmaltB1SdWNTb2gFKNC39R
	twuZMGcAoA1FJCx/m/JTGvxzz1AtgSPAsyug/mVxcCfWFvaPZZZE23sysgj9JZkUgqKH
	txWpltHFDl5lcbt68qKl4+0NzcDulsx03rMSDcRt9DGuHg2dwkxW6wadR7keoe/5UDWK
	og0MMjLTGKu6qDIdL9MTRlfxOkaE+Z/2qdFr8Mi2WURefIu7N/gLAdpWAHGVuFTkZK4g
	CiOYAmT+IPRbRVT78gT52ylu5jj0T5X1RmcRaABHAFybfZfnLBLj2JGCiMat0iMPnycz
	MNDQ==
X-Received: by 10.66.124.165 with SMTP id mj5mr36416851pab.97.1448297547873;
	Mon, 23 Nov 2015 08:52:27 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:96:49db:54d6:362d?
	([2601:646:8802:5d5c:96:49db:54d6:362d])
	by smtp.gmail.com with ESMTPSA id
	zn2sm11081044pbb.40.2015.11.23.08.52.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Nov 2015 08:52:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKqRoEzU_uHtuBNRzq=3tQi5Um0PV+io6bcCcfm8dfWsjQ@mail.gmail.com>
Date: Mon, 23 Nov 2015 08:52:23 -0800
Message-Id: <D00C1F8D-0789-4430-BFF0-392336C81D37@gmail.com>
References: <1448279098-24980-1-git-send-email-otavio@ossystems.com.br>
	<87h9kcoqw5.fsf@email.parenteses.org>
	<CAP9ODKqRoEzU_uHtuBNRzq=3tQi5Um0PV+io6bcCcfm8dfWsjQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-ruby][meta-xfce][PATCH] Move imsettings from meta-ruby to meta-xfce
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
X-List-Received-Date: Mon, 23 Nov 2015 16:52:28 -0000
X-Groupsio-MsgNum: 58790
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C0B11094-FCA2-4D9A-A1CF-61A1870C0348";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C0B11094-FCA2-4D9A-A1CF-61A1870C0348
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 23, 2015, at 4:29 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> On Mon, Nov 23, 2015 at 10:13 AM, Mario Domenech Goulart
> <mario.goulart@gmail.com> wrote:
>> On Mon, 23 Nov 2015 09:44:58 -0200 Otavio Salvador =
<otavio@ossystems.com.br> wrote:
>>=20
>>> The imsettings requires xfconf to run, making it dependent of XFCE. =
It
>>> makes no sense to make meta-ruby dependent of XFCE so we move the
>>> imsettings recipe to meta-xfce and add the meta-ruby dependency =
there.
>>=20
>> s/dependent of/dependent on/
>=20
> Agreed; Martin, can you fix it when applying or do you wish me to send =
a v2?

I have sent a patch for same last week see.

http://permalink.gmane.org/gmane.comp.handhelds.openembedded/72211

>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_C0B11094-FCA2-4D9A-A1CF-61A1870C0348
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZTREoACgkQuwUzVZGdMxS04gCfT36smW/M0X8gbi0n0Oc7Jej3
whoAn1MiCB45hBUHiFmofFE176g2e0v5
=G4Lv
-----END PGP SIGNATURE-----

--Apple-Mail=_C0B11094-FCA2-4D9A-A1CF-61A1870C0348--
