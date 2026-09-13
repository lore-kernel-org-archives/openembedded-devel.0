Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094EBC88E53
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 00:05:12 +0000 (UTC)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16749.1789257903616051611
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 17:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=THLx739Y;
 spf=pass (domain: gmail.com, ip: 74.125.231.76, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-4693691fc81so393959fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 17:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789257903; cv=none;
        d=google.com; s=arc-20260327;
        b=YAsSzw57rWsE0Fz5WzRcNcf8wA16W0VFQ8ZLr5gDBdcIYAI5v1HKtjfVH6R2oW5+i2
         7QjDaJq4vCv35o9W4wuXmOshCGBVJE73avulrzMIoi/CKHZ5w2r4FrymPHdLqCgUbwU1
         TWtlJ9NbrqM68Bxpo8OIroniVnl17218s2nYdYa8SApSX48S+aRlO9x00rToHprabh0c
         rOekXc0FXyipmg6DrAq/gabv9woYP5LG+cRB5p1iKyz4xAEm9qlSGQeTECs4ip41uFh5
         zkg5UTWa3IVUuykACj4UexGgRk/l/3bBH0aSF9vdh+ZMn9LJpQkOLWKLEvekvBdBChBx
         EMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ne4qMxHbiV7XbUw7NIs0vc0uumK8wKQr0Bmp9jkUTJo=;
        fh=MDr69MKAKPhHLP/BdTV+G8EzKpzjSmRQCaJY6/3y2p0=;
        b=aU0dih+3IiSXvVnY+jtR9S2sallbDrdZyfiMCPOX9RbmZyg7Nn60D59xh0l2h+D9y+
         Tz90WfldiPsqfTjjoNYIJCqfQ+PpfxET3rfQsis7HK4bpFXkrmaSmPRFLrqfgFq3w85p
         nCMVpvKgRft0ggEQ1yU/AId3ozEP5D4KW3j09e8zBDbhsLhODRHdXZwW2sPJL3x8ENBT
         LNIyTLEeG5ojc/hphlx52IsMGVZrmElo3vFbEu0OpZdmm/m8IcuaYI+0FX+YDan4KT6A
         HAzi4bYO9Gx8KxE++/qkuoyLEX3P5SGCjnrwoeJV3qgaI1vjGE+UY4HwQ9XZ3l7KsKCI
         fUdw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257903; x=1789862703; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ne4qMxHbiV7XbUw7NIs0vc0uumK8wKQr0Bmp9jkUTJo=;
        b=THLx739YJq/6iMkW6Zi+sa2vgaXzvs4kTs8vYEYaFUxzJHTFJIWoKUiB2NVKa4Dwwx
         uVLEfgj0LnqwC9AsOG8ZgakqGHnjHZwoHqHNo9bMEKIODXXNLaNUAG5thTFjtXyN5Je+
         S3ITK9As2CsLkztevACeBiNtf67exApUuKV0KbvoRYRsFd525NqJpAa820k2XWeljhK2
         54W3+2AhXwCseTbGiR1qZRrSzkhgELQTseQnDxHRFOwd8o+P2igtmdsmRQ0kafoklzyd
         ZDK6HnP/ti3W/s7C5fsqTiOGQN0vX6/cBpdXdyOPaUcZKpBfwToIzF8O77iEwokBQ/sh
         6p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257903; x=1789862703;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ne4qMxHbiV7XbUw7NIs0vc0uumK8wKQr0Bmp9jkUTJo=;
        b=WeSO2/DMzC2VjlIW1+XArs45DBI+LuFtEee5gZzfMC60xq043ht+4JZj/Ru5uh88WX
         x1BKS7Q6wP95rhsmEaGrNa7Yu5s0EIbf+cv+OFk08MpNWmJED1BUtGqL6L+n4kfuy8uy
         RTX1UgDanF8ZajVJIpweShgzd7/TxcLva/Tw6adVjo45TaxU7l1WJMrcv3IC8Dw63Ab9
         Zlgf3flwTX1i2C14TATh8dfa9xq71ojcP/IteSHs5qj9/J2XbH8Jr37a/bYeqvv/7MVW
         RBcgf19M1qgOJppwnSFtSIneMBQddmDI4DzTGESiSMHC9eGjwE/wGUE4cvCf/QDMYk5F
         w4BQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWqD37OVcIa/SwjydzbsKhvYkLdneJAXOuEIuI4ykykSPsOKokh3dryObfNsSRCMB4k4QQn2PHdrnwl7arMG6JiQE=@lists.openembedded.org
X-Gm-Message-State: AFuF++nd4i7JmUIqH5sYGsKNvJBxGcQWXo1a+mOLT7HDQRhnv//Q1sLM
	O8av89zg62ZYYczkxWrjCJIOddEoePuSS7p3mgVzEDdSWmuzF7c15MVSHDpmRKnjxTsurbXhqtc
	vONbks5mSSy38Cv9tIPJEpZ3KBOFHl3Q=
X-Gm-Gg: AYBFou04BC3syGiiAu3kfz4UqQajFemck/9qBynWyeVmnBls/2U/Bhiq7Un7TkxF0a5
	iO+g81Naue7JSx/o6jqiYN3FGwh6BuJ8/YBdN9wOoo6MQ3lVQps5RVP6N2x/t+TldFBH4tKbZcU
	rKVwyEThmZ4kVDzBtOdgFWzmbfslLwpVSGjdWIclA1hXMY8f/O80x2jp3gy4HuU5px7NgKTo4jl
	E0gV9ThZBv0Y7i/blGWvusrMdm2fy2i7VwndqG8W6MI38A9H+n+chYI+yveC9BTdsshBsR8V1Lq
	P/rUyRIcNszIyvRfbAuc/GW8inXeuvfibNBRrBnvIaO3Z/gbbCQRMB5WrPODOv+yOY0AcA==
X-Received: by 2002:a05:6871:6181:b0:448:8bdd:8358 with SMTP id
 586e51a60fabf-47f58514e5bmr2597878fac.15.1789257902662; Sat, 12 Sep 2026
 17:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260911045624.4072516-1-alistair.francis@wdc.com>
 <CAMKF1sr-M=kiTZhuOsy0sfuXHpC8ge8Yh7tBc-3uTuojmdLkhA@mail.gmail.com> <CAMKF1spvDCxwCKQKtaj0eLgcS8_p6G9t3X1E8hsdju9OW9txHQ@mail.gmail.com>
In-Reply-To: <CAMKF1spvDCxwCKQKtaj0eLgcS8_p6G9t3X1E8hsdju9OW9txHQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 13 Sep 2026 12:04:51 +1200
X-Gm-Features: AcwNN1WZxV_6IewXx4o2LEdwb_v4ErXAPyTEyV_zYwkSNcvkjzQd9HmdB8TEdgg
Message-ID: <CADySD0H+PG70nUvUmmQ5iRWYieGHXJfkFVakHVU5o=vVu0e2Vg@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] tcmu-runner: Initial commit
To: raj.khem@gmail.com
Cc: alistair23@gmail.com, openembedded-devel@lists.openembedded.org, 
	alistair@alistair23.me, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 00:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129992

