Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9D13F755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 12:08:28 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so40908142wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=5et0/Zaio8dfqfdCWaqzkq7ZcXP0Bws3GWsK+M6hBow=;
	b=G9y4kZXCMcoODY3kzPThTqCmQc6bz/sGgianGhu1kHFjXbIEVEQhtG/PUSz7Px7kp5
	Ka52YrkPwt7/HpYXqDMSK76x2kNFi7mLp25GU4oTUK1U5i4Hp2MzrA0CcS14GHQEHP79
	rVjXfIwVz4RRuzeLqcOIV6LEWKIFccavVowXdnk/U4pOfKtRfz3a+N9qYBUNT2BWwJ1f
	FDlNX7nHCCbBvROA39Ls/CT4eaUkPJ1JoNI44ZEs7EgRPBgodTAJZfl+T7KrrUrdpChe
	wXuS1Jlm0s4LcPQhSgOgUznkWVvYKkYXszf58ygdbFcui9n6kyq0GQQuErukIlkxre91
	BurA==
X-Received: by 10.194.89.98 with SMTP id bn2mr1603565wjb.55.1446120508044;
	Thu, 29 Oct 2015 05:08:28 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	bf8sm1491694wjc.22.2015.10.29.05.08.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Oct 2015 05:08:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <563208F3.1040900@skidata.com>
Date: Thu, 29 Oct 2015 13:08:26 +0100
Message-Id: <CA01E751-CDBE-4B96-8949-BA919E3572F9@gmail.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
	<A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
	<CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
	<9E01DDA7-C832-4E17-B17A-25850D0B27B5@gmail.com>
	<563208F3.1040900@skidata.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 29 Oct 2015 12:08:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 29.10.2015 um 12:54 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>=20
> On 10/29/2015 12:24 PM, Jens Rehsack wrote:
>>=20
>>> Am 29.10.2015 um 11:46 schrieb Otavio Salvador =
<otavio.salvador@ossystems.com.br>:
>>>=20
>>> On Thu, Oct 29, 2015 at 7:22 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>> Am 29.10.2015 um 08:41 schrieb Richard Leitner =
<richard.leitner@skidata.com>:
>>>>> To cite Otavio:
>>>>> We could rename the patches directory for openjdk-7 and avoid the
>>>>> version number on it. This would make easier for upgrades and to =
see
>>>>> the diff between the patches.
>>>>=20
>>>> So git diff -M doesn't work for you? I don't understand the =
reasoning.
>>>=20
>>> It does but reusing the directory easy the upgrade and as the
>>> openjdk-8 is in maintenance it is expected that it does not change
>>> much in the patches.
>>=20
>> Partial. As I told you, I updated OpenJDK from 8u40 to 8u72 when I =
first
>> encountered massive crashes on the target device with zeroshark until
>> llvm guys told me, that legacy JIT for ARM was utterly broken and =
they
>> force people to MCJIT.
>>=20
>> Having both directories during the upgrade helped me massively to
>> avoid breaking patches by fixing against new upstream adoptions.
>>=20
>> Surely, this could be handled developer-side by keeping an foo.old
>> directory - but it smells the same smell ;)
>>=20
>> I don't fight against renaming the directory, I just argue, both
>> way have their own kind of smell.
>>=20
>=20
> I really understand both sides... But for me, due to the fact we want =
to
> support only one version of each OpenJDK release, the patch directory
> without version has "a better smell" ;-)
>=20
> I would also go one step further and omit the version from
> openjdk-7-release-*.inc. Then the version number is only included in =
the
> name of the openjdk-7_*.bb file.
>=20
> But I'm open to any discussion! So what do you think about it?

I'm fine with both when you assure that you handle any request regarding
that topic ;)

So when I'm going to rename the files (fine for me), than you have to
fight with requests about file/patch-dir names from community ... :P

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


