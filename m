Return-Path: <beniaminsandu@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4782578F72
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 18:15:13 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id j11so4909918lfm.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2019 11:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=Z9Cq6LuKqHi66wAbLEHWLpFtbtZh5G3/0F/X4dehrLg=;
	b=aQIheAO0m83tXfQiSMygQmjEvXB8VbZPk0LDrd/fF1n2UCJOPGXsUpa6nPEWmW334E
	5zV+Gzm9T5nXrg3HtSGcFNPrkY3OzbLqakc6/cl4fdPk6i14qjeeUx3nFWuMhngzKYeF
	1kU26XXIB3jqT1I/WptjuYNwZRxyZ1aZ8eqTnZaJ5Ss6VTD8GlbE9eduhnj4Ornqtg0C
	/BXK7kWSI+0RXaw6+LbxZ0yuNNBYkzH25YfkN0OqrTUiPXHmX5O2iR8W9uCbQVClNiSZ
	YnhuOD+Gb05omIdCMJMm3Ol/soWosTbyOLEoLu5IYFdfepCGgxsYb4OPvQWMr2pMfxBT
	jofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Z9Cq6LuKqHi66wAbLEHWLpFtbtZh5G3/0F/X4dehrLg=;
	b=WXbM3qvmy4Sy97ywmHOjKaq3YFqqvlgiZjOjI2U4dYlOUw8C8XhnhRctVTVLgVvy1w
	FANuB0/ulq/r1NM/nWCCBZXid3KmVy6Bh10hzi9R1VnolhdnNyFiW33r6JqLNczKL9ZF
	1kWyNbS8vX+KH9axZbPE+M5vmf932Vnbf13cteaQ2UGndT/8YdeqqnIOBEqlgrQjh3uv
	TS9rkgNYXFuhXsB9CyP4kEoLfIQaFc4idqx4Zq5pkftW42G7oXW0Xho326ovC/WCU5aj
	GIt3si3GdrYTS6bHu/epuLzTJbj7yEDT1c89+pqlGKdhBu+pXjMNQVd8tiUq1BHZW/Nk
	4HZg==
X-Gm-Message-State: APjAAAVOgXkJLwUTxvhh0CDckEPjjXehCBCTA/QktAi9x2QZpbTRfZzJ
	pJUOi3K/Y5Q/Ff52u9dfjgw=
X-Google-Smtp-Source: APXvYqy4LskGFEhye/uUQxQzu8JZ0USVZ39VX4DrCH3ntj9ohKIIP9LgNnV0VCq3O1O18frHNPFzFg==
X-Received: by 2002:ac2:5487:: with SMTP id t7mr3002204lfk.41.1556388913624;
	Sat, 27 Apr 2019 11:15:13 -0700 (PDT)
Received: from [192.168.2.101] (5-13-153-104.residential.rdsnet.ro.
	[5.13.153.104]) by smtp.googlemail.com with ESMTPSA id
	u6sm6385830lfu.5.2019.04.27.11.15.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Apr 2019 11:15:12 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190418153432.16745-1-beniamin.sandu@gmail.com>
	<CAMKF1sozPTkxYHg67tNEok5SDgQ35EEu=WkLmaTro4CvZea_AA@mail.gmail.com>
	<CAMKF1sr6Rn+epNv93hcamsoL0DSK7VWcZzYqmx0dEXZo6KJaKw@mail.gmail.com>
From: Ben <beniaminsandu@gmail.com>
Message-ID: <04bdb6db-0121-fa55-c536-c95e2c3fe824@gmail.com>
Date: Sat, 27 Apr 2019 21:15:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr6Rn+epNv93hcamsoL0DSK7VWcZzYqmx0dEXZo6KJaKw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.2
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
X-List-Received-Date: Sat, 27 Apr 2019 18:15:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 27.04.2019 20:12, Khem Raj wrote:
> On Sat, Apr 27, 2019 at 10:02 AM Khem Raj <raj.khem@gmail.com> wrote:
>> it fails to package the systemd files so please build with systemd in
>> DISTRO_FEATURES
>>
>> see https://errors.yoctoproject.org/Errors/Details/238577/
>>
> right link to error is
>
> https://errors.yoctoproject.org/Errors/Details/238573/

Hmm, in this error log it looks like it doesn't find the openssl 
libraries in do_configure, not sure it has something to do with systemd.

Anyway, I will check it out and test with systemd too, thanks.

>
>> On Thu, Apr 18, 2019 at 8:35 AM Beniamin Sandu <beniaminsandu@gmail.com> wrote:
>>> Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
>>> ---
>>>   .../recipes-support/unbound/unbound_1.9.2.bb  | 22 +++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>   create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>>>
>>> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.2.bb b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>>> new file mode 100644
>>> index 000000000..9e0a24187
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.2.bb
>>> @@ -0,0 +1,22 @@
>>> +SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
>>> +DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
>>> +       features including enhanced security (DNSSEC) validation, Internet Protocol \
>>> +       Version 6 (IPv6), and a client resolver library API as an integral part of the \
>>> +       architecture"
>>> +
>>> +HOMEPAGE = "https://www.unbound.net/"
>>> +SECTION = "net"
>>> +LICENSE = "BSD-3-Clause"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
>>> +
>>> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
>>> +SRCREV="61a28c2ee5e60132f26725583b66c1cf8214bb78"
>>> +
>>> +inherit autotools pkgconfig
>>> +
>>> +DEPENDS = "openssl libevent libtool-native bison-native expat"
>>> +RDEPENDS_${PN} = "bash openssl-bin"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool"
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

