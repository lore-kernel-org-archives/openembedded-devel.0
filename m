Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7875.1794564533254210145
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 02:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pFHMsUzR;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6767d92cde6so671670d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 02:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794564532; cv=none;
        d=google.com; s=arc-20260327;
        b=mvHNNZd7KmzIdH70nRjcccqlRMe1jWlJwhR2Uao6fGGEwIQ0ghJGgNeaS1sh0HSure
         COzSAzzkxe7SQxEXJTLu7g9UfzIkSHXcsXmuyJ3Kk3W9Tr++Ysv0sj6LDTMjytTueKwj
         ZtAmci2PMMCx7aPttRKbrHUFc+F8jsAcEqLxTrFdDW9lmIRhUBnQcogwR3ir861Hq1Al
         y4QI5M6pU7tDoqYl5uA0uJGG7TCLhNCopb51+9gkSVzfpLE6LhwbdzTVEfvSOOXOg9Mw
         hs4t9UP8RwgI5FeLdivC72+/prhKWdAifDbHlTV7iGlUx1wEyAKvEy1/leXdmXyKwwpY
         AzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDx6REIDG526xihxguwHE1iR+Csl+RLxew726uCajw0=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=NzPUgwzlWRU14BUa/uZ0Xz6Az/0HZhwuCPsje9I+yJ+sfGzS5fjZwRMuEe63TB+erK
         ItjtE9ngtM5hzfxFexooZAlyJswvP9Dz7kvObl4WsPPXBdw/3jfNsCOQ+lG5ywtjdjXN
         wFLS9lZs4pyKYLofrNv3FuXV5XMtjVEuRTXHg+d6e3KHj7eM8d+cTuGSSsEIotYRhSGt
         aHXtOXwJj+bz8Z45WxMqNV2h2oVrE/6Nqw2v6U7E6O1Z9viJJNPAA8t6qLgybCEzh0LQ
         2rGbMVLoCW0bN64s0/kXZwZPEVjJka/9wb14DdCcSdCp4VzViNaQeRKdypdFDej6hssU
         n9xQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794564532; x=1795169332; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDx6REIDG526xihxguwHE1iR+Csl+RLxew726uCajw0=;
        b=pFHMsUzRXdfccWrnbpzw93V1TWA3JU7QSrQrSHugFFz/T0iGpNluLHjk3ikmxpwBR+
         VI7gXWgEOk5wjTKWddQavdL6wKhCbRxyyRsaGgrcb2U42p8L2MV4DV7pjlTw1hThu6jb
         larIJYwbIjgTqY27jEbyGeTkSO95BcgWPx8pgqKQw+4gelIy/9JqOTFhGvWiowg1XV0L
         BRTjttspm6ekc9Rjs1dACfFbpqnEFLuTUMBSkesN3oUJ1fMYIj49L80i4oEiNg3ARjGc
         A+ZUZfUoGY5OBMFFluXGbEMNbztVLUuxQ16moCWFrShCOh1uWTpxglxSrZIHZSt6FbXC
         gJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564532; x=1795169332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDx6REIDG526xihxguwHE1iR+Csl+RLxew726uCajw0=;
        b=oJWNI6aMhGLG8jSs+uIDdZv3hhfuqUvd3bddD0vxE9HIZvKO8NXJGDJ8zuCN+L6xwl
         wk7uuk3OXaboWQqJRobClS2NH0dh0xbdJm25c3Z95PmUl3+HNbrjVoy02BQ/0F+fOERO
         oeb3aw3Fm+GNWnYYbNufjoUODv3C9+ILbcB1x31uHkz7SZaX29X0ORBXkljanKltyKWd
         4CH4t9PgH+N5Hb2VR5C/7lQ9+hSZ+PXNcwdf8BF41roa8suLmXGKREDR/mkxUU4hxr9Q
         qhNx65myOBHAqtx6JT/7evgFZZaqCMqjcse/mA/4W2IOEI00C9uk7YyLuB/6wQtBJAHF
         IRPQ==
