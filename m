Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E06F07F9A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 11:56:53 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so19732473wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 03:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TBJz4pxLq8UbrnPPmkRuoJ8uFtnR3gsi8EZSZwODhkA=;
	b=bYlgYgl+gP5mdxZGPGDv4uSk8MmTHfNTxpV6VEV4R+CLI3+xyVig3Uz2/s9akYUH0Y
	88Tsp2mDWPRIO7Ia2k+z+qr9ydX/0XHyrWAXvU8qyVmF5G4toB9DEUzr7I2HFjd8CBkM
	43l01sHyLaJbEuVVOz/CUz3haMAaVR0VI52aqktCiUXj51zjHCWvgruJ5H1luu+Ypx+l
	Pn1M2XCRtWA6suM6HGBf8U5uY072qqKLQUhoufhRoR77AShz+74CH54gA/lWoQM50kQT
	llz7A4ebg2jZufF1I1kPQbvedjdbqBDARhuMTVAy59hvkpuNgMgCDyS8aEf22nrzytIx
	GACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TBJz4pxLq8UbrnPPmkRuoJ8uFtnR3gsi8EZSZwODhkA=;
	b=TatpOhpVHh6GAm3smchlvog5qYD9YZaXYhD1bdIzVfKC1WWASYegtJW82NVovCdojU
	D59teYZig2UqfK+r1B01Gv7SmfLc7Aez3T6NObf+3vOwZTfQlIeIV15+bXWAIMDsRA+n
	gHMjYTLDqKQBQ4yE9Iqp+pgx1ERQbIZyi64F7OeHqCJhlL9D2FijzwOGPg94g0IJVS+r
	9bhBakJ/rumfqY8KeFhMn7jKf0q0EFddQ36uAszo1MUhRAznMsj9/nc5zdUuZJ7XoaUt
	RLNirQCbAQz1FZwOQG8FvJKkO9FA95kdmrjxsHHyCQ0gd1I3jlUxtzNb7rP/KaEcTiAe
	BBrg==
X-Gm-Message-State: APjAAAV1HejIQmpn+dVF+6p2g1n7VUYP5YtPK6Vdpc9uZihZKgs6KPUF
	m5qtoEZ96NHvd+hTQopntN9ateuHJbxNIPLwKlE=
X-Google-Smtp-Source: APXvYqyHkDZjXuQ4Nmc7GicZv8FecEJCZ7yvWtUVBcjzQZe3BsiPov7cyMIPk+uFZMiHncZ0kAElwq+RiqqZJlEELio=
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr2763813wrp.111.1575979013678; 
	Tue, 10 Dec 2019 03:56:53 -0800 (PST)
MIME-Version: 1.0
References: <20191210093850.6292-1-costamagnagianfranco@yahoo.it>
	<CA+chaQe=2S1t_wpXzbExnPuGnSXy=XvscZ_n_xyMxscRZYY=mA@mail.gmail.com>
In-Reply-To: <CA+chaQe=2S1t_wpXzbExnPuGnSXy=XvscZ_n_xyMxscRZYY=mA@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Tue, 10 Dec 2019 12:56:42 +0100
Message-ID: <CAATN8PUKP4V13O3gZWq7z6s8Pto+Ua98wzGm=oQPjVXDtktZRA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: update to version 6.0.14 and unblacklist
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
X-List-Received-Date: Tue, 10 Dec 2019 11:56:54 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

Unfortunately that commit has been removed in
0e3f1ad80fc8cb0c517fd9a9afb22752b741fa76

git tag --contains df4028658f9dd7f82fd190e9db5bd82c05f94625
v5.4
v5.4-rc7
v5.4-rc8
v5.4.1
v5.4.2
v5.5-rc1

git tag --contains 0e3f1ad80fc8cb0c517fd9a9afb22752b741fa76
v5.4
v5.4-rc8
v5.4.1
v5.4.2
v5.5-rc1

so, unless you use v5.4-rc7 or patches, you can't use the vanilla version.

In any case, this commit should be fixing also kernels before 5.5 (that
will hopefully be the first release with that support fixed),
and it shouldn't hurt that much.

please note that I just tried to update the recipe, I'm not a direct user
of this recipe myself, so I don't care if you want to just drop the recipe
(I'm testing it right now)

G.



Il giorno mar 10 dic 2019 alle ore 11:03 Martin Jansa <
martin.jansa@gmail.com> ha scritto:

> Hi,
>
> what kernel are you using?
>
> Now with vboxsf also included in staging of vanilla kernel, this recipe is
> less useful then it used to be (vboxguest and vboxvideo were included long
> time ago and we're using them without any issues in LuneOS)
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.4&id=df4028658f9dd7f82fd190e9db5bd82c05f94625
>
>
> On Tue, Dec 10, 2019 at 10:39 AM Gianfranco Costamagna <
> costamagna.gianfranco@gmail.com> wrote:
>
>> ---
>>  ...oxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>  rename meta-oe/recipes-support/vboxguestdrivers/{
>> vboxguestdrivers_5.2.22.bb => vboxguestdrivers_6.0.14.bb} (92%)
>>
>> diff --git a/meta-oe/recipes-support/vboxguestdrivers/
>> vboxguestdrivers_5.2.22.bb b/meta-oe/recipes-support/vboxguestdrivers/
>> vboxguestdrivers_6.0.14.bb
>> similarity index 92%
>> rename from meta-oe/recipes-support/vboxguestdrivers/
>> vboxguestdrivers_5.2.22.bb
>> rename to meta-oe/recipes-support/vboxguestdrivers/
>> vboxguestdrivers_6.0.14.bb
>> index 0f8d7af3f..bd7339e1a 100644
>> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
>> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.0.14.bb
>> @@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
>>  SRC_URI = "
>> http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
>>      file://Makefile.utils \
>>  "
>> -SRC_URI[md5sum] = "c9c2f162ac5f99d28d8c0ca43b19ed01"
>> -SRC_URI[sha256sum] =
>> "5580e875349341a1aabc6d5d2f697d242f277487316faaf1fbe68d9014f788d4"
>> +SRC_URI[md5sum] = "2766d6f628dcd8f0bc216d0f8a2abc8e"
>> +SRC_URI[sha256sum] =
>> "5e12b14f0c38bf195d9592d76a9e0a128df2d38cd77c26ce5b5488397715dd0c"
>>
>>  S = "${WORKDIR}/vbox_module"
>>
>> @@ -78,6 +78,3 @@ FILES_${PN} = "${base_sbindir}"
>>
>>  # autoload if installed
>>  KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
>> -
>> -PNBLACKLIST[vboxguestdrivers] = "Needs forward porting to kernel 5.2+"
>> -
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

