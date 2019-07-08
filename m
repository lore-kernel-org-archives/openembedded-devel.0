Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 24BED7D19E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 02:09:02 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t132so6827079pgb.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2019 19:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=DsG6HZNrnvJeTkUdSm7JlgS2QZDzZUXQ+v7qX3NYD0g=;
	b=hRzligh3UtZ6lG3EPCv4hd/ehi+JYBCXAP/7HEUQ0NOheTCO4CJaiF2zWmGWdCFmSt
	/kYSvxy7ew4WAsa/yxOZyNn1KLdeyk52ArGUozjYD+J6TfRrpb1+ffgz5CyZYJbUqaR2
	62HiTQOIcxXj4dSaQTf/4cajprU3k0uSQwHCQSmUTtKA7OjhvxThW8NcAesdcg0mUeoX
	xE4i2J2hW+0Zgf/uLzxNM4gEWML4C97fg0Khq6twQT9GyObfuUjqfLZDNFHPB7s6s+lE
	ee5FhkWMt0QcWDoTbhKZRrkOZOn8mxdP8wrfOA2TIn7MM6NFsFLUWTNH0wct2UviBz4n
	oJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=DsG6HZNrnvJeTkUdSm7JlgS2QZDzZUXQ+v7qX3NYD0g=;
	b=SWq3c85TQfMgaUTyNalVGXvnAFDhcsBf//IoJTzE98t3VF+cfHpooCJoMu7LBsLSx6
	JUz63TKyLDObAdzhtvyaDRTsRh0fJg+TZz4OZgpBMbwE40omdIy8+FoO/ef+f4jabXOQ
	yxgfn6kHg/JVBrmF9uklTBb/VBaO9UFox3Bl92SJGaDnhaAY/+V0LJ41Gu170gQDxiXu
	8j6IeQVaLBIqd9xNDheAygkX10ynoeFxQ/884v9h88ue3LfXORDub09+gm7j8rcqlJZK
	VRie76xUhrn2t0B7l42DmwvDkYTF3MrrM/EzWls7b9KjjEUnMHFkA2AgzC0ShJT/DXAj
	3eSA==
X-Gm-Message-State: APjAAAUvOwHM820V7uPauh0wSDbKh/7bkAB42IhZ7S1yngTbyfP/OHbK
	heTi2vSP12wrP1bpU5KLMr8H/eEtcrQ=
X-Google-Smtp-Source: APXvYqydPs/OBvlz+5zRhl79BjsdB1Bsao+zCVcNfgde2ip9j7lQxQTt294miFJWltnoVMNaidec8A==
X-Received: by 2002:a63:7e1d:: with SMTP id z29mr20234399pgc.346.1562551742973;
	Sun, 07 Jul 2019 19:09:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c2e:f46a:e59c:dae7?
	([2601:202:4180:c33:c2e:f46a:e59c:dae7])
	by smtp.gmail.com with ESMTPSA id
	h6sm14928710pfn.79.2019.07.07.19.09.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jul 2019 19:09:02 -0700 (PDT)
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20190708015236.42034-1-yongxin.liu@windriver.com>
	<afcf7ce5-1f2e-c5d1-fca9-a2fcda677b35@gmail.com>
	<597B109EC20B76429F71A8A97770610D19C4EB56@ALA-MBD.corp.ad.wrs.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <300f0a37-4f44-7424-c3cb-95237fec6196@gmail.com>
Date: Sun, 7 Jul 2019 19:09:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <597B109EC20B76429F71A8A97770610D19C4EB56@ALA-MBD.corp.ad.wrs.com>
Subject: Re: [meta-oe][PATCH v2 1/2] keyutils: add new recipe for version 1.6.
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
X-List-Received-Date: Mon, 08 Jul 2019 02:09:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 7/7/19 7:03 PM, Liu, Yongxin wrote:
>> -----Original Message-----
>> From: akuster808 [mailto:akuster808@gmail.com]
>> Sent: Monday, July 8, 2019 09:59
>> To: Liu, Yongxin; raj.khem@gmail.com; openembedded-
>> devel@lists.openembedded.org
>> Subject: Re: [oe] [meta-oe][PATCH v2 1/2] keyutils: add new recipe for
>> version 1.6.
>>
>>
>>
>> On 7/7/19 6:52 PM, Yongxin Liu wrote:
>>> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
>>> ---
>>>  meta-oe/recipes-security/keyutils/keyutils_1.6.bb | 38
>> +++++++++++++++++++++++
>>>  1 file changed, 38 insertions(+)
>>>  create mode 100644 meta-oe/recipes-security/keyutils/keyutils_1.6.bb
>>>
>>> diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.bb b/meta-
>> oe/recipes-security/keyutils/keyutils_1.6.bb
>>> new file mode 100644
>>> index 000000000..3a26c902a
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
>> This recipe is in meta-security and contains ptests. Did you want the
>> ptests and other fixes too?
> This recipe is intended to be used by other recipes in OE.
> For other layers, I think they can use their own keyutils.

I mean, it should move out of meta-security to meta-oe.  And if you
don't want to do that, you should pick up the fixes.

Please have a look and compare.
http://git.yoctoproject.org/cgit/cgit.cgi/meta-security/tree/recipes-security/keyutils/keyutils_1.6.bb

- armin

>
> Thanks,
> Yongxin
>
>> - armin
>>> @@ -0,0 +1,38 @@
>>> +SUMMARY = "Linux Key Management Utilities"
>>> +DESCRIPTION = "These tools are used to control the key management
>> system built into the Linux."
>>> +
>>> +SECTION = "base"
>>> +
>>> +LICENSE = "LGPLv2.1+ & GPLv2.0+"
>>> +LIC_FILES_CHKSUM =
>> "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
>>> +
>> file://LICENCE.LGPL;md5=7d1cacaa3ea752b72ea5e525df54a21f"
>>> +
>>> +PV = "1.6+git${SRCPV}"
>>> +
>>> +SRC_URI = "\
>>> +
>> git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git \
>>> +"
>>> +
>>> +SRCREV = "4723f0185d11b13df243ad3cd41fbddfed53b5b1"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall'"
>>> +
>>> +INSTALL_FLAGS = "\
>>> +    LIBDIR=${libdir} \
>>> +    USRLIBDIR=${libdir} \
>>> +    BINDIR=${bindir} \
>>> +    SBINDIR=${sbindir} \
>>> +    ETCDIR=${sysconfdir} \
>>> +    SHAREDIR=${datadir} \
>>> +    MANDIR=${mandir} \
>>> +    INCLUDEDIR=${includedir} \
>>> +    DESTDIR=${D} \
>>> +"
>>> +
>>> +do_install() {
>>> +    cd ${S} && oe_runmake ${INSTALL_FLAGS} install
>>> +}
>>> +
>>> +FILES_${PN} += "${datadir}/request-key-debug.sh"


