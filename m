Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2646DC636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:54:30 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10862.1677160467110307943
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 05:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bwt0YU4Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id m14-20020a7bce0e000000b003e00c739ce4so8243431wmc.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 05:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GLEuwMck0IcozFaKQYOL5+YEOIgOwKGYtiELxCOG+DQ=;
        b=Bwt0YU4QT51+tdUims29bQLUVjf5t36dp8lJ45lL3vE9vmbLu7T8nLdcvV0GFraCcQ
         Gc2MUPBRx0qxeKphuS+3ykkeJ0Kea+vpLJv8zXYsZH3z7MNdlPRxh7j/YLXniPq9NmKf
         Cal3SGrVReSmZ0HgbnVO6yZgKFzVfgwtQSE/gRP3YtvgMQ7l6kgWEaUgWfMDup1TjJsT
         pqu6XR+MMF990F7EHBbu+GVtEfYdXAMckKrEELKpyNX+eIHuVClmiDpnqXtOdfDF0YKE
         ZZ1Hs/cpRt7TbQXwsuQgJDWmTyVCW1M34KTwBLuDmDZ2bdmHlIwQbxbMd2JGvAyKZGCA
         VvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLEuwMck0IcozFaKQYOL5+YEOIgOwKGYtiELxCOG+DQ=;
        b=MV/N4LszMFss0qWAeTHB2VsRnF69wBll1U3PXpnZvCgMrGA3Yss8EKUMOlOKd50kGb
         NNBFonXZen/Zc+1Igm9VKf0G2qBK1Sktds0OXiCRrDHLtFHKVBw8Wfc9/7W8oiVKjUmF
         E8PLiGnRvomEsXL92fiIchzDHBzgMHDpwbNRcwyIRomuY14G/25UTBE4yIhr7M28QLvo
         L9z6gF0ydhOKQzegY3YAvMF2uoiEIT1jnUdvokgp11SfexrAFA6elYEH+QOUNK3yzSWv
         af4uSJ2RrHDjerijMOsSBs+01IeqVo+f5WfTQnlQolNoyFGDWIOYqqgR6urMk0EVilq3
         JWjQ==
X-Gm-Message-State: AO0yUKW1mh9G7e8Z4irWNislKkFzL/dZrvVLYW6sSsqnqvdrwhvoJzir
	1+e6w5lknVIC3ntMtpYhwYFbOlFrzOkcaKiG1GE=
X-Google-Smtp-Source: AK7set8dr0P5AO8kfx0xn7qp/0fmsqfipNsCSp9B6s2cG5xlcmDJqf9FwquDv2XcydIW5dXb37upCPgyQEwLC73hvOY=
X-Received: by 2002:a05:600c:1e8a:b0:3dc:546c:b2ec with SMTP id
 be10-20020a05600c1e8a00b003dc546cb2ecmr256611wmb.32.1677160465315; Thu, 23
 Feb 2023 05:54:25 -0800 (PST)
MIME-Version: 1.0
References: <20230223124050.2282580-1-yi.zhao@windriver.com> <174676461BB5DC73.19957@lists.openembedded.org>
In-Reply-To: <174676461BB5DC73.19957@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Feb 2023 14:54:10 +0100
Message-ID: <CA+chaQf4d7YTh6w=0X=TNmQgcoGSAhKRDA1X4q-Sgb_AwAcOMA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: fix Upstream-Status format
To: Martin.Jansa@gmail.com
Cc: Yi Zhao <yi.zhao@eng.windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c43c9105f55e5909"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 13:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101231

--000000000000c43c9105f55e5909
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've sent them now (on top of your 4 patches).

Some stats from meta-oe layers:

meta-oe Total patches found: 1230
meta-networking Total patches found: 496
meta-python     Total patches found: 106
meta-multimedia Total patches found: 82
meta-initramfs  Total patches found: 60
meta-gnome      Total patches found: 55
meta-filesystems        Total patches found: 43
meta-webserver  Total patches found: 40
meta-xfce       Total patches found: 18
meta-perl       Total patches found: 12

