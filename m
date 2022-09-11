Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6521EC6FA83
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 19:23:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.1922.1662924192170687666
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 12:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F0Qn1M2F;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id d5so5774918wms.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=RusdWJ3rcAKb9OyNkooYeBZDSauKu4JGWo0Yf27CY7k=;
        b=F0Qn1M2FtZcSjKq9RMgVdi8czJBru0zWONJ/1JAvv24hzLsJvY6z20vHn+WMGzHIaW
         kbTMEgE66Yf1eu+eSTbPFp6F2ZIYLpjZKt+FZLGCdkpbQEyxC9rvTkeKaI/0OVFm1N+t
         7j1bBM4q5uR+YwoTFaf+liWG71dlVHamBnkvL3Okif8aoLgm27ay8yfyPbmxd5efey78
         0IO4Wdu0p+reQAVXpCtBulLaXLLN1O9PutwcLqguOW/ioem/VPcSjXS8c94q40jioE8c
         qJINWZLl/aTrCcMAsuUAHxgQao/dfLnkeb93tb8R5xNAsKb6/NnaVr9DW6kfWX+AL41y
         /eiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=RusdWJ3rcAKb9OyNkooYeBZDSauKu4JGWo0Yf27CY7k=;
        b=1v4mjPJdEgqNEcL4n2JL5Cq+a5jjpxDATZG6yFakPU9KW01msj8PuZpiheJRQnz/w9
         Yo31j9+hE+u26hzgBl1PcVIPUcXPH26FL8drM9tyAwE76XEoXC37XXY+eTL3NPJoebnH
         QBxX+mZE+Xd7vO0E/brkp0VxVtAb0J6duN874LlTTbYw09GEeWx1LtDQv9cpOmrm3DBw
         Lu6AncFka4wLQt1VKj+xeqPqKhLVyHmA+AlNzw1m0Xi2+zkCHqOZpfblc47GGhnau2fa
         mg7skb7CYoTHxrD5GMDQZvL9D7MCeWDf0RZkZP1NnLgts9STI0od3bqXb+g+WbxxJVKW
         BOTw==
X-Gm-Message-State: ACgBeo1NxMO7sfLuQRMZpmr6eTEvikQucDWV9GVl75XhDUOLWAuJD+f7
	jj55/byCT4k7E3H6ptv3qmCOfhzLEZ9OAGmoVvc=
X-Google-Smtp-Source: 
 AA6agR70X73ueYXiVjWvKh9FRra3YJ4FfrVdV6KKEHA2MflB1Z+orBKjFVhryUE5bYwmTXtfDf8RVQnB1hKOwijfp+c=
X-Received: by 2002:a05:600c:418a:b0:3b4:6708:1e3b with SMTP id
 p10-20020a05600c418a00b003b467081e3bmr5407220wmh.67.1662924190307; Sun, 11
 Sep 2022 12:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <1662442335-7255-1-git-send-email-wangmy@fujitsu.com>
 <1662442335-7255-2-git-send-email-wangmy@fujitsu.com>
 <CA+chaQdaqbL6hVzHq=QX217ju2GkYGywHT7gYgfYoyH2+jo6ew@mail.gmail.com>
 <CAMKF1soWhUXO=4JJqeBUQjPFJmYpx+x2kCvDr5hFNaTjAcB9Rg@mail.gmail.com>
 <1713E3AE64512681.13468@lists.openembedded.org>
In-Reply-To: <1713E3AE64512681.13468@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Sep 2022 21:22:57 +0200
Message-ID: 
 <CA+chaQdWLn=gbhTF6tQfiUpr9DK5sFyp13y=Ln=EaHqPE7-QvQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] lvm2/libdevmapper: upgrade 2.03.11 ->
 2.03.16
To: Martin.Jansa@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, wangmy <wangmy@fujitsu.com>,
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a6dabb05e86bb54c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Sep 2022 19:23:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98738

