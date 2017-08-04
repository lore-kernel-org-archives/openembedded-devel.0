Return-Path: <garbados@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7A43F71AFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Aug 2017 21:30:58 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x64so7023019wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Aug 2017 14:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h/H/sUkJ4XOz6jcpKwhY1hVI548RBzpixL/MhNpfG3w=;
	b=qfxE8CrTDCV5yh1NcVf9xwW+KGxwCPR+9OH+rpg6f3JWRiCp+nKMHoi4+i/UWooHDd
	eOATM4cHPmKyerRTpnpjrjNM09UG/NXVKMQ8gL/14Mcl2MqmoppqzEn7ArMIKCuG7JTa
	nP/3oMGYGy8nh59GJf/mQ5esaHJKLmc9AeeciGjQH2uFXT14NK3kg83iam73I3HfrENw
	lNHiT5x9Nn7WGG33aLoU8xah752DpWvRHymQFU70k1J9nOcj0820jn1tQ0My4JrTZ+Zo
	gAJlvMRMbVTX8NmQKAca5WTDZLyU/3mHzNswybRx9j/HnTMuB6DqsQWm/x4P+atMGPVx
	kT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h/H/sUkJ4XOz6jcpKwhY1hVI548RBzpixL/MhNpfG3w=;
	b=kVafMxGz1aMnfqGE5TRkg5k+kVFU6pGteGMo1wcSxU+eSn7jVvjqHdxrDl+/0s6W+D
	HSWAQr8OZyoNw1Pf8h7mxV/qhQOjgAMFqjmInAzlFtT9a3xYcz5tdY+YHLdv5z88LKJn
	TYiZQu9zXbpxmPLg1W60V58kJ9VsyKmi+T0/CkAZZ0YwlrAdGHlXKeZTMXTyrffTGnLB
	Y/Q65sqWs39R3B72INqN6f5SrU8MV6K653QOpl60DODZf8mOyhhRSLYLUfuCrBnEaCzS
	fwp/Hl7FptKXAPwTp5jqwUnEkcDO/3ezgh8vSLiF+1ko2wBIbzVxIW5mYcvFz9IlTFqo
	sgXw==
X-Gm-Message-State: AIVw113X+mQ1s4OHDjYatkqoJyNHixpX+yxO6U6ARoHZ1qVRkEPEi0kS
	pWA+QyHuHd+v6ExnAOUusnzt13l9pw==
X-Received: by 10.80.140.253 with SMTP id r58mr3962961edr.123.1501882259297;
	Fri, 04 Aug 2017 14:30:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.167.164 with HTTP; Fri, 4 Aug 2017 14:30:18 -0700 (PDT)
In-Reply-To: <CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
References: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
	<CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
From: Diana Thayer <garbados@gmail.com>
Date: Fri, 4 Aug 2017 14:30:18 -0700
Message-ID: <CA++8a_BLciSLffmy_MyxyeSEWCX+07BkiQ4u80Rz+upJ1rzBdw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-openwrt] Issues adding layer using readme instructions
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
X-List-Received-Date: Fri, 04 Aug 2017 21:30:58 -0000
Content-Type: text/plain; charset="UTF-8"

Alright. I've added it manually. I get this error:

```
ParseError at
/home/garbados/openembedded-core/meta-openwrt/recipes-core/images/
openwrt-base-image.bb:5: Could not inherit file
classes/image_types_uboot.bbclass
```

This is also the error Toaster gives me when trying to build the layer.

On Fri, Aug 4, 2017 at 2:25 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi Diana
>
> Haven't seen anyone report this error thus far
> I would suggest to add the layer manually to
> Bblayer.conf and see how then you get better error messages during parse
>
> On Fri, Aug 4, 2017 at 1:45 PM Diana Thayer <garbados@gmail.com> wrote:
>
>> Hello!
>>
>> I'm experiencing issues building with meta-openwrt. Following the
>> instructions in the readme <https://github.com/kraj/meta-openwrt>, I get
>> this error:
>>
>> ```
>> $ bitbake-layers add-layer ../meta-openwrt
>> NOTE: Starting bitbake server...
>> Loading cache: 100% |#############################
>> ############################################################
>> #########################|
>> Time: 0:00:00
>> Loaded 66 entries from dependency cache.
>> ERROR: Parse failure with the specified layer added
>>                                                           | ETA:  --:--:--
>> ```
>>
>> What failed? Why? How do I debug it? I followed the directions step by
>> step, both within openembedded-core and poky.
>>
>> Thanks for any help you can provide.
>>
>> Best regards,
>> Diana
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

