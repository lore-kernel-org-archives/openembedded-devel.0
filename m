Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id A207B75100
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 19:07:25 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id g83-v6so5466335vkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 12:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wXGTLFXsDt6FiWmZ5FGg8IuYbt5lN5TsIdgrKExyte8=;
	b=go64VeRLDic3EwAxhadnZ/0pC2/XPWpUvePM8Ca1PQsDwd7uOAoz9zQ3ZDBgbggequ
	62wgJ7e1Uw6WbOEjYYZF2Jgq+GPatpv0TroQphAAoOXCCM0k5DKOd41Jss7FNYUES7h2
	0de6etwH2UdG9BYIetUyqt+q6ViuYyeY3kh8+jHK7ePa7LHcWPXrgPyiSEmYeGPGzSBK
	WoKWmmSMETgz2uWs/iD6lIfJ/MaXmH/6er1wkSXEdQMwoHaqZMN7R008KUe6Dh2H+FLz
	YNTSKhXMNuoamtApdeTI+4TLpDv3cRG5z+cCO2ISqvoP72z3T4hhOi9wSUy2sTmJXaGT
	y1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wXGTLFXsDt6FiWmZ5FGg8IuYbt5lN5TsIdgrKExyte8=;
	b=IVWRFFk+Fou+Nr12Nt5eUR5Uyj5idmAqpAxcpFzcOWfRkjCcp6W5U7fgvNbBnFqDpf
	bs92DGC/V/TcTmUmlzrnwWkVr4MNeVjqR11JBnFLoNFUFrAEBoFYaN98pUjrvRCMcTd4
	nd4iY9vDdw5+Fdv9bbJV7x7IKMHGXpddY/Ea4LE5ESrxQuISG5qPl4pLpQfYCINH2uoD
	jVS7ylcFy7Hsva0s1rgfszwd1ZkuEbW08T/u5VB3clMZaTVhpWFNX+jzlZ18ORdNAyfs
	TVAVGhDmuh6LRYPbEgs5p7NTd755M2wvhqGQaTHCQ7mxvsUyVXe4YcyP97u2z3Zed5kB
	oGxg==
X-Gm-Message-State: ALKqPwdvtsnJf6c5gEj+1ccR5K1l4Dp1p7wiGFaGyBtmwkDyGGBzgmfO
	z2CvPJKkK2HG6DBABsFQqaIuAozAG1W8N4Rsqks=
X-Google-Smtp-Source: AB8JxZrnUyqmErgaDtCqYhLcIkTkYAn9wljYaubYMLr765phK7PSnDEIbkSb0A3vwdEhHDpWm9cWClh5efCceRsF+VY=
X-Received: by 2002:a1f:b254:: with SMTP id
	b81-v6mr7767988vkf.20.1526670446216; 
	Fri, 18 May 2018 12:07:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Fri, 18 May 2018 12:07:25
	-0700 (PDT)
In-Reply-To: <4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 18 May 2018 12:07:25 -0700
Message-ID: <CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Fri, 18 May 2018 19:07:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 17, 2018 at 6:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi Andre
>
> This series is fine, except that it has some formatting changes mixed with
> cmake related changes. It would be preferable to have them as separate
> pulls. I reckon that both types of changes are good.

The formatting cleanups are all minor and probably not worth
submitting on their own.

> On 5/17/18 6:30 PM, Andre McCurdy wrote:
>>
>> The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
>> ${datadir}/cmake end up in the dev package, so recipes no longer need
>> to provide custom packaging rules to handles these files.
>>
>>
>> http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>   meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git
>> a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>> b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>> index 9354799..6b9c545 100644
>> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>> @@ -24,5 +24,4 @@ PACKAGECONFIG[testapps] =
>> "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,
>>     PACKAGES =+ "${PN}-testapps"
>>   -FILES_${PN}-dev += "${libdir}/cmake"
>>   FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
>>
>