--000000000000a6dabb05e86bb54c
Content-Type: text/plain; charset="UTF-8"

Patch sent for the issue with gold.

wangmy: why did you add bash to RDEPENDS?

Couple years ago it was patched to avoid bashisms and runtime dependency on
bash:
https://git.openembedded.org/meta-openembedded/commit/?id=af279a8e746ba80e4811751ba6ede3519cd71b3c

I guess it was because of:
ERROR: lvm2-2.03.16-r0 do_package_qa: QA Issue: /usr/sbin/lvm_import_vdo
contained in package lvm2 requires /bin/bash, but no providers found in
RDEPENDS:lvm2? [file-rdeps]

but can we move lvm_import_vdo to PN-scripts (which already rdepends on
bash) or avoid bash here as well?

it was added in
https://github.com/lvmteam/lvm2/commit/ed48cb26a31e8e5a12d82d96d8bec6bfc4d5b218
and later renamed in
https://github.com/lvmteam/lvm2/commit/bbbd4fed69d88e67678994cb611d082d27bb774b

Regards,

On Sun, Sep 11, 2022 at 9:03 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> Yes, you're right, it's reproducible only with ld-is-gold and
> LDFLAGS += "-fuse-ld=bfd"
> resolves this error.
>
> It's caused by dm_bitset_parse_list uncommented
> in libdm/.exported_symbols.DM_1_02_129:
>
> https://github.com/lvmteam/lvm2/commit/60eb608d66c2056a78e81f27db3da14139d9faab
>
> On Sat, Sep 10, 2022 at 4:51 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sat, Sep 10, 2022 at 1:09 AM Martin Jansa <Martin.Jansa@gmail.com>
>> wrote:
>> >
>> > With this version I'm seeing both lvm2 and libdevmapper failing with::
>> >
>> >     [CC] ioctl/libdevmapper.so.1.02
>> > TOPDIR/..../12.2.0/ld: warning: using 'DM_1_02_129' as version for
>> 'dm_bitset_parse_list' which is also named in version 'DM_1_02_138' in
>> script
>> > TOPDIR/..../12.2.0/ld: error: datastruct/bitset.o: multiple definition
>> of 'dm_bitset_parse_list'
>> > TOPDIR/..../12.2.0/ld: datastruct/bitset.o: previous definition here
>> >
>> > anyone else seeing the same?
>>
>> This is something that gold linker might catch. Are you using gold
>> linker ? secondly just try with ld.bfd and see if it works. That
>> atleast will put some sanity into
>> why my builders or AB did not see it.
>>
>> >
>> > On Tue, Sep 6, 2022 at 7:32 AM wangmy <wangmy@fujitsu.com> wrote:
>> >>
>> >> 0005-do-not-build-manual.patch
>> >> 0006-start-lvm2-monitor.service-after-tmp.mount.patch
>> >> refreshed for new version.
>> >>
>> >> Add bash to RDEPENDS.
>> >>
>> >> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> >> ---
>> >>  .../lvm2/files/0005-do-not-build-manual.patch | 23 ++++++++++---------
>> >>  ...lvm2-monitor.service-after-tmp.mount.patch | 11 +++++----
>> >>  ...per_2.03.11.bb => libdevmapper_2.03.16.bb} |  0
>> >>  meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
>> >>  .../lvm2/{lvm2_2.03.11.bb => lvm2_2.03.16.bb} |  1 +
>> >>  5 files changed, 21 insertions(+), 16 deletions(-)
>> >>  rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.11.bb =>
>> libdevmapper_2.03.16.bb} (100%)
>> >>  rename meta-oe/recipes-support/lvm2/{lvm2_2.03.11.bb =>
>> lvm2_2.03.16.bb} (99%)
>> >>
>> >> diff --git
>> a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
>> b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
>> >> index 7117d99a39..7979efbefb 100644
>> >> --- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
>> >> +++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
>> >> @@ -15,25 +15,26 @@ Upstream-Status: Pending
>> >>
>> >>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> >>
>> >> -
>> >>  Update context for lvm2 2.03.02.
>> >> -
>> >>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> >> +
>> >> +Update context for lvm2 2.03.16.
>> >> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> >>  ---
>> >>   Makefile.in  | 6 +++---
>> >>   configure.ac | 1 -
>> >>   2 files changed, 3 insertions(+), 4 deletions(-)
>> >>
>> >>  diff --git a/Makefile.in b/Makefile.in
>> >> -index 6a1a990..80cba91 100644
>> >> +index 3b7e0ec..37f14eb 100644
>> >>  --- a/Makefile.in
>> >>  +++ b/Makefile.in
>> >>  @@ -18,7 +18,7 @@ top_builddir = @top_builddir@
>> >>   abs_top_builddir = @abs_top_builddir@
>> >>   abs_top_srcdir = @abs_top_srcdir@
>> >>
>> >> --SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools
>> >> -+SUBDIRS = conf daemons include lib libdaemon libdm scripts tools
>> >> +-SUBDIRS = libdm conf daemons include lib libdaemon man scripts tools
>> >> ++SUBDIRS = libdm conf daemons include lib libdaemon scripts tools
>> >>
>> >>   ifeq ("@UDEV_RULES@", "yes")
>> >>     SUBDIRS += udev
>> >> @@ -46,20 +47,20 @@ index 6a1a990..80cba91 100644
>> >>       libdaemon lib tools daemons libdm \
>> >>       udev po
>> >>   tools.distclean: test.distclean
>> >> -@@ -65,7 +65,7 @@ libdm.device-mapper: include.device-mapper
>> >> +@@ -59,7 +59,7 @@ unit-test  run-unit-test: test
>> >> +
>> >>   daemons.device-mapper: libdm.device-mapper
>> >>   tools.device-mapper: libdm.device-mapper
>> >> - scripts.device-mapper: include.device-mapper
>> >>  -device-mapper: tools.device-mapper daemons.device-mapper
>> man.device-mapper
>> >>  +device-mapper: tools.device-mapper daemons.device-mapper
>> >> + device_mapper: device-mapper
>> >>
>> >>   ifeq ("@INTL@", "yes")
>> >> - lib.pofile: include.pofile
>> >>  diff --git a/configure.ac b/configure.ac
>> >> -index 7fd0561..4154dc0 100644
>> >> +index 6def519..18a5c97 100644
>> >>  --- a/configure.ac
>> >>  +++ b/configure.ac
>> >> -@@ -1812,7 +1812,6 @@ libdaemon/server/Makefile
>> >> +@@ -2018,7 +2018,6 @@ libdaemon/server/Makefile
>> >>   libdm/Makefile
>> >>   libdm/dm-tools/Makefile
>> >>   libdm/libdevmapper.pc
>> >> @@ -68,5 +69,5 @@ index 7fd0561..4154dc0 100644
>> >>   scripts/lvm2-pvscan.service
>> >>   scripts/blkdeactivate.sh
>> >>  --
>> >> -2.7.4
>> >> +2.25.1
>> >>
>> >> diff --git
>> a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
>> b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
>> >> index 9f9383ef48..5b9b2d5748 100644
>> >> ---
>> a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
>> >> +++
>> b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
>> >> @@ -11,23 +11,26 @@ Upstream-Status: Inappropriate [oe specific]
>> >>
>> >>  Rebase to v2_03_05
>> >>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> >> +
>> >> +Rebase to v2_03_16
>> >> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> >>  ---
>> >>   scripts/lvm2_monitoring_systemd_red_hat.service.in | 2 +-
>> >>   1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >>  diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in
>> b/scripts/lvm2_monitoring_systemd_red_hat.service.in
>> >> -index 4bf744a..46766cb 100644
>> >> +index c0c96e3..2a99a37 100644
>> >>  --- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
>> >>  +++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
>> >>  @@ -2,7 +2,7 @@
>> >>   Description=Monitoring of LVM2 mirrors, snapshots etc. using
>> dmeventd or progress polling
>> >>   Documentation=man:dmeventd(8) man:lvcreate(8) man:lvchange(8)
>> man:vgchange(8)
>> >>   Requires=dm-event.socket
>> >> --After=dm-event.socket dm-event.service lvm2-activation.service
>> >> -+After=dm-event.socket dm-event.service lvm2-activation.service
>> tmp.mount
>> >> +-After=dm-event.socket dm-event.service
>> >> ++After=dm-event.socket dm-event.service tmp.mount
>> >>   Before=local-fs-pre.target shutdown.target
>> >>   DefaultDependencies=no
>> >>   Conflicts=shutdown.target
>> >>  --
>> >> -2.7.4
>> >> +2.25.1
>> >>
>> >> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
>> b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
>> >> similarity index 100%
>> >> rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
>> >> rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
>> >> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
>> b/meta-oe/recipes-support/lvm2/lvm2.inc
>> >> index 0c593b2042..34e57ec7a5 100644
>> >> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
>> >> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
>> >> @@ -18,7 +18,7 @@ SRC_URI = "git://
>> sourceware.org/git/lvm2.git;branch=main \
>> >>             file://reproducible-build.patch \
>> >>             "
>> >>
>> >> -SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
>> >> +SRCREV = "6d1e894a867681af7a811ed63bc435f3aa55fec8"
>> >>  S = "${WORKDIR}/git"
>> >>
>> >>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
>> >> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
>> b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
>> >> similarity index 99%
>> >> rename from meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
>> >> rename to meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
>> >> index a729324c9b..6a6cdc7cef 100644
>> >> --- a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
>> >> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
>> >> @@ -68,6 +68,7 @@ FILES:${PN}-scripts = " \
>> >>  # Specified explicitly for the udev rules, just in case that it does
>> not get picked
>> >>  # up automatically:
>> >>  FILES:${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
>> >> +RDEPENDS:${PN} = "bash"
>> >>  RDEPENDS:${PN}-udevrules = "libdevmapper"
>> >>  RDEPENDS:${PN}:append:class-target = " libdevmapper"
>> >>  RDEPENDS:${PN}:append:class-nativesdk = " libdevmapper"
>> >> --
>> >> 2.25.1
>> >>
>> >>
>> >>
>> >>
>> >
>> >
>> >
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98736):
> https://lists.openembedded.org/g/openembedded-devel/message/98736
> Mute This Topic: https://lists.openembedded.org/mt/93495342/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a6dabb05e86bb54c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patch sent for the issue with gold.<div><br></div><div>wan=
gmy: why did you add bash to RDEPENDS?</div><div><br></div><div>Couple year=
s ago it was patched to avoid bashisms and runtime dependency on bash:</div=
><div><a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3Daf279a8e746ba80e4811751ba6ede3519cd71b3c">https://git.openembedded.org/m=
eta-openembedded/commit/?id=3Daf279a8e746ba80e4811751ba6ede3519cd71b3c</a><=
br></div><div><br></div><div>I guess it was because of:</div><div>ERROR: lv=
m2-2.03.16-r0 do_package_qa: QA Issue: /usr/sbin/lvm_import_vdo contained i=
n package lvm2 requires /bin/bash, but no providers found in RDEPENDS:lvm2?=
 [file-rdeps]<br></div><div><br></div><div>but can we move lvm_import_vdo t=