meta-filesystems        Patches missing Signed-off-by: 4 (9%)
meta-filesystems        Patches missing Upstream-Status: 13 (30%)
meta-filesystems        Patches in Pending state: 10 (23%)
meta-gnome      Patches missing Signed-off-by: 4 (7%)
meta-gnome      Patches missing Upstream-Status: 6 (11%)
meta-gnome      Patches in Pending state: 15 (27%)
meta-initramfs  Patches missing Signed-off-by: 4 (7%)
meta-initramfs  Patches missing Upstream-Status: 20 (33%)
meta-initramfs  Patches in Pending state: 6 (10%)
meta-multimedia Patches missing Signed-off-by: 11 (13%)
meta-multimedia Patches missing Upstream-Status: 19 (23%)
meta-multimedia Patches in Pending state: 27 (33%)
meta-networking Patches missing Signed-off-by: 66 (13%)
meta-networking Patches missing CVE: 2 (0%)
meta-networking Patches missing Upstream-Status: 130 (26%)
meta-networking Patches in Pending state: 188 (38%)
meta-oe Patches missing Signed-off-by: 226 (18%)
meta-oe Patches missing CVE: 5 (0%)
meta-oe Patches missing Upstream-Status: 381 (31%)
meta-oe Patches in Pending state: 370 (30%)
meta-perl       Patches missing Signed-off-by: 1 (8%)
meta-perl       Patches missing Upstream-Status: 1 (8%)
meta-perl       Patches in Pending state: 6 (50%)
meta-python     Patches missing Signed-off-by: 9 (8%)
meta-python     Patches missing CVE: 2 (2%)
meta-python     Patches missing Upstream-Status: 20 (19%)
meta-python     Patches in Pending state: 30 (28%)
meta-webserver  Patches missing Signed-off-by: 12 (30%)
meta-webserver  Patches missing Upstream-Status: 9 (22%)
meta-webserver  Patches in Pending state: 13 (32%)
meta-xfce       Patches missing Upstream-Status: 2 (11%)
meta-xfce       Patches in Pending state: 4 (22%)

If someone really wants I can add Upstream-Status: Pending to .patches
without any Upstream-Status (I already have oneliner to do that), but that
just replaces missing with Pending without adding any other value (other
than avoiding warnings from the QA check). But I also don't expect the
regular contributors to be able to add missing Upstream-Status in remaining
30% patches anytime soon.

Cheers,

