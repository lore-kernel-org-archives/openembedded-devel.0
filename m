Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 122CF799C4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 19:28:21 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id b7-v6so6490330pfo.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SNUdF/qBGEBR/egIS16zUKksMOGg4KV6bxNsGcB7RBQ=;
	b=ubVjer42hyHXb/OMHXv38bkXmZPnP8M+v2qOVHnDN1fvsnVCO2bhVqW9AY7GEZ8UoS
	ti/0NXtxmpJgkjTX4LI6gqtF6TWmOyopteXLvjMBtYoPXhSlgx1X2rE4Q3A3fCq1A7Au
	XfZn7jnMzw1RMXBm9tIe67x6eNK/uU+xClRk6qv+5d38WQoTvwu4OYkneE8iHC6akFHc
	ZXvPLvfnAlGX6I0rv2KUpBekRAdW9ERKMgFugcbLN2TDkZSTqVZIuxYvOsmPWA6Xa7I9
	swdgiUFifxlKTvGp0EXVdAdjnnPl3YeUdOtbUMXsMVQv5U5bHAuHfTi7Wa8dcj1h5mZp
	2z2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=SNUdF/qBGEBR/egIS16zUKksMOGg4KV6bxNsGcB7RBQ=;
	b=fECxb4YUjuTTjFVFu0DFGUGJMNJTkppe1A0cCdyWguMkgu2vgvJ8i40WISMGRr+ReK
	WkFixpzL4F6k884Yzi3SH5HwnDCz1PqLrqBhm2EHqNnynJ15YrGXAl6ffJ2Gn12nOQmQ
	j/U+mEDrpvty5dfBHFcX/TUD1vqmuaJWs6K+PU/+fx13nXONLueMxO1GYp346/h+XxB9
	kH0Bmsw3IROXQpsOp6fhV4ptr+n3RnFs7DurPzBmg0tuklLuXg5oTdniY4Jj6xUC/tW5
	FuVroOGJfa25/bLm85qHUWTO9VHMuql/SKy/B51JzMvMrj5GL+95at4XHrtPFE3cstWE
	5UBQ==
X-Gm-Message-State: ABuFfoiA+3IKqg0KbEYePXTImsqVpU/pYAhK01Po4t4V/gzZFbTyj7ST
	ch59ZQ4s93QHUkFGma68JavFA1a7
X-Google-Smtp-Source: ACcGV60DkJuNfb/L0znnV6w+56Vi/BBSpcBemzvsLoBTuhYzE6vM1dJktuVq6wJUMGmJ7c5W0J5sLA==
X-Received: by 2002:a62:6eca:: with SMTP id
	j193-v6mr4263325pfc.256.1538249302893; 
	Sat, 29 Sep 2018 12:28:22 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:d58e:d32:beb0:c4a3?
	([2601:202:4180:c33:d58e:d32:beb0:c4a3])
	by smtp.gmail.com with ESMTPSA id
	d63-v6sm12955126pfd.94.2018.09.29.12.28.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 12:28:22 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20180929181029.22080-1-akuster808@gmail.com>
	<20180929181518.GB1449@jama>
	<CAMKF1spF3hNc5Bu68j3=+poRud6v6JLpbDd-gYvYJXvidiCkiA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5c782aef-2da5-eeb1-4cb3-2fdf32c26ffd@gmail.com>
Date: Sat, 29 Sep 2018 12:28:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spF3hNc5Bu68j3=+poRud6v6JLpbDd-gYvYJXvidiCkiA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] mpd: fix yocto-check-layer issue with mulitmedia
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
X-List-Received-Date: Sat, 29 Sep 2018 19:28:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/29/2018 11:46 AM, Khem Raj wrote:
> v2 needs to be rebased on top of master as well.

sure.. I did have an updated mater but on a different system so the
brain marked that task as done.

- armin
> On Sat, Sep 29, 2018 at 11:15 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Sat, Sep 29, 2018 at 11:10:29AM -0700, Armin Kuster wrote:
>>> ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS on or otherwise requires it)
>>>
>>> enable acc only if LICENSE_FLAGS is commercial
>> aac
>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
>>> index c0d4c8c2b..aee9e0769 100644
>>> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
>>> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
>>> @@ -27,7 +27,8 @@ SRC_URI[sha256sum] = "8322764dc265c20f05c8c8fdfdd578b0722e74626bef56fcd8eebfb01a
>>>  EXTRA_OECONF = "enable_bzip2=yes"
>>>  EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
>>>
>>> -PACKAGECONFIG ??= "aac alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
>>> +PACKAGECONFIG ??= "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
>>> +PACKAGECONFIG += "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
>>>
>>>  PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,faad2"
>>>  PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


