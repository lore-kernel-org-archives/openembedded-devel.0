Return-Path: <koen@dominion.thruhere.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEF9CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 09:55:06 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.3071.1761731703789878971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 02:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dominion-thruhere-net.20230601.gappssmtp.com header.s=20230601 header.b=hiOZxqbm;
 spf=none, err=permanent DNS error (domain: dominion.thruhere.net, ip: 209.85.218.48, mailfrom: koen@dominion.thruhere.net)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d3effe106so1559519566b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 02:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dominion-thruhere-net.20230601.gappssmtp.com; s=20230601; t=1761731702; x=1762336502; darn=lists.openembedded.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fv4itjCO40Dlbj+oW+wIUMt7MoHxvL8a77HIB8hYmPc=;
        b=hiOZxqbm+FDSYkICojxj+w8L+P4ajyiQiXvfYHk9oq14Jg5cObwh69dHRGrBV6M5Wq
         mksTPQGFZZrIJhjhJg/HYEmUmJhX81lLG3tP5obhswi611PMeavfLsb+yPSqZtakXT4C
         z3UZqvhlhynJVlUFDkt1ry8gBJ2hzJQ6boqi85iahaaMX/42k4PvLQshjkMxwZzaMYdB
         mRVl6otq5ezOAPWPLZI33VMAb5pZzeKT6GVw9FOLVMNb5EXvOq3DxUv8gIbCZr2xRkGA
         j3wlHsO6RahwwmR5jLdYOWHGgHPta0Us0supFevhUIhCZ76aNd76JVT/Pz60CM7cy+RA
         f5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731702; x=1762336502;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fv4itjCO40Dlbj+oW+wIUMt7MoHxvL8a77HIB8hYmPc=;
        b=BxRBQUo+l4z8+XIfs3n0i4TnOitoqlrUD13ID2n0NLoXoawVQ62xFcPVRjEDLM3ybW
         nT679St70puykLdMOD7BjfIY+/o1AYcDjeZH1gVolJfbmLuHkBaJwPTGyatYDCoPdyk4
         k6+oMVOV1/oi7mhR0KqqB+oGYnZCFe2CaAfSkiS9oBH8HonGe7saMh/QPy9pjlW3M/7Q
         ENTqc6XVGufSyyJhUcgMsoLu7isIjKNRCT1zR0nuixckQ018EMxtEeg5ZlMaL7kad5Vb
         EKA99SYN2oPEhuQu+DrA5hdCLSDJxEXQJ+EPE+6gfeJr4dEIvVCH9qz2cQGpppTN0671
         SB7g==
X-Gm-Message-State: AOJu0Yz9ht3W4SZww/IAJKMMtpQdpgl27rkkoJHWXBfMiPo0FjG+rxaX
	IMefgVMvG0+ddxRcJ5kqD9rJIiiri0LPinkaUn/rrw4KmbKArOtMK97RGVX/pVc/8WRuaDcfS47
	2gJwJIA==
X-Gm-Gg: ASbGncszvHxFNw/fe5pTbzBN1ozw1LZEQrXcnF05aD0Sdi+1pFM8nrXJ+eyW5+9dqyp
	sZAC0o4FnWAXiPJ3S1cl3KAcrKDivY0HD2IL7LlMXsvWDPLNGY33u6RFRB4kbbdx7W4qmCVxKDn
	fpECWfzeOuYCTwvBohXFebpobpas4BRUalkXhNb5byz61DKj3aSJYiFBGxva3RsaA+W3n9CluYV
	RyJZ3SmALSgqyuA/VnoSTIsm3DxfQDJJ4M0O03g6hz4zXxTkvTKVIzAnRYy+7bvCmgtGbUWQMzF
	sSX+53A9VdgSl43DF+2CasNDT30lgfs2SpozOxYFCEbVVqTiCT0wV/7uHaiISw/+qON7OyAngoi
	cSDyC2dcNOGxgBevruOqMPec+DbRswf9Q8x203ga/NDlfatqFIy9r0uiC43USOWmK2yhwrElX8m
	xxDLZEzISmdA3RXs+1X8q8zou6ufoMuqyCSB6mbE+xxAswYkcQrUy/puLq