On Thu, Feb 23, 2023 at 2:12 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> Be aware that with:
>
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230215172041.6=
36292-3-Martin.Jansa@gmail.com/
>
> meta-oe layers have 81 malformed Upstream-Status entries (before your
> patches are applied), so there are many more cases.
>
> But I agree that if it's included, it should be in the right format,
> because other people might copy&paste it to other new .patch files as wel=
l.
>
> I can send fixes for the rest.
>
> On Thu, Feb 23, 2023 at 1:41 PM Yi Zhao <yi.zhao@eng.windriver.com> wrote=
:
>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>  .../0001-server-Adjust-the-cache-alignment-assumptions.patch  | 2 +-
>>  .../obexftp/obexftp/Remove_some_printf_in_obexftpd.patch      | 2 +-
>>  .../lshw/files/0001-disable-docbook2man.patch                 | 2 +-
>>  .../fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch      | 2 +-
>>  ...rust.configure-do-not-try-to-find-a-suitable-upstrea.patch | 2 +-
>>  .../lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch               | 4 +---
>>  .../hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff                | 2 +-
>>  .../libb64/libb64/0001-example-Do-not-run-the-tests.patch     | 2 +-
>>  ...configure.ac-do-additional-checks-on-libxml2-also-wh.patch | 4 +---
>>  .../sharutils/sharutils/CVE-2018-1000097.patch                | 2 +-
>>  10 files changed, 10 insertions(+), 14 deletions(-)
>>
>> diff --git
>> a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-se=
rver-Adjust-the-cache-alignment-assumptions.patch
>> b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-se=
rver-Adjust-the-cache-alignment-assumptions.patch
>> index bf083c85f..52c9df9b1 100644
>> ---
>> a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-se=
rver-Adjust-the-cache-alignment-assumptions.patch
>> +++
>> b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-se=
rver-Adjust-the-cache-alignment-assumptions.patch
>> @@ -15,7 +15,7 @@ src/mongo/db/stats/counters.h:185:47: error: static
>> assertion failed: cache line
>>  The structure need to ensure true sharing for both the elements
>>  so align it to hardware_constructive_interference_size instead
>>
>> -Upstream-Status: Reported [https://jira.mongodb.org/browse/SERVER-65664=
]
>> +Upstream-Status: Inappropriate [
>> https://jira.mongodb.org/browse/SERVER-65664]
>>
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>  ---
>> diff --git
>> a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obe=
xftpd.patch
>> b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obe=
xftpd.patch
>> index 8b73af32e..23e92885e 100644
>> ---
>> a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obe=
xftpd.patch
>> +++
>> b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obe=
xftpd.patch
>> @@ -1,6 +1,6 @@
>>  Signed-off-by: Jun Zhu <R01007@freescale.com>
>>
>> -Upstream-Status:  Not applicable
>> +Upstream-Status: Inappropriate [embedded specific]
>>
>>  diff -Nru obexftp-0.23/apps.orig/obexftpd.c obexftp-0.23/apps/obexftpd.=
c
>>  --- obexftp-0.23/apps.orig/obexftpd.c  2013-11-08 10:42:20.816631583
>> +0800
>> diff --git
>> a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
>> b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
>> index 00f7b8674..706f2d524 100644
>> --- a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
>> +++ b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
>> @@ -5,7 +5,7 @@ Subject: [PATCH] build: Do not build .sgml file
>>
>>  It needs docbook2man tool which we do not have recipe for
>>
>> -Upstream-Status: OE-Specific [needs native docbook2man tool]
>> +Upstream-Status: Inappropriate [needs native docbook2man tool]
>>
>>  Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>>  ---
>> diff --git
>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overw=
rite-CFLAGS.patch
>> b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overw=
rite-CFLAGS.patch
>> index 6c585c2f5..158857ae2 100644
>> ---
>> a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overw=
rite-CFLAGS.patch
>> +++
>> b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overw=
rite-CFLAGS.patch
>> @@ -7,7 +7,7 @@ bitbake passes CFLAGS that are often in conflict with th=
e
>> ones set
>>  in mbedtls' CMakeLists.txt. Such conflicts are the inability to use
>>  FORTIFY_SOURCE=3D2 except in release mode
>>
>> -Upstream-Status: Innapropriate [due to fluent-bit having it's own
>> Release flags that also overwrite bitbake ones.]
>> +Upstream-Status: Inappropriate [due to fluent-bit having it's own
>> Release flags that also overwrite bitbake ones.]
>>  ---
>>   lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
>>   1 file changed, 2 deletions(-)
>> diff --git
>> a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-tr=
y-to-find-a-suitable-upstrea.patch
>> b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-tr=
y-to-find-a-suitable-upstrea.patch
>> index e63b05356..202f12612 100644
>> ---
>> a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-tr=
y-to-find-a-suitable-upstrea.patch
>> +++
>> b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-tr=
y-to-find-a-suitable-upstrea.patch
>> @@ -5,7 +5,7 @@ Subject: [PATCH] rust.configure: do not try to find a
>> suitable upstream target
>>
>>  OE is using custom targets and so this is bound to fail.
>>
>> -Upstream-Status: Inapppropriate [oe-core specific]
>> +Upstream-Status: Inappropriate [oe-core specific]
>>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>>
>>  ---
>> diff --git
>> a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch
>> b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch
>> index afe11f353..d232f6913 100644
>> --- a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.pat=
ch
>> +++ b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.pat=
ch
>> @@ -3,9 +3,7 @@ From: dgod <dgod.osa@gmail.com>
>>  Date: Mon, 21 Mar 2016 19:25:25 +0800
>>  Subject: [PATCH] fix css under gtk 3.20
>>
>> -Upstream-Status: Applied [1]
>> -
>> -[1]
>> https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cfd=
9454d70e4b0753531e46580416771
>> +Upstream-Status
>> <https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cf=
d9454d70e4b0753531e46580416771+Upstream-Status>:
>> Backport [
>> https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cfd=
9454d70e4b0753531e46580416771
>> ]
>>  ---
>>   data/themes/Industrial/gtk.css | 1 +
>>   1 file changed, 1 insertion(+)
>> diff --git
>> a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
>> b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
>> index 057b1fd1d..60953381a 100644
>> --- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
>> +++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
>> @@ -6,7 +6,7 @@ Filtered with:
>>    filterdiff -p1 -x README -x 'debian/*'
>>
>>
>> -Upstream-Status: unmaintained
>> +Upstream-Status: Inappropriate [unmaintained]
>>
>>  Index: hddtemp-0.3-beta15/doc/hddtemp.8
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> diff --git
>> a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-test=
s.patch
>> b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-test=
s.patch
>> index ea3ddfb64..b3ee24d9d 100644
>> ---
>> a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-test=
s.patch
>> +++
>> b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-test=
s.patch
>> @@ -3,7 +3,7 @@ From: Khem Raj <raj.khem@gmail.com>
>>  Date: Sat, 27 Mar 2021 21:41:04 -0700
>>  Subject: [PATCH] example: Do not run the tests
>>
>> -Upstream-Status: Inappropritate [Cross-compile specific]
>> +Upstream-Status: Inappropriate [Cross-compile specific]
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>  ---
>>   examples/Makefile | 3 ---
>> diff --git
>> a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-=
checks-on-libxml2-also-wh.patch
>> b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-=
checks-on-libxml2-also-wh.patch
>> index 7faeb130a..490b61f1f 100644
>> ---
>> a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-=
checks-on-libxml2-also-wh.patch
>> +++
>> b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-=
checks-on-libxml2-also-wh.patch
>> @@ -7,9 +7,7 @@ MIME-Version: 1.0
>>  Content-Type: text/plain; charset=3DUTF-8
>>  Content-Transfer-Encoding: 8bit
>>
>> -Upstream-Status: Applied [1]
>> -
>> -[1] https://github.com/dajobe/raptor/pull/33
>> +Upstream-Status: Backport [
>> https://github.com/dajobe/raptor/commit/e75b1dbb7f2a6514b8d391b200c45a2b=
ec6268bf
>> ]
>>
>>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>  ---
>> diff --git
>> a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
>> b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
>> index 99dc4e304..47eb9cfd6 100644
>> --- a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
>> +++ b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
>> @@ -36,7 +36,7 @@ This was reported in
>>  <http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html>=
.
>>
>>  CVE: CVE-2018-1000097
>> -Upstream-Status: no upstream [
>> http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html]
>> +Upstream-Status: Inappropriate [no upstream]
>>  Signed-off-by: Petr P=C3=ADsa=C5=99 <ppisar@redhat.com>
>>  Signed-off-by: Sinan Kaya <okaya@kernel.org>
>>  ---
>> --
>> 2.25.1
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101228):
> https://lists.openembedded.org/g/openembedded-devel/message/101228
> Mute This Topic: https://lists.openembedded.org/mt/97181611/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c43c9105f55e5909
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve sent them now (on top of your 4 patches).<div><br=
></div><div>Some stats from meta-oe layers:</div><div><br></div><div>meta-o=
e Total patches found: 1230<br>meta-networking Total patches found: 496<br>=
meta-python =C2=A0 =C2=A0 Total patches found: 106<br>meta-multimedia Total=
 patches found: 82<br>meta-initramfs =C2=A0Total patches found: 60<br>meta-=
