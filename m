Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id A9F8A6012A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 15:44:36 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id k123so8860384qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2017 08:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yJJfqBASRRmSbBBOmHO9putUvh4H30duMtbTIlDNOas=;
	b=GsTvVJxQ/Rmp79q4wG/cadvKmmFZQwQKYxApwLJi6JVGijKbmNmGfzfoDe2Umzbbqf
	qEOMUBkA1+kzcXiPj7bwXqv//r31wiF868b2jVTWhWyKIoW22/FxaYsXWqU/bACKF6Mr
	muXL7+SGsdBJpUY6m9RLyEPtZHK6fSxVEeVFvbtHxDlVuznHoC9nict80p4Cp/V4HUoC
	h+gNNQAlzU89a43mm1urL3rqssMtR5X9fA8GiuwA02EMWUVuun5QDr+EjLV2rSCUZdgR
	Hz6oTMmivMEB2nKTJ/0vKoBj6r6BGajV9ByU2WWKtjaQWtUZxVZ/SONIfb7d2luMydIP
	syYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yJJfqBASRRmSbBBOmHO9putUvh4H30duMtbTIlDNOas=;
	b=W4B9DZsHxD67Bj65Dwow6PyG4qT0kV/ZesFqj2vKLPlQligri3n1CGJpOT9vAyXLTG
	FOuYfCOxRlzTdqb96Iy3tZn/dAqdDhMDyWx9k0AWj2/VheMvzUCtE0cyr1OfkZjbFqZs
	HwU6pFEXWbKEC67t/y6FzdGcN9lTbxp6lPIYMZqt0Z8h0JTvLu1Gg9cqOurMyMBCbAo4
	bFPcEXr6HdJJyNh/j1gAKgUlx7pN/qhu2FGkImUCfL9llyomS8HCflPnxDjmsTGfdq2C
	3ZBQyWUTe0o+F00WHsuxw1gtuh9kXUH33+jwtbWGc2yaTl1xCXPlnG7CsoRy055iyBuR
	YdFQ==
X-Gm-Message-State: AMCzsaWXJc85EqplG6ipibqWDwvDfyVyA/LuzbGszgbCCJUW3hclHV9T
	ux8K8xcoCEi8/f1ctTpzOVGt4XWlcgCbVo+TbQk=
X-Google-Smtp-Source: ABhQp+ROofg7iYBjxP21EV2O5e6g1nlWDsnS+TQX8eyZKXflmUfs06BnJJeoSLyDx4uOS+n0MDSgZ1QuyYkJC5neQDo=
X-Received: by 10.55.15.212 with SMTP id 81mr1441125qkp.262.1509119077608;
	Fri, 27 Oct 2017 08:44:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.199 with HTTP; Fri, 27 Oct 2017 08:44:36 -0700 (PDT)
In-Reply-To: <87y3o2m1iy.fsf@rkubodac-desk.ger.corp.intel.com>
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
	<CAP9ODKqqSJDKNsoPoYR0oFUVynQqpey_jaSjLeEAPxYV3fpNPA@mail.gmail.com>
	<87y3o2m1iy.fsf@rkubodac-desk.ger.corp.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 27 Oct 2017 11:44:36 -0400
Message-ID: <CAHUNapSQ1otDzx4kRVqpW6GFQdVWVhcZcWuWL4Q8n8qLHPyB5Q@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 27 Oct 2017 15:44:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2017 at 9:33 AM, Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
> Otavio Salvador <otavio.salvador@ossystems.com.br> writes:
>>>>       | g++ -MMD -MF base/base_paths.o.d
>>>>       | -I/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-n=
ative/62.0.3202.62-r0/chromium-62.0.3202.62/out_bootstrap/gen
>>>>       | -I/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-n=
ative/62.0.3202.62-r0/chromium-62.0.3202.62
>>>>       | -isystem/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linu=
x/gn-native/62.0.3202.62-r0/recipe-sysroot-native/usr/include
>>>>       | -O2 -pipe -DNO_TCMALLOC -D__STDC_FORMAT_MACROS -O2 -g0
>>>>       | -D_FILE_OFFSET_BITS=3D64 -D__STDC_CONSTANT_MACROS
>>>>       | -D__STDC_FORMAT_MACROS -pthread -pipe -fno-exceptions
>>>>       | -isystem/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linu=
x/gn-native/62.0.3202.62-r0/recipe-sysroot-native/usr/include
>>>>       | -O2 -pipe -std=3Dc++14 -Wno-c++11-narrowing -c
>>>>       | /z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-nat=
ive/62.0.3202.62-r0/chromium-62.0.3202.62/base/base_paths.cc
>>>>       | -o base/base_paths.o
>>>>       | g++: error: unrecognized command line option =E2=80=98-std=3Dc=
++14=E2=80=99
>>>
>>> Ouch :( That's a new kind of issue I was not expecting.
>>
>> It needs to check if c++14 is really needed for GN to work. Better
>> would it depends on gn-native and it to be handled elsewhere.
>
> While this specific issue is in GN, I expect it to happen during the
> Chromium build as well, as some tools are built and run on the host
> machine.
>
> Even if GN specifically does not depend on C++14 now, working around
> that is an uphill battle, as the Chromium project requires a C++14
> compiler and multiple parts of the code base will start using C++14
> features (or already are).

Ouch for sure! For some strange reason I was under the impression OE
builds created a native gcc for things like this! Oh well, I was able
to sort out the native compiler issue on my openSUSE 42.2 system; the
default gcc is 4.8, but there are packages for gcc5 and gcc6 so I just
installed the gcc6 one and used update-alternatives. It works, but it
will lead to some interesting questions wrt support and basic OE
support for openSUSE (however, that'll be a different discussion for
another day and probably for another mailing list).

I was able to successfully build for the minnow board (x86_64), but
when I tried building for the 32-bit variant for raspberrypi3 I got:

    | install: cannot stat 'swiftshader/libEGL.so': No such file or directo=
ry

during the do_install step for chromium itself. Odd, I thought egl
came from mesa? (but then again I thought OE built its own
gcc-native... :-S

