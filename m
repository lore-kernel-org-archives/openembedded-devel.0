Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 490B177283
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:35:13 +0000 (UTC)
Received: by wmww144 with SMTP id w144so20902053wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 01:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=0ZGezKqeyekvS2IhJOSsDQ4ymHf90dNDw/0CrzOBHmA=;
	b=QpqejK03ks5NgrgI3JMSytMt62Kwu31qVa34pIt5jNjinhItdWj86LajyhcJhbJFBW
	Q2sz2YIbsAArh0ChRuL8luy1ya3jhcXXdHHtm1qe2X9iX7AclkcFTxIlJWK/ZhSuE9u3
	wmNogUg5A14QQdiifWUEn1U2PZqhbHxhKtb0Mv8ipBnDi0jj1Xo1umMYFBtSclAAp3Df
	P54ivqCe57lc+jI+ToZ+L2g8n3sX3MpukaakqKtU1Z4kH6ZDZU7txnHTgRq2uZs0dv3k
	gwrciVOdg46K0dykcwVFIJJ2cATwJV63f1vzoMx6V3YgQtSapgv6VjuseJskt5y1qpWg
	Z6ig==
X-Received: by 10.28.32.65 with SMTP id g62mr2452332wmg.81.1447407313718;
	Fri, 13 Nov 2015 01:35:13 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	v9sm18966490wjv.45.2015.11.13.01.35.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Nov 2015 01:35:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA010C724220@ALA-MBA.corp.ad.wrs.com>
Date: Fri, 13 Nov 2015 10:35:12 +0100
Message-Id: <E53AEAEF-950F-4909-A022-81701B46D060@gmail.com>
References: <1447327014-27893-1-git-send-email-jackie.huang@windriver.com>
	<BA61B1AD-E729-4B0E-ABF1-8B5CC3E2768B@gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA010C724220@ALA-MBA.corp.ad.wrs.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [v2][PATCH] talloc: upgrade to 2.1.3
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
X-List-Received-Date: Fri, 13 Nov 2015 09:35:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 13.11.2015 um 03:04 schrieb Huang, Jie (Jackie) =
<Jackie.Huang@windriver.com>:
>=20
>=20
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-
>> bounces@lists.openembedded.org] On Behalf Of Jens Rehsack
>> Sent: Thursday, November 12, 2015 11:23 PM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] [v2][PATCH] talloc: upgrade to 2.1.3
>>=20
>>=20
>>> Am 12.11.2015 um 12:16 schrieb jackie.huang@windriver.com:
>>>=20
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>=20
>>> Changes:
>>> - use ${SOLIBS} and ${SOLIBSDEV} instead of hardcoded suffix
>>>=20
>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>> ---
>>> .../talloc/{talloc_2.1.1.bb =3D> talloc_2.1.3.bb}        | 18 =
++++++++----------
>>> 1 file changed, 8 insertions(+), 10 deletions(-)
>>> rename meta-oe/recipes-support/talloc/{talloc_2.1.1.bb =3D> =
talloc_2.1.3.bb} (69%)
>>>=20
>>> diff --git a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb =
b/meta-oe/recipes-
>> support/talloc/talloc_2.1.3.bb
>>> similarity index 69%
>>> rename from meta-oe/recipes-support/talloc/talloc_2.1.1.bb
>>> rename to meta-oe/recipes-support/talloc/talloc_2.1.3.bb
>>> index 89c390f..83c8f8f 100644
>>> --- a/meta-oe/recipes-support/talloc/talloc_2.1.1.bb
>>> +++ b/meta-oe/recipes-support/talloc/talloc_2.1.3.bb
>>> @@ -7,8 +7,8 @@ SRC_URI =3D =
"http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz"
>>> LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/meta/files/common-licenses/LGPL-
>> 3.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
>>>                    =
file://${COREBASE}/meta/files/common-licenses/GPL-
>> 3.0;md5=3Dc79ff39f19dfec6d293b95dea7b07891"
>>>=20
>>> -SRC_URI[md5sum] =3D "5dffb86414218a91864ed4453ba9be07"
>>> -SRC_URI[sha256sum] =3D =
"3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb6a459025488b6174"
>>> +SRC_URI[md5sum] =3D "3e285de2228ae67ff0a0f5cec658f627"
>>> +SRC_URI[sha256sum] =3D =
"7aa5f75b22d4ef9c737b25515f2a2837ddc13014ff4ac6e58dd9e311f41f2cb0"
>>>=20
>>> inherit waf-samba
>>>=20
>>> @@ -27,19 +27,17 @@ FILES_${PN} =3D ""
>>> FILES_${PN}-dev =3D ""
>>> FILES_${PN}-dbg =3D ""
>>>=20
>>> -FILES_libtalloc =3D "${libdir}/libtalloc.so.2 \
>>> -                   ${libdir}/libtalloc.so.2.1.1"
>>> +FILES_libtalloc =3D "${libdir}/libtalloc${SOLIBS}"
>>> FILES_libtalloc-dbg =3D "/usr/src/debug/ \
>>> -                   ${libdir}/.debug/libtalloc.so.2.1.1"
>>> +                   ${libdir}/.debug/libtalloc${SOLIBS}"
>>> FILES_libtalloc-dev =3D "${includedir}/ \
>>> -                   ${libdir}/libtalloc.so \
>>> +                   ${libdir}/libtalloc${SOLIBSDEV} \
>>>                   ${libdir}/pkgconfig/"
>>>=20
>>> FILES_pytalloc =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
>>> -                  ${libdir}/libpytalloc-util.so.2 \
>>> -                  ${libdir}/libpytalloc-util.so.2.1.1 \
>>> +                  ${libdir}/libpytalloc-util${SOLIBS} \
>>>                 "
>>> FILES_pytalloc-dbg =3D =
"${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
>>> -                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
>>> -FILES_pytalloc-dev =3D "${libdir}/libpytalloc-util.so"
>>> +                      ${libdir}/.debug/libpytalloc-util${SOLIBS}"
>>> +FILES_pytalloc-dev =3D "${libdir}/libpytalloc-util${SOLIBSDEV}"
>>> RDEPENDS_pytalloc =3D "python"
>>> --
>>> 1.9.1
>>>=20
>>> --
>>=20
>>=20
>> I'm missing the fix discussed in =
http://patchwork.openembedded.org/patch/104719/ - is talloc-dev
>> not empty with the update?
>=20
> No, I didn't involve the above discussion and it seems pending, this =
only updates the version for the
> updated wafsamba.bbclass builds, I think the empty package issue will =
need a separate patch.
>=20
> Thanks,
> Jackie

I think, with the update and after jethro has been branched, you should =
do the update as suggested
into a libtalloc_2.1.3.bb and remove talloc_2.1.1.bb

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


