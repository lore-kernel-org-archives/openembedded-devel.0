Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <colin.foeparker@aclimalabs.com>) id 1Tvsoo-00040V-Te
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 18:00:04 +0100
Received: by mail-ob0-f171.google.com with SMTP id dn14so2751234obc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2013 08:44:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:content-type:message-id:mime-version:subject:date
	:references:to:in-reply-to:x-mailer:x-gm-message-state;
	bh=DBCSxFpB8tAn048VnI8X4VL6oLlVU0SmK0H9eEx4W5I=;
	b=py5ybiNZdGCRditfL4ZI/bSDB4iEDScMb5Xiiu72DMdU6o1fVYGpB2VhV1YMYkcuq0
	dfcJGKE5nGkog6SHpam5z6fZgP79y4zpNydFeAgRhviNabAIYLUxJsmtn9en01f3Cv6w
	RR0jb8vPoPSg5H10Uj9AYyDz7mLhDf6uIuAykFAFMK9zmqMfNygYRZa5pwCgRHZ7bVl3
	HIaSH9Gnm4XyuXpX/GZFPABe8894EKFvCRSVbKwCB6+i9rBCr4ITgOdRgVc/uFAyfpJM
	alfDHXkDf02ejbcBBxZXxLk+sf/wZkmJF2pHMho7IxHq2/pSL+dmUjcdM1fjywFbeX8o
	Zf2A==
X-Received: by 10.182.136.68 with SMTP id py4mr4411300obb.38.1358441075064;
	Thu, 17 Jan 2013 08:44:35 -0800 (PST)
Received: from [10.10.0.115] (108-94-24-230.lightspeed.sntcca.sbcglobal.net.
	[108.94.24.230])
	by mx.google.com with ESMTPS id g8sm1375714oba.16.2013.01.17.08.44.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 08:44:34 -0800 (PST)
From: Colin Foe-Parker <colin.foeparker@aclimalabs.com>
Message-Id: <1725C8BF-53EF-400B-983E-9C729EBE8730@aclimalabs.com>
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
Date: Thu, 17 Jan 2013 08:44:34 -0800
References: <1358377712-18666-1-git-send-email-colin.foeparker@aclimalabs.com>
	<20130117124858.GF3067@jama>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20130117124858.GF3067@jama>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQkuGac2s3rrtvxqSEUKxhRuec2pIBqN5niFBuBJW4lBcH22l/wme4LxAtOXyVrMlNpRuo9y
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] META-OE: DENZIL Branch: SSVB-CPUBURN-A8: MD5SUM and SHA256SUM don't match source.
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
X-List-Received-Date: Thu, 17 Jan 2013 17:00:05 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Jan 17, 2013, at 4:48 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Wed, Jan 16, 2013 at 03:08:30PM -0800, Colin Foe-Parker wrote:
>> Updated the md5sum and sha256sum for the ssvb-cpuburn-a8.S file
>=20
> Please read README how commit subject should look like.

Sorry, I will get it right next time. :)

>=20
> Or just see other examples.
>=20
> Change to denzil needs to be in master/danny first (if it isn't =
already)
Can you point me to a description of the roles of the different OE =
branches? =20

> Change of checksum should be explained in commit message and also
> include diff between old and new version

I don't have a copy of the previous version of the cpuburn sources.  I =
tried to build it from
the bitbake recipe in denzil and it failed with validation/fetch errors. =
 So I pulled the sources, built, and tested them manually.  After I knew =
that it worked I updated the recipe with the new md5sum/sha256sum =
values.=20

So this is patch is truly reactionary, I was just trying to fix the =
bitbake recipe so that it would build.

That being said, it appears that "Otavio" already fixed this issue in =
the master branch but it hasn't filtered down to denzil yet.  =
a17cda6e85f990bd3569df731ec0f223b185ec6b =20

-Colin

>=20
> Cheers,
>=20
>> Signed-off-by: Colin Foe-Parker <colin.foeparker@aclimalabs.com>
>> ---
>> meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb |    4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb =
b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
>> index bb9ca1c..68833e6 100644
>> --- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
>> +++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon.bb
>> @@ -13,8 +13,8 @@ SRC_URI =3D =
"http://hardwarebug.org/files/burn.S;name=3Dmru \
>>            =
http://github.com/downloads/ssvb/ssvb.github.com/ssvb-cpuburn-a8.S;name=3D=
ssvb"
>> SRC_URI[mru.md5sum] =3D "823abc72c2cd448e87df9bc5355a4456"
>> SRC_URI[mru.sha256sum] =3D =
"01d9fc04f83740c513c25401dcc89c11b2a5a6013e70bfca42b7b02129f88cd2"
>> -SRC_URI[ssvb.md5sum] =3D "f1af41dcd56e4f0f7e92b67109dc01ed"
>> -SRC_URI[ssvb.sha256sum] =3D =
"95e2267a684be0d848dd6f935e769fa3ed810274ebacddc3fe8ddac4b34838c2"
>> +SRC_URI[ssvb.md5sum] =3D "0acc570d943c41c7f8602b9ff6fa111d"
>> +SRC_URI[ssvb.sha256sum] =3D =
"bfddd3226a499ffdf71bb58c05ccdc6dac5bb2c2c3bdb10ac610ee0b60aac087"
>>=20
>> S =3D "${WORKDIR}"
>>=20
>> --=20
>> 1.7.9.5
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


