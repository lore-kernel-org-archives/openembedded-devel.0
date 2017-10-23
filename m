Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 699D76FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Oct 2017 11:12:10 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id n82so29979572oig.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Oct 2017 04:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BZpsAiUt0ROnO+3A0J7Zu4HCtCFkjS9pASwcB3LFkyA=;
	b=S1LSsK62QX4gRv+RopDrT8SGIeATp3V9hKY1JasqQnsLMksS1xoOVOZWIpD1SHDJ6C
	wBQd8DnTAU+2Zm8p+RIvYrVA/fJvLcF1/A61Es27ZMOx/Pb7+sOHd2fvy2zOrKEsDNm5
	nvKfDCwt/9V1Ug8PFNV+EPfhQdgtp01gNHVnpd2q49Jg0BGmTBV0D75oh7343Pv9MRJF
	1NV3s5xxBRUoNsRWe4MFGMqUQQq6I0ABVn6i0ksxWMQtJaCuhedbt5cGJecwnGGwKaKD
	pp5glXYuiCnIHYchTxU1XBjcEoKSKZQZM0ovRiIJF4JlAwu44uo95KdQXA/pnnFYAcip
	tfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BZpsAiUt0ROnO+3A0J7Zu4HCtCFkjS9pASwcB3LFkyA=;
	b=O6KpHGjcGdbqs+0BNCa7jSkqmRbgEI4ThfDHAHYfqqUdMSbtYcx6LykmZ4N6krbZM2
	ZVCsrv0WnXVTetkUGt/nWjj8ertX0aWYFRCZmN5ipow40uhlTDjmDkDelVU9KebTHlqP
	TR/qqf2nG01uDbQHbyS1R2fi8c36unP4QQwDQOrQDjRhRstbxgFzVme8pV3F2772nJZt
	GdQjjvGSGTgNyEXniMDnWyJrrcjNeh2medDnvOH/ZSGPTovrw2W1myfyRMpM3Jb/0F1U
	ZhToox8Uj/kOPm62GjxPgWfawLmRyvmY9AQYESm6uhWsQzVlg0UvEu76wZ0+4UtxhesS
	XR6Q==
X-Gm-Message-State: AMCzsaW4cRc+0CVPG5P7FngxVhQxcJvsou9YXDrxcY+0D0d2T68E8tyg
	7iUKufMoFFvRorOdaBAGA0qVaYl+
X-Received: by 10.202.79.7 with SMTP id d7mr7420542oib.273.1508757131116;
	Mon, 23 Oct 2017 04:12:11 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48])
	by smtp.gmail.com with ESMTPSA id o9sm3181796oik.42.2017.10.23.04.12.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 04:12:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id g125so29967542oib.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Oct 2017 04:12:09 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TvHFfuF15OciClWomE/PupIW/d+br2/I5ZFPo+rh1S43lvZw9EYu0GfdJPkrDhG2czVozuTdr4JCjsxwtKglQ=
X-Received: by 10.202.177.66 with SMTP id a63mr4399993oif.375.1508757129289;
	Mon, 23 Oct 2017 04:12:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 23 Oct 2017 04:12:08 -0700 (PDT)
In-Reply-To: <87lgk2nmxg.fsf@rkubodac-desk.ger.corp.intel.com>
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<5612aa4c-d986-89f7-7667-14898b5f7bfc@igalia.com>
	<878tgbxio5.fsf@rkubodac-desk.ger.corp.intel.com>
	<874lqzxhoc.fsf@rkubodac-desk.ger.corp.intel.com>
	<87efq0wnt0.fsf@rkubodac-desk.ger.corp.intel.com>
	<87shefnm1g.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171020153307.GA6636@linux-uys3>
	<87lgk2nmxg.fsf@rkubodac-desk.ger.corp.intel.com>
Date: Mon, 23 Oct 2017 09:12:08 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqqSJDKNsoPoYR0oFUVynQqpey_jaSjLeEAPxYV3fpNPA@mail.gmail.com>
Message-ID: <CAP9ODKqqSJDKNsoPoYR0oFUVynQqpey_jaSjLeEAPxYV3fpNPA@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Mon, 23 Oct 2017 11:12:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2017 at 9:06 AM, Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
> Trevor Woerner <twoerner@gmail.com> writes:
>
>> On Thu 2017-10-19 @ 06:24:11 PM, Raphael Kubo da Costa wrote:
>>> Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:
>>> > Work on Chromium 62 has started, but updating is a bit slower now tha=
t
>>> > I'm trying to test GCC 5, 7, pyro and rocko.
>>>
>>> I've pushed a new branch called "chromium62". It's been test-built
>>> against Yocto's pyro (with GCC 5) and rocko (with GCC 7) for x86 and
>>> x86-64.
>>>
>>> Additional testing is appreciated!
>>
>> It looks like something in the chromium62 build is calling my native g++=
 and
>> expecting that this native g++ will be recent enough to support c++14:
>>
>>
>>       | g++ -MMD -MF base/base_paths.o.d
>>       | -I/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-nat=
ive/62.0.3202.62-r0/chromium-62.0.3202.62/out_bootstrap/gen
>>       | -I/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-nat=
ive/62.0.3202.62-r0/chromium-62.0.3202.62
>>       | -isystem/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/=
gn-native/62.0.3202.62-r0/recipe-sysroot-native/usr/include
>>       | -O2 -pipe -DNO_TCMALLOC -D__STDC_FORMAT_MACROS -O2 -g0
>>       | -D_FILE_OFFSET_BITS=3D64 -D__STDC_CONSTANT_MACROS
>>       | -D__STDC_FORMAT_MACROS -pthread -pipe -fno-exceptions
>>       | -isystem/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/=
gn-native/62.0.3202.62-r0/recipe-sysroot-native/usr/include
>>       | -O2 -pipe -std=3Dc++14 -Wno-c++11-narrowing -c
>>       | /z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-nativ=
e/62.0.3202.62-r0/chromium-62.0.3202.62/base/base_paths.cc
>>       | -o base/base_paths.o
>>       | g++: error: unrecognized command line option =E2=80=98-std=3Dc++=
14=E2=80=99
>
> Ouch :( That's a new kind of issue I was not expecting.

It needs to check if c++14 is really needed for GN to work. Better
would it depends on gn-native and it to be handled elsewhere.

>> [...]
>
>> Is there any way to intercept these calls and have it call OE's gcc-nati=
ve
>> instead?
>
> Do you have an example of that being done in another recipe?

Hard. We don't build a native compiler.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

