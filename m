Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9B98A71A9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 16:07:29 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id u202-v6so32617219lff.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=G3jzNCtQ0/TSaFKdxH4s3XxxUmWHOZmOm1Pa/5JdOe4=;
	b=Dzy4oC6hik17sc/4F4wa4JNK8/tVJLoEzcrJLZJ4ney6Y01MuH8X/6Rr5bv5XKw0f7
	epOs4I+A1pRX4XZ14VPrlJcONzFtAUxk0WliqY1px5pGVycuXYmxPcneDwDrO+YtmKde
	PRYQHE565jlYkurvQtER6PrAt9XHQn/SXfqQJBPshbvKHLzLxuJt9vsZOU4cIWezZdPC
	Z+TIUsYj1U7rnwf7CuUnH9BBzypxnIXyVBB1tPl5zSUn8LCZUXcxEsTCO8MZwWfC703r
	zpfwU6bLQ4cU+QyAgU/UzUX72tGKZlYXJnsRODeq2V0FW9pKKKzI4iHdFi58U5f3vK2e
	OP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=G3jzNCtQ0/TSaFKdxH4s3XxxUmWHOZmOm1Pa/5JdOe4=;
	b=fGoimu/wAbE2BFkvbY6aZYqfXJkkYiTMvHbIucHGWU+BTWk1JCgYTmJkl6PSur2jQI
	os1AWpkG7EtjV+awEK8SVjOr80AjQHCb/46xP7/0ol9uSRhJhx6MTnr9KoFUpkF7Dbu5
	XamkdZJs0NUc4kS96jyHx8yol1v+c0qzQIDiLHF6E4Y6FbH3tcEP7WNlJbQ0cE5iBj+d
	sA/mUXNmSxKTpkUTun6UUp9dk/7m68faC6IvF3U5ft3uLWpMLawZdKsnFknzvNVwehrQ
	nmcj5CO6VHagJL9evhYa6+dmWGMw2Thasf8XlBaR3q4okwNqrg+uteKjMQUDEVvRVKVu
	j4CA==
X-Gm-Message-State: AOUpUlGQQef1Bkc9FHM+A0j04E8LPaVNZ2MQ8un5047HhPrlAo5gCbia
	IhwpYFOb7oXb8Z6hsbtedK9+i4Z//ck4IP8M+F4=
X-Google-Smtp-Source: AAOMgpc/nq6bOT+c17GBJfRaEPktO/JHXknRZNKt6eSSK9F+6PWZKBsVPWp6/FzuwwqDZqMPY3NgyZL+orZUi716jNU=
X-Received: by 2002:a19:b598:: with SMTP id
	g24-v6mr12359552lfk.129.1531757249806; 
	Mon, 16 Jul 2018 09:07:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 09:07:29
	-0700 (PDT)
In-Reply-To: <5B4C1482.3020306@windriver.com>
References: <1530984352-5594-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAMKF1sqb2w1WUW4Y+AeVdE986b4Vf0VNCAZbcC0iEjduvLghag@mail.gmail.com>
	<CAD3vsf7kL2tq28JxbTjrU0UHJNiYohcDcAw8qyD8q-me=rTm1A@mail.gmail.com>
	<2dc32d53-c796-179d-ef1b-b30b094cc7aa@gmail.com>
	<5B4C1482.3020306@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Jul 2018 12:07:29 -0400
