Return-Path: <brgl@bgdev.pl>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id A75A1796B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 16:13:40 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id h1-v6so15113367itj.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 09:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uFT4ul8EHiPLAsmXEflj8S8WGiHrkIoIfm4Fy28E+F8=;
	b=XC11KQPQqzrm4O3ab57j4P+okTms/Hrt+DZTILuwZGTagzfmMUZj0Szivyx3FUvghb
	1WCSmKo/2cAvwqXuQ/xGBuTKPe+pnKNM4LhULQJZINTNjuR9Oxv2XxBVVkk/FZQ8Eh+o
	Ee1qkLLdsatEU8kmr3OYL3F0MfSvrH4Xl2T+rCaxMK8++iGWxA8yjTh1i9h0e6/GI704
	EE137shNn6iLADWMKwwO1ulH+tbcJcc9/qp0aetPQ8glnu3y2NII6PTnADUbFab84Mqn
	iiLHaN6PgqFmWe70QLVceAXAQJNcLkuitDCCzjGrMwHc+4VXpJD7v889VZ0jzuLmu2uS
	1fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uFT4ul8EHiPLAsmXEflj8S8WGiHrkIoIfm4Fy28E+F8=;
	b=mwK1smv9CySf4wTEQBGaJ3oAvH/KgVo4BQZ0Aw1On6mVF1UM1UCUeyG+SiMjaiSPVa
	vOjp0dmzkjmE3rv5gwLfcj2/oFQuRpAeTEOejDte3367p7Jt2seuOyujLCFbwQo7G+qq
	RWrGbbcHBHO5GR1s1+vp7StkzlLV8XHsNidHEFbqzGqip+QxiytXTcU6FribBpYLZYrh
	NdALaBqGelmN0XJgDidubu31DndLZ9eA/hjztQ1Li4V2rTRN4BMznV+11N2vQlMk3t5Z
	ApLmx31ukIw2O7KFcL3p3VuFoxIRU+AffR5pt9NwhKsBLmPHfOE11Zu1B2jhFjod3Lar
	e+lg==
X-Gm-Message-State: APzg51DNiW6qgBoHkefOpi6lp6TbC//cf2lNNhy8Ws6VrfddHvkLFfhX
	giCVGvcvCaseoRZvQj4267/X41XaQe85f3vDhy09HQ==
X-Google-Smtp-Source: ANB0VdYTvYhk5MDvLWmmcvOL7J2/FzevJ8f9ficlCgsJ7d+1YuUXkP3COjhvw0W5tCyqvC97EJcXrzKNNnx9m0mHAok=
X-Received: by 2002:a24:a20f:: with SMTP id
	j15-v6mr3206989itf.125.1536250421396; 
	Thu, 06 Sep 2018 09:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:238d:0:0:0:0:0 with HTTP;
	Thu, 6 Sep 2018 09:13:40 -0700 (PDT)
In-Reply-To: <CAMKF1soK0OxkEai1r0U-aZdE97u5HPoev7G7Ykes9m8BP9uSmQ@mail.gmail.com>
References: <20180906123745.26192-1-brgl@bgdev.pl>
	<CAMKF1soK0OxkEai1r0U-aZdE97u5HPoev7G7Ykes9m8BP9uSmQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 6 Sep 2018 18:13:40 +0200
Message-ID: <CAMRc=MejwMEJS89gOmxNqbAd6AnSg28fY+urhLT6ofaQ1aC5cQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkd-dispatcher: new package
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
X-List-Received-Date: Thu, 06 Sep 2018 16:13:40 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-06 17:31 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Thu, Sep 6, 2018 at 5:38 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> This adds a recipe for networkd-dispatcher.
>>
>> It's a simple package containing a python script that needs to be
>> installed together with a systemd service and an example config
>> file. There's nothing to build.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  .../networkd-dispatcher_1.7.bb                | 30 +++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
>>
>> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
>> new file mode 100644
>> index 000000000..1887c4c7a
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_1.7.bb
>> @@ -0,0 +1,30 @@
>> +SUMMARY = "Dispatcher service for systemd-networkd connection status changes"
>> +DESCRIPTION = "This daemon is similar to NetworkManager-dispatcher, but is much \
>> +more limited in the types of events it supports due to the limited nature of \
>> +systemd-networkd(8)."
>> +AUTHOR = "Clayton Craft and others"
>> +
>> +LICENSE = "GPLv3"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
>> +
>> +RDEPENDS_${PN} = "systemd python3 python3-pygobject python3-dbus"
>> +
>> +SRC_URI = "git://gitlab.com/craftyguy/networkd-dispatcher.git;protocol=https"
>> +SRCREV = "c7e25623a161b64618ea778541c064d2a1df086b"
>
> perhaps define PV in terms of SRCPV
>
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +# Nothing to build, just a python script to install.
>> +do_compile() {
>> +}
>
> use deltask
>
>> +
>> +do_install() {
>> +    mkdir -p ${D}/${sbindir}
>> +    install -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
>
> condense both into install -D -m 0755 ....
>
>> +    mkdir -p ${D}/${systemd_unitdir}/system
>> +    install -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_unitdir}/system/networkd-dispatcher.service
>> +    mkdir -p ${D}/${sysconfdir}/conf.d
>> +    install -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
>
> this whole section should check for systemd being in DISTRO_FEATURES
>

It doesn't seem necessary - if systemd is not in DISTRO_FEATURES the
following error is raised:

ERROR: Nothing RPROVIDES 'systemd' (but
/<snip!>/meta-openembedded/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher.bb
RDEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'systemd' (not in
DISTRO_FEATURES)

For other issues: I'll fix them all in v2 and resend tomorrow.

Thanks!
Bart

>> +}
>> +
>> +FILES_${PN} += "${systemd_unitdir}/system/networkd-dispatcher.service"
>
> use systemd_system_unitdir
>
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