o PN-scripts (which already rdepends on bash) or avoid bash here as well?</=
div><div><br></div><div>it was added in=C2=A0<a href=3D"https://github.com/=
lvmteam/lvm2/commit/ed48cb26a31e8e5a12d82d96d8bec6bfc4d5b218">https://githu=
b.com/lvmteam/lvm2/commit/ed48cb26a31e8e5a12d82d96d8bec6bfc4d5b218</a> and =
later renamed in=C2=A0<a href=3D"https://github.com/lvmteam/lvm2/commit/bbb=
d4fed69d88e67678994cb611d082d27bb774b">https://github.com/lvmteam/lvm2/comm=
it/bbbd4fed69d88e67678994cb611d082d27bb774b</a></div><div><br></div><div>Re=
gards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Sun, Sep 11, 2022 at 9:03 PM Martin Jansa via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Yes, you&#39;re right, it&#39;s reproducible only =
with ld-is-gold and<div>LDFLAGS +=3D &quot;-fuse-ld=3Dbfd&quot;<br></div><d=
iv>resolves this error.</div><div><br></div><div>It&#39;s caused by=C2=A0dm=
_bitset_parse_list uncommented in=C2=A0libdm/.exported_symbols.DM_1_02_129:=
</div><div><a href=3D"https://github.com/lvmteam/lvm2/commit/60eb608d66c205=
6a78e81f27db3da14139d9faab" target=3D"_blank">https://github.com/lvmteam/lv=
m2/commit/60eb608d66c2056a78e81f27db3da14139d9faab</a><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep=
 10, 2022 at 4:51 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sat, Sep 10, 2022 at 1:09 AM Martin Jan=