Message-ID: <CADkTA4PLc6=bTax3LCkexQtM=bZhwTi6G33SaO+n=PT9RNukHA@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
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
X-List-Received-Date: Mon, 16 Jul 2018 16:07:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 15, 2018 at 11:44 PM, Yu, Mingli <mingli.yu@windriver.com> wrot=
e:
>
>
> On 2018=E5=B9=B407=E6=9C=8814=E6=97=A5 02:47, Khem Raj wrote:
>>
>> On 7/13/18 12:35 PM, Jagadeesh Krishnanjanappa wrote:
>>>
>>> Yes, we need to copy libconfig-general-perl recipe (from meta-openstack=
)
>>> to
>>> meta-networking as well.
>>>
>>> Bruce comment:
>>> We have specific version requirements with openstack, so we'll keep the
>>> original
>>> recipe in place in meta-openstack, so you might want to change the shor=
t
>>> log of
>>> your patch to "copy recipe from meta-openstack".
>>>
>>> Since tgt recipe will continue to exists under meta-openstack layer as
>>> per above comment,
>>> copying it under meta-networking would create duplication. Is it OK?
>>>
>>
>> this is SCSI target framework, in my mind this is neither openstack
>> specific nor networking specific. same is true for
>> libconfig-general-perl, however if there are no users of this outside
>> openstack layer users then its better it stays there, otherwise it
>> should move to meta-oe
>
>
> If we won't support the iscsitarget in the future as it needs too much
> change to work with kernel >=3D 4.14, it should be convenient to move tgt=
 to
> meta-oe.

That statement actually makes little sense. If the meta-openstack
layer doesn't break anything, keeping the recipe there is one line in
a bblayers file. Not exactly a grand challenge.

In meta-openstack there are very specific version requirements and
system level testing that happens, so the uprev cadence is different.
If more frequent updates, and unit testing via meta-oe are going to be
done, then that is definitely a reason for a copy to be made (since
depending on meta-openstack could be a problem) .. that's an actual
reason, versus stating some fact that has nothing to do with recipe
placement.

But again, I'm not arguing one way or the other, and I'm certainly not
objecting to anything here .. I'll need to keep the recipe in
meta-openstack either way.

It is just Monday and I thought I'd point out that using valid
technical points makes decision making easier.

Cheers,

Bruce

