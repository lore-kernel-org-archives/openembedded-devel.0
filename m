Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2AB7853A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 18:48:12 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id z8-v6so19466624qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 11:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=RlmkIbaxDcCm6jttNskSGpgPA9q6pTuzgWQ7pugJdlc=;
	b=NS4AlUE/jKQOLRWFqMZzsFXsvZC5Ewu2YT8pf4+g8yw0doEC4Cv5bvE+mycXYCPi3J
	SBCEc2czojpKxRxl4Qt+eB25lWC0P6vgXdCBeNbRFfJt2FSZV7zkYol2geEqydp4HzI+
	1wGI36sXSC2kGMjvPVT0I+uRTo3sYE6gvckrw6Bw0u9seHBTwCI8/HX0dvB8fpINhOF0
	M3Z1tQukpZ0mI6waaA0IzuBdUgkDz8zS6BDA7b7TvLDgFefYoQfbRpGjguttwk4z4dAy
	2IKKNJR5swSj3nsK9gNtP510pOlQkdWDtk2zL+tmY6SG2FkW2zs6kwcUcLXJbA16Q3Ug
	Li2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=RlmkIbaxDcCm6jttNskSGpgPA9q6pTuzgWQ7pugJdlc=;
	b=cTYiyxQDn3Om5qMqIqwhsLtGRTzqcva2k1xwfBuLtMFagFeMo73YFd0THzq0s3aylv
	YcDWLGFzfMsQngxNbNVRjTNNXjrY0A9JfSawJRNVLc5+xO8U+xN/Hf+SYuFdsE0WdTU8
	p6+D9+/0qaoy54W3lGJQ4dfNEI/4zLasxguu7z4CEVCpgXtY6FPF3ZK9A2lWe4lyX2ho
	cHrvT6NBBIj1ohloaI3zhQagsZlC4O7YEsjhaErZXxpR6WUQJDl7JK9EjOCGKfuMICD1
	S0eGsl4gQkRW7gX3sedBVwbccAzH/qOeTs5Z3wSOMf3OO8gPXVN4TT8jcigjUZzeyyiY
	7ygg==
X-Gm-Message-State: AOUpUlFWK9LDQve0UtN9Q3NFBkpFX0m9nYAaXSpBKIrlr3xvexRdq4oe
	O7YRtPlElkO40uHOvJs49UuKopxx
X-Google-Smtp-Source: AAOMgpfcgz6RYT2b+QDppP/wCXd7oK/J1uR0tcVBg1AR0yzSH7ohOES6rccgBuVIZnwf0bMiDNB36g==
X-Received: by 2002:ac8:fb1:: with SMTP id b46-v6mr6882417qtk.31.1531507692703;
	Fri, 13 Jul 2018 11:48:12 -0700 (PDT)
Received: from [172.16.60.21] ([142.136.62.197])
	by smtp.gmail.com with ESMTPSA id
	o71-v6sm23516228qki.55.2018.07.13.11.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jul 2018 11:48:12 -0700 (PDT)
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
References: <1530984352-5594-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAMKF1sqb2w1WUW4Y+AeVdE986b4Vf0VNCAZbcC0iEjduvLghag@mail.gmail.com>
	<CAD3vsf7kL2tq28JxbTjrU0UHJNiYohcDcAw8qyD8q-me=rTm1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <2dc32d53-c796-179d-ef1b-b30b094cc7aa@gmail.com>
Date: Fri, 13 Jul 2018 12:47:59 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAD3vsf7kL2tq28JxbTjrU0UHJNiYohcDcAw8qyD8q-me=rTm1A@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tgt: Migrate recipe from meta-openstack layer
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
X-List-Received-Date: Fri, 13 Jul 2018 18:48:12 -0000
X-Groupsio-MsgNum: 73355
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="w2vNf3UZj9kWPN9fXgF9LlV0Jb3Pyss1C"

