Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEF872D64
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 01:03:52 +0000 (UTC)
Received: by pdea3 with SMTP id a3so29025920pde.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 18:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=sBELADy6xCJPkeWBrL0mPflMeswwo/p6cIlpCmJHYyE=;
	b=qqBJQk+m2EYyCUdzWc64wUSSzFsDjQ/cLdoSAB8g46BiXOPGWo/CKf378PUrF1WER7
	2VF6grDDFdGDHK9wBERJq83PgfdWzHTs7+nIDH6bvgn6arNp1lNsINqLtdKL50xilnn2
	nn8FV3QULnJpfaHh5eemvqzRRVo7L4+IL+UY93WcctK/CQFmGx0g+br/aAnKR2JNrgEh
	ZD/hTo0yNA71Q8fiTn3nTMGoauohWEDlGqzUV2AKlwHiQYo3bXmwGK5peSUTGlV7jb2j
	+gDdTqKjl+PWW48LZFVCANO13Q6Qa9IzvSYVcOlK8STn67zpEQ9GFxavmInmtkbWP/6Q
	fGVA==
X-Received: by 10.70.138.70 with SMTP id qo6mr244017pdb.163.1432775033714;
	Wed, 27 May 2015 18:03:53 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:90eb:a06b:3186:ca08?
	([2601:9:3580:84c:90eb:a06b:3186:ca08])
	by mx.google.com with ESMTPSA id os7sm382172pdb.51.2015.05.27.18.03.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 May 2015 18:03:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <79A6FDE8-B52C-4A3F-9F26-7CF27EE17568@gmail.com>
Date: Wed, 27 May 2015 18:03:48 -0700
Message-Id: <A2557B3C-55BA-43EE-826F-F386D88DCBE4@gmail.com>
References: <CAAzKXnhRDirDffx7krgxbCjgjWV2pORdB8g2c7csohzkjp_hqQ@mail.gmail.com>
	<79A6FDE8-B52C-4A3F-9F26-7CF27EE17568@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-browser] [PATCH 1/2] chromium, cef: Fix install path for cef library
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
X-List-Received-Date: Thu, 28 May 2015 01:03:54 -0000
X-Groupsio-MsgNum: 55673
Content-Type: multipart/signed;
	boundary="Apple-Mail=_20A6D202-04AA-4374-9C17-44996DC8A3DE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_20A6D202-04AA-4374-9C17-44996DC8A3DE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

applied

it seems the patch got mutilated on its way, I had to resurrect it.

> On May 27, 2015, at 5:53 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> this change is ok
>=20
>> On May 27, 2015, at 10:36 AM, Zoltan Kuscsik =
<zoltan.kuscsik@linaro.org> wrote:
>>=20
>> Wrong location of cef caused QA errors.
>>=20
>> Change-Id: I56743864f9e7d47e7c87fb26c478cd812d5d6961
>> Signed-off-by: Zoltan Kuscsik <zoltan.kuscsik@linaro.org>
>> ---
>> recipes-browser/chromium/chromium.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/recipes-browser/chromium/chromium.inc
>> b/recipes-browser/chromium/chromium.inc
>> index 377e685..cd8bfb5 100644
>> --- a/recipes-browser/chromium/chromium.inc
>> +++ b/recipes-browser/chromium/chromium.inc
>> @@ -44,7 +44,7 @@ do_install() {
>>               install -Dm 0755 =
${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple
>> ${D}${bindir}/${BPN}/cefsimple
>>       fi
>>       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so" ]; then
>> -               install -Dm 0755
>> ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so =
${D}${bindir}/lib/libcef.so
>> +               install -Dm 0755
>> ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so =
${D}${libdir}/${BPN}/libcef.so
>>       fi
>>       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome" ]; then
>>               install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome
>> ${D}${bindir}/${BPN}/chrome
>> --
>> 1.9.1
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20


--Apple-Mail=_20A6D202-04AA-4374-9C17-44996DC8A3DE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVmaXcACgkQuwUzVZGdMxTtJwCgkTSw8GFM2U+ZGobYt6HWvw37
jE0An2bVxo86zbxrCoEga3U0iRA2UWle
=BpS/
-----END PGP SIGNATURE-----

--Apple-Mail=_20A6D202-04AA-4374-9C17-44996DC8A3DE--