gnome =C2=A0 =C2=A0 =C2=A0Total patches found: 55<br>meta-filesystems =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Total patches found: 43<br>meta-webserver =C2=A0Tot=
al patches found: 40<br>meta-xfce =C2=A0 =C2=A0 =C2=A0 Total patches found:=
 18<br>meta-perl =C2=A0 =C2=A0 =C2=A0 Total patches found: 12<br></div><div=
><br></div><div>meta-filesystems =C2=A0 =C2=A0 =C2=A0 =C2=A0Patches missing=
 Signed-off-by: 4 (9%)<br>meta-filesystems =C2=A0 =C2=A0 =C2=A0 =C2=A0Patch=
es missing Upstream-Status: 13 (30%)<br>meta-filesystems =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Patches in Pending state: 10 (23%)<br>meta-gnome =C2=A0 =C2=A0 =
=C2=A0Patches missing Signed-off-by: 4 (7%)<br>meta-gnome =C2=A0 =C2=A0 =C2=
=A0Patches missing Upstream-Status: 6 (11%)<br>meta-gnome =C2=A0 =C2=A0 =C2=
=A0Patches in Pending state: 15 (27%)<br>meta-initramfs =C2=A0Patches missi=
ng Signed-off-by: 4 (7%)<br>meta-initramfs =C2=A0Patches missing Upstream-S=
tatus: 20 (33%)<br>meta-initramfs =C2=A0Patches in Pending state: 6 (10%)<b=
r>meta-multimedia Patches missing Signed-off-by: 11 (13%)<br>meta-multimedi=
a Patches missing Upstream-Status: 19 (23%)<br>meta-multimedia Patches in P=
ending state: 27 (33%)<br>meta-networking Patches missing Signed-off-by: 66=
 (13%)<br>meta-networking Patches missing CVE: 2 (0%)<br>meta-networking Pa=
