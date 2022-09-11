Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5BCC6FA83
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 19:03:47 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.1716.1662923024898735953
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 12:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QCJFiv3U;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id d2so12137804wrn.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 12:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jw9yBRxsyu3gfkcC9hf2OMRfOR2Ns/cFJyi3CoR1kKQ=;
        b=QCJFiv3Ut/qgaz8RMbkKsshpOVR7wjpf368ObKmklQv08BcOTH12Mdf+AIpIpIeeXm
         5ltQoUPUj4RT6k9xbwDpNe9uySUTCR4WH/qdiY+nkdMRMLDI2UoOiKLgqvkdsUzRd2lR
         s4I3SrBhF1MnpeTZsjAZk+115M3dmJ6jEscePMrzcKoozAV91/Kyv5ooMl5zBnmJygHn
         lpeD/ztr7HjBrTMmsxmJe7BktEN6yWxoIH4t5/5L23Jn/6QyfUL0r7gFd3G7tAVQPBO3
         MdRSZODrSHxzvUca7dRLI9MWva7XlYyJNe3JgM4BiNLKfyjTLcK5oTMGFf4N9c7ai+IT
         0+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jw9yBRxsyu3gfkcC9hf2OMRfOR2Ns/cFJyi3CoR1kKQ=;
        b=Jghblp7w9Q1WVPdHXNja+3HqD5gbRF3gVjuaA+Mu/ImZJkuv9rby30BB9A8CCQ+7MY
         BNu7w2dWCxz/Umr104mAvMv5Gdebzzhjg+0sOIQcYoW4xSgROFdMOncYDUMK62X8CIvP
         LGZHLq6ZxvEin6fDXq2S8lB16bOx9+MA52v9FuYYN64ypEvslMvC+Ep59id6p5ekXdcK
         1TkQHnhvdqOvKbJ2ouCv8AZO1ypM3cVuWRPMqcXQg2scTkrZSZY54FHch2WPU0KDcBqb
         M5ztHMwGfz1QU1+S2hGrndDN1pPPYt6VYF5DlBX2LT1VgmJWt+EJ6lMCObRMYX0HKu27
         607A==
X-Gm-Message-State: ACgBeo2P0GtjVtcU4q8WbH69AjqE+SGAL1VXrN61POM0D1zX8+nG4fD5
	sHI6iD77fTfX/h+noEKiYCLIaqbZrrQz7M5sIrA=
X-Google-Smtp-Source: 
 AA6agR6QnQN2BxBy+FyTOF86pntTusZKhq2XlmcB+zQYE+kRFqo5KpsH/Wabd4LsxFiCYwRhWm7y6veB10fgn60Rwqw=
X-Received: by 2002:a5d:6f14:0:b0:228:e3c6:fa2 with SMTP id
 ay20-20020a5d6f14000000b00228e3c60fa2mr12846828wrb.516.1662923023131; Sun, 11
 Sep 2022 12:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <1662442335-7255-1-git-send-email-wangmy@fujitsu.com>
 <1662442335-7255-2-git-send-email-wangmy@fujitsu.com>
 <CA+chaQdaqbL6hVzHq=QX217ju2GkYGywHT7gYgfYoyH2+jo6ew@mail.gmail.com>
 <CAMKF1soWhUXO=4JJqeBUQjPFJmYpx+x2kCvDr5hFNaTjAcB9Rg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soWhUXO=4JJqeBUQjPFJmYpx+x2kCvDr5hFNaTjAcB9Rg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Sep 2022 21:03:30 +0200
Message-ID: 
 <CA+chaQc1OpT0=d1Bhs+nuwq4Hd3-_vLV4KrgGQ2BWTL8P0hMcg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] lvm2/libdevmapper: upgrade 2.03.11 ->
 2.03.16
To: Khem Raj <raj.khem@gmail.com>
Cc: wangmy <wangmy@fujitsu.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000015284705e86b7093"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Sep 2022 19:03:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98736

--00000000000015284705e86b7093
Content-Type: text/plain; charset="UTF-8"

Yes, you're right, it's reproducible only with ld-is-gold and
LDFLAGS += "-fuse-ld=bfd"
resolves this error.

It's caused by dm_bitset_parse_list uncommented
in libdm/.exported_symbols.DM_1_02_129:
https://github.com/lvmteam/lvm2/commit/60eb608d66c2056a78e81f27db3da14139d9faab

