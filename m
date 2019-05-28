Return-Path: <beniaminsandu@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4FDBD6C154
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 18:33:20 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d9so21361950wrx.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 11:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=YnNqAkmt4zOjlnyvPvoPFTxVSpNV4MNFEag/ddMRfa0=;
	b=brg+J8Fvc3KVLWGkl9SOK0E9uP5qBIjN+kOyqQFcBWKlORb8MsQfCl+GEa41FN0PP4
	RCMiUEVes3tqpaWmFjShGagI9DnVDYcQkXjEAPx9suctt6Q+0+vw5D9VKZ8ENnzdl0tQ
	dv4g4shheZUiAf3BYTCt/ynwP+e2keC6fvTnGKIRnHTF3silzIcc+fWKxVd33fpRmjyt
	lYjcwvyBebb6x/ZGucojK75AttOX3//7khAR63F7/qsbnyWO7iFNhYViq3zQp2itzF5Q
	TmyE44bYlxRzL9JnzsjoEqxOEBuSERio/vS1ApfzDHsQpeOZFCc1ENC6DfBZwJ5USs/P
	JI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=YnNqAkmt4zOjlnyvPvoPFTxVSpNV4MNFEag/ddMRfa0=;
	b=kdKFyXUdAKo2xoxhB6nyHY9p7oBRv5iUdFBt+D+BH1t9lKQiMXlDqwi0FGWqucXOIK
	x0oWE6cRhp04GBvWk7Di3ggsOMacUe2lE3G+yAvhqZVQiHXglB+qdu5CIIgFCew7bD2Z
	9YYT8FYTWX9J1cgDpgOpWQC6Oq5qQAm76hK0YLIgqPgz8RNtXVFyuV9wpi6HKIk4J08P
	eBR4lqa0M2C/8bJYgX4KZVVF0DSREVbiiomYd6JNofSniPaeZK4qOZ3DpzBE3ta52CNy
	yRC00Az+mn39GtwE5txvIuXc492m+NXDClcH7YHaPrf9xy7+d1mhnIn8iSh0o+6elE7p
	55eg==
X-Gm-Message-State: APjAAAXV8nCLqB5OPrwhtqi8mh23/ZZuXxtyjhFzlCFbd+w5R5Xsd/xt
	U35HiM0AluAR2P07Elh4hJA=
X-Google-Smtp-Source: APXvYqz+NdYrHBxWS7OFFxU8Ldw8YspgDOi2G6HzSEH6rdXAXFNUMyQzh2AZ0a5KJ4bK4lWsKLLXDg==
X-Received: by 2002:adf:f246:: with SMTP id b6mr5690216wrp.92.1559068400788;
	Tue, 28 May 2019 11:33:20 -0700 (PDT)
Received: from [192.168.2.101] (5-13-146-78.residential.rdsnet.ro.
	[5.13.146.78]) by smtp.googlemail.com with ESMTPSA id
	z13sm11278053wrw.42.2019.05.28.11.33.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 11:33:20 -0700 (PDT)
From: Ben <beniaminsandu@gmail.com>
To: Tom Rini <trini@konsulko.com>
References: <20190427213551.14485-1-beniamin.sandu@gmail.com>
	<20190429005330.GH31207@bill-the-cat>
	<54b42f72-dba5-4c7e-7ff5-802e03285cd0@gmail.com>
	<20190429111639.GI31207@bill-the-cat>
	<6500bb24-f559-1a19-8b9f-896d3d71620e@gmail.com>
Message-ID: <d4e80b44-4724-9cf4-4bc8-4e1a579e4237@gmail.com>
Date: Tue, 28 May 2019 21:33:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6500bb24-f559-1a19-8b9f-896d3d71620e@gmail.com>
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
X-List-Received-Date: Tue, 28 May 2019 18:33:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

I got back to this and updated the recipe. Problem is the sysvinit 
script/systemd service file that come from the original package, don't 
work out of the box, they both require tinkering.

What is the best "oe approach" for this? Do we ship new files that work 
with our bitbake package? Is the end user supposed to adapt the config 
files to the needed environment?

Cheers,

Beni