--w2vNf3UZj9kWPN9fXgF9LlV0Jb3Pyss1C
Content-Type: multipart/mixed; boundary="2BT3L5apSJKwieLbCZKFulT5quoWPF1zj";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <2dc32d53-c796-179d-ef1b-b30b094cc7aa@gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] tgt: Migrate recipe from
 meta-openstack layer
References: <1530984352-5594-1-git-send-email-jkrishnanjanappa@mvista.com>
 <CAMKF1sqb2w1WUW4Y+AeVdE986b4Vf0VNCAZbcC0iEjduvLghag@mail.gmail.com>
 <CAD3vsf7kL2tq28JxbTjrU0UHJNiYohcDcAw8qyD8q-me=rTm1A@mail.gmail.com>
In-Reply-To: <CAD3vsf7kL2tq28JxbTjrU0UHJNiYohcDcAw8qyD8q-me=rTm1A@mail.gmail.com>

--2BT3L5apSJKwieLbCZKFulT5quoWPF1zj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/13/18 12:35 PM, Jagadeesh Krishnanjanappa wrote:
> Yes, we need to copy libconfig-general-perl recipe (from meta-openstack=
) to
> meta-networking as well.
>=20
> Bruce comment:
> We have specific version requirements with openstack, so we'll keep the=

> original
> recipe in place in meta-openstack, so you might want to change the shor=
t
> log of
> your patch to "copy recipe from meta-openstack".
>=20
> Since tgt recipe will continue to exists under meta-openstack layer as
> per above comment,
> copying it under meta-networking would create duplication. Is it OK?
>=20

this is SCSI target framework, in my mind this is neither openstack
specific nor networking specific. same is true for
libconfig-general-perl, however if there are no users of this outside
openstack layer users then its better it stays there, otherwise it
should move to meta-oe

