Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6E4C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 07:08:52 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.8405.1646291331459817104
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 23:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oI9gUrHU;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id x3so3433746qvd.8
        for <Openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 23:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gL64ojdJY4gaz+MDTIVgylJaw2UWhUbOppX6u4mFB00=;
        b=oI9gUrHUy0N7U3CSKQy+o5T4cxy27s8rGc0JKykBioEa0dPEUYbv70OFmoOEhQiZlJ
         mj0ndsCwxns5pEeEhZpVmQo3+27AbZtprW2fOeBccWJo9Mc/cg8QCMLZEt08fYmHuMPV
         gZAGthMwanPBiGvrL/MpiujPDuE++A3eBQv+ZKjztkSD1fPAwvvqRv2P4TyZasdnvMYs
         ryTsHVTH7ITIR1dLWrClpMj6XiR6/d4llE7WKdzVOBzhOW54GBdtRbziHc7XYNnhemhT
         Xd9msaiRzFLDo8zyBkDUsNrsQra0q5A/6YNqPckjAKkoYhIeTaFCo3ErI0K7TjduQYLF
         If0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gL64ojdJY4gaz+MDTIVgylJaw2UWhUbOppX6u4mFB00=;
        b=MLb2hSy8feD9WyHqXmoKpqLlfuWquP3DO1phOSH7PZRJwqn1fJadlKYUPhxns9vinG
         DabV2tPwC5lds5NviYgWajLVCGolIc8VNDQm4wDir7L96a8dCGyMN76NcNndbbfIiI3V
         dUuodMJJXfNWukGDbrkavswAaazTR/6hzCKhQLnqfL/3dOCCPyoZ9E3xkT/UidQr+oBK
         q5etxPIAPUWEf2+d/hq7ybCztU/+7QJSza0pGq4LP+qdE4497ma1QLnxHag8QeuH3Cel
         d8yI2SrC2ot1n+ICxdvKDeX09T293upGvXwTNBdwBOLeMVYkI0lgnP3HpDpJThF35a8l
         hbDg==
X-Gm-Message-State: AOAM53179li9LN9CQ8/YL33RVEiP5RU650YiPuS7MsfIFtnMFc9K3aeM
	Tbjoff1gE2vSpfahBKdOvgJq3PGHVWYkJviRxis=
X-Google-Smtp-Source: 
 ABdhPJxrERD9Ttyw9uIRSJuOg3e5zWuoIAgPMW1whOrkcleEKnzKXqnc050Hbp0q5RFun+w4qN/7pIpzk+gLDbqh4u4=
X-Received: by 2002:a05:6214:1c0d:b0:432:6487:9c53 with SMTP id
 u13-20020a0562141c0d00b0043264879c53mr23058507qvc.36.1646291330392; Wed, 02
 Mar 2022 23:08:50 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAMKF1sppjOqUoU2zswWD1h9E8gSntfMiQUak=wQrWrSJ71Qx3w@mail.gmail.com>
 <CAMKF1spv_=Lm=4=oBLA8v=Dx_=wzcGt1rZ89xxAZN-rPcnKgag@mail.gmail.com>
 <CAMKF1sq1-WTR_ndLV_oGJ+2HqWpMzt6ZePGqLJBXSSVcD25Sdw@mail.gmail.com>
 <CAMKF1sp4VCcuiJxOF1zDC0jB2860EGa6y+RKB0xWPeLBH_AGCw@mail.gmail.com>
 <CAMKF1spnXiT9PyV1HRVEuZAXFgWaX3m3tFrKHmT2Fhvgnb2BvQ@mail.gmail.com>
 <CANx9H-CtXBXECQUK98wyfruz7n2+rRC_X0CgFsPDhxDKCw1gdw@mail.gmail.com>
In-Reply-To: 
 <CANx9H-CtXBXECQUK98wyfruz7n2+rRC_X0CgFsPDhxDKCw1gdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2022 23:08:24 -0800
Message-ID: 
 <CAMKF1sqzPuN6dZch0LPhG-WGYSBX+z4nk9HjQ1KR-9BiKcQGCA@mail.gmail.com>
Subject: Re: [oe] PEP-517 packaging fixes needed in meta-openembedded
To: Tim Orling <ticotimo@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 07:08:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95730

On Wed, Mar 2, 2022 at 9:13 PM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Wed, Mar 2, 2022 at 6:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Here is latest failures we are down to 3
>>
>> https://errors.yoctoproject.org/Errors/Build/142145/
>
>
> I have a partial fix for python3-slip-dbus, but it doesn=E2=80=99t solve =
the problem.
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dtimo/p=
yprojecttoml&id=3D79b14b76276ac9a9378ed37bb39959de8bf4c751
>

I have addressed it. Right now we are effectively left with

meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unattended-u=
pgrades_2.6.bb

It fails in weird ways

| Installing collected packages: unattended-upgrades
| ERROR: For req: unattended-upgrades=3D=3D0.1. Unknown scheme key used in
/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unattended-upgrades/2.=
6-r0/git/dist/unattended_upgrades-0.1-py3-
none-any.whl: etc (for file
'unattended_upgrades-0.1.data/etc/kernel/postinst.d/unattended-upgrades').
.data directory contents should be in subdirectories named with a
valid scheme key (d
ata, headers, platlib, purelib, scripts)
| Exception information:
| Traceback (most recent call last):
|   File "/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/unattended-u=
pgrades/2.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/pip/_=
internal/operations/install/wheel.py",
line 521, in make_data_scheme_file
|     scheme_path =3D scheme_paths[scheme_key]
| KeyError: 'etc'
|
| During handling of the above exception, another exception occurred:
|

