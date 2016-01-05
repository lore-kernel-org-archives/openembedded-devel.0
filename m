Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5C87C6FF7B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 16:17:20 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id o67so470590304iof.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 08:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=BWPjGAfKt2o/jaeJd5mfAOrHgV4ThmXNikBp6JCV0UQ=;
	b=rIA57OpnmybIjkT6HeVgrTjAe6tsdMz/xGZB+vtMZ0d3MmkfRRVHwh0DaD3ayh9osr
	LC/p8CTgTdohOmt0Z1zvvLitwlpgn3//JOHNVWJH7e51j0Fi0UW8aX3uC3lHIEppLqlj
	/rYNhzzXs/lk00IGjbqNiyu+4o8o97s59DAAakyO/COmh7Adaf0SzvPZwe4TcmgNq+xl
	XeNTLibe+h2pQVrfvfG1tvtb3/OSXNaoWiI4r8s0rXhaxH1sLT55xSSDz/FpjOlZZibO
	ejeRNOtV0pozBHg9gtofuiZpw++PEQulj1gcYUw76O/qL/pUFGPSV4FDBIJJXiMCAMrU
	1HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BWPjGAfKt2o/jaeJd5mfAOrHgV4ThmXNikBp6JCV0UQ=;
	b=bW7jTXZm9v/FPu40Ow/pK8XotLbfYJcJKUfsY+WleiiNGusYsioZpN+Twg5Ar3VSdJ
	2p/sib/d22wjtbxutNdZd48Twwvzv5I+LUCUqpaqbDmdrWX4LwlrW6Pzaw4x9g7IwwEL
	J61f4+Xh7Ye/etC3rX7U11WcY8gNlo8H988eZbqoF5j5NKK3vV6eatHEt+3M0zCmoOKj
	IT5yvK2faeQ+mlLFelnEpK7C8uAhVOpo/YVBoXAPwGJMWXtGKE8W71Nu5kcLiIphh8Xm
	CUdexHiBtr6VVR8T2qaEWTaaORCYb7X1zJI4u+dvsvm+baS3d4LaLuqh79Ep0F1mTlYP
	ng0w==
X-Gm-Message-State: ALoCoQniXcFz++yZAEkcuEytk2jVAqaaebLzxU8v/8Cm3Y9oYl2OVeffPHlVMXLP5ujTflid17pJkvZvjKSjMHUzjDTdhTg6sdmKwLA76eNKKchBrRtuEOs=
X-Received: by 10.107.135.104 with SMTP id j101mr57241958iod.133.1452010641214;
	Tue, 05 Jan 2016 08:17:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 08:17:01 -0800 (PST)
In-Reply-To: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 16:17:01 +0000
Message-ID: <CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] glibc 2.23
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
X-List-Received-Date: Tue, 05 Jan 2016 16:17:22 -0000
Content-Type: text/plain; charset=UTF-8

On 4 January 2016 at 19:00, Khem Raj <raj.khem@gmail.com> wrote:

> I have done OE-Core only clean world builds for all Qemu machines
> without a single build failure and
> runtime boot tested.
>

I threw this at the autobuilder and glibc failed to build on one of the
runs:

http://errors.yoctoproject.org/Errors/Details/26057/

Ross