> Regards,
> Jagadeesh
>=20
> On Thu, Jul 12, 2018 at 7:44 PM, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     I guess more recipes needs to be migrated. This fails with
>=20
>     ERROR: Nothing RPROVIDES 'libconfig-general-perl' (but
>     /mnt/a/oe/sources/meta-openembedded/meta-networking/recipes-support=
/tgt/tgt_git.bb
>     <http://tgt_git.bb>
>     RDEPENDS on or otherwise requires it)
>     NOTE: Runtime target 'libconfig-general-perl' is unbuildable,
>     removing...
>     Missing or unbuildable dependency chain was: ['libconfig-general-pe=
rl']
>     NOTE: Runtime target 'tgt' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['tgt',
>     'libconfig-general-perl']
>     ERROR: Nothing RPROVIDES 'tgt-dev' (but
>     /mnt/a/oe/sources/meta-openembedded/meta-networking/recipes-support=
/tgt/tgt_git.bb
>     <http://tgt_git.bb>
>     RDEPENDS on or otherwise requires it)
>     No eligible RPROVIDERs exist for 'tgt-dev'
>     NOTE: Runtime target 'tgt-dev' is unbuildable, removing...
>     Missing or unbuildable dependency chain was: ['tgt-dev']
>=20
>=20
>     On Sat, Jul 7, 2018 at 11:26 AM Jagadeesh Krishnanjanappa
>     <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>>
>     wrote:
>     >
>     > As iscsitarget cannot be built with Linux kernel >=3D 4.14, so
>     > migrate Linux SCSI target framework (tgt) recipe from meta-openst=
ack
>     > layer; to allow users to test iSCSI target feature with tgt in
>     > meta-networking layer.
>     >
>     > Signed-off-by: Jagadeesh Krishnanjanappa
>     <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>>
>     > ---
>     >=C2=A0 ...-path-of-header-files-check-in-Yocto-buil.patch |=C2=A0 =
47 +++++++++
>     >=C2=A0 .../tgt/files/0001-usr-Makefile-WARNING-fix.patch=C2=A0 |=C2=
=A0 29 ++++++
>     >=C2=A0 .../recipes-support/tgt/files/tgtd.init=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 116
>     +++++++++++++++++++++
>     >=C2=A0 ...Makefile-apply-LDFLAGS-to-all-executables.patch |=C2=A0 =
35 +++++++
>     >=C2=A0 meta-networking/recipes-support/tgt/tgt_git.bb
>     <http://tgt_git.bb>=C2=A0 =C2=A0 =C2=A0|=C2=A0 73 +++++++++++++
>     >=C2=A0 5 files changed, 300 insertions(+)
>     >=C2=A0 create mode 100644
>     meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-=
header-files-check-in-Yocto-buil.patch
>     >=C2=A0 create mode 100644
>     meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING=
-fix.patch
>     >=C2=A0 create mode 100644
>     meta-networking/recipes-support/tgt/files/tgtd.init
>     >=C2=A0 create mode 100644
>     meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAG=
S-to-all-executables.patch
>     >=C2=A0 create mode 100644 meta-networking/recipes-support/tgt/tgt_=
git.bb
>     <http://tgt_git.bb>
>     >
>     > diff --git
>     a/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-o=
f-header-files-check-in-Yocto-buil.patch
>     b/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-o=
f-header-files-check-in-Yocto-buil.patch
>     > new file mode 100644
>     > index 0000000..173ecb6
>     > --- /dev/null
>     > +++
>     b/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-o=
f-header-files-check-in-Yocto-buil.patch
>     > @@ -0,0 +1,47 @@
>     > +From 93fea40915d01be6d02587a0b8be85a642e6a8d5 Mon Sep 17 00:00:0=
0
>     2001
>     > +From: Zhenhua Luo <zhenhua.luo@freescale.com
>     <mailto:zhenhua.luo@freescale.com>>
>     > +Date: Thu, 10 Apr 2014 11:26:39 +0800
>     > +Subject: [PATCH] Correct the path of header files check in Yocto=

>     build env
>     > +
>     > +Upstream-Status: Inappropriate [the fix is specific to Yocto
>     build env]
>     > +
>     > +Current Makefile will check headers on host instead of Yocto
>     sysroot, following
>     > +error appears. Change the path of header check.
>     > +| bs_aio.c:34:20: fatal error: libaio.h: No such file or directo=
ry
>     > +| #include <libaio.h>
>     > +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^
>     > +| compilation terminated.
>     > +
>     > +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com
>     <mailto:zhenhua.luo@freescale.com>>
>     > +
>     > +---
>     > + usr/Makefile | 6 +++---
>     > + 1 file changed, 3 insertions(+), 3 deletions(-)
>     > +
>     > +diff --git a/usr/Makefile b/usr/Makefile
>     > +index decf13c..9ff8f15 100644
>     > +--- a/usr/Makefile
>     > ++++ b/usr/Makefile
>     > +@@ -1,11 +1,11 @@
>     > + sbindir ?=3D $(PREFIX)/sbin
>     > + libdir ?=3D $(PREFIX)/lib/tgt
>     > +
>     > +-ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1)=
,)
>     > ++ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h
>     && echo 1),)
>     > + CFLAGS +=3D -DUSE_SIGNALFD
>     > + endif
>     > +
>     > +-ifneq ($(shell test -n $(shell find /usr/include -name
>     "timerfd.h" | head -n1) && echo 1),)
>     > ++ifneq ($(shell test -n $(shell find $(SYSROOT)/usr/include -nam=
e
>     "timerfd.h" | head -n1) && echo 1),)
>     > + CFLAGS +=3D -DUSE_TIMERFD
>     > + endif
>     > +
>     > +@@ -25,7 +25,7 @@ ifneq ($(SD_NOTIFY),)
>     > + CFLAGS +=3D -DUSE_SYSTEMD
>     > + endif
>     > +
>     > +-ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e
>     /usr/include/libaio.h && echo 1),)
>     > ++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/eventfd.h &&
>     test -e $(SYSROOT)/usr/include/libaio.h && echo 1),)
>     > + CFLAGS +=3D -DUSE_EVENTFD
>     > + TGTD_OBJS +=3D bs_aio.o
>     > + LIBS +=3D -laio
>     > diff --git
>     a/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNI=
NG-fix.patch
>     b/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNI=
NG-fix.patch
>     > new file mode 100644
>     > index 0000000..078ba9e
>     > --- /dev/null
>     > +++
>     b/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNI=
NG-fix.patch
>     > @@ -0,0 +1,29 @@
>     > +From 6f4e3b11c7dccf83e2d18635c84837b212dfcc1c Mon Sep 17 00:00:0=
0
>     2001
>     > +From: Li xin <lixin.fnst@cn.fujitsu.com
>     <mailto:lixin.fnst@cn.fujitsu.com>>
>     > +Date: Sun, 26 Jul 2015 04:23:51 +0900
>     > +Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue: tg=
t:
>     > + /work/i586-oe-linux/tgt/1.0.60+gitAUTOINC+ab51727a36-r0/
>     > + packages-split/tgt/usr/sbin/tgtd contains probably-redundant
>     RPATH /usr/lib
>     > + [useless-rpaths]
>     > +
>     > +Upstream-Status: pending
>     > +
>     > +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com
>     <mailto:lixin.fnst@cn.fujitsu.com>>
>     > +
>     > +---
>     > + usr/Makefile | 2 +-
>     > + 1 file changed, 1 insertion(+), 1 deletion(-)
>     > +
>     > +diff --git a/usr/Makefile b/usr/Makefile
>     > +index 9ff8f15..cc8df11 100644
>     > +--- a/usr/Makefile
>     > ++++ b/usr/Makefile
>     > +@@ -63,7 +63,7 @@ TGTD_OBJS +=3D tgtd.o mgmt.o target.o scsi.o
>     log.o driver.o util.o work.o \
>     > +
>     > + TGTD_DEP =3D $(TGTD_OBJS:.o=3D.d)
>     > +
>     > +-LDFLAGS =3D -Wl,-E,-rpath=3D$(libdir)
>     > ++LDFLAGS +=3D -Wl,-E
>     > +
>     > + .PHONY:all
>     > + all: $(PROGRAMS) $(MODULES)
>     > diff --git a/meta-networking/recipes-support/tgt/files/tgtd.init
>     b/meta-networking/recipes-support/tgt/files/tgtd.init
>     > new file mode 100644
>     > index 0000000..4b0ce94
>     > --- /dev/null
>     > +++ b/meta-networking/recipes-support/tgt/files/tgtd.init
>     > @@ -0,0 +1,116 @@
>     > +#!/bin/sh
>     > +
>     > +### BEGIN INIT INFO
>     > +# Provides: tgtd
>     > +# Required-Start: $remote_fs $network $syslog
>     > +# Required-Stop: $remote_fs $syslog
>     > +# Default-Start:=C2=A0 =C2=A0 =C2=A03 5
>     > +# Default-Stop:=C2=A0 =C2=A0 =C2=A0 0 1 2 6
>     > +# Short-Description: SCSI target daemon
>     > +# Description: Linux SCSI target framework (tgt)
>     > +### END INIT INFO
>     > +
>     > +DESC=3D"tgtd"
>     > +DAEMON=3D"/usr/sbin/tgtd"
>     > +TGTD_CONFIG=3D/etc/tgt/targets.conf
>     > +
>     > +start ()
>     > +{
>     > +=C2=A0 =C2=A0 echo -n "Starting $DESC..."
>     > +
>     > +=C2=A0 =C2=A0 # Ensure service isn't running
>     > +=C2=A0 =C2=A0 tgt-admin -s >/dev/null 2>&1
>     > +=C2=A0 =C2=A0 RETVAL=3D$?
>     > +=C2=A0 =C2=A0 if [ "$RETVAL" -ne 107 ] ; then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "$DESC is already running."
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
>     > +=C2=A0 =C2=A0 fi
>     > +
>     > +=C2=A0 =C2=A0 # Start tgtd first
>     > +=C2=A0 =C2=A0 $DAEMON &>/dev/null
>     > +=C2=A0 =C2=A0 RETVAL=3D$?
>     > +=C2=A0 =C2=A0 if [ "$RETVAL" -ne 0 ]; then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "failed."
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
>     > +=C2=A0 =C2=A0 fi
>     > +
>     > +=C2=A0 =C2=A0 # Put tgtd into "offline" state until all the targ=
ets are
>     configured.
>     > +=C2=A0 =C2=A0 # We don't want initiators to (re)connect and fail=
 the connection
>     > +=C2=A0 =C2=A0 # if it's not ready.
>     > +=C2=A0 =C2=A0 tgtadm --op update --mode sys --name State -v offl=
ine
>     > +=C2=A0 =C2=A0 # Configure the targets.
>     > +=C2=A0 =C2=A0 tgt-admin -f -e -c $TGTD_CONFIG
>     > +=C2=A0 =C2=A0 # Put tgtd into "ready" state.
>     > +=C2=A0 =C2=A0 tgtadm --op update --mode sys --name State -v read=
y
>     > +
>     > +=C2=A0 =C2=A0 echo "done."
>     > +}
>     > +
>     > +stop ()
>     > +{
>     > +=C2=A0 =C2=A0 echo -n "Stopping $DESC..."
>     > +
>     > +=C2=A0 =C2=A0 # Remove all targets. It only removes targets whic=
h are not
>     in use.
>     > +=C2=A0 =C2=A0 tgt-admin --update ALL -c /dev/null &>/dev/null
>     > +=C2=A0 =C2=A0 # tgtd will exit if all targets were removed
>     > +=C2=A0 =C2=A0 tgtadm --op delete --mode system &>/dev/null
>     > +=C2=A0 =C2=A0 RETVAL=3D$?
>     > +=C2=A0 =C2=A0 if [ "$RETVAL" -eq 107 ] ; then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ "$TASK" !=3D "restart" ] ; then=