On 29.04.2019 14:25, Ben wrote:
> On 4/29/19 2:16 PM, Tom Rini wrote:
>
>> On Mon, Apr 29, 2019 at 02:09:08PM +0300, Ben wrote:
>>> On 4/29/19 3:53 AM, Tom Rini wrote:
>>>> On Sun, Apr 28, 2019 at 12:35:51AM +0300, Beniamin Sandu wrote:
>>>>
>>>>> Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
>>>>> ---
>>>>>   .../recipes-support/unbound/unbound_1.9.1.bb  | 36 
>>>>> +++++++++++++++++++
>>>>>   1 file changed, 36 insertions(+)
>>>>>   create mode 100644 
>>>>> meta-networking/recipes-support/unbound/unbound_1.9.1.bb
>>>>>
>>>>> diff --git 
>>>>> a/meta-networking/recipes-support/unbound/unbound_1.9.1.bb 
>>>>> b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
>>>>> new file mode 100644
>>>>> index 000000000..84bbe6581
>>>>> --- /dev/null
>>>>> +++ b/meta-networking/recipes-support/unbound/unbound_1.9.1.bb
>>>>> @@ -0,0 +1,36 @@
>>>>> +SUMMARY = "Unbound is a validating, recursive, and caching DNS 
>>>>> resolver"
>>>>> +DESCRIPTION = "Unbound's design is a set of modular components 
>>>>> which incorporate \
>>>>> +    features including enhanced security (DNSSEC) validation, 
>>>>> Internet Protocol \
>>>>> +    Version 6 (IPv6), and a client resolver library API as an 
>>>>> integral part of the \
>>>>> +    architecture"
>>>>> +
>>>>> +HOMEPAGE = "https://www.unbound.net/"
>>>>> +SECTION = "net"
>>>>> +LICENSE = "BSD-3-Clause"
>>>>> +LIC_FILES_CHKSUM = 
>>>>> "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
>>>>> +
>>>>> +SRC_URI = 
>>>>> "git://github.com/NLnetLabs/unbound.git;protocol=http;branch=master"
>>>>> +SRCREV="16cc196bf28aec604ed2dae2b5af2ed82c8a58d6"
>>>>> +
>>>>> +inherit autotools pkgconfig systemd
>>>>> +
>>>>> +DEPENDS = "openssl libevent libtool-native bison-native expat"
>>>>> +RDEPENDS_${PN} = "bash openssl-bin"
>>>>> +
>>>>> +S = "${WORKDIR}/git"
>>>>> +
>>>>> +EXTRA_OECONF = "libtool=${TARGET_PREFIX}libtool \
>>>>> +        --with-ssl=${STAGING_EXECPREFIXDIR}"
>>>>> +
>>>>> +PACKAGECONFIG = 
>>>>> "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
>>>>> +PACKAGECONFIG[systemd] = "--enable-systemd,,systemd"
>>>> You should probably add:
>>>> PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'largefile 
>>>> systemd', d)}"
>>>> PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, 
>>>> libsodium"
>>>> PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
>>>> PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
>>> Thanks, I will add those. I've only used unbound a bit and thought 
>>> about
>>> sending a patch with a recipe for it since I noticed there is none, 
>>> but I
>>> didn't look into many configuration options.
>> And thanks for your contribution!  I only kinda stumbled on those others
>> being possible myself.
>>
>>>>> +do_install_append() {
>>>>> +    # systemd support
>>>>> +    if 
>>>>> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; 
>>>>> then
>>>>> +        install -d ${D}${systemd_unitdir}/system/
>>>>> +        install -m 0644 ${B}/contrib/${BPN}.service 
>>>>> ${D}${systemd_unitdir}/system/${BPN}.service
>>>>> +    fi
>>>>> +}
>>>>> +
>>>>> +SYSTEMD_SERVICE_${PN} = "${BPN}.service"
>>>> Then you're missing the sysvinit script too?  You can just do:
>>>> do_install_append() {
>>>>      install -d ${D}${systemd_unitdir}/system
>>>>      install -m 0644 ${B}/contrib/unbound.service 
>>>> ${D}${systemd_unitdir}/system
>>>>
>>>>      install -d ${D}${sysconfdir}/init.d
>>>>      install -m 0755 ${S}/contrib/unbound.init 
>>>> ${D}${sysconfdir}/init.d/unbound
>>>> }
>>>>
>>>> And the right things are packaged or not.
>>> Wouldn't be better to install these files under an if where we check
>>> DISTRO_FEATURES for systemd/sysvinit like in my initial patch?
>> No, that just adds more complexity to the recipe that we don't need to
>> have.  Oh, and since we're adding the sysvinit script too you need
>> to inherit update-rc.d and add some appropriate lines too so it's
>> installed right.  The current best practice, iirc, is to do both if we
>> can do both and then we have the right logic elsewhere to not do
>> sysvinit stuff on systemd and vice-versa.
>>
> Cool, I will send a v2 when I get to a proper machine.

