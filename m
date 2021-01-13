Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web08.7046.1610539380743544238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 04:03:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@embed.me.uk header.s=soverin header.b=ai/LqAsK;
 spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id B80216028A
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Jan 2021 12:02:57 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embed.me.uk;
	s=soverin; t=1610539377;
	bh=lmGeZGtoGUAeD9ALjJ88YWsqJlwHa/mHC0t8DUcznuY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=ai/LqAsKKEmCQguJ0aLC560QKjnIji6ImHqoeyevArmX9cMgYLt4zTkCFA0kRq55t
	 IoO+7TZXA0lrzr+W2ZIhwHB1dWwQoWYOzCb2IIFYBLOgj4J7G6Bz+8GkrhaLV0D8GH
	 eClT50BZMWKamCwO8gMj2Qs7QukBJWcDBtO9OYU7RFM9aLSwxZxjQU5250HY/CAOQG
	 cBjsUuQu8W5tKagUz4eTlSOsztbj+ijXjusKPSrRcKF7ekuHyTEKNQUEWu38XimjD4
	 uz8tKySxGYp6kIs1ZL5onO0XbsAYc8DPxH+r4ir9asgt3RU/99mMTRk5CeDZeKJ4/i
	 u4v5rDt6YzBNA==
Subject: Re: [oe] Yocto recipe for scikit-learn
To: Marek Belisko <marek.belisko@gmail.com>, kodali13451@gmail.com
Cc: OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
References: <Tx4I.1610465744315911278.fazH@lists.openembedded.org>
 <042511c7-8ad2-fa6d-2f55-bee8eb7cba7a@embed.me.uk>
 <CAAfyv34pbPebD9BVUTbsGcQnRTGS68sVZXFOUFuXsJCVzBXv1Q@mail.gmail.com>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <5cd73e00-fc8f-0bb2-8985-824ae53e2083@embed.me.uk>
Date: Wed, 13 Jan 2021 12:02:54 +0000
MIME-Version: 1.0
In-Reply-To: <CAAfyv34pbPebD9BVUTbsGcQnRTGS68sVZXFOUFuXsJCVzBXv1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

On 12/01/2021 16:57, Marek Belisko wrote:
> Hi,
> 
> On Tue, Jan 12, 2021 at 5:41 PM Jack Mitchell <ml@embed.me.uk> wrote:
>>
>> On 12/01/2021 15:35, kodali13451@gmail.com wrote:
>>> I am trying to create a `yocto` `recipe` for `scikit-learn` package. It
>>> depends on `scipy` pacakge. I was able to successfully build the `scipy`
>>> package using : https://github.com/gpanders/meta-scipy
>>> <https://github.com/gpanders/meta-scipy>.
>>>
>>> When I run `bitbake python3-scikit-learn`, i am getting the below error:
>>> `ModuleNotFoundError: No module named 'scipy'`
>>>
>>> I am executing the commands in the below order.
>>>
>>> Once I have cloned/copied the `scipy` recipes and the patches listed in
>>> the `meta-scipy`, i am running `bitbake python3-scipy` and the build was
>>> successful.
>>>
>>> Then, I created a `recipe` file with the name
>>> `python3-scikit-learn_0.23.2.bb
>>> <http://python3-scikit-learn_0.23.2.bb/>` and the contents are as below.
>>>
>>> ```
>>> PYPI_PACKAGE = "scikit-learn"
>>>
>>> LICENSE = "BSD"
>>> LIC_FILES_CHKSUM  =
>>> "file://PKG-INFO;beginline=8;endline=8;md5=40ee42dc5a49f1617c5c78f16c50e065"
>>>
>>> SRC_URI[sha256sum] =
>>> "20766f515e6cd6f954554387dfae705d93c7b544ec0e6c6a5d8e006f6f7ef480"
>>>
>>> inherit pypi setuptools3
>>>
>>> #DEPENDS = "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy
>>> ${PYTHON_PN}-scipy ${PYTHON_PN}-joblib ${PYTHON_PN}"
>>> DEPENDS = "${PYTHON_PN}-numpy-native ${PYTHON_PN}-numpy
>>> ${PYTHON_PN}-scipy ${PYTHON_PN}"
>>>
>>> RDEPENDS_${PN} += "${PYTHON_PN}-numpy ${PYTHON_PN}-scipy"
>>> ```
>>>
>>> When I run the `bitbake python3-scikit-learn`, i am getting this
>>> `ModuleNotFoundError: No module named 'scipy'`
>>>
>>> Checked the path where the `devshell python3` is looking
>>> (`poky/build/tmp-glibc/work/aarch64-oe-linux/python3-scikit-learn/0.23.2-r0/recipe-sysroot-native/usr/lib/python3.8/site-packages`),
>>> and i can only see the `numpy` package there, but `scipy` package is not
>>> there.
>>>
>>> `ls` command output :
>>> ```easy_install.py
>>>  numpy
>>>  numpy-1.17.4-py3.8.egg-info
>>>  pkg_resources
>>>  __pycache__
>>>  README.txt
>>>  setuptools
>>>  setuptools-45.2.0-py3.8.egg-info
>>> ```
>>>
>>> Can someone point me on how to include the `python3-scipy` package, so
>>> that it will be included/copied to the `devshell`. Or do I need to
>>> update/fix something else.
>>>
>>> Appreciate any guidance on this.
>>>
>>
>> I'm also working on a scikit-learn recipe, you need to create a recipe
>> to provide python3-scipy-native as it uses this during the build
>> process. However, even with this recipe in place and scikit-learn
>> building, the resulting packages doesn't work due to inconsistencies in
>> the build, with the most obvious failure looking like a 64bit -> 32bit
>> compile error from using the native include headers in cython generated
>> files. I'm still looking into this but if anybody else has managed to
>> get this compiled properly I would also be interested in hearing about it.
> Same here, I didn't manage to make a proper recipe in yocto. Some
> advice I get on github:
> https://github.com/scikit-learn/scikit-learn/issues/19037
>>
>> Regards,
>> Jack.
>>
>> --
>> Jack Mitchell, Consultant
>> https://www.tuxable.co.uk
>>
>>

My broken out meta-scikit-learn layer can be found at

https://github.com/tuxable-ltd/meta-scikit-learn/tree/WIP

and the issue to track the runtime issue is at

https://github.com/tuxable-ltd/meta-scikit-learn/issues/1

Any help with the issue would be much appreciated.

-- 
Jack Mitchell, Consultant
https://www.tuxable.co.uk