>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     > +=C2=A0 =C2=A0 elif [ "$RETVAL" -ne 0 ] ; then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Some initiators are still conn=
ected - could not
>     stop tgtd"
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 2
>     > +=C2=A0 =C2=A0 fi
>     > +=C2=A0 =C2=A0 echo -n
>     > +}
>     > +
>     > +reload()
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Reloading configuration of $DE=
SC" "$NAME"
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Update configuration for targets. =
Only targets which
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # are not in use will be updated.
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tgt-admin --update ALL -c $TGTD_CONF=
IG &>/dev/null
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 RETVAL=3D$?
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ "$RETVAL" -eq 107 ] ; then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "tg=
td is not running"
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     > +}
>     > +
>     > +status()
>     > +{
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tgt-admin -s >/dev/null 2>&1
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0RETVAL=3D$?
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ "$RETVAL" -eq 107 ] ; then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "tg=
td is not running"
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "tg=
td is running"
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     > +}
>     > +
>     > +case "$1" in
>     > +=C2=A0 =C2=A0 start)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 start
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
>     > +=C2=A0 =C2=A0 stop)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 stop
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
>     > +=C2=A0 =C2=A0 restart|force-reload)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 stop
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 start
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
>     > +=C2=A0 =C2=A0 reload)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 reload
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
>     > +=C2=A0 =C2=A0 status)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 status
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
>     > +=C2=A0 =C2=A0 *)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo "Usage: $0
>     {start|stop|force-reload|restart|status|reload}"
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
>     > +esac
>     > +
>     > +exit 0
>     > diff --git
>     a/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFL=
AGS-to-all-executables.patch
>     b/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFL=
AGS-to-all-executables.patch
>     > new file mode 100644
>     > index 0000000..d480ef7
>     > --- /dev/null
>     > +++
>     b/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFL=
AGS-to-all-executables.patch
>     > @@ -0,0 +1,35 @@
>     > +From a815ac8ee16b344d9e24b445957f32bf2aafa532 Mon Sep 17 00:00:0=
0
>     2001
>     > +From: Mark Asselstine <mark.asselstine@windriver.com
>     <mailto:mark.asselstine@windriver.com>>
>     > +Date: Thu, 5 Jan 2017 11:07:51 -0500
>     > +Subject: [PATCH] usr/Makefile: apply LDFLAGS to all executables
>     > +
>     > +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com
>     <mailto:mark.asselstine@windriver.com>>
>     > +---
>     > + usr/Makefile | 4 ++--
>     > + 1 file changed, 2 insertions(+), 2 deletions(-)
>     > +
>     > +diff --git a/usr/Makefile b/usr/Makefile
>     > +index cc8df11..c55fd68 100644
>     > +--- a/usr/Makefile
>     > ++++ b/usr/Makefile
>     > +@@ -78,7 +78,7 @@ TGTADM_OBJS =3D tgtadm.o concat_buf.o
>     > + TGTADM_DEP =3D $(TGTADM_OBJS:.o=3D.d)
>     > +
>     > + tgtadm: $(TGTADM_OBJS)
>     > +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $@
>     > ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $@ $(LDFLAGS)
>     > +
>     > + -include $(TGTADM_DEP)
>     > +
>     > +@@ -86,7 +86,7 @@ TGTIMG_OBJS =3D tgtimg.o libssc.o libcrc32c.o
>     > + TGTIMG_DEP =3D $(TGTIMG_OBJS:.o=3D.d)
>     > +
>     > + tgtimg: $(TGTIMG_OBJS)
>     > +-=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $@
>     > ++=C2=A0 =C2=A0 =C2=A0 $(CC) $^ -o $@ $(LDFLAGS)
>     > +
>     > + -include $(TGTIMG_DEP)
>     > +
>     > +--
>     > +2.7.4
>     > +
>     > diff --git a/meta-networking/recipes-support/tgt/tgt_git.bb
>     <http://tgt_git.bb> b/meta-networking/recipes-support/tgt/tgt_git.b=
b
>     <http://tgt_git.bb>
>     > new file mode 100644
>     > index 0000000..9ca181a
>     > --- /dev/null
>     > +++ b/meta-networking/recipes-support/tgt/tgt_git.bb
>     <http://tgt_git.bb>
>     > @@ -0,0 +1,73 @@
>     > +DESCRIPTION =3D "Linux SCSI target framework (tgt)"
>     > +HOMEPAGE =3D "http://stgt.sourceforge.net"
>     > +LICENSE =3D "GPLv2"
>     > +LIC_FILES_CHKSUM =3D
>     "file://scripts/tgtd.spec;beginline=3D7;endline=3D7;md5=3D21c19ea7d=
ad04648b9c2f791b6e29b4c"
>     > +DEPENDS =3D "sg3-utils"
>     > +
>     > +SRCREV =3D "cb7971cfeecaa43c15eed4719dc82516d7e87b6c"
>     > +PV =3D "1.0.67+git${SRCPV}"
>     > +
>     > +SRC_URI =3D "git://github.com/fujita/tgt.git
>     <http://github.com/fujita/tgt.git> \
>     > +=C2=A0 =C2=A0 =C2=A0
>     =C2=A0file://0001-Correct-the-path-of-header-files-check-in-Yocto-b=
uil.patch
>     \
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-usr-Makefile-WARNING-fix=
=2Epatch \
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://usr-Makefile-apply-LDFLAGS-to=
-all-executables.patch \
>     > +"
>     > +SRC_URI +=3D "file://tgtd.init"
>     > +
>     > +S =3D "${WORKDIR}/git"
>     > +
>     > +CONFFILES_${PN} +=3D "${sysconfdir}/tgt/targets.conf"
>     > +
>     > +inherit update-rc.d
>     > +
>     > +CFLAGS +=3D ' -I. -DUSE_SIGNALFD -DUSE_TIMERFD -D_GNU_SOURCE
>     -DTGT_VERSION=3D\\"1.0.63\\" -DBSDIR=3D\\"${libdir}/backing-store\\=
"'
>     > +
>     > +#do_compile() {
>     > +#=C2=A0 =C2=A0 oe_runmake SYSROOT=3D"${STAGING_DIR_TARGET}" -e p=
rograms conf
>     scripts
>     > +#}
>     > +EXTRA_OEMAKE =3D "-e programs conf scripts"
>     > +
>     > +do_install() {
>     > +=C2=A0 =C2=A0 oe_runmake -e DESTDIR=3D"${D}" install-programs in=
stall-conf
>     install-scripts
>     > +
>     > +=C2=A0 =C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvin=
it',
>     'true', 'false', d)}; then
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/init.d
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/tgtd.init=

