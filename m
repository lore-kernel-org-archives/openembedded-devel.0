Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 003CF76294
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 14:07:44 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id n63so32210884qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 07:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=KTv/hNHQbn8ivLdicxQYCJyKvwxs8Td+6K64kbS1ito=;
	b=ouW/ShSTsb7leSY3v2JhP/nEGlLiV6/2EiUYMUSyEsXeUkr7Oa1d+5yBsYFvRvb8EB
	zxsGb3JAsw1sq6WHMTWt0s4Nyoo/b/J1HsV3Hi8N9fPwMuw/HVLAfrRxrqhZOgl3RRyv
	vrYQYhyxgnuGgKNZgV0Bi4XHoagzkcpFT8PFKyGVRRojShAjwI38pf377lIKc6i0nXaB
	dbsM0usxLq1A5/LPdMuC8YGukCp1KfzHQWquetdihwYm4HTpwlhHeLeBLx56pBER1di5
	YKnZXj5S/WArRqXiusbqb+kGpANPVQRTAw2GDcu25GnA7NJW5cGQ08AyAedwozPs2Q5U
	OrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=KTv/hNHQbn8ivLdicxQYCJyKvwxs8Td+6K64kbS1ito=;
	b=fcyjzT2BYmZ7aIvTgJBZ+fNDR81NpXae94bcFovWWui/TiUrs4wLxKk8X3IyUXYffd
	ogUexlj3ObGqI+TEIEPpx9+NtStUj1iV/ERnMNNefTNthFxTXLhQEAOk0YEdXDjRFBQe
	HugNXTrfh8RK2ej4gEoXDrB7Mx1Wsay2es4xJFTL/vUlNupUrQWxWzeX0Sz8F8BUaSP2
	0FHu+fSrQqw8MRYwuXQ7g6HBfvvH2+vQKIuzF4AkkmkNOing2jVUt9kRtMD5ADH08uE5
	terpUsuUmtA2FvgZ+frorK2FKz+n1rDqMtXgGN6nLiKHJh3OImmbf6aWXf5rmSQ1t/W0
	vZ9Q==
X-Gm-Message-State: AOPr4FXMtZzgTz6IGHA5xyR8N4baN2OUhBfnNk79Pa3eBLXzh2AoNMVchx6y+g/sj3ekXPCiLvESadC3lWZbjg==
X-Received: by 10.55.200.137 with SMTP id t9mr15263626qkl.41.1461852465047;
	Thu, 28 Apr 2016 07:07:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 28 Apr 2016 07:07:15 -0700 (PDT)
In-Reply-To: <5721F2E8.6080306@pseudoterminal.org>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<5721F2E8.6080306@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2016 07:07:15 -0700
Message-ID: <CAMKF1srrSNia6vEp4qO=NiFWtchcytnSRu3-nOg0W6CG9CTPcQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 28 Apr 2016 14:07:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 28, 2016 at 4:24 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> Something that concerns me is a note from
> https://gcc.gnu.org/gcc-6/changes.html :
>
> "Value range propagation now assumes that the this pointer of C++ member
> functions is non-null. This eliminates common null pointer checks but als=
o
> breaks some non-conforming code-bases (such as Qt-5, Chromium, KDevelop).=
 As
> a temporary work-around -fno-delete-null-pointer-checks can be used. Wron=
g
> code can be identified by using -fsanitize=3Dundefined."
>
> Sounds like this has potential to break a significant number of packages.

Thanks for bringing it up.
it could but then these need/will be fixed in due course. I would not
recommend changing  OE wide
compiler defaults for few apps. The relevant fix can be applied per
recipe if needed

>
>
> On 04/18/2016 07:15 AM, Khem Raj wrote:
>>
>> Hello all,
>>
>> I have put together a potential gcc6 upgrade recipe set, and pushed the
>> branch to tree here
>>
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-=
6
>>
>> and also at github fork of mine.
>>
>> https://github.com/kraj/openembedded-core/tree/kraj/master
>>
>> You need to set
>>
>> GCCVERSION =3D =E2=80=9C6.%=E2=80=9D
>>
>> in local.conf to enable it.
>>
>>
>> There are few recipes in OE-Core which still don=E2=80=99t compile e.g.
>>
>> see
>>
>> http://errors.yoctoproject.org/Errors/Build/14782/
>>
>> any help in fixing them or otherwise fixing other layers is appreciated.
>>
>> gcc6 is a major release for some info see
>>
>> https://gcc.gnu.org/gcc-6/changes.html
>>
>> and porting guide
>>
>> https://gcc.gnu.org/gcc-6/porting_to.html
>>
>>
>> Thanks
>>
>> -Khem
>>
>>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

