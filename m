Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id DDBB060720
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 11:09:11 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h18so15153764wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 04:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=bBmVx24Evrass4Mc79stcfuogTGl4hz7ZwHGFTImpeo=;
	b=RdKDt4mJBh/si8u6d75EJ0rxndrKnybVuZzb9TEeRYFv7WFARGJJJVPFXAcmzmgiM4
	z3Q2YusOnSoibwylydD3xk6jNgVEKdmz43zojNzwsZullDLBTWLGUn17Yr+2aj5D1HYb
	4dpFpr5xh25hFNJgLRPLV/K0nCrKV20HHw3OJTHVtzPlh1NST6fidl2iNBWARuhttUbk
	woip+OeZnaDqsMfvqiseuxHu5Fvy0hebrDOw/xOb9ofJFhTqigDFBS9Ib2keB4LnR4nk
	pQ1jYvCncq/Ydgixoim3kx2Hm3OA5+P+Yt9PS5bGOWH09n/FdFmtgzELsLEQmwTRHztq
	kocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bBmVx24Evrass4Mc79stcfuogTGl4hz7ZwHGFTImpeo=;
	b=VBkmPUzqRSMXjrxUtGvVM+pFl3M8/ebbC6yICfdjukqGXti8wCoiUAkxSUgKy/vRtN
	VHkyBojGfAqf/k/CGD9ksvh8xhK3E5w+ctFOfok5OblLypJilfkgPuuPoTqVlMVRwaOi
	WJzW+gprS9OniDdNW66x42ghq8Vbht19f5ti/ejOl2b+rGj+XWQrET8APhMnS2XDSfIp
	5xM7W+X5bCM+4odN9vy1CYkigFkZupSDPy/6a4XdRtTmATcH6YzBiQhpjoJZLMMEaTsn
	IjXTn/OoHPUYeg6xsE9/zsP6w9EDRaPwUOwsYZMgQ/0NIUaaOPTZ+sr9NRA/d/7dzpG8
	QioA==
X-Gm-Message-State: APjAAAXyE/E58gsndOSmpHHI27B0Sti7O2FiKcUcnyGRCyVt3Xs11iQX
	CztNFVNCoWYW0e8H1YM4Bqk=
X-Google-Smtp-Source: APXvYqxx+5p6ioX6TQvZuyI9Hnv/MzgPo5fpCiO7ktsRXvlvCc+2HE4iDSMdLVeFXyn/dDV8BU/Qqw==
X-Received: by 2002:a1c:3c07:: with SMTP id j7mr8625066wma.79.1556536152495;
	Mon, 29 Apr 2019 04:09:12 -0700 (PDT)
Received: from [192.168.100.108] ([94.176.97.226])
	by smtp.googlemail.com with ESMTPSA id
	d1sm10261168wrb.61.2019.04.29.04.09.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 04:09:11 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>
References: <20190427213551.14485-1-beniamin.sandu@gmail.com>
	<20190429005330.GH31207@bill-the-cat>
From: Ben <beniaminsandu@gmail.com>
Message-ID: <54b42f72-dba5-4c7e-7ff5-802e03285cd0@gmail.com>
Date: Mon, 29 Apr 2019 14:09:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429005330.GH31207@bill-the-cat>
Cc: openembedded-devel@lists.openembedded.org,
	Beniamin Sandu <beniamin.sandu@gmail.com>
Subject: Re: [meta-networking][PATCH] unbound: create recipe for version 1.9.1
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
X-List-Received-Date: Mon, 29 Apr 2019 11:09:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 4/29/19 3:53 AM, Tom Rini wrote:
> On Sun, Apr 28, 2019 at 12:35:51AM +0300, Beniamin Sandu wrote:
>
>> Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
>> ---
>>   .../recipes-support/unbound/unbound_1.9.1.bb  | 36 +++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>   create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.1.bb
>>
>> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.1.bb b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
>> new file mode 100644
>> index 000000000..84bbe6581
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
>> @@ -0,0 +1,36 @@
>> +SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
>> +DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
>> +	features including enhanced security (DNSSEC) validation, Internet Protocol \
>> +	Version 6 (IPv6), and a client resolver library API as an integral part of the \
>> +	architecture"
>> +
>> +HOMEPAGE = "https://www.unbound.net/"
>> +SECTION = "net"
>> +LICENSE = "BSD-3-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
>> +
>> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
>> +SRCREV="16cc196bf28aec604ed2dae2b5af2ed82c8a58d6"
>> +
>> +inherit autotools pkgconfig systemd
>> +
>> +DEPENDS = "openssl libevent libtool-native bison-native expat"
>> +RDEPENDS_${PN} = "bash openssl-bin"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool \
>> +		--with-ssl=${STAGING_EXECPREFIXDIR}"
>> +
>> +PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
>> +PACKAGECONFIG[systemd] = "--enable-systemd,,systemd"
> You should probably add:
> PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile systemd', d)}"
> PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
> PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
> PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"

Thanks, I will add those. I've only used unbound a bit and thought about 
sending a patch with a recipe for it since I noticed there is none, but 
I didn't look into many configuration options.

>
>> +do_install_append() {
>> +	# systemd support
>> +	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>> +		install -d ${D}${systemd_unitdir}/system/
>> +		install -m 0644 ${B}/contrib/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
>> +	fi
>> +}
>> +
>> +SYSTEMD_SERVICE_${PN} = "${BPN}.service"
> Then you're missing the sysvinit script too?  You can just do:
> do_install_append() {
>      install -d ${D}${systemd_unitdir}/system
>      install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
>
>      install -d ${D}${sysconfdir}/init.d
>      install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/init.d/unbound
> }
>
> And the right things are packaged or not.
Wouldn't be better to install these files under an if where we check 
DISTRO_FEATURES for systemd/sysvinit like in my initial patch?
>
> I had a recipe for 1.9.0 locally that I didn't post as I ran into some
> other problem with unbound, and then ran out of time to re-visit, which
> is why I have these bits handy.
>