>     ${D}${sysconfdir}/init.d/tgtd
>     > +=C2=A0 =C2=A0 fi
>     > +}
>     > +
>     > +RDEPENDS_${PN} =3D " \
>     > +=C2=A0 =C2=A0 bash \
>     > +=C2=A0 =C2=A0 libaio \
>     > +=C2=A0 =C2=A0 libconfig-general-perl \
>     > +=C2=A0 =C2=A0 perl-module-english \
>     > +=C2=A0 =C2=A0 perl-module-tie-hash-namedcapture \
>     > +=C2=A0 =C2=A0 perl-module-xsloader \
>     > +=C2=A0 =C2=A0 perl-module-carp \
>     > +=C2=A0 =C2=A0 perl-module-exporter \
>     > +=C2=A0 =C2=A0 perl-module-errno \
>     > +=C2=A0 =C2=A0 perl-module-exporter-heavy \
>     > +=C2=A0 =C2=A0 perl-module-symbol \
>     > +=C2=A0 =C2=A0 perl-module-selectsaver \
>     > +=C2=A0 =C2=A0 perl-module-dynaloader \
>     > +=C2=A0 =C2=A0 perl-module-carp-heavy \
>     > +=C2=A0 =C2=A0 perl-module-filehandle \
>     > +=C2=A0 =C2=A0 perl-module-feature \
>     > +=C2=A0 =C2=A0 perl-module-overload \
>     > +=C2=A0 =C2=A0 perl-module-fcntl \
>     > +=C2=A0 =C2=A0 perl-module-io \
>     > +=C2=A0 =C2=A0 perl-module-io-file \
>     > +=C2=A0 =C2=A0 perl-module-io-handle \
>     > +=C2=A0 =C2=A0 perl-module-io-seekable \
>     > +=C2=A0 =C2=A0 perl-module-file-glob \
>     > +=C2=A0 =C2=A0 perl-module-base \
>     > +=C2=A0 =C2=A0 perl-module-encoding-warnings \
>     > +=C2=A0 =C2=A0 perl-module-file-spec-unix \
>     > +=C2=A0 =C2=A0 perl-module-file-spec \
>     > +=C2=A0 =C2=A0 perl-module-file-spec-functions \
>     > +=C2=A0 =C2=A0 perl-module-getopt-long \
>     > +=C2=A0 =C2=A0 perl-module-constant \
>     > +=C2=A0 =C2=A0 "
>     > +INITSCRIPT_PACKAGES =3D "${PN}"
>     > +INITSCRIPT_NAME_${PN} =3D "tgtd"
>     > +
>     > --
>     > 2.7.4
>     >
>     > --
>     > _______________________________________________
>     > Openembedded-devel mailing list
>     > Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     > http://lists.openembedded.org/mailman/listinfo/openembedded-devel=

>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>=

>=20
>=20



--2BT3L5apSJKwieLbCZKFulT5quoWPF1zj--

--w2vNf3UZj9kWPN9fXgF9LlV0Jb3Pyss1C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW0jz5gAKCRC7BTNVkZ0z
FCBpAJ9+PjvSbExAq+odPcZEktZCtAMpYgCfTHf4+F8PqkMrEwP9v7Zse80F+Ng=
=JPp5
-----END PGP SIGNATURE-----

--w2vNf3UZj9kWPN9fXgF9LlV0Jb3Pyss1C--
