Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4A871AFA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Aug 2017 21:34:54 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y206so6987615wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Aug 2017 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IWPaVumTnoqFhD9jBL4o862rg3v2Pbr7wAAxooRgMbc=;
	b=XGs3E6+RxPFTtXX3yMgDYv73T1d5gGrkdCtwA/fe8Ij59WFHDz76KcsfKr8EhXeIyS
	WxdGyt58+Z0tTqTBVHSyBSgaVYppvXdh5AUe/9bif53kVCaDDioRNMRlf/b1bTRB9AXz
	mrGjrUTaMd6WyIb2Ru3YhD3e+m8jHLWV3eVcbpQl0k1iiS8ss/CkWpe/JOdSQjg0u9Bz
	lFqXbunTrT8AmpGnh/YzKl7Rvyfb1WP4JmlyKtQNwFJRZTmIUp/OH6mh8XaAMsJq+2ZL
	Bw4Ghr1XMk08hnNZo6W7ReMi8NRvvoVaeHfealkLEqth2NciSNNz7Z/510H5EfeL0P3V
	9Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IWPaVumTnoqFhD9jBL4o862rg3v2Pbr7wAAxooRgMbc=;
	b=rbZKwb/NfCPJz14WwEn7MVBMogLnQdBSXdGPUyDk+meHCZ5TXnehJ9UIabtW0yeINR
	Lcrk9A9uxU5oBbkFyZXvlnRxjHZ4MMuyjf03j+5oUTieaNlIxnHe+obcJ/xQlgFqL281
	irBJzknSG/jgST1PHoMEbbUAJzu2dtv+lZ/tgTsdZBL4rcxJLjZCg0sKtEFK78FS2mhA
	5IR12FVCvfW6w1/3F+8kLAMLJdddY4CAzAKy+DbaNnNaOpXgdpTrY8bDHTT66Zneevr6
	QhMIdZujxAMHOWCiexOFUM/0VD5kMzJH9kkPSv9QMprn/d3UBi87PpeGZvlfhWMwZ+Uv
	yhUA==
X-Gm-Message-State: AIVw113uSrxr9koR8GpzJSdTrhMGo0Kv+F9vSDcKOZiJ39cINtB6AEbS
	oaZB6Z2RdB6XqosESjp6sHnBksaRDg==
X-Received: by 10.80.142.68 with SMTP id 4mr3959549edx.186.1501882495442; Fri,
	04 Aug 2017 14:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
	<CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
	<CA++8a_BLciSLffmy_MyxyeSEWCX+07BkiQ4u80Rz+upJ1rzBdw@mail.gmail.com>
In-Reply-To: <CA++8a_BLciSLffmy_MyxyeSEWCX+07BkiQ4u80Rz+upJ1rzBdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 04 Aug 2017 21:34:44 +0000
Message-ID: <CAMKF1spBau=OW8iA2K=ULnkZ_fFvdiRupDsPeiL8bPhPfms2cg@mail.gmail.com>
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
X-List-Received-Date: Fri, 04 Aug 2017 21:34:54 -0000
Content-Type: text/plain; charset="UTF-8"

Ok please look for this class being inherited in this layer and delete it
it has been merged into image class in oe-core we should have kept an empty
class in or-core for backward compatibility but that's another matter

On Fri, Aug 4, 2017 at 2:30 PM Diana Thayer <garbados@gmail.com> wrote:

> Alright. I've added it manually. I get this error:
>
> ```
> ParseError at
> /home/garbados/openembedded-core/meta-openwrt/recipes-core/images/
> openwrt-base-image.bb:5: Could not inherit file
> classes/image_types_uboot.bbclass
> ```
>
> This is also the error Toaster gives me when trying to build the layer.
>
> On Fri, Aug 4, 2017 at 2:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Hi Diana
>>
>> Haven't seen anyone report this error thus far
>> I would suggest to add the layer manually to
>> Bblayer.conf and see how then you get better error messages during parse
>>
>> On Fri, Aug 4, 2017 at 1:45 PM Diana Thayer <garbados@gmail.com> wrote:
>>
>>> Hello!
>>>
>>> I'm experiencing issues building with meta-openwrt. Following the
>>> instructions in the readme <https://github.com/kraj/meta-openwrt>, I get
>>> this error:
>>>
>>> ```
>>> $ bitbake-layers add-layer ../meta-openwrt
>>> NOTE: Starting bitbake server...
>>> Loading cache: 100% |#############################
>>>
>>> #####################################################################################|
>>> Time: 0:00:00
>>> Loaded 66 entries from dependency cache.
>>> ERROR: Parse failure with the specified layer added
>>>                                                           | ETA:
>>> --:--:--
>>> ```
>>>
>>> What failed? Why? How do I debug it? I followed the directions step by
>>> step, both within openembedded-core and poky.
>>>
>>> Thanks for any help you can provide.
>>>
>>> Best regards,
>>> Diana
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>

