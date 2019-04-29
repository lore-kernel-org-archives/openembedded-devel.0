Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2E317D9F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 11:25:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w15so15178980wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=e+rNiYlMLwgK3dlnqXd/dZKzdsbnCFnzK4AUWTUEmps=;
	b=Hs0a4Oz9EQyX9mzx9ssyDe03xlUD7/6EB/ze4+Ai3NE3g02WKhpg2gTeT1fu0Mj1Vv
	OIaMFnVQqZuavSCYGIA1obfjkl7Ym+dJUrZY0r3Xg8WsN/gpY4EOAb0rW8ZTIGBMoeI8
	PPg3TCq5YBziYukdN+SgHt/CRjVsNlbbML7W8E73skMIQuuFSULU6SghtKqCKcSdZy+i
	fhr9WtJ0ugoBw69efSHSy7RBuEb5d0xj6B+cIQjUsNdCREfRnT9E3Xx6d1W6IVdPfYSI
	lUFjtgXSolzsRdaurh8Rwj2BGQHe46VFFgIaT6b7BLz3cTP0HZilpoVP6X67XmCzc4rA
	ZBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=e+rNiYlMLwgK3dlnqXd/dZKzdsbnCFnzK4AUWTUEmps=;
	b=AUzo3PP7J8JkieAD37z+B1iwQ1NLbT2N9x4CqYMkKuZkNVCRCkV/axFGMATtUj6ocU
	4+eqR+pbR/gHgthWfVApDeEpe8SZhSidQ9va2kExRwiIdTy6j7fjVxmVwMlLK5cpdpsv
	xaW0MsHXp+U/61eOhoKH4I7tl+ZJ8/u+4zGi1aGTWG7ekTo8L02HV7U8jO9qx1iqZkTz
	I4hpaOsiYQclZcgmtmF0aoVTQOlLyIRz/znEaJpeJMPrSPB0Ejf9xLs764quYgWHZgRd
	enLl2fy4ua9WxHKPWItTU62fu9pdUN7SXcdgoY+YzXh6UdfKDbbU2b3HEO/h2N7HfYPJ
	gaHw==
X-Gm-Message-State: APjAAAULg6DoRMWJ92mBpExX0YiONLoK0IsFeyJYWCakBjui09aM2E1F
	95Hev3xjwMX476s/oBoEA3E=
X-Google-Smtp-Source: APXvYqzd4eSdWEou7CxUikFatphTvbqB1uG3bAgth6uaA1as4+FxjSlqB093PIjKabM01lYvEI8w7Q==
X-Received: by 2002:a1c:6342:: with SMTP id x63mr17308232wmb.58.1556537148489; 
	Mon, 29 Apr 2019 04:25:48 -0700 (PDT)
Received: from [192.168.100.108] ([94.176.97.226])
	by smtp.googlemail.com with ESMTPSA id
	k206sm15578031wmk.16.2019.04.29.04.25.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 04:25:47 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>
References: <20190427213551.14485-1-beniamin.sandu@gmail.com>
	<20190429005330.GH31207@bill-the-cat>
	<54b42f72-dba5-4c7e-7ff5-802e03285cd0@gmail.com>
	<20190429111639.GI31207@bill-the-cat>
From: Ben <beniaminsandu@gmail.com>
Message-ID: <6500bb24-f559-1a19-8b9f-896d3d71620e@gmail.com>
Date: Mon, 29 Apr 2019 14:25:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429111639.GI31207@bill-the-cat>
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
X-List-Received-Date: Mon, 29 Apr 2019 11:25:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 4/29/19 2:16 PM, Tom Rini wrote:

> On Mon, Apr 29, 2019 at 02:09:08PM +0300, Ben wrote:
>> On 4/29/19 3:53 AM, Tom Rini wrote:
>>> On Sun, Apr 28, 2019 at 12:35:51AM +0300, Beniamin Sandu wrote:
>>>
>>>> Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
>>>> ---
>>>>   .../recipes-support/unbound/unbound_1.9.1.bb  | 36 +++++++++++++++++++
>>>>   1 file changed, 36 insertions(+)
>>>>   create mode 100644 meta-networking/recipes-support/unbound/unbound_1.9.1.bb
>>>>
>>>> diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.1.bb b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
>>>> new file mode 100644
>>>> index 000000000..84bbe6581
>>>> --- /dev/null
>>>> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
>>>> @@ -0,0 +1,36 @@
>>>> +SUMMARY = "Unbound is a validating, recursive, and caching DNS resolver"
>>>> +DESCRIPTION = "Unbound's design is a set of modular components which incorporate \
>>>> +	features including enhanced security (DNSSEC) validation, Internet Protocol \
>>>> +	Version 6 (IPv6), and a client resolver library API as an integral part of the \
>>>> +	architecture"
>>>> +
>>>> +HOMEPAGE = "https://www.unbound.net/"
>>>> +SECTION = "net"
>>>> +LICENSE = "BSD-3-Clause"
>>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
>>>> +
>>>> +SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
>>>> +SRCREV="16cc196bf28aec604ed2dae2b5af2ed82c8a58d6"
>>>> +
>>>> +inherit autotools pkgconfig systemd
>>>> +
>>>> +DEPENDS = "openssl libevent libtool-native bison-native expat"
>>>> +RDEPENDS_${PN} = "bash openssl-bin"
>>>> +
>>>> +S = "${WORKDIR}/git"
>>>> +
>>>> +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool \
>>>> +		--with-ssl=${STAGING_EXECPREFIXDIR}"
>>>> +
>>>> +PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
>>>> +PACKAGECONFIG[systemd] = "--enable-systemd,,systemd"
>>> You should probably add:
>>> PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile systemd', d)}"
>>> PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
>>> PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
>>> PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
>> Thanks, I will add those. I've only used unbound a bit and thought about
>> sending a patch with a recipe for it since I noticed there is none, but I
>> didn't look into many configuration options.
> And thanks for your contribution!  I only kinda stumbled on those others
> being possible myself.
>
>>>> +do_install_append() {
>>>> +	# systemd support
>>>> +	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>>>> +		install -d ${D}${systemd_unitdir}/system/
>>>> +		install -m 0644 ${B}/contrib/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
>>>> +	fi
>>>> +}
>>>> +
>>>> +SYSTEMD_SERVICE_${PN} = "${BPN}.service"
>>> Then you're missing the sysvinit script too?  You can just do:
>>> do_install_append() {
>>>      install -d ${D}${systemd_unitdir}/system
>>>      install -m 0644 ${B}/contrib/unbound.service ${D}${systemd_unitdir}/system
>>>
>>>      install -d ${D}${sysconfdir}/init.d
>>>      install -m 0755 ${S}/contrib/unbound.init ${D}${sysconfdir}/init.d/unbound
>>> }
>>>
>>> And the right things are packaged or not.
>> Wouldn't be better to install these files under an if where we check
>> DISTRO_FEATURES for systemd/sysvinit like in my initial patch?
> No, that just adds more complexity to the recipe that we don't need to
> have.  Oh, and since we're adding the sysvinit script too you need
> to inherit update-rc.d and add some appropriate lines too so it's
> installed right.  The current best practice, iirc, is to do both if we
> can do both and then we have the right logic elsewhere to not do
> sysvinit stuff on systemd and vice-versa.
>
Cool, I will send a v2 when I get to a proper machine.