sa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.J=
ansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; With this version I&#39;m seeing both lvm2 and libdevmapper failing wi=
th::<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[CC] ioctl/libdevmapper.so.1.02<br>
&gt; TOPDIR/..../12.2.0/ld: warning: using &#39;DM_1_02_129&#39; as version=
 for &#39;dm_bitset_parse_list&#39; which is also named in version &#39;DM_=
1_02_138&#39; in script<br>
&gt; TOPDIR/..../12.2.0/ld: error: datastruct/bitset.o: multiple definition=
 of &#39;dm_bitset_parse_list&#39;<br>
&gt; TOPDIR/..../12.2.0/ld: datastruct/bitset.o: previous definition here<b=
r>
&gt;<br>
&gt; anyone else seeing the same?<br>
<br>
This is something that gold linker might catch. Are you using gold<br>
linker ? secondly just try with ld.bfd and see if it works. That<br>
atleast will put some sanity into<br>
why my builders or AB did not see it.<br>
<br>
&gt;<br>
&gt; On Tue, Sep 6, 2022 at 7:32 AM wangmy &lt;<a href=3D"mailto:wangmy@fuj=
itsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; 0005-do-not-build-manual.patch<br>
&gt;&gt; 0006-start-lvm2-monitor.service-after-tmp.mount.patch<br>
&gt;&gt; refreshed for new version.<br>
&gt;&gt;<br>
&gt;&gt; Add bash to RDEPENDS.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.co=
m" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../lvm2/files/0005-do-not-build-manual.patch | 23 +++++++++=
+---------<br>
&gt;&gt;=C2=A0 ...lvm2-monitor.service-after-tmp.mount.patch | 11 +++++----=
<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://per_2.03.11.bb" rel=3D"noreferrer" targ=
et=3D"_blank">per_2.03.11.bb</a> =3D&gt; <a href=3D"http://libdevmapper_2.0=
3.16.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.16.bb</a>} =
|=C2=A0 0<br>
&gt;&gt;=C2=A0 meta-oe/recipes-support/lvm2/lvm2.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 .../lvm2/{<a href=3D"http://lvm2_2.03.11.bb" rel=3D"noreferr=
er" target=3D"_blank">lvm2_2.03.11.bb</a> =3D&gt; <a href=3D"http://lvm2_2.=
03.16.bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.16.bb</a>} |=C2=A0=
 1 +<br>
