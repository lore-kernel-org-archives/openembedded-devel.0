Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D953771BD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Aug 2017 22:56:16 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r77so7183448wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Aug 2017 15:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mjyYd9oGT83jMy/A7USq//X7XXr90ocQCROcwJvcH08=;
	b=XUHJOoIdELnIEf2qtWA25GDHEhNHDtSzFSirVTsxef0zZSAnHpOCw5b6IQNOmJUQNB
	dh8WDP72aAnyb+OvqhyaV0c5XEVqMyDwU3KnOHFU3Rkb60TszpHsntzIp/8H94AE4X7J
	nBrdKWRcBGpOa5nlRYJlxE6QoYUKjEasrNCJ7N5KRfxRDjJnpbUoQWKiYAWTNhHKqLIH
	1LlKhUGaL3Pqvkjdd5OoFYDlVpwMYkWxPNiFDsa8UNFXmh3kgK5RlHurcH5dPyKN9rn/
	WjiBoOw89pQa06Q9Jwk7K7wqmT33bvnVaZt+3QpBbbTMuGimoDGlwP6VdvrXci2rKkZU
	Rvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mjyYd9oGT83jMy/A7USq//X7XXr90ocQCROcwJvcH08=;
	b=oDqAgxFWPKy5NY9N3lJMA4L4SssxA9kuJUIRWx980ufv1QHUEgSGtk90me4P6ZqJCB
	UykGs2eCT8zYNA1cQumtnrHn1Ki8e0qW77vawtfO1Ut4mECI0xqw2mqb5q4YulIEN5K2
	c/TeXGwPnGv2MLLWhj9ftk7dx9Lv7OGWsbim1g/5+RN+NqRekRBuafSoVLTXZsMz4fua
	65rwntkGA2p0uX/RSmGsNRohViKlUr4R37GJbPyfumLkypQaZC5Va1NuENVjj21TkjvF
	kla4EyT9YD0FfhewXSfRbggeza6h4VxH3vv9BaX1c79wP2q1GpgOE6z3qLJ3PlYkP1a6
	C2GA==
X-Gm-Message-State: AIVw110sIoEnSCz1F6+JkdyQfwB3IB+dey8nHJSD+8U5g+jPaSD3kLGi
	yhHBxb2H5gJNxbVxMH5syy5rafNrHw==
X-Received: by 10.80.139.65 with SMTP id l59mr4002897edl.52.1501887377578;
	Fri, 04 Aug 2017 15:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
	<CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
	<CA++8a_BLciSLffmy_MyxyeSEWCX+07BkiQ4u80Rz+upJ1rzBdw@mail.gmail.com>
	<CAMKF1spBau=OW8iA2K=ULnkZ_fFvdiRupDsPeiL8bPhPfms2cg@mail.gmail.com>
	<CA++8a_CQEZBUGm_u04cA1EddT=QnMxgWqEY8ZJGiVrTnbaKmoA@mail.gmail.com>
In-Reply-To: <CA++8a_CQEZBUGm_u04cA1EddT=QnMxgWqEY8ZJGiVrTnbaKmoA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 04 Aug 2017 22:56:07 +0000
Message-ID: <CAMKF1soVgTtENN2DG_ESg02coXAtjzuWn=jMt3ydhz_HdLfXbA@mail.gmail.com>
To: Diana Thayer <garbados@gmail.com>
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
X-List-Received-Date: Fri, 04 Aug 2017 22:56:17 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, please!

On Fri, Aug 4, 2017 at 2:37 PM Diana Thayer <garbados@gmail.com> wrote:

> That did the trick. Should I submit a patch to remove it?
>
> On Fri, Aug 4, 2017 at 2:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Ok please look for this class being inherited in this layer and delete it
>> it has been merged into image class in oe-core we should have kept an empty
>> class in or-core for backward compatibility but that's another matter
>>
>> On Fri, Aug 4, 2017 at 2:30 PM Diana Thayer <garbados@gmail.com> wrote:
>>
>>> Alright. I've added it manually. I get this error:
>>>
>>> ```
>>> ParseError at
>>> /home/garbados/openembedded-core/meta-openwrt/recipes-core/images/
>>> openwrt-base-image.bb:5: Could not inherit file
>>> classes/image_types_uboot.bbclass
>>> ```
>>>
>>> This is also the error Toaster gives me when trying to build the layer.
>>>
>>> On Fri, Aug 4, 2017 at 2:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> Hi Diana
>>>>
>>>> Haven't seen anyone report this error thus far
>>>> I would suggest to add the layer manually to
>>>> Bblayer.conf and see how then you get better error messages during
>>>> parse
>>>>
>>>> On Fri, Aug 4, 2017 at 1:45 PM Diana Thayer <garbados@gmail.com> wrote:
>>>>
>>>>> Hello!
>>>>>
>>>>> I'm experiencing issues building with meta-openwrt. Following the
>>>>> instructions in the readme <https://github.com/kraj/meta-openwrt>, I
>>>>> get
>>>>> this error:
>>>>>
>>>>> ```
>>>>> $ bitbake-layers add-layer ../meta-openwrt
>>>>> NOTE: Starting bitbake server...
>>>>> Loading cache: 100% |#############################
>>>>>
>>>>> #####################################################################################|
>>>>> Time: 0:00:00
>>>>> Loaded 66 entries from dependency cache.
>>>>> ERROR: Parse failure with the specified layer added
>>>>>                                                           | ETA:
>>>>> --:--:--
>>>>> ```
>>>>>
>>>>> What failed? Why? How do I debug it? I followed the directions step by
>>>>> step, both within openembedded-core and poky.
>>>>>
>>>>> Thanks for any help you can provide.
>>>>>
>>>>> Best regards,
>>>>> Diana
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>
>>>>
>>>
>

