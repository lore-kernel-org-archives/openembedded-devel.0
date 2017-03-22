Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7118C7302A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 10:59:15 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z133so8636211wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x3bMOCRfU5GU+ykEQtNdqSuRPrDBjg1nGRMvhgS3sOg=;
	b=TpFA9UvDPvwSIX9gk8ZInimHUHDh9e0N84SwryPgUv9mKZToHumkSnzJ8sJ3zqHz9W
	ogExJgizsxUaBWNpjFaDt4PnlfE7Xrmlazi7RxpyLjtzRI/BaV4eI9nW8UncCPT1dVaY
	QIK/7KnFDJHi9pVGo/RSgNBdkKh6XUWwnv5Kv9LebAgZ0RZMk0bH8vKTx6GnVgxeQErF
	A1yh2eZzkjL/HlUdpwfCdXZt2k/Y0kFmoy6KrGxzyUj+tsIPxWVmQNnPtR2uJmJJV8dA
	A+kuwzIMKJclqYbEaTPPOBgwmHM6r579DwshF425Lb1hVjHEVqAgpCtpWB4MYSjioZTZ
	4E0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x3bMOCRfU5GU+ykEQtNdqSuRPrDBjg1nGRMvhgS3sOg=;
	b=RFMycYBbgSOMAfZNpG28tAJ7CH6mT0z4Spa6K4X5Z/Tlr22XYbJrLL538nX3K+RMVJ
	nLa6a4pmYhQJS1f4zDhY49Y7jgPEDCWTc+TC7dA2uQ9cwKmtt3zqFhpVdk3EOkqpjq9i
	VPxQKkL5D7LYe0whOXZ0pcGwDIWsAR5PRvAmeS2bluptsl6vkWrIgA7WvU249vnaGUpA
	DmwuPGyXPSGVa/e1IG3ifjpdZd8ifRPyO22/d58j/cmd2zPDNK+m6DGsMKuOJLj8H6E8
	q26lb6xdopm9sE39qIuIOxgxv3xetpSNsfSpc18AG6rZECD3Yn39U5P2iin+HDcnN3H5
	xHtw==
X-Gm-Message-State: AFeK/H3ukfNizvD5cqUDhew2ayz3ODDOwC1ZBcPHFrF+5eC3VUs3bJzgJWVMSTbVf2/wNQEk8HHF6AEfHyHtNw==
X-Received: by 10.28.134.70 with SMTP id i67mr6882780wmd.124.1490180355992;
	Wed, 22 Mar 2017 03:59:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Wed, 22 Mar 2017 03:59:15 -0700 (PDT)
In-Reply-To: <1a1d1994-a982-fa0a-667a-6bd3a8d50b79@windriver.com>
References: <20170313032921.8669-1-kai.kang@windriver.com>
	<20170313032921.8669-4-kai.kang@windriver.com>
	<1a1d1994-a982-fa0a-667a-6bd3a8d50b79@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 Mar 2017 11:59:15 +0100
Message-ID: <CA+chaQdT5OFOg2weDe7ixSiz4PxGFAjtHm234Dn=HsBYZKX23g@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libdnet: update SRC_URI
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
X-List-Received-Date: Wed, 22 Mar 2017 10:59:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yes, you can use git repo, just add nobranch=3D1 parameter.

On Wed, Mar 22, 2017 at 9:16 AM, Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2017=E5=B9=B403=E6=9C=8813=E6=97=A5 11:29, kai.kang@windriver.com wrot=
e:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> The official site libdnet.googlecode.com is redirected to github. So
>> update SRC_URI and its checksums. And update S as well.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb | 8
>> +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.b=
b
>> b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
>> index 28b6c82..aff64c2 100644
>> --- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
>> +++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb
>> @@ -4,10 +4,12 @@ SECTION =3D "libs"
>>   LICENSE =3D "BSD"
>>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0036c1b155
>> f4e999f3e0a373490b5db9"
>>   -SRC_URI =3D "http://libdnet.googlecode.com/files/libdnet-${PV}.tgz"
>> +SRC_URI =3D "https://github.com/dugsong/${BPN}/archive/${BP}.tar.gz"
>>
>
> Hi Martin,
>
> It is weird that the tag 'libdnet-1.12' is not contained in any branch. I
> am afraid it could NOT use git repo for libdnet.
>
> Ref:
> https://github.com/dugsong/libdnet/commit/12fca29a6d4e99d1b9
> 23d6820887fe7b24226904
>
>
> Regards,
> Kai
>
>>   -SRC_URI[md5sum] =3D "9253ef6de1b5e28e9c9a62b882e44cc9"
>> -SRC_URI[sha256sum] =3D "83b33039787cf99990e977cef7f18
>> a5d5e7aaffc4505548a83d31bd3515eb026"
>> +SRC_URI[md5sum] =3D "d2f1b72eac2a1070959667e9e61dcf20"
>> +SRC_URI[sha256sum] =3D "b6360659c93fa2e3cde9e0a1fc9c0
>> 7bc4111f3448c5de856e095eb98315dd424"
>> +
>> +S =3D "${WORKDIR}/${BPN}-${BP}"
>>     inherit autotools
>>
>>
>
>
> --
> Regards,
> Neil | Kai Kang
>
>