&gt;&gt;=C2=A0 5 files changed, 21 insertions(+), 16 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-support/lvm2/{<a href=3D"http://libde=
vmapper_2.03.11.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.=
11.bb</a> =3D&gt; <a href=3D"http://libdevmapper_2.03.16.bb" rel=3D"norefer=
rer" target=3D"_blank">libdevmapper_2.03.16.bb</a>} (100%)<br>
&gt;&gt;=C2=A0 rename meta-oe/recipes-support/lvm2/{<a href=3D"http://lvm2_=
2.03.11.bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.11.bb</a> =3D&gt=
; <a href=3D"http://lvm2_2.03.16.bb" rel=3D"noreferrer" target=3D"_blank">l=
vm2_2.03.16.bb</a>} (99%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-=
manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.=
patch<br>
&gt;&gt; index 7117d99a39..7979efbefb 100644<br>
&gt;&gt; --- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.=
patch<br>
&gt;&gt; +++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.=
patch<br>
&gt;&gt; @@ -15,25 +15,26 @@ Upstream-Status: Pending<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@w=
indriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 Update context for lvm2 2.03.02.<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windr=
iver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +Update context for lvm2 2.03.16.<br>
&gt;&gt; +Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.c=
om" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt;&gt;=C2=A0 ---<br>
&gt;&gt;=C2=A0 =C2=A0Makefile.in=C2=A0 | 6 +++---<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a> | 1 -<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 3 insertions(+), 4 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 diff --git a/Makefile.in b/Makefile.in<br>
&gt;&gt; -index 6a1a990..80cba91 100644<br>
&gt;&gt; +index 3b7e0ec..37f14eb 100644<br>
&gt;&gt;=C2=A0 --- a/Makefile.in<br>
&gt;&gt;=C2=A0 +++ b/Makefile.in<br>
&gt;&gt;=C2=A0 @@ -18,7 +18,7 @@ top_builddir =3D @top_builddir@<br>
&gt;&gt;=C2=A0 =C2=A0abs_top_builddir =3D @abs_top_builddir@<br>
&gt;&gt;=C2=A0 =C2=A0abs_top_srcdir =3D @abs_top_srcdir@<br>
&gt;&gt;<br>
&gt;&gt; --SUBDIRS =3D conf daemons include lib libdaemon libdm man scripts=
 tools<br>
&gt;&gt; -+SUBDIRS =3D conf daemons include lib libdaemon libdm scripts too=
ls<br>
&gt;&gt; +-SUBDIRS =3D libdm conf daemons include lib libdaemon man scripts=
 tools<br>
&gt;&gt; ++SUBDIRS =3D libdm conf daemons include lib libdaemon scripts too=
ls<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0ifeq (&quot;@UDEV_RULES@&quot;, &quot;yes&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0SUBDIRS +=3D udev<br>
&gt;&gt; @@ -46,20 +47,20 @@ index 6a1a990..80cba91 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0libdaemon lib tools daemons libdm \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0udev po<br>
&gt;&gt;=C2=A0 =C2=A0tools.distclean: test.distclean<br>
&gt;&gt; -@@ -65,7 +65,7 @@ libdm.device-mapper: include.device-mapper<br>
&gt;&gt; +@@ -59,7 +59,7 @@ unit-test=C2=A0 run-unit-test: test<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0daemons.device-mapper: libdm.device-mapper<br>
&gt;&gt;=C2=A0 =C2=A0tools.device-mapper: libdm.device-mapper<br>
&gt;&gt; - scripts.device-mapper: include.device-mapper<br>
&gt;&gt;=C2=A0 -device-mapper: tools.device-mapper daemons.device-mapper ma=
n.device-mapper<br>
&gt;&gt;=C2=A0 +device-mapper: tools.device-mapper daemons.device-mapper<br=
>
&gt;&gt; + device_mapper: device-mapper<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0ifeq (&quot;@INTL@&quot;, &quot;yes&quot;)<br>
&gt;&gt; - lib.pofile: include.pofile<br>
&gt;&gt;=C2=A0 diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" re=
l=3D"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt;&gt; -index 7fd0561..4154dc0 100644<br>
&gt;&gt; +index 6def519..18a5c97 100644<br>
&gt;&gt;=C2=A0 --- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt;&gt;=C2=A0 +++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" tar=
get=3D"_blank">configure.ac</a><br>
&gt;&gt; -@@ -1812,7 +1812,6 @@ libdaemon/server/Makefile<br>
&gt;&gt; +@@ -2018,7 +2018,6 @@ libdaemon/server/Makefile<br>
&gt;&gt;=C2=A0 =C2=A0libdm/Makefile<br>
&gt;&gt;=C2=A0 =C2=A0libdm/dm-tools/Makefile<br>
&gt;&gt;=C2=A0 =C2=A0libdm/libdevmapper.pc<br>
&gt;&gt; @@ -68,5 +69,5 @@ index 7fd0561..4154dc0 100644<br>
&gt;&gt;=C2=A0 =C2=A0scripts/lvm2-pvscan.service<br>
&gt;&gt;=C2=A0 =C2=A0scripts/blkdeactivate.sh<br>
&gt;&gt;=C2=A0 --<br>
&gt;&gt; -2.7.4<br>
&gt;&gt; +2.25.1<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-mo=
nitor.service-after-tmp.mount.patch b/meta-oe/recipes-support/lvm2/files/00=
06-start-lvm2-monitor.service-after-tmp.mount.patch<br>
&gt;&gt; index 9f9383ef48..5b9b2d5748 100644<br>
&gt;&gt; --- a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.s=
ervice-after-tmp.mount.patch<br>
&gt;&gt; +++ b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.s=
ervice-after-tmp.mount.patch<br>
&gt;&gt; @@ -11,23 +11,26 @@ Upstream-Status: Inappropriate [oe specific]<b=
r>
&gt;&gt;<br>
&gt;&gt;=C2=A0 Rebase to v2_03_05<br>
&gt;&gt;=C2=A0 Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@w=
indriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +Rebase to v2_03_16<br>
&gt;&gt; +Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.c=
om" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt;&gt;=C2=A0 ---<br>
&gt;&gt;=C2=A0 =C2=A0scripts/<a href=3D"http://lvm2_monitoring_systemd_red_=
hat.service.in" rel=3D"noreferrer" target=3D"_blank">lvm2_monitoring_system=
d_red_hat.service.in</a> | 2 +-<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 diff --git a/scripts/<a href=3D"http://lvm2_monitoring_syste=
md_red_hat.service.in" rel=3D"noreferrer" target=3D"_blank">lvm2_monitoring=
_systemd_red_hat.service.in</a> b/scripts/<a href=3D"http://lvm2_monitoring=
_systemd_red_hat.service.in" rel=3D"noreferrer" target=3D"_blank">lvm2_moni=
toring_systemd_red_hat.service.in</a><br>
&gt;&gt; -index 4bf744a..46766cb 100644<br>
&gt;&gt; +index c0c96e3..2a99a37 100644<br>
&gt;&gt;=C2=A0 --- a/scripts/<a href=3D"http://lvm2_monitoring_systemd_red_=
hat.service.in" rel=3D"noreferrer" target=3D"_blank">lvm2_monitoring_system=
d_red_hat.service.in</a><br>
&gt;&gt;=C2=A0 +++ b/scripts/<a href=3D"http://lvm2_monitoring_systemd_red_=
hat.service.in" rel=3D"noreferrer" target=3D"_blank">lvm2_monitoring_system=
d_red_hat.service.in</a><br>
&gt;&gt;=C2=A0 @@ -2,7 +2,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0Description=3DMonitoring of LVM2 mirrors, snapshots et=
c. using dmeventd or progress polling<br>
&gt;&gt;=C2=A0 =C2=A0Documentation=3Dman:dmeventd(8) man:lvcreate(8) man:lv=
change(8) man:vgchange(8)<br>
&gt;&gt;=C2=A0 =C2=A0Requires=3Ddm-event.socket<br>
&gt;&gt; --After=3Ddm-event.socket dm-event.service lvm2-activation.service=
<br>
&gt;&gt; -+After=3Ddm-event.socket dm-event.service lvm2-activation.service=
 tmp.mount<br>
&gt;&gt; +-After=3Ddm-event.socket dm-event.service<br>
&gt;&gt; ++After=3Ddm-event.socket dm-event.service tmp.mount<br>
&gt;&gt;=C2=A0 =C2=A0Before=3Dlocal-fs-pre.target shutdown.target<br>
&gt;&gt;=C2=A0 =C2=A0DefaultDependencies=3Dno<br>
&gt;&gt;=C2=A0 =C2=A0Conflicts=3Dshutdown.target<br>
&gt;&gt;=C2=A0 --<br>
&gt;&gt; -2.7.4<br>
&gt;&gt; +2.25.1<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/lvm2/<a href=3D"http://libdev=
mapper_2.03.11.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.1=
1.bb</a> b/meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.03=
.16.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.16.bb</a><br=
>
&gt;&gt; similarity index 100%<br>
&gt;&gt; rename from meta-oe/recipes-support/lvm2/<a href=3D"http://libdevm=
apper_2.03.11.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.11=
.bb</a><br>
&gt;&gt; rename to meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmap=
per_2.03.16.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.16.b=
b</a><br>
&gt;&gt; diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recip=
es-support/lvm2/lvm2.inc<br>
&gt;&gt; index 0c593b2042..34e57ec7a5 100644<br>
&gt;&gt; --- a/meta-oe/recipes-support/lvm2/lvm2.inc<br>
&gt;&gt; +++ b/meta-oe/recipes-support/lvm2/lvm2.inc<br>
&gt;&gt; @@ -18,7 +18,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://source=
ware.org/git/lvm2.git;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">s=
ourceware.org/git/lvm2.git;branch=3Dmain</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reproducible=
-build.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRCREV =3D &quot;3e8bd8d1bd70691f09a170785836aeb4f83154e6&quot;<b=
r>
&gt;&gt; +SRCREV =3D &quot;6d1e894a867681af7a811ed63bc435f3aa55fec8&quot;<b=
r>
&gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\_\=
d+)+)&quot;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2=
.03.11.bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.11.bb</a> b/meta-=
oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03.16.bb" rel=3D"noreferre=
r" target=3D"_blank">lvm2_2.03.16.bb</a><br>
&gt;&gt; similarity index 99%<br>
&gt;&gt; rename from meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.=
03.11.bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.11.bb</a><br>
&gt;&gt; rename to meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03=
.16.bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.16.bb</a><br>
&gt;&gt; index a729324c9b..6a6cdc7cef 100644<br>
&gt;&gt; --- a/meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03.11.=
bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.11.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03.16.=
bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.16.bb</a><br>
&gt;&gt; @@ -68,6 +68,7 @@ FILES:${PN}-scripts =3D &quot; \<br>
&gt;&gt;=C2=A0 # Specified explicitly for the udev rules, just in case that=
 it does not get picked<br>
&gt;&gt;=C2=A0 # up automatically:<br>
&gt;&gt;=C2=A0 FILES:${PN}-udevrules =3D &quot;${nonarch_base_libdir}/udev/=
rules.d&quot;<br>
&gt;&gt; +RDEPENDS:${PN} =3D &quot;bash&quot;<br>
&gt;&gt;=C2=A0 RDEPENDS:${PN}-udevrules =3D &quot;libdevmapper&quot;<br>
&gt;&gt;=C2=A0 RDEPENDS:${PN}:append:class-target =3D &quot; libdevmapper&q=
uot;<br>
&gt;&gt;=C2=A0 RDEPENDS:${PN}:append:class-nativesdk =3D &quot; libdevmappe=
r&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98736): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98736" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98736</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93495342/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93495342/3617156</a><br>
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

--000000000000a6dabb05e86bb54c--