>>
>> On Wed, Mar 2, 2022 at 10:40 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > Here is latest list which is significantly less so thanks for
>> > contributions thus far.
>> >
>> >   meta-openembedded/meta-python/recipes-extended/python-blivet/python3=
-blivetgui_2.2.1.bb
>> >   meta-openembedded/meta-python/recipes-devtools/python/python3-aws-io=
t-device-sdk-python_1.4.9.bb
>> >   meta-openembedded/meta-python/recipes-extended/python-blivet/python3=
-blivet_3.4.3.bb
>> >   meta-openembedded/meta-python/recipes-devtools/python/python3-slip-d=
bus_0.6.5.bb
>> >   meta-openembedded/meta-python/recipes-devtools/python/python3-keras-=
applications_1.0.8.bb
>> >   meta-openembedded/meta-python/recipes-devtools/python/python3-pymetn=
o_0.9.0.bb
>> >   meta-openembedded/meta-python/recipes-extended/python-cson/python3-c=
son_git.bb
>> >   meta-openembedded/meta-python/recipes-devtools/python/python3-dbussy=
_1.3.bb
>> >   meta-openembedded/meta-python/recipes-connectivity/python-txws/pytho=
n3-txws_0.9.1.bb
>> >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/unatt=
ended-upgrades_2.6.bb
>> >
>> >
>> > On Tue, Mar 1, 2022 at 8:18 AM Khem Raj <raj.khem@gmail.com> wrote:
>> > >
>> > > We are making some progress. This is the latest ( 24 build failures =
)
>> > > as of last night.
>> > >
>> > > https://errors.yoctoproject.org/Errors/Build/142052/
>> > >
>> > > On Mon, Feb 28, 2022 at 3:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > > >
>> > > > Thanks for sending fixing everyone. Lets keep going. Here is lates=
t
>> > > > list of failing recipes on master-next now
>> > > >
>> > > > Summary: 32 tasks failed:
>> > > >   meta-openembedded/meta-python/recipes-extended/python-blivet/pyt=
hon3-blivet_3.4.0.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-aw=
s-iot-device-sdk-python_1.4.9.bb:do_compile
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-cr=
cmod_1.7.bb:do_compile
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-lr=
parsing_1.0.17.bb:do_compile
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-sl=
ip-dbus_0.6.5.bb:do_compile
>> > > >   meta-openembedded/meta-python/recipes-extended/python-blivet/pyt=
hon3-blivetgui_2.2.1.bb:do_compile
>> > > >   meta-raspberrypi/recipes-devtools/python/python3-rtimu_git.bb:do=
_compile
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-fl=
ask-versioned_0.9.4-20101221.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-nt=
plib_0.4.0.bb:do_install
>> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-circui=
tpython-register_1.9.4.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-be=
have_1.2.6.bb:do_install
>> > > >   meta-atmel/recipes-utils/mpio/mpio_1.3.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-py=
stache_0.5.4.bb:do_install
>> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-pureio=
_1.1.8.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-py=
scaffold_4.1.4.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-pr=
ctl_1.8.1.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-py=
metno_0.9.0.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-extended/python-cson/pytho=
n3-cson_git.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-py=
dbus-manager_git.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-py=
misp_2.4.152.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-db=
ussy_1.3.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/gyp/gyp_git.bb:do=
_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-ke=
ras-applications_1.0.8.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-gc=
ovr_5.0.bb:do_install
>> > > >   meta-raspberrypi/recipes-devtools/python/python3-adafruit-platfo=
rmdetect_3.1.1.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-co=
nfigshell-fb_1.1.29.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-devtools/python/python3-xm=
odem_0.4.6.bb:do_package
>> > > >   meta-openembedded/meta-oe/recipes-devtools/unattended-upgrades/u=
nattended-upgrades_2.6.bb:do_install
>> > > >   meta-openembedded/meta-python/recipes-connectivity/python-txws/p=
ython3-txws_0.9.1.bb:do_install
>> > > >   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.16.3.=
bb:do_compile
>> > > >   meta-openembedded/meta-xfce/recipes-apps/menulibre/menulibre_2.2=
.3.bb:do_install
>> > > >   meta-openembedded/meta-gnome/recipes-support/onboard/onboard_1.4=
.1.bb:do_compile
>> > > >
>> > > > On Sat, Feb 26, 2022 at 11:49 AM Khem Raj <raj.khem@gmail.com> wro=
te:
>> > > > >
>> > > > > Hello All,
>> > > > >
>> > > > > We have PEP-517 packaging related infra changes merged into oe-c=
ore,
>> > > > > which obviously
>> > > > > mean there are some failures on various python packages.
>> > > > >
>> > > > > I am posting the latest results (qemux86-64/glibc)
>> > > > >
>> > > > > https://errors.yoctoproject.org/Errors/Build/141804/
>> > > > >
>> > > > > We have 57 recipes left, Tim has worked diligently on fixing the
>> > > > > PEP-517 issues but we would
>> > > > > need more hands. If you see any of
>> > > > > these recipes that you can help fixing, please send patches
>> > > > >
>> > > > > Since upcoming release is an LTS release, I would like to have t=
hese
>> > > > > issues fixed for this
>> > > > > release.
>> > > > >
>> > > > > Thank you for your help
>> > > > >
>> > > > > -Khem
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95721): https://lists.openembedded.org/g/openembedde=
d-devel/message/95721
>> Mute This Topic: https://lists.openembedded.org/mt/89416561/924729
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
ticotimo@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