On Sat, Sep 12, 2026 at 3:01=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> and also fails to build with clang see - https://errors.yoctoproject.org/=
Errors/Details/971842/
>
> On Fri, Sep 11, 2026 at 7:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>> This fails on AB with
>>
>> stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: QA Issue: File /usr/sr=
c/debug/tcmu-runner/1.6.0/tcmuhandler-generated.c in package tcmu-runner-sr=
c contains reference to TMPDIR [buildpaths]
>> stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: QA Issue: File /usr/sr=
c/debug/tcmu-runner/1.6.0/tcmuhandler-generated.c in package tcmu-runner-sr=
c contains a reference to the build host HOME directory. If upstream hardco=
des a directory path that matches your home, you can set OEQA_BUILDPATHS_SK=
IP =3D "/srv/pokybuild" in the recipe. [buildpaths]
>> stdio: ERROR: tcmu-runner-1.6.0-r0 do_package_qa: Fatal QA errors were f=
ound, failing task.
>>
>>
>>
>> On Thu, Sep 10, 2026 at 9:56=E2=80=AFPM Alistair Francis via lists.opene=
mbedded.org <alistair23=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> From: Alistair Francis <alistair.francis@wdc.com>
>>>
>>> Initial support for verion 1.6.0 of tcmu-runner.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>  .../tcmu-runner/tcmu-runner_1.6.0.bb          | 33 +++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>  create mode 100644 meta-filesystems/recipes-utils/tcmu-runner/tcmu-run=
ner_1.6.0.bb
>>>
>>> diff --git a/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6=
.0.bb b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.0.bb
>>> new file mode 100644
>>> index 0000000000..c851bb10f7
>>> --- /dev/null
>>> +++ b/meta-filesystems/recipes-utils/tcmu-runner/tcmu-runner_1.6.0.bb
>>> @@ -0,0 +1,33 @@
>>> +SUMMARY =3D "A daemon that handles the userspace side of the LIO TCM-U=
ser backstore"
>>> +LICENSE =3D "Apache-2.0 OR LGPLv2.1"
>>> +LIC_FILES_CHKSUM =3D " \
>>> +       file://LICENSE.LGPLv2.1;md5=3Da7ef827a98fa240d37910ac4e8ce3f53 =
\
>>> +       file://LICENSE.Apache2;md5=3D6c4db32a2fa8717faffa1d4f10136f47 \
>>> +       "
>>> +
>>> +SRCREV =3D "1bdb239fa183c84d2ace6b52aa33476968a0cef7"
>>> +
>>> +SRC_URI =3D "git://github.com/open-iscsi/tcmu-runner.git;protocol=3Dht=
tps;branch=3Dmain"

can please also include tag=3Dv${PV} in the SRC_URI

>>> +
>>> +inherit cmake pkgconfig systemd
>>> +
>>> +DEPENDS =3D "gtk4 libnl gperftools glib-2.0-native"
>>> +
>>> +EXTRA_OECMAKE =3D "-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 \
>>> +                -Dwith-rbd=3Dfalse \
>>> +                -Dwith-glfs=3Dfalse \
>>> +                "
>>> +
>>> +PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d=
)}"
>>> +
>>> +PACKAGECONFIG[systemd] =3D "-DSUPPORT_SYSTEMD=3DON,,"
>>> +
>>> +SYSTEMD_SERVICE:${PN} =3D "tcmu-runner.service"
>>> +SYSTEMD_AUTO_ENABLE =3D "enable"
>>> +
>>> +FILES:${PN} +=3D " \
>>> +    ${systemd_user_unitdir}/lib \
>>> +    ${systemd_user_unitdir}/tcmu-runner \
>>> +    ${systemd_system_unitdir}/tcmu-runner.service \
>>> +    ${datadir}/dbus-1 \
>>> +"
>>> --
>>> 2.55.0
>>>
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129974): https://lists.openembedded.org/g/openembedde=
d-devel/message/129974
> Mute This Topic: https://lists.openembedded.org/mt/121193927/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