X-Gm-Message-State: APuU4Z9jUYEqOQdzwEAYnBM3w1kL/jhOSirYvh4fvv3uuHcvE19wTlfY
	OEHQUlZ1dHE1TZfCjQ3sWXqXZ8NJCsxHmdFrxu2DgHyM7FAuqYtZUc2XGeLJlCC4j5w8ySvDEKN
	T+vqUV4tziyAQSGl/Y6lVKzdFoXIwSqnmf+l/
X-Gm-Gg: AYBFou0rfEY5dRBesqO7V/yUOsDJcdgWmGTpeanmAdhyPxGlI25dEiSArPv+q1XmXuX
	FAkZf/xbfSChcuYBloMf8noblP89Q3IOKHaGW21+bJ4DsLAwRWwqi8ykLZ/91VNlpQcELiBcOfs
	EgYqaXj4iWFryFQbMsuwlcxzlVoJHUvyh2B0AwHM1UMH0TQedcB+4MLhS5IGwrIJeZrZXM/lA18
	O+FdEz5eFGsqoFsXo8XYrI7RM1RQ/yHhVXmdLK5GM3lQwgDgIz+dxeCU0iIBlSfrDdyXDAyI2ys
	ZI0Y+5SVayeyGrlcVlnsN7XVJRIQnTK7AAz6ORMN4KEq79B6iT2FXSsqmv7SvYwkD4J6Yud0Z65
	D0WTU5osRoUzImaUzNc2xv3fZ63E+eug6oY8oi7uIIrlcxZ0Blksjx2ViYbSHLaCFCvWEmv9OEN
	eMdncN8Qrzvrs=
X-Received: by 2002:a53:bb46:0:b0:67c:cab:bd6a with SMTP id
 956f58d0204a3-67d8979c38fmr916046d50.99.1794564531983; Fri, 13 Nov 2026
 02:08:51 -0800 (PST)
MIME-Version: 1.0
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com> <CAMKF1sqnzQEBmAnpMZoEkuHzQwVQj0zF0wYTi2nAB1EWYTckYQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqnzQEBmAnpMZoEkuHzQwVQj0zF0wYTi2nAB1EWYTckYQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 13 Nov 2026 10:08:39 +0000
X-Gm-Features: AclHuK-_n0RkPUT7d8moy3-HYdSbsnaPVOkiFRGUsqUavFXJgeyX1QLI4mztTUY
Message-ID: <CAO5Uq5QU9QWyWt0=YN7g7BXZLhaD=eF4wpEOMr7VpvpvOoDxwg@mail.gmail.com>
Subject: Re: [oe] [PATCH meta-oe 00/10] android-tools: adbd fixes and opt-in
 access control for Linux systems
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132247

That's fair...

I guess the right thing at this point is to drop the series as I've
not engaged (and really don't have the time at this point) with the
Debian maintainers to try and land it there and I suspect some
wouldn't fit with their goals (thinking things like using build.prop
to gate authentication) and almost certainly none of it would be able
to land upstream in Google as it's irrelevant to Android. Also they've
got significant divergence in later releases (things like libadbusb
look like might solve a load of problems).

That what we have right now has no authentication just scares me, but
it is what it is.

Alex

On Wed, Nov 11, 2026 at 1:28=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> This is significant amount of patches to carry with Pending status, could=
 you update on your upstreaming effort around this into android-tools itsel=