tches missing Upstream-Status: 130 (26%)<br>meta-networking Patches in Pend=
ing state: 188 (38%)<br>meta-oe Patches missing Signed-off-by: 226 (18%)<br=
>meta-oe Patches missing CVE: 5 (0%)<br>meta-oe Patches missing Upstream-St=
atus: 381 (31%)<br>meta-oe Patches in Pending state: 370 (30%)<br>meta-perl=
 =C2=A0 =C2=A0 =C2=A0 Patches missing Signed-off-by: 1 (8%)<br>meta-perl =
=C2=A0 =C2=A0 =C2=A0 Patches missing Upstream-Status: 1 (8%)<br>meta-perl =
=C2=A0 =C2=A0 =C2=A0 Patches in Pending state: 6 (50%)<br>meta-python =C2=
=A0 =C2=A0 Patches missing Signed-off-by: 9 (8%)<br>meta-python =C2=A0 =C2=
=A0 Patches missing CVE: 2 (2%)<br>meta-python =C2=A0 =C2=A0 Patches missin=
g Upstream-Status: 20 (19%)<br>meta-python =C2=A0 =C2=A0 Patches in Pending=
 state: 30 (28%)<br>meta-webserver =C2=A0Patches missing Signed-off-by: 12 =
(30%)<br>meta-webserver =C2=A0Patches missing Upstream-Status: 9 (22%)<br>m=
eta-webserver =C2=A0Patches in Pending state: 13 (32%)<br>meta-xfce =C2=A0 =
=C2=A0 =C2=A0 Patches missing Upstream-Status: 2 (11%)<br>meta-xfce =C2=A0 =
=C2=A0 =C2=A0 Patches in Pending state: 4 (22%)<br></div><div><br></div><di=
v>If someone really wants I can add Upstream-Status: Pending to .patches wi=
thout any Upstream-Status (I already have oneliner to do that), but that ju=
st replaces missing with Pending without adding any other value (other than=
 avoiding warnings from the QA check). But I also don&#39;t expect the regu=