X-Google-Smtp-Source: AGHT+IGykLQdIHIO9gLYFzWuJlueVdYdnUHpHGX4aMTT5dXJ6ZLnf2j8h+pUii/FELdSNjKOGB7pNQ==
X-Received: by 2002:a17:906:d551:b0:b04:5a74:b674 with SMTP id a640c23a62f3a-b703d5f8712mr231912366b.58.1761731701812;
        Wed, 29 Oct 2025 02:55:01 -0700 (PDT)
Received: from smtpclient.apple (185-047-135-246.jonaz.nl. [185.47.135.246])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef8288asm11504685a12.10.2025.10.29.02.55.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:55:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [oe] [meta-oe][PATCH] gpsd: update to 3.26.1
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CADySD0Fc3CPTs8u+saEFJPwhUCw2xea9z47gYG1=+EvFZ0VrRg@mail.gmail.com>
Date: Wed, 29 Oct 2025 10:54:50 +0100
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C9CABDC8-2999-41F1-BF5D-EFBF3A62D8C9@dominion.thruhere.net>
References: <20251027144201.2754511-1-koen@dominion.thruhere.net>
 <CADySD0Fc3CPTs8u+saEFJPwhUCw2xea9z47gYG1=+EvFZ0VrRg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3864.100.1.1.5)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 09:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121145



> Op 27 okt 2025, om 21:55 heeft Ankur Tyagi <ankur.tyagi85@gmail.com> =
het volgende geschreven:
>=20
> On Tue, Oct 28, 2025 at 3:47=E2=80=AFAM Koen Kooi via =
lists.openembedded.org
> <koen=3Ddominion.thruhere.net@lists.openembedded.org> wrote:
>>=20
>> Drop patch that was applied upstream in =
https://gitlab.com/gpsd/gpsd/-/merge_requests/406
>>=20
>> Upstream changelog:
>>=20
>> 3.26.1: 17 May 2025
>>  Increment libgps version
>>  Update Debian Trixie in build.adoc
>>  Fix buffer overrun in cgps.
>>  Make gpsmon deprecation slightly more obvious.
>=20
> I think it will be helpful to explicitly highlight gpsmon deprecation
> in the commit message as well

Agreed, I sent a v2 with more text about gpsmon.

regards,

Koen