>
> Thanks,
>
>
>>
>>> Regards,
>>> Jagadeesh
>>>
>>> On Thu, Jul 12, 2018 at 7:44 PM, Khem Raj <raj.khem@gmail.com
>>> <mailto:raj.khem@gmail.com>> wrote:
>>>
>>>      I guess more recipes needs to be migrated. This fails with
>>>
>>>      ERROR: Nothing RPROVIDES 'libconfig-general-perl' (but
>>>
>>> /mnt/a/oe/sources/meta-openembedded/meta-networking/recipes-support/tgt=
/tgt_git.bb
>>>      <http://tgt_git.bb>
>>>      RDEPENDS on or otherwise requires it)
>>>      NOTE: Runtime target 'libconfig-general-perl' is unbuildable,
>>>      removing...
>>>      Missing or unbuildable dependency chain was:
>>> ['libconfig-general-perl']
>>>      NOTE: Runtime target 'tgt' is unbuildable, removing...
>>>      Missing or unbuildable dependency chain was: ['tgt',
>>>      'libconfig-general-perl']
>>>      ERROR: Nothing RPROVIDES 'tgt-dev' (but
>>>
>>> /mnt/a/oe/sources/meta-openembedded/meta-networking/recipes-support/tgt=
/tgt_git.bb
>>>      <http://tgt_git.bb>
>>>      RDEPENDS on or otherwise requires it)
>>>      No eligible RPROVIDERs exist for 'tgt-dev'
>>>      NOTE: Runtime target 'tgt-dev' is unbuildable, removing...
>>>      Missing or unbuildable dependency chain was: ['tgt-dev']
>>>
>>>
>>>      On Sat, Jul 7, 2018 at 11:26 AM Jagadeesh Krishnanjanappa
>>>      <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>>
>>>      wrote:
>>>      >
>>>      > As iscsitarget cannot be built with Linux kernel >=3D 4.14, so
>>>      > migrate Linux SCSI target framework (tgt) recipe from
>>> meta-openstack
>>>      > layer; to allow users to test iSCSI target feature with tgt in
>>>      > meta-networking layer.
>>>      >
>>>      > Signed-off-by: Jagadeesh Krishnanjanappa
>>>      <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>>
>>>      > ---
>>>      >  ...-path-of-header-files-check-in-Yocto-buil.patch |  47
>>> +++++++++
>>>      >  .../tgt/files/0001-usr-Makefile-WARNING-fix.patch  |  29 ++++++
>>>      >  .../recipes-support/tgt/files/tgtd.init            | 116
>>>      +++++++++++++++++++++
>>>      >  ...Makefile-apply-LDFLAGS-to-all-executables.patch |  35 ++++++=
+
>>>      >  meta-networking/recipes-support/tgt/tgt_git.bb
>>>      <http://tgt_git.bb>     |  73 +++++++++++++
>>>      >  5 files changed, 300 insertions(+)
>>>      >  create mode 100644
>>>
>>> meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-head=
er-files-check-in-Yocto-buil.patch
>>>      >  create mode 100644
>>>
>>> meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-fix=
.patch
>>>      >  create mode 100644
>>>      meta-networking/recipes-support/tgt/files/tgtd.init
>>>      >  create mode 100644
>>>
>>> meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-to=
-all-executables.patch
>>>      >  create mode 100644 meta-networking/recipes-support/tgt/tgt_git.=
bb
>>>      <http://tgt_git.bb>
>>>      >
>>>      > diff --git
>>>
>>> a/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-he=
ader-files-check-in-Yocto-buil.patch
>>>
>>> b/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-he=
ader-files-check-in-Yocto-buil.patch
>>>      > new file mode 100644
>>>      > index 0000000..173ecb6
>>>      > --- /dev/null
>>>      > +++
>>>
>>> b/meta-networking/recipes-support/tgt/files/0001-Correct-the-path-of-he=
ader-files-check-in-Yocto-buil.patch
>>>      > @@ -0,0 +1,47 @@
>>>      > +From 93fea40915d01be6d02587a0b8be85a642e6a8d5 Mon Sep 17 00:00:=
00
>>>      2001
>>>      > +From: Zhenhua Luo <zhenhua.luo@freescale.com
>>>      <mailto:zhenhua.luo@freescale.com>>
>>>      > +Date: Thu, 10 Apr 2014 11:26:39 +0800
>>>      > +Subject: [PATCH] Correct the path of header files check in Yoct=
o
>>>      build env
>>>      > +
>>>      > +Upstream-Status: Inappropriate [the fix is specific to Yocto
>>>      build env]
>>>      > +
>>>      > +Current Makefile will check headers on host instead of Yocto
>>>      sysroot, following
>>>      > +error appears. Change the path of header check.
>>>      > +| bs_aio.c:34:20: fatal error: libaio.h: No such file or
>>> directory
>>>      > +| #include <libaio.h>
>>>      > +|                     ^
>>>      > +| compilation terminated.
>>>      > +
>>>      > +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com
>>>      <mailto:zhenhua.luo@freescale.com>>
>>>      > +
>>>      > +---
>>>      > + usr/Makefile | 6 +++---
>>>      > + 1 file changed, 3 insertions(+), 3 deletions(-)
>>>      > +
>>>      > +diff --git a/usr/Makefile b/usr/Makefile
>>>      > +index decf13c..9ff8f15 100644
>>>      > +--- a/usr/Makefile
>>>      > ++++ b/usr/Makefile
>>>      > +@@ -1,11 +1,11 @@
>>>      > + sbindir ?=3D $(PREFIX)/sbin
>>>      > + libdir ?=3D $(PREFIX)/lib/tgt
>>>      > +
>>>      > +-ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo
>>> 1),)
>>>      > ++ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h
>>>      && echo 1),)
>>>      > + CFLAGS +=3D -DUSE_SIGNALFD
>>>      > + endif
>>>      > +
>>>      > +-ifneq ($(shell test -n $(shell find /usr/include -name
>>>      "timerfd.h" | head -n1) && echo 1),)
>>>      > ++ifneq ($(shell test -n $(shell find $(SYSROOT)/usr/include -na=
me
>>>      "timerfd.h" | head -n1) && echo 1),)
>>>      > + CFLAGS +=3D -DUSE_TIMERFD
>>>      > + endif
>>>      > +
>>>      > +@@ -25,7 +25,7 @@ ifneq ($(SD_NOTIFY),)
>>>      > + CFLAGS +=3D -DUSE_SYSTEMD
>>>      > + endif
>>>      > +
>>>      > +-ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e
>>>      /usr/include/libaio.h && echo 1),)
>>>      > ++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/eventfd.h &&
>>>      test -e $(SYSROOT)/usr/include/libaio.h && echo 1),)
>>>      > + CFLAGS +=3D -DUSE_EVENTFD
>>>      > + TGTD_OBJS +=3D bs_aio.o
>>>      > + LIBS +=3D -laio
>>>      > diff --git
>>>
>>> a/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-f=
ix.patch
>>>
>>> b/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-f=
ix.patch
>>>      > new file mode 100644
>>>      > index 0000000..078ba9e
>>>      > --- /dev/null
>>>      > +++
>>>
>>> b/meta-networking/recipes-support/tgt/files/0001-usr-Makefile-WARNING-f=
ix.patch
>>>      > @@ -0,0 +1,29 @@
>>>      > +From 6f4e3b11c7dccf83e2d18635c84837b212dfcc1c Mon Sep 17 00:00:=
00
>>>      2001
>>>      > +From: Li xin <lixin.fnst@cn.fujitsu.com
>>>      <mailto:lixin.fnst@cn.fujitsu.com>>
>>>      > +Date: Sun, 26 Jul 2015 04:23:51 +0900
>>>      > +Subject: [PATCH] usr/Makefile: WARNING fix WARNING: QA Issue:
>>> tgt:
>>>      > + /work/i586-oe-linux/tgt/1.0.60+gitAUTOINC+ab51727a36-r0/
>>>      > + packages-split/tgt/usr/sbin/tgtd contains probably-redundant
>>>      RPATH /usr/lib
>>>      > + [useless-rpaths]
>>>      > +
>>>      > +Upstream-Status: pending
>>>      > +
>>>      > +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com
>>>      <mailto:lixin.fnst@cn.fujitsu.com>>
>>>      > +
>>>      > +---
>>>      > + usr/Makefile | 2 +-
>>>      > + 1 file changed, 1 insertion(+), 1 deletion(-)
>>>      > +
>>>      > +diff --git a/usr/Makefile b/usr/Makefile
>>>      > +index 9ff8f15..cc8df11 100644
>>>      > +--- a/usr/Makefile
>>>      > ++++ b/usr/Makefile
>>>      > +@@ -63,7 +63,7 @@ TGTD_OBJS +=3D tgtd.o mgmt.o target.o scsi.o
>>>      log.o driver.o util.o work.o \
>>>      > +
>>>      > + TGTD_DEP =3D $(TGTD_OBJS:.o=3D.d)
>>>      > +
>>>      > +-LDFLAGS =3D -Wl,-E,-rpath=3D$(libdir)
>>>      > ++LDFLAGS +=3D -Wl,-E
>>>      > +
>>>      > + .PHONY:all
>>>      > + all: $(PROGRAMS) $(MODULES)
>>>      > diff --git a/meta-networking/recipes-support/tgt/files/tgtd.init
>>>      b/meta-networking/recipes-support/tgt/files/tgtd.init
>>>      > new file mode 100644
>>>      > index 0000000..4b0ce94
>>>      > --- /dev/null
>>>      > +++ b/meta-networking/recipes-support/tgt/files/tgtd.init
>>>      > @@ -0,0 +1,116 @@
>>>      > +#!/bin/sh
>>>      > +
>>>      > +### BEGIN INIT INFO
>>>      > +# Provides: tgtd
>>>      > +# Required-Start: $remote_fs $network $syslog
>>>      > +# Required-Stop: $remote_fs $syslog
>>>      > +# Default-Start:     3 5
>>>      > +# Default-Stop:      0 1 2 6
>>>      > +# Short-Description: SCSI target daemon
>>>      > +# Description: Linux SCSI target framework (tgt)
>>>      > +### END INIT INFO
>>>      > +
>>>      > +DESC=3D"tgtd"
>>>      > +DAEMON=3D"/usr/sbin/tgtd"
>>>      > +TGTD_CONFIG=3D/etc/tgt/targets.conf
>>>      > +
>>>      > +start ()
>>>      > +{
>>>      > +    echo -n "Starting $DESC..."
>>>      > +
>>>      > +    # Ensure service isn't running
>>>      > +    tgt-admin -s >/dev/null 2>&1
>>>      > +    RETVAL=3D$?
>>>      > +    if [ "$RETVAL" -ne 107 ] ; then
>>>      > +        echo "$DESC is already running."
>>>      > +        exit 1
>>>      > +    fi
>>>      > +
>>>      > +    # Start tgtd first
>>>      > +    $DAEMON &>/dev/null
>>>      > +    RETVAL=3D$?
>>>      > +    if [ "$RETVAL" -ne 0 ]; then
>>>      > +        echo "failed."
>>>      > +        exit 1
>>>      > +    fi
>>>      > +
>>>      > +    # Put tgtd into "offline" state until all the targets are
>>>      configured.
>>>      > +    # We don't want initiators to (re)connect and fail the
>>> connection
>>>      > +    # if it's not ready.
>>>      > +    tgtadm --op update --mode sys --name State -v offline
>>>      > +    # Configure the targets.
>>>      > +    tgt-admin -f -e -c $TGTD_CONFIG
>>>      > +    # Put tgtd into "ready" state.
>>>      > +    tgtadm --op update --mode sys --name State -v ready
>>>      > +
>>>      > +    echo "done."
>>>      > +}
>>>      > +
>>>      > +stop ()
>>>      > +{
>>>      > +    echo -n "Stopping $DESC..."
>>>      > +
>>>      > +    # Remove all targets. It only removes targets which are not
>>>      in use.
>>>      > +    tgt-admin --update ALL -c /dev/null &>/dev/null
>>>      > +    # tgtd will exit if all targets were removed
>>>      > +    tgtadm --op delete --mode system &>/dev/null
>>>      > +    RETVAL=3D$?
>>>      > +    if [ "$RETVAL" -eq 107 ] ; then
>>>      > +        if [ "$TASK" !=3D "restart" ] ; then
>>>      > +            return 1
>>>      > +        fi
>>>      > +    elif [ "$RETVAL" -ne 0 ] ; then
>>>      > +        echo "Some initiators are still connected - could not
>>>      stop tgtd"
>>>      > +        return 2
>>>      > +    fi
>>>      > +    echo -n
>>>      > +}
>>>      > +
>>>      > +reload()
>>>      > +{
>>>      > +        echo "Reloading configuration of $DESC" "$NAME"
>>>      > +        # Update configuration for targets. Only targets which
>>>      > +        # are not in use will be updated.
>>>      > +        tgt-admin --update ALL -c $TGTD_CONFIG &>/dev/null
>>>      > +        RETVAL=3D$?
>>>      > +        if [ "$RETVAL" -eq 107 ] ; then
>>>      > +                echo "tgtd is not running"
>>>      > +                exit 1
>>>      > +        fi
>>>      > +}
>>>      > +
>>>      > +status()
>>>      > +{
>>>      > +        tgt-admin -s >/dev/null 2>&1
>>>      > +       RETVAL=3D$?
>>>      > +        if [ "$RETVAL" -eq 107 ] ; then
>>>      > +                echo "tgtd is not running"
>>>      > +        else
>>>      > +                echo "tgtd is running"
>>>      > +        fi
>>>      > +}
>>>      > +
>>>      > +case "$1" in
>>>      > +    start)
>>>      > +        start
>>>      > +        ;;
>>>      > +    stop)
>>>      > +        stop
>>>      > +        ;;
>>>      > +    restart|force-reload)
>>>      > +        stop
>>>      > +        start
>>>      > +        ;;
>>>      > +    reload)
>>>      > +        reload
>>>      > +        ;;
>>>      > +    status)
>>>      > +        status
>>>      > +        ;;
>>>      > +    *)
>>>      > +        echo "Usage: $0
>>>      {start|stop|force-reload|restart|status|reload}"
>>>      > +        exit 1
>>>      > +        ;;
>>>      > +esac
>>>      > +
>>>      > +exit 0
>>>      > diff --git
>>>
>>> a/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-=
to-all-executables.patch
>>>
>>> b/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-=
to-all-executables.patch
>>>      > new file mode 100644
>>>      > index 0000000..d480ef7
>>>      > --- /dev/null
>>>      > +++
>>>
>>> b/meta-networking/recipes-support/tgt/files/usr-Makefile-apply-LDFLAGS-=
to-all-executables.patch
>>>      > @@ -0,0 +1,35 @@
>>>      > +From a815ac8ee16b344d9e24b445957f32bf2aafa532 Mon Sep 17 00:00:=
00
>>>      2001
>>>      > +From: Mark Asselstine <mark.asselstine@windriver.com
>>>      <mailto:mark.asselstine@windriver.com>>
>>>      > +Date: Thu, 5 Jan 2017 11:07:51 -0500
>>>      > +Subject: [PATCH] usr/Makefile: apply LDFLAGS to all executables
>>>      > +
>>>      > +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com
>>>      <mailto:mark.asselstine@windriver.com>>
>>>      > +---
>>>      > + usr/Makefile | 4 ++--
>>>      > + 1 file changed, 2 insertions(+), 2 deletions(-)
>>>      > +
>>>      > +diff --git a/usr/Makefile b/usr/Makefile
>>>      > +index cc8df11..c55fd68 100644
>>>      > +--- a/usr/Makefile
>>>      > ++++ b/usr/Makefile
>>>      > +@@ -78,7 +78,7 @@ TGTADM_OBJS =3D tgtadm.o concat_buf.o
>>>      > + TGTADM_DEP =3D $(TGTADM_OBJS:.o=3D.d)
>>>      > +
>>>      > + tgtadm: $(TGTADM_OBJS)
>>>      > +-      $(CC) $^ -o $@
>>>      > ++      $(CC) $^ -o $@ $(LDFLAGS)
>>>      > +
>>>      > + -include $(TGTADM_DEP)
>>>      > +
>>>      > +@@ -86,7 +86,7 @@ TGTIMG_OBJS =3D tgtimg.o libssc.o libcrc32c.o
>>>      > + TGTIMG_DEP =3D $(TGTIMG_OBJS:.o=3D.d)
>>>      > +
>>>      > + tgtimg: $(TGTIMG_OBJS)
>>>      > +-      $(CC) $^ -o $@
>>>      > ++      $(CC) $^ -o $@ $(LDFLAGS)
>>>      > +
>>>      > + -include $(TGTIMG_DEP)
>>>      > +
>>>      > +--
>>>      > +2.7.4
>>>      > +
>>>      > diff --git a/meta-networking/recipes-support/tgt/tgt_git.bb
>>>      <http://tgt_git.bb> b/meta-networking/recipes-support/tgt/tgt_git.=
bb
>>>      <http://tgt_git.bb>
>>>      > new file mode 100644
>>>      > index 0000000..9ca181a
>>>      > --- /dev/null
>>>      > +++ b/meta-networking/recipes-support/tgt/tgt_git.bb
>>>      <http://tgt_git.bb>
>>>      > @@ -0,0 +1,73 @@
>>>      > +DESCRIPTION =3D "Linux SCSI target framework (tgt)"
>>>      > +HOMEPAGE =3D "http://stgt.sourceforge.net"
>>>      > +LICENSE =3D "GPLv2"
>>>      > +LIC_FILES_CHKSUM =3D
>>>
>>> "file://scripts/tgtd.spec;beginline=3D7;endline=3D7;md5=3D21c19ea7dad04=
648b9c2f791b6e29b4c"
>>>      > +DEPENDS =3D "sg3-utils"
>>>      > +
>>>      > +SRCREV =3D "cb7971cfeecaa43c15eed4719dc82516d7e87b6c"
>>>      > +PV =3D "1.0.67+git${SRCPV}"
>>>      > +
>>>      > +SRC_URI =3D "git://github.com/fujita/tgt.git
>>>      <http://github.com/fujita/tgt.git> \
>>>      > +
>>>
>>> file://0001-Correct-the-path-of-header-files-check-in-Yocto-buil.patch
>>>      \
>>>      > +        file://0001-usr-Makefile-WARNING-fix.patch \
>>>      > +
>>> file://usr-Makefile-apply-LDFLAGS-to-all-executables.patch \
>>>      > +"
>>>      > +SRC_URI +=3D "file://tgtd.init"
>>>      > +
>>>      > +S =3D "${WORKDIR}/git"
>>>      > +
>>>      > +CONFFILES_${PN} +=3D "${sysconfdir}/tgt/targets.conf"
>>>      > +
>>>      > +inherit update-rc.d
>>>      > +
>>>      > +CFLAGS +=3D ' -I. -DUSE_SIGNALFD -DUSE_TIMERFD -D_GNU_SOURCE
>>>      -DTGT_VERSION=3D\\"1.0.63\\" -DBSDIR=3D\\"${libdir}/backing-store\=
\"'
>>>      > +
>>>      > +#do_compile() {
>>>      > +#    oe_runmake SYSROOT=3D"${STAGING_DIR_TARGET}" -e programs c=
onf
>>>      scripts
>>>      > +#}
>>>      > +EXTRA_OEMAKE =3D "-e programs conf scripts"
>>>      > +
>>>      > +do_install() {
>>>      > +    oe_runmake -e DESTDIR=3D"${D}" install-programs install-con=
f
>>>      install-scripts
>>>      > +
>>>      > +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit',
>>>      'true', 'false', d)}; then
>>>      > +        install -d ${D}${sysconfdir}/init.d
>>>      > +        install -m 0755 ${WORKDIR}/tgtd.init
>>>      ${D}${sysconfdir}/init.d/tgtd
>>>      > +    fi
>>>      > +}
>>>      > +
>>>      > +RDEPENDS_${PN} =3D " \
>>>      > +    bash \
>>>      > +    libaio \
>>>      > +    libconfig-general-perl \
>>>      > +    perl-module-english \
>>>      > +    perl-module-tie-hash-namedcapture \
>>>      > +    perl-module-xsloader \
>>>      > +    perl-module-carp \
>>>      > +    perl-module-exporter \
>>>      > +    perl-module-errno \
>>>      > +    perl-module-exporter-heavy \
>>>      > +    perl-module-symbol \
>>>      > +    perl-module-selectsaver \
>>>      > +    perl-module-dynaloader \
>>>      > +    perl-module-carp-heavy \
>>>      > +    perl-module-filehandle \
>>>      > +    perl-module-feature \
>>>      > +    perl-module-overload \
>>>      > +    perl-module-fcntl \
>>>      > +    perl-module-io \
>>>      > +    perl-module-io-file \
>>>      > +    perl-module-io-handle \
>>>      > +    perl-module-io-seekable \
>>>      > +    perl-module-file-glob \
>>>      > +    perl-module-base \
>>>      > +    perl-module-encoding-warnings \
>>>      > +    perl-module-file-spec-unix \
>>>      > +    perl-module-file-spec \
>>>      > +    perl-module-file-spec-functions \
>>>      > +    perl-module-getopt-long \
>>>      > +    perl-module-constant \
>>>      > +    "
>>>      > +INITSCRIPT_PACKAGES =3D "${PN}"
>>>      > +INITSCRIPT_NAME_${PN} =3D "tgtd"
>>>      > +
>>>      > --
>>>      > 2.7.4
>>>      >
>>>      > --
>>>      > _______________________________________________
>>>      > Openembedded-devel mailing list
>>>      > Openembedded-devel@lists.openembedded.org
>>>      <mailto:Openembedded-devel@lists.openembedded.org>
>>>      > http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l
>>>      <http://lists.openembedded.org/mailman/listinfo/openembedded-devel=
>
>>>
>>>
>>
>>
>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