lar contributors to be able to add missing Upstream-Status in remaining 30%=
 patches anytime soon.</div><div><br></div><div>Cheers,</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 23=
, 2023 at 2:12 PM Martin Jansa via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com=
@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">B=
e aware that with:<div><a href=3D"https://patchwork.yoctoproject.org/projec=
t/oe-core/patch/20230215172041.636292-3-Martin.Jansa@gmail.com/" target=3D"=
_blank">https://patchwork.yoctoproject.org/project/oe-core/patch/2023021517=
2041.636292-3-Martin.Jansa@gmail.com/</a><br></div><div><br></div><div>meta=
-oe layers have 81 malformed Upstream-Status entries (before your patches a=
re applied), so there are many more cases.</div><div><br></div><div>But I a=
gree that if it&#39;s included, it should be in the right format, because o=
ther people might copy&amp;paste it to other new .patch files as well.</div=
><div><br></div><div>I can send fixes for the rest.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 23, 20=
23 at 1:41 PM Yi Zhao &lt;<a href=3D"mailto:yi.zhao@eng.windriver.com" targ=
et=3D"_blank">yi.zhao@eng.windriver.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Signed-off-by: Yi Zhao &lt;<a href=
=3D"mailto:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</=
a>&gt;<br>
---<br>
=C2=A0.../0001-server-Adjust-the-cache-alignment-assumptions.patch=C2=A0 | =
2 +-<br>
=C2=A0.../obexftp/obexftp/Remove_some_printf_in_obexftpd.patch=C2=A0 =C2=A0=
 =C2=A0 | 2 +-<br>
=C2=A0.../lshw/files/0001-disable-docbook2man.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch=C2=A0 =C2=A0=
 =C2=A0 | 2 +-<br>