On Sat, Sep 10, 2022 at 4:51 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Sep 10, 2022 at 1:09 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > With this version I'm seeing both lvm2 and libdevmapper failing with::
> >
> >     [CC] ioctl/libdevmapper.so.1.02
> > TOPDIR/..../12.2.0/ld: warning: using 'DM_1_02_129' as version for
> 'dm_bitset_parse_list' which is also named in version 'DM_1_02_138' in
> script
> > TOPDIR/..../12.2.0/ld: error: datastruct/bitset.o: multiple definition
> of 'dm_bitset_parse_list'
> > TOPDIR/..../12.2.0/ld: datastruct/bitset.o: previous definition here
> >
> > anyone else seeing the same?
>
> This is something that gold linker might catch. Are you using gold
> linker ? secondly just try with ld.bfd and see if it works. That
> atleast will put some sanity into
> why my builders or AB did not see it.
>
> >
> > On Tue, Sep 6, 2022 at 7:32 AM wangmy <wangmy@fujitsu.com> wrote:
> >>
> >> 0005-do-not-build-manual.patch
> >> 0006-start-lvm2-monitor.service-after-tmp.mount.patch
> >> refreshed for new version.
> >>
> >> Add bash to RDEPENDS.
> >>
> >> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> >> ---
> >>  .../lvm2/files/0005-do-not-build-manual.patch | 23 ++++++++++---------
> >>  ...lvm2-monitor.service-after-tmp.mount.patch | 11 +++++----
> >>  ...per_2.03.11.bb => libdevmapper_2.03.16.bb} |  0
> >>  meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
> >>  .../lvm2/{lvm2_2.03.11.bb => lvm2_2.03.16.bb} |  1 +
> >>  5 files changed, 21 insertions(+), 16 deletions(-)
> >>  rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.11.bb =>
> libdevmapper_2.03.16.bb} (100%)
> >>  rename meta-oe/recipes-support/lvm2/{lvm2_2.03.11.bb =>
> lvm2_2.03.16.bb} (99%)
> >>
> >> diff --git
> a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> >> index 7117d99a39..7979efbefb 100644
> >> --- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> >> +++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> >> @@ -15,25 +15,26 @@ Upstream-Status: Pending
> >>
> >>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >>
> >> -
> >>  Update context for lvm2 2.03.02.
> >> -
> >>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> +
> >> +Update context for lvm2 2.03.16.
> >> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> >>  ---
> >>   Makefile.in  | 6 +++---
> >>   configure.ac | 1 -
> >>   2 files changed, 3 insertions(+), 4 deletions(-)
> >>
> >>  diff --git a/Makefile.in b/Makefile.in
> >> -index 6a1a990..80cba91 100644
> >> +index 3b7e0ec..37f14eb 100644
> >>  --- a/Makefile.in
> >>  +++ b/Makefile.in
> >>  @@ -18,7 +18,7 @@ top_builddir = @top_builddir@
> >>   abs_top_builddir = @abs_top_builddir@
> >>   abs_top_srcdir = @abs_top_srcdir@
> >>
> >> --SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools
> >> -+SUBDIRS = conf daemons include lib libdaemon libdm scripts tools
> >> +-SUBDIRS = libdm conf daemons include lib libdaemon man scripts tools
> >> ++SUBDIRS = libdm conf daemons include lib libdaemon scripts tools
> >>
> >>   ifeq ("@UDEV_RULES@", "yes")
> >>     SUBDIRS += udev
> >> @@ -46,20 +47,20 @@ index 6a1a990..80cba91 100644
> >>       libdaemon lib tools daemons libdm \
> >>       udev po
> >>   tools.distclean: test.distclean
> >> -@@ -65,7 +65,7 @@ libdm.device-mapper: include.device-mapper
> >> +@@ -59,7 +59,7 @@ unit-test  run-unit-test: test
> >> +
> >>   daemons.device-mapper: libdm.device-mapper
> >>   tools.device-mapper: libdm.device-mapper
> >> - scripts.device-mapper: include.device-mapper
> >>  -device-mapper: tools.device-mapper daemons.device-mapper
> man.device-mapper
> >>  +device-mapper: tools.device-mapper daemons.device-mapper
> >> + device_mapper: device-mapper
> >>
> >>   ifeq ("@INTL@", "yes")
> >> - lib.pofile: include.pofile
> >>  diff --git a/configure.ac b/configure.ac
> >> -index 7fd0561..4154dc0 100644
> >> +index 6def519..18a5c97 100644
> >>  --- a/configure.ac
> >>  +++ b/configure.ac
> >> -@@ -1812,7 +1812,6 @@ libdaemon/server/Makefile
> >> +@@ -2018,7 +2018,6 @@ libdaemon/server/Makefile
> >>   libdm/Makefile
> >>   libdm/dm-tools/Makefile
> >>   libdm/libdevmapper.pc
> >> @@ -68,5 +69,5 @@ index 7fd0561..4154dc0 100644
> >>   scripts/lvm2-pvscan.service
> >>   scripts/blkdeactivate.sh
> >>  --
> >> -2.7.4
> >> +2.25.1
> >>
> >> diff --git
> a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
> b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
> >> index 9f9383ef48..5b9b2d5748 100644
> >> ---
> a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
> >> +++
> b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
> >> @@ -11,23 +11,26 @@ Upstream-Status: Inappropriate [oe specific]
> >>
> >>  Rebase to v2_03_05
> >>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> +
> >> +Rebase to v2_03_16
> >> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> >>  ---
> >>   scripts/lvm2_monitoring_systemd_red_hat.service.in | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>  diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in
> b/scripts/lvm2_monitoring_systemd_red_hat.service.in
> >> -index 4bf744a..46766cb 100644
> >> +index c0c96e3..2a99a37 100644
> >>  --- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
> >>  +++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
> >>  @@ -2,7 +2,7 @@
> >>   Description=Monitoring of LVM2 mirrors, snapshots etc. using dmeventd
> or progress polling
> >>   Documentation=man:dmeventd(8) man:lvcreate(8) man:lvchange(8)
> man:vgchange(8)
> >>   Requires=dm-event.socket
> >> --After=dm-event.socket dm-event.service lvm2-activation.service
> >> -+After=dm-event.socket dm-event.service lvm2-activation.service
> tmp.mount
> >> +-After=dm-event.socket dm-event.service
> >> ++After=dm-event.socket dm-event.service tmp.mount
> >>   Before=local-fs-pre.target shutdown.target
> >>   DefaultDependencies=no
> >>   Conflicts=shutdown.target
> >>  --
> >> -2.7.4
> >> +2.25.1
> >>
> >> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
> b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
> >> similarity index 100%
> >> rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
> >> rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
> >> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> b/meta-oe/recipes-support/lvm2/lvm2.inc
> >> index 0c593b2042..34e57ec7a5 100644
> >> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> >> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> >> @@ -18,7 +18,7 @@ SRC_URI = "git://
> sourceware.org/git/lvm2.git;branch=main \
> >>             file://reproducible-build.patch \
> >>             "
> >>
> >> -SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
> >> +SRCREV = "6d1e894a867681af7a811ed63bc435f3aa55fec8"
> >>  S = "${WORKDIR}/git"
> >>
> >>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
> >> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
> b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
> >> similarity index 99%
> >> rename from meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
> >> rename to meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
> >> index a729324c9b..6a6cdc7cef 100644
> >> --- a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
> >> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
> >> @@ -68,6 +68,7 @@ FILES:${PN}-scripts = " \
> >>  # Specified explicitly for the udev rules, just in case that it does
> not get picked
> >>  # up automatically:
> >>  FILES:${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
> >> +RDEPENDS:${PN} = "bash"
> >>  RDEPENDS:${PN}-udevrules = "libdevmapper"
> >>  RDEPENDS:${PN}:append:class-target = " libdevmapper"
> >>  RDEPENDS:${PN}:append:class-nativesdk = " libdevmapper"
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#98732):
> https://lists.openembedded.org/g/openembedded-devel/message/98732
> > Mute This Topic: https://lists.openembedded.org/mt/93495342/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000015284705e86b7093
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, you&#39;re right, it&#39;s reproducible only with ld-=
is-gold and<div>LDFLAGS +=3D &quot;-fuse-ld=3Dbfd&quot;<br></div><div>resol=
ves this error.</div><div><br></div><div>It&#39;s caused by=C2=A0dm_bitset_=
parse_list uncommented in=C2=A0libdm/.exported_symbols.DM_1_02_129:</div><d=
iv><a href=3D"https://github.com/lvmteam/lvm2/commit/60eb608d66c2056a78e81f=
27db3da14139d9faab">https://github.com/lvmteam/lvm2/commit/60eb608d66c2056a=
78e81f27db3da14139d9faab</a><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 10, 2022 at 4:51 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, Sep=
 10, 2022 at 1:09 AM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
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
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#98732): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/98732" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/98732</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93495342=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/93495342/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000015284705e86b7093--

