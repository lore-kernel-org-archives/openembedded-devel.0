Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0CF601B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 19:39:13 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id u186so5319728ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=PN11tfBk2UA8Kq2KxDO+X2n7BxAF4UBb7Hrff9yG8WU=;
	b=NtEiwl+grNkMRmcl+Pl16BUnuYrN/m6DXVkGuZzltaxOva/g6pv5T+pvlbAPYznFzE
	Jz6x3NS1GcQ98pFyDy1/R2uJ7lrxlzCpW/zxkdWv2UiiQuk36o4gm3O5dKssTpPaBU49
	jQlt3se4QC5lz0hpbQBUQVZDLrvLHngIHUtw5SX6gAp1Bx7pBddK5CyRS4/F0pVu1s6o
	/50gt1zHCf7cXMhScOMD51+/8V8iN3K+31ulyJBru5MyQpgoXPt8y1x4rnVsCJQZqVvS
	FS6R3HinCWOywcgSVT8uOl+iRlFbYWuzEVYStB9787cPt0FKdnJwU3uwSfdsLLD9eFcN
	hnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=PN11tfBk2UA8Kq2KxDO+X2n7BxAF4UBb7Hrff9yG8WU=;
	b=Zl1iqC2ZYi1tlBMqNgFOb1GIFsPyS57FMdyxkm8UTLQEIJL1UDlyR6eDnnzS2ESElM
	DLGW6VlZjqWuyMMnx1DAwAFFGVTqCgV6wwDNiTmTwJ6gq7Rlj2peoNWrzhx9th9YPBJ+
	ybRQ7BjGwaaml4kWwJ8djMzkV2t6a3/T8Ursb6VHk0t0j/iHo+s4GKxEQzv2lNV4bOtc
	mOd8pVCk7C4zTS9I8gJW8Qsma4sWOC5fj6N6tkgmhKR9QNsAtYb0kVe71Xps5xsNvNTJ
	udv3KbwQBSfTvtrxSYV/SypCISdSYq7AZjuGt571BvnzeW+UGk3kvidNB5goQyfWMpmy
	U18A==
X-Gm-Message-State: AEkoouttWxCG+B6tOV+trHnBB85SIIvEwvMVFi5t1amxROG9H/FzizPKimnXuPpozxMzAQDCKi0aymo5MYhbZ1Cq
X-Received: by 10.36.20.75 with SMTP id 72mr11618333itg.83.1470944354189; Thu,
	11 Aug 2016 12:39:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 11 Aug 2016 12:38:53 -0700 (PDT)
In-Reply-To: <bef7bc37-7691-5631-d232-80ffc0e29e26@smile.fr>
References: <bef7bc37-7691-5631-d232-80ffc0e29e26@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Aug 2016 20:38:53 +0100
Message-ID: <CAJTo0LYzmcMhA22cdJX5mS1n30tN1G9XSD3LV+-CpEVOQC=OQA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [Jethro] Can't compile gcc-cross when gcc-6 is the host compiler
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
X-List-Received-Date: Thu, 11 Aug 2016 19:39:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11 August 2016 at 13:40, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> This helped, and allowed me to go much further in my build, but the recip=
e
> gcc-cross-arm still failed. To be able to compile my build I had to add t=
he
> following to my local.conf
>
> CC_pn-gcc-cross-arm=3D "${BUILD_CC}"
> CXX_pn-gcc-cross-arm=3D "${BUILD_CXX}"
> CC_pn-gcc-crosssdk-x86_64=3D "${BUILD_CC}"
> CXX_pn-gcc-crosssdk-x86_64=3D "${BUILD_CXX}"
>
>
> So apparently, gcc still has some reference to $CC and $CXX hardcoded
> somewhere (I think it's in do_configure)
>
> It seems to set $CC in the do_compile correctly, but not in do_configure.
> And it never sets $CXX
>
> I tried to understand what the GCC recipe was doing wrong, but I couldn't
> find out on first look and it's a really complicated recipe
>

Could you try adding a do_configure_prepend to gcc-cross.inc that sets
exports those (and extend the do_compile exports) to see if that solves it?

Ross