f ?
>
> On Tue, Nov 10, 2026 at 9:35=E2=80=AFAM Alex Kiernan via openembedded-dev=
el <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> adbd built from this recipe runs on Linux devices rather than Android, a=
nd
>> several things that Android's init or property service would normally
>> provide are missing. This series fixes the bugs that follow from that, a=
nd
>> adds opt-in controls for who may use adbd.
>>
>> The first five patches are fixes and change behaviour without any opt-in=
:
>>
>>  - `adb reboot recovery` / `bootloader` pass their target to RESTART2
>>    instead of a fixed "adb", so kernels whose reboot-mode driver picks t=
he
>>    boot mode from the reason string reboot into the requested mode.
>>  - `adb shell` starts in the user's home directory and no longer gets
>>    Android's TMPDIR=3D/data/local/tmp.
>>  - On glibc, UsbFfsConnection::StopWorker() no longer spins for ever
>>    after a cable pull: it relied on bionic's pthread_kill() behaviour, a=
nd
>>    the host saw the device as offline until adbd was restarted.
>>  - adbd exits after `adb root` / `adb unroot` so the service manager
>>    restarts it with the new privilege state; the unit becomes
>>    Restart=3Dalways.
>>  - Readiness is signalled once functionfs is being serviced, not
>>    immediately after the USB thread starts. sd_notify(READY=3D1) raced
>>    open_functionfs(), and 10-adbd-configfs.conf binds the UDC on READY=
=3D1
>>    with no delay, so the bind could be dropped and the host never reache=
d
>>    CONFIGURED. Builds without systemd can get the same signal through a
>>    FIFO named in $ADBD_READY_FIFO.
>>
>> The next four are opt-in, and change nothing unless enabled:
>>
>>  - PACKAGECONFIG[debuggable-prop]: liblog reads ro.debuggable from the
>>    build.prop-style files in ADB_DEBUGGABLE_PROP_FILES rather than
>>    reporting every build as debuggable, so `adb root` can be refused on =
a
>>    production image.
>>  - PACKAGECONFIG[auth-unless-debuggable]: hosts must authenticate unless
>>    the build is debuggable, decided per connection. Today the Debian pat=
ch
>>    lets every host in without a key.
>>  - ADBD_AUTH_KEY_PATHS: where adbd reads trusted host keys, in place of
>>    Android's /adb_keys and /data/misc/adb/adb_keys.
>>  - adbd keeps root across a restart only while the build is debuggable,
>>    so a root state written while it was does not outlive it. Without
>>    debuggable-prop every Linux build is debuggable, so this is a no-op.
>>
>> The last patch drops `killall adbd` from android-gadget-cleanup, which
>> runs after adbd has already exited.
>>
>> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> ---
>> Alex Kiernan (10):
>>       android-tools: adbd: forward the reboot target to RESTART2
>>       android-tools: adbd: start adb shell in $HOME, without Android's T=
MPDIR
>>       android-tools: adbd: fix the USB worker hanging on glibc after a c=
able pull
>>       android-tools: adbd: restart after adb root/unroot
>>       android-tools: adbd: signal readiness once functionfs is serviced
>>       android-tools: add PACKAGECONFIG debuggable-prop
>>       android-tools: add PACKAGECONFIG auth-unless-debuggable
>>       android-tools: add ADBD_AUTH_KEY_PATHS
>>       android-tools: adbd: keep root only while the build is debuggable
>>       android-tools-conf: android-gadget-cleanup: don't killall adbd
>>
>>  .../android-tools-conf/android-gadget-cleanup      |   4 +-
>>  ...dbd-forward-the-reboot-target-to-RESTART2.patch |  42 +++++++
>>  ...start-in-HOME-and-drop-the-Android-only-T.patch |  45 +++++++
>>  ...-use-pthread_kill-as-a-thread-liveness-pr.patch | 118 ++++++++++++++=
++++
>>  ...exit-after-adb-root-unroot-so-an-init-sup.patch |  60 +++++++++
>>  ...nal-readiness-once-functionfs-is-serviced.patch | 117 ++++++++++++++=
+++
>>  ...onally-read-ro.debuggable-from-build.prop.patch | 117 ++++++++++++++=
+++
>>  ...ally-require-authorization-unless-the-bui.patch | 138 ++++++++++++++=
+++++++
>>  ...h-optionally-take-the-trusted-key-paths-a.patch |  72 +++++++++++
>>  ...oot-on-Linux-only-while-the-build-is-debu.patch |  51 ++++++++
>>  .../android-tools/android-tools-adbd.service       |   2 +-
>>  .../android-tools/android-tools_35.0.2.bb          |  28 ++++-
>>  12 files changed, 788 insertions(+), 6 deletions(-)
>> ---
>> base-commit: 33db795031ddef81949db64aedf33070e1330fdd
>> change-id: 20261106-android-tools-adbd-1c8f4decb0de
>>
>> Best regards,
>> --
>> Alex Kiernan <alex.kiernan@gmail.com>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#132097): https://lists.openembedded.org/g/openembedd=
ed-devel/message/132097
>> Mute This Topic: https://lists.openembedded.org/mt/122197686/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--
Alex Kiernan