=C2=A0...rust.configure-do-not-try-to-find-a-suitable-upstrea.patch | 2 +-<=
br>
=C2=A0.../lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +---<br>
=C2=A0.../hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../libb64/libb64/0001-example-Do-not-run-the-tests.patch=C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A0...configure.ac-do-additional-checks-on-libxml2-also-wh.patch | 4 +--=
-<br>
=C2=A0.../sharutils/sharutils/CVE-2018-1000097.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A010 files changed, 10 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
/0001-server-Adjust-the-cache-alignment-assumptions.patch b/meta-oe/dynamic=
-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cach=
e-alignment-assumptions.patch<br>
index bf083c85f..52c9df9b1 100644<br>
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-s=
erver-Adjust-the-cache-alignment-assumptions.patch<br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-s=
erver-Adjust-the-cache-alignment-assumptions.patch<br>
@@ -15,7 +15,7 @@ src/mongo/db/stats/counters.h:185:47: error: static asser=
tion failed: cache line<br>
=C2=A0The structure need to ensure true sharing for both the elements<br>
=C2=A0so align it to hardware_constructive_interference_size instead<br>
<br>
-Upstream-Status: Reported [<a href=3D"https://jira.mongodb.org/browse/SERV=
ER-65664" rel=3D"noreferrer" target=3D"_blank">https://jira.mongodb.org/bro=
wse/SERVER-65664</a>]<br>
+Upstream-Status: Inappropriate [<a href=3D"https://jira.mongodb.org/browse=
/SERVER-65664" rel=3D"noreferrer" target=3D"_blank">https://jira.mongodb.or=
g/browse/SERVER-65664</a>]<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_print=
f_in_obexftpd.patch b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_s=
ome_printf_in_obexftpd.patch<br>
index 8b73af32e..23e92885e 100644<br>
--- a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_ob=
exftpd.patch<br>
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_ob=
exftpd.patch<br>
@@ -1,6 +1,6 @@<br>
=C2=A0Signed-off-by: Jun Zhu &lt;<a href=3D"mailto:R01007@freescale.com" ta=
rget=3D"_blank">R01007@freescale.com</a>&gt;<br>
<br>
-Upstream-Status:=C2=A0 Not applicable<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0diff -Nru obexftp-0.23/apps.orig/obexftpd.c obexftp-0.23/apps/obexftp=
d.c<br>
=C2=A0--- obexftp-0.23/apps.orig/obexftpd.c=C2=A0 2013-11-08 10:42:20.81663=
1583 +0800<br>
diff --git a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.p=
atch b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch<b=
r>
index 00f7b8674..706f2d524 100644<br>
--- a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch<br=
>
+++ b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch<br=
>
@@ -5,7 +5,7 @@ Subject: [PATCH] build: Do not build .sgml file<br>
<br>
=C2=A0It needs docbook2man tool which we do not have recipe for<br>
<br>
-Upstream-Status: OE-Specific [needs native docbook2man tool]<br>
+Upstream-Status: Inappropriate [needs native docbook2man tool]<br>
<br>
=C2=A0Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
=C2=A0---<br>
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-n=
ot-overwrite-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/00=
03-mbedtls-Do-not-overwrite-CFLAGS.patch<br>
index 6c585c2f5..158857ae2 100644<br>
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-over=
write-CFLAGS.patch<br>
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-over=
write-CFLAGS.patch<br>
@@ -7,7 +7,7 @@ bitbake passes CFLAGS that are often in conflict with the o=
nes set<br>
=C2=A0in mbedtls&#39; CMakeLists.txt. Such conflicts are the inability to u=
se<br>
=C2=A0FORTIFY_SOURCE=3D2 except in release mode<br>
<br>
-Upstream-Status: Innapropriate [due to fluent-bit having it&#39;s own Rele=
ase flags that also overwrite bitbake ones.]<br>
+Upstream-Status: Inappropriate [due to fluent-bit having it&#39;s own Rele=
ase flags that also overwrite bitbake ones.]<br>
=C2=A0---<br>
=C2=A0 lib/mbedtls-2.28.0/CMakeLists.txt | 2 --<br>
=C2=A0 1 file changed, 2 deletions(-)<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-d=
o-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch<=
br>
index e63b05356..202f12612 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-t=
ry-to-find-a-suitable-upstrea.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-t=
ry-to-find-a-suitable-upstrea.patch<br>
@@ -5,7 +5,7 @@ Subject: [PATCH] rust.configure: do not try to find a suita=
ble upstream target<br>
<br>
=C2=A0OE is using custom targets and so this is bound to fail.<br>
<br>
-Upstream-Status: Inapppropriate [oe-core specific]<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
<br>
=C2=A0---<br>
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20=
.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.pat=
ch<br>
index afe11f353..d232f6913 100644<br>
--- a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch<=
br>
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch<=
br>
@@ -3,9 +3,7 @@ From: dgod &lt;<a href=3D"mailto:dgod.osa@gmail.com" target=
=3D"_blank">dgod.osa@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 21 Mar 2016 19:25:25 +0800<br>
=C2=A0Subject: [PATCH] fix css under gtk 3.20<br>
<br>
-Upstream-Status: Applied [1]<br>
-<br>
-[1] <a href=3D"https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=
=3D72812894cfd9454d70e4b0753531e46580416771+Upstream-Status" rel=3D"norefer=
rer" target=3D"_blank">https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dp=
atch;h=3D72812894cfd9454d70e4b0753531e46580416771<br>
+Upstream-Status</a>: Backport [<a href=3D"https://git.lxde.org/gitweb/?p=
=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cfd9454d70e4b0753531e46580416771" re=
l=3D"noreferrer" target=3D"_blank">https://git.lxde.org/gitweb/?p=3Dlxde/lx=
dm.git;a=3Dpatch;h=3D72812894cfd9454d70e4b0753531e46580416771</a>]<br>
=C2=A0---<br>
=C2=A0 data/themes/Industrial/gtk.css | 1 +<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.=
diff b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff<b=
r>
index 057b1fd1d..60953381a 100644<br>
--- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff<br=
>
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff<br=
>
@@ -6,7 +6,7 @@ Filtered with:<br>
=C2=A0 =C2=A0filterdiff -p1 -x README -x &#39;debian/*&#39;<br>
<br>
<br>
-Upstream-Status: unmaintained<br>
+Upstream-Status: Inappropriate [unmaintained]<br>
<br>
=C2=A0Index: hddtemp-0.3-beta15/doc/hddtemp.8<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
diff --git a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-=
the-tests.patch b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not=
-run-the-tests.patch<br>
index ea3ddfb64..b3ee24d9d 100644<br>
--- a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tes=
ts.patch<br>
+++ b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tes=
ts.patch<br>
@@ -3,7 +3,7 @@ From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 27 Mar 2021 21:41:04 -0700<br>
=C2=A0Subject: [PATCH] example: Do not run the tests<br>
<br>
-Upstream-Status: Inappropritate [Cross-compile specific]<br>
+Upstream-Status: Inappropriate [Cross-compile specific]<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 examples/Makefile | 3 ---<br>
diff --git a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-add=
itional-checks-on-libxml2-also-wh.patch b/meta-oe/recipes-support/raptor2/f=
iles/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch<br>
index 7faeb130a..490b61f1f 100644<br>
--- a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional=
-checks-on-libxml2-also-wh.patch<br>
+++ b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional=
-checks-on-libxml2-also-wh.patch<br>
@@ -7,9 +7,7 @@ MIME-Version: 1.0<br>
=C2=A0Content-Type: text/plain; charset=3DUTF-8<br>
=C2=A0Content-Transfer-Encoding: 8bit<br>
<br>
-Upstream-Status: Applied [1]<br>
-<br>
-[1] <a href=3D"https://github.com/dajobe/raptor/pull/33" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/dajobe/raptor/pull/33</a><br>
+Upstream-Status: Backport [<a href=3D"https://github.com/dajobe/raptor/com=
mit/e75b1dbb7f2a6514b8d391b200c45a2bec6268bf" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/dajobe/raptor/commit/e75b1dbb7f2a6514b8d391b200c=
45a2bec6268bf</a>]<br>
<br>
=C2=A0Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzelton=
y@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;<br=
>
=C2=A0---<br>
diff --git a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.p=
atch b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch<b=
r>
index 99dc4e304..47eb9cfd6 100644<br>
--- a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch<br=
>
+++ b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch<br=
>
@@ -36,7 +36,7 @@ This was reported in<br>
=C2=A0&lt;<a href=3D"http://lists.gnu.org/archive/html/bug-gnu-utils/2018-0=
2/msg00004.html" rel=3D"noreferrer" target=3D"_blank">http://lists.gnu.org/=
archive/html/bug-gnu-utils/2018-02/msg00004.html</a>&gt;.<br>
<br>
=C2=A0CVE: CVE-2018-1000097<br>
-Upstream-Status: no upstream [<a href=3D"http://lists.gnu.org/archive/html=
/bug-gnu-utils/2018-02/msg00004.html" rel=3D"noreferrer" target=3D"_blank">=
http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html</a>]<=
br>
+Upstream-Status: Inappropriate [no upstream]<br>
=C2=A0Signed-off-by: Petr P=C3=ADsa=C5=99 &lt;<a href=3D"mailto:ppisar@redh=
at.com" target=3D"_blank">ppisar@redhat.com</a>&gt;<br>
=C2=A0Signed-off-by: Sinan Kaya &lt;<a href=3D"mailto:okaya@kernel.org" tar=
get=3D"_blank">okaya@kernel.org</a>&gt;<br>
=C2=A0---<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101228): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101228" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101228</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97181611/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97181611/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c43c9105f55e5909--