>=20
>>  Fix some *BSD compiler warnings
>>  Fix numerous typos.
>>=20
>> 3.26: 11 May 2025
>>  Handle NTRIPv2 that comes in "chunks".
>>  Add many UBX decodes.  Mostly in ubxtool, some in gpsd.
>>  Improve TSIP and UBX initialization.
>>  Gather Antenna Status (ant_stat) and Jamming (jam) and send to JSON.
>>  Always build u-blox, RTCM104V2, RTCM104V3 drivers.
>>  Add partial support for badly documented ALLYSTAR GNSS messages.
>>  Add minimal support for Unicore GNSS messages.
>>  Add minimal support for CASIC GNSS messages.
>>  Add minimal support for buggy Inertial Sense GNSS messages.
>>  Try to work better as non-root using non-standard "capabilities".
>>  Add SUBSYSTEM=3Dgnss rule to gpsd.rules
>>  Moved ntploggps from NTPSec to GPSD and renamed to gpslogntp.
>>  Fix many build, Coverity, and Codacy warnings.
>>  Improved Python interface for the lexer.
>>  Add support for new BeiDou PRNs and subframes.
>>  Officially deprecate gpsmon.
>>  Improve support for NMEA 4.11 (a stealthy moving target).
>>  Remove Oceanserver IMU support.  Never worked well.
>>  Always with  build ubx, NMEA 103, rtcm104v2 and rtcm104v3 support.
>>  Add support for jamming detection.
>>  Add Go client example.
>>  Add support for RTCM3.2
>>=20
>>  Note: The new "chunk" code led to a short lived bug that led to
>>        CVE-2023-43628, a buffer overrun.  That bug never appeared in
>>        any gpsd release.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> .../gpsd/gpsd/fix-pps_strerror_r.patch        | 51 =
-------------------
>> .../gpsd/{gpsd_3.25.bb =3D> gpsd_3.26.1.bb}     |  3 +-
>> 2 files changed, 1 insertion(+), 53 deletions(-)
>> delete mode 100644 =
meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch
>> rename meta-oe/recipes-navigation/gpsd/{gpsd_3.25.bb =3D> =
gpsd_3.26.1.bb} (97%)
>>=20
>> diff --git =
a/meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch =
b/meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch
>> deleted file mode 100644
>> index 8942b39524..0000000000
>> --- a/meta-oe/recipes-navigation/gpsd/gpsd/fix-pps_strerror_r.patch
>> +++ /dev/null
>> @@ -1,51 +0,0 @@
>> -=46rom c72a489e2eb13296c7b514b7341033114abf430a Mon Sep 17 00:00:00 =
2001
>> -From: Miroslav Lichvar <mlichvar@redhat.com>
>> -Date: Mon, 22 Apr 2024 11:31:24 +0200
>> -Subject: [PATCH 1/2] SConscript: provide variable names to =
MergeFlags
>> -
>> -If the scons MergeFlags() function is provided with a list of
>> -compiler/linker options, it needs to guess what options belong =
where. If
>> -it doesn't recognize an option, it is silently ignored. There are =
also
>> -ambiguous options that could be both in CFLAGS and LINKFLAGS (e.g. =
-spec).
>> -
>> -Provide MergeFlags() with a dict instead of list to avoid the =
guesswork
>> -in order to pass all options, even if some are not recognized by =
scons.
>> -Switch LDFLAGS to LINKFLAGS for better compatibility with existing
>> -scripts.
>> -
>> -Upstream-Status: Submitted =
[https://gitlab.com/gpsd/gpsd/-/merge_requests/406]
>> -Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> -
>> ----
>> - SConscript | 11 ++++++-----
>> - 1 file changed, 6 insertions(+), 5 deletions(-)
>> -
>> -diff --git a/SConscript b/SConscript
>> -index dab481654..ee90d87c4 100644
>> ---- a/SConscript
>> -+++ b/SConscript
>> -@@ -585,8 +585,8 @@ env['SC_PYTHON'] =3D sys.executable  # Path to =
SCons Python
>> - # explicitly quote them or (better yet) use the "=3D" form of GNU =
option
>> - # settings.
>> - #
>> --# Scons also uses different internal names than most other =
build-systems.
>> --# So we rely on MergeFlags/ParseFlags to do the right thing for us.
>> -+# Scons also uses different internal names than most other =
build-systems,
>> -+# e.g. it uses LINKFLAGS instead of LDFLAGS.
>> - #
>> - # scons uses gcc, or clang, to link. Thus LDFLAGS does not serve =
its
>> - # traditional function of providing arguments to ln. LDFLAGS set in =
the
>> -@@ -618,7 +618,10 @@ for i in ["ARFLAGS",
>> -           "SHLINKFLAGS",
>> -           ]:
>> -     if i in os.environ:
>> --        env.MergeFlags(Split(os.getenv(i)))
>> -+        t =3D i
>> -+        if t =3D=3D "LDFLAGS":
>> -+            t =3D "LINKFLAGS"
>> -+        env.MergeFlags({t: Split(os.getenv(i))})
>> -
>> -
>> - # Keep scan-build options in the environment
>> ---
>> -GitLab
>> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb =
b/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
>> similarity index 97%
>> rename from meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
>> rename to meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
>> index 0d5232c88c..e4a571daa6 100644
>> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.25.bb
>> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.26.1.bb
>> @@ -9,9 +9,8 @@ HOMEPAGE =3D "https://gpsd.io/"
>>=20
>> SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
>>            file://gpsd.init \
>> -           file://fix-pps_strerror_r.patch \
>>            "
>> -SRC_URI[sha256sum] =3D =
"b368b6a305e3f7a6382d23a0cbfc1d78923060b6b7f54cf7987a73c7b4a9afc2"
>> +SRC_URI[sha256sum] =3D =
"dc7e465968c1540e61bc57c7586d6a57a0047212a014efdad348f907bc2e0990"
>>=20
>> inherit scons update-rc.d python3-dir python3native systemd =
update-alternatives pkgconfig
>>=20
>> --
>> 2.47.3
>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#121051): =
https://lists.openembedded.org/g/openembedded-devel/message/121051
>> Mute This Topic: https://lists.openembedded.org/mt/115975689/3619737
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: =
https://lists.openembedded.org/g/openembedded-devel/unsub =
[ankur.tyagi85@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



