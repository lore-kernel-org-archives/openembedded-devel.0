Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1299.1794587390290494805
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 08:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d1rVXEUr;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b30477a320so9474417b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 08:29:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587389; cv=none;
        d=google.com; s=arc-20260327;
        b=Kn2oJLqa+f/ElOIzO39IqrFbmz6lw3fRW3HniUn76qoTvvZRa+9GhAWctUUuwolDZ8
         bqGJF7BzAEUH3q6HxbX+2CQW5V+O3ZSqyD4w+Qc3qK2wWkX3lI4M/r3+fC8A6reCpVYt
         Hl0g0a3gC4tQCwhTsiwIN4eYEmvPloIKPxUMKZemv7QhjM9XtP1yqRmCCJFRNe3ls0w6
         +7YSS7xxvZXdM0WBdbKALzhHYZ62LyGMbULXBVfRS+MeKNbZKIglFJG/GA/J1nZdz+5h
         MkLop6aQiaZpJCtjjEYZ1uVfjrGupw74p+Qg0xYKrRfx2QMqSBKYRpSyWzvXnHpIMaFO
         V4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FfwQgckfpE1JuxryO26U4a26EevB1dfhiBBd+bNowfg=;
        fh=DJVb3WjbXurWrZe2AIluO4Zh7m8+u85xhV4ANlI/nHg=;
        b=E4jRvClUwqTH4AalKN8pZ6lcn9ZNK1h3xasCRn2d9alftwEX1KWrzLrMA6Patr+K20
         oVc3mz3Ll7Lrs56huIHLpaggknPFwx8s4yHT+n9OQMQf2jEA/ZsoL1ESDDIIj1337DHh
         iGrw0tdAsSKmht7loGQeIZJO/tFx/AF5ZdVHC0wpgJHgjKjxQ8fbvi5NuXZAxn+sG8Vz
         +sb3lsU+AU2oJ8kwCS0IA/YNxn6NK/YpsNxouc8mPlg0OdheEN/ImYYMBUdmZ9HlH+3M
         Q6yjpa6zikFltAck3/cxLniwYBTGbJ75Zz2dSlMU42xj9PZX091BZJrgakPoz5GU2Abz
         O5pw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794587389; x=1795192189; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfwQgckfpE1JuxryO26U4a26EevB1dfhiBBd+bNowfg=;
        b=d1rVXEUrT5CrE9csmVS1YLC6c4UC2tx4anOLrLTtzoz+UivwOi283SBAQIQQHNEH9b
         qN/Ampr+X1052Ux0L8hJPBxkhOwoYo4lk0wGmgg9I9/XGMTjSImJ4yHvYOzfg9OZfSc6
         WFBzhD4K+o9VKVU8ZeT1Kqlz6iVmaepXlMUrJFNFchpEKaxsO1+OBlxNrZGpKxR9JenF
         YFIrXQP+b13jgBrRqHrc5jhGLYFOh7Q5y/d7Drvnk3fh1vlIO/uwm4V+I47SuNj39uz0
         9MczWmVWXnCQeZp2zp7Q3NVgGIRcVa3jpmkTJzbNRu1ZQDSwGzm1DMjO8m/bwvqTEgCY
         pEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587389; x=1795192189;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FfwQgckfpE1JuxryO26U4a26EevB1dfhiBBd+bNowfg=;
        b=WFtu5qmF4SK8nS0tUJ2qjkx2LYNKhr0bSjKl7JzZadLQKnPwPFqypYRu2Tkd9d9uqL
         OtgzpgYO3bTChANZIZXgshTS4dC5bb8J7JPRDJ46TFOclIPWffJ34RHRZ9kdbMKU44RV
         oPJvLGmo2QYnTVb+cjS8tTAY4FZAVEyZjIQ8yDvA6mVCgMifBl2HYAvJnlPbnHUPmp8r
         /g/LJdiYfbN/d50OOEWpkw4KHMLujNttHRHU4qNIU0KJxx7CNYhzfUffiJblY2I4uI4i
         CO/DaVMXKFf+nLcP/sz930PhVat1qxL/WKEuDnC7FIYHyMiPcw2EDIe869/8QcMvlOI+
         Hb1w==
X-Gm-Message-State: APuU4Z94/U3S6whIARKvRNvVHHMN4RK/GnzHlufEZ3TVceItm+TOkkXd
	+zWzblGaUOwlGVEQ8y54qjrQzBIEIUWmbTTYrAdHJe36wvajCS/ySNnkNRMJ90iGC0SypJ2N7qC
	lMR8SV8J2brLRf3EYlnMdmeEXyKQ8a6Y=
X-Gm-Gg: AYBFou1T3E3q48Tjp501/uOjcmG231O7a8+OzDOb6qY3ywOalnKj0JAQtOe07/OfvTX
	QBVMTFgoGbiSKQDxq0omePUGFp1QlRos21JbSVeVtsVtpETBWEMOc8b5aBaYmG/zh/+1vd96vUe
	sf6DSp4qi+M/8ZWDqINBCrUB4Bqdg50UZCanL2QcGYCRQYmFKZEfnWxunXpm31roHK2VRot8qf7
	SzR5+emFGKmCtCuwT8xKlJRR4VJ4I2esbPR4TPq1iu4KjeXQW9WGvw4XcK6hVemKNfxxJoilqW7
	IVUOMbStQsU2+KvwfpG7+Ueo3InbvkMNBUKiMy28YpYPN+e/AfIQ+umf8QDbx2ZVSJIKHF4Fm3/
	6fVV5JVY4qph1We6m8WujtxHL9fYEFB+hGI7eiwnPGwTJ6grXKwaRFWbJ4TTU7l/avfeRVR97iO
	cA9swwK0Oj51DgskkAA17uNDldg3SyCNd0xthIL0F9rCYRVC3+9/BkrSyP0xDYqEn1vrLG3wiU1
	iG4GhOe/hGCjDSlQjT/nJqCjKAocWy5DNmGsl1FTDsTYBaORny0eoZ8jbm3b8pf1sVIJnZBe1JH
	FiI3SmpsPWMli+jUo/x06oA2UBjtjIICrgstDUSp5tRkMXuJKFXbOHaMzea1co6CJ+Xrh9z5HV9
	aaZ63hi7BuaieH1wt46NKRA==
X-Received: by 2002:a05:690e:1502:b0:67c:41a:bf5b with SMTP id
 956f58d0204a3-67d893e4226mr1457845d50.9.1794587388999; Fri, 13 Nov 2026
 08:29:48 -0800 (PST)
MIME-Version: 1.0
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
 <CAMKF1sqnzQEBmAnpMZoEkuHzQwVQj0zF0wYTi2nAB1EWYTckYQ@mail.gmail.com> <CAO5Uq5QU9QWyWt0=YN7g7BXZLhaD=eF4wpEOMr7VpvpvOoDxwg@mail.gmail.com>
In-Reply-To: <CAO5Uq5QU9QWyWt0=YN7g7BXZLhaD=eF4wpEOMr7VpvpvOoDxwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Nov 2026 08:29:21 -0800
X-Gm-Features: AclHuK9NAC1291SBp58dTZNoIiS2IpN76JYP7i4Cb94os1eaSjyjzHYSXymO-W4
Message-ID: <CAMKF1srWhrv9=n8Teawbf2_BK+dCdw+DTDw7hWuJj4VPQD2n4Q@mail.gmail.com>
Subject: Re: [oe] [PATCH meta-oe 00/10] android-tools: adbd fixes and opt-in
 access control for Linux systems
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d6fdfa06602aef90"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 16:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132248

--000000000000d6fdfa06602aef90
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:08=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:

> That's fair...
>
> I guess the right thing at this point is to drop the series as I've
> not engaged (and really don't have the time at this point) with the
> Debian maintainers to try and land it there and I suspect some
> wouldn't fit with their goals (thinking things like using build.prop
> to gate authentication) and almost certainly none of it would be able
> to land upstream in Google as it's irrelevant to Android. Also they've
> got significant divergence in later releases (things like libadbusb
> look like might solve a load of problems).
>

Upgrading might be a better option here, adding patches diverges us more


>
> That what we have right now has no authentication just scares me, but
> it is what it is.
>
> Alex
>
> On Wed, Nov 11, 2026 at 1:28=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > This is significant amount of patches to carry with Pending status,
> could you update on your upstreaming effort around this into android-tool=
s
> itself ?
> >
> > On Tue, Nov 10, 2026 at 9:35=E2=80=AFAM Alex Kiernan via openembedded-d=
evel
> <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> adbd built from this recipe runs on Linux devices rather than Android,
> and
> >> several things that Android's init or property service would normally
> >> provide are missing. This series fixes the bugs that follow from that,
> and
> >> adds opt-in controls for who may use adbd.
> >>
> >> The first five patches are fixes and change behaviour without any
> opt-in:
> >>
> >>  - `adb reboot recovery` / `bootloader` pass their target to RESTART2
> >>    instead of a fixed "adb", so kernels whose reboot-mode driver picks
> the
> >>    boot mode from the reason string reboot into the requested mode.
> >>  - `adb shell` starts in the user's home directory and no longer gets
> >>    Android's TMPDIR=3D/data/local/tmp.
> >>  - On glibc, UsbFfsConnection::StopWorker() no longer spins for ever
> >>    after a cable pull: it relied on bionic's pthread_kill() behaviour,
> and
> >>    the host saw the device as offline until adbd was restarted.
> >>  - adbd exits after `adb root` / `adb unroot` so the service manager
> >>    restarts it with the new privilege state; the unit becomes
> >>    Restart=3Dalways.
> >>  - Readiness is signalled once functionfs is being serviced, not
> >>    immediately after the USB thread starts. sd_notify(READY=3D1) raced
> >>    open_functionfs(), and 10-adbd-configfs.conf binds the UDC on READY=
=3D1
> >>    with no delay, so the bind could be dropped and the host never
> reached
> >>    CONFIGURED. Builds without systemd can get the same signal through =
a
> >>    FIFO named in $ADBD_READY_FIFO.
> >>
> >> The next four are opt-in, and change nothing unless enabled:
> >>
> >>  - PACKAGECONFIG[debuggable-prop]: liblog reads ro.debuggable from the
> >>    build.prop-style files in ADB_DEBUGGABLE_PROP_FILES rather than
> >>    reporting every build as debuggable, so `adb root` can be refused o=
n
> a
> >>    production image.
> >>  - PACKAGECONFIG[auth-unless-debuggable]: hosts must authenticate unle=
ss
> >>    the build is debuggable, decided per connection. Today the Debian
> patch
> >>    lets every host in without a key.
> >>  - ADBD_AUTH_KEY_PATHS: where adbd reads trusted host keys, in place o=
f
> >>    Android's /adb_keys and /data/misc/adb/adb_keys.
> >>  - adbd keeps root across a restart only while the build is debuggable=
,
> >>    so a root state written while it was does not outlive it. Without
> >>    debuggable-prop every Linux build is debuggable, so this is a no-op=
.
> >>
> >> The last patch drops `killall adbd` from android-gadget-cleanup, which
> >> runs after adbd has already exited.
> >>
> >> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >> ---
> >> Alex Kiernan (10):
> >>       android-tools: adbd: forward the reboot target to RESTART2
> >>       android-tools: adbd: start adb shell in $HOME, without Android's
> TMPDIR
> >>       android-tools: adbd: fix the USB worker hanging on glibc after a
> cable pull
> >>       android-tools: adbd: restart after adb root/unroot
> >>       android-tools: adbd: signal readiness once functionfs is service=
d
> >>       android-tools: add PACKAGECONFIG debuggable-prop
> >>       android-tools: add PACKAGECONFIG auth-unless-debuggable
> >>       android-tools: add ADBD_AUTH_KEY_PATHS
> >>       android-tools: adbd: keep root only while the build is debuggabl=
e
> >>       android-tools-conf: android-gadget-cleanup: don't killall adbd
> >>
> >>  .../android-tools-conf/android-gadget-cleanup      |   4 +-
> >>  ...dbd-forward-the-reboot-target-to-RESTART2.patch |  42 +++++++
> >>  ...start-in-HOME-and-drop-the-Android-only-T.patch |  45 +++++++
> >>  ...-use-pthread_kill-as-a-thread-liveness-pr.patch | 118
> ++++++++++++++++++
> >>  ...exit-after-adb-root-unroot-so-an-init-sup.patch |  60 +++++++++
> >>  ...nal-readiness-once-functionfs-is-serviced.patch | 117
> +++++++++++++++++
> >>  ...onally-read-ro.debuggable-from-build.prop.patch | 117
> +++++++++++++++++
> >>  ...ally-require-authorization-unless-the-bui.patch | 138
> +++++++++++++++++++++
> >>  ...h-optionally-take-the-trusted-key-paths-a.patch |  72 +++++++++++
> >>  ...oot-on-Linux-only-while-the-build-is-debu.patch |  51 ++++++++
> >>  .../android-tools/android-tools-adbd.service       |   2 +-
> >>  .../android-tools/android-tools_35.0.2.bb          |  28 ++++-
> >>  12 files changed, 788 insertions(+), 6 deletions(-)
> >> ---
> >> base-commit: 33db795031ddef81949db64aedf33070e1330fdd
> >> change-id: 20261106-android-tools-adbd-1c8f4decb0de
> >>
> >> Best regards,
> >> --
> >> Alex Kiernan <alex.kiernan@gmail.com>
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#132097):
> https://lists.openembedded.org/g/openembedded-devel/message/132097
> >> Mute This Topic: https://lists.openembedded.org/mt/122197686/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>
> --
> Alex Kiernan
>

--000000000000d6fdfa06602aef90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 13,=
 2026 at 2:08=E2=80=AFAM Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gm=
ail.com">alex.kiernan@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">That&#39;s fair...<br>
<br>
I guess the right thing at this point is to drop the series as I&#39;ve<br>
not engaged (and really don&#39;t have the time at this point) with the<br>
Debian maintainers to try and land it there and I suspect some<br>
wouldn&#39;t fit with their goals (thinking things like using build.prop<br=
>
to gate authentication) and almost certainly none of it would be able<br>
to land upstream in Google as it&#39;s irrelevant to Android. Also they&#39=
;ve<br>
got significant divergence in later releases (things like libadbusb<br>
look like might solve a load of problems).<br></blockquote><div><br></div><=
div>Upgrading might be a better option here, adding patches diverges us mor=
e</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
That what we have right now has no authentication just scares me, but<br>
it is what it is.<br>
<br>
Alex<br>
<br>
On Wed, Nov 11, 2026 at 1:28=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is significant amount of patches to carry with Pending status, co=
uld you update on your upstreaming effort around this into android-tools it=
self ?<br>
&gt;<br>
&gt; On Tue, Nov 10, 2026 at 9:35=E2=80=AFAM Alex Kiernan via openembedded-=
devel &lt;alex.kiernan=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; adbd built from this recipe runs on Linux devices rather than Andr=
oid, and<br>
&gt;&gt; several things that Android&#39;s init or property service would n=
ormally<br>
&gt;&gt; provide are missing. This series fixes the bugs that follow from t=
hat, and<br>
&gt;&gt; adds opt-in controls for who may use adbd.<br>
&gt;&gt;<br>
&gt;&gt; The first five patches are fixes and change behaviour without any =
opt-in:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - `adb reboot recovery` / `bootloader` pass their target to =
RESTART2<br>
&gt;&gt;=C2=A0 =C2=A0 instead of a fixed &quot;adb&quot;, so kernels whose =
reboot-mode driver picks the<br>
&gt;&gt;=C2=A0 =C2=A0 boot mode from the reason string reboot into the requ=
ested mode.<br>
&gt;&gt;=C2=A0 - `adb shell` starts in the user&#39;s home directory and no=
 longer gets<br>
&gt;&gt;=C2=A0 =C2=A0 Android&#39;s TMPDIR=3D/data/local/tmp.<br>
&gt;&gt;=C2=A0 - On glibc, UsbFfsConnection::StopWorker() no longer spins f=
or ever<br>
&gt;&gt;=C2=A0 =C2=A0 after a cable pull: it relied on bionic&#39;s pthread=
_kill() behaviour, and<br>
&gt;&gt;=C2=A0 =C2=A0 the host saw the device as offline until adbd was res=
tarted.<br>
&gt;&gt;=C2=A0 - adbd exits after `adb root` / `adb unroot` so the service =
manager<br>
&gt;&gt;=C2=A0 =C2=A0 restarts it with the new privilege state; the unit be=
comes<br>
&gt;&gt;=C2=A0 =C2=A0 Restart=3Dalways.<br>
&gt;&gt;=C2=A0 - Readiness is signalled once functionfs is being serviced, =
not<br>
&gt;&gt;=C2=A0 =C2=A0 immediately after the USB thread starts. sd_notify(RE=
ADY=3D1) raced<br>
&gt;&gt;=C2=A0 =C2=A0 open_functionfs(), and 10-adbd-configfs.conf binds th=
e UDC on READY=3D1<br>
&gt;&gt;=C2=A0 =C2=A0 with no delay, so the bind could be dropped and the h=
ost never reached<br>
&gt;&gt;=C2=A0 =C2=A0 CONFIGURED. Builds without systemd can get the same s=
ignal through a<br>
&gt;&gt;=C2=A0 =C2=A0 FIFO named in $ADBD_READY_FIFO.<br>
&gt;&gt;<br>
&gt;&gt; The next four are opt-in, and change nothing unless enabled:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 - PACKAGECONFIG[debuggable-prop]: liblog reads ro.debuggable=
 from the<br>
&gt;&gt;=C2=A0 =C2=A0 build.prop-style files in ADB_DEBUGGABLE_PROP_FILES r=
ather than<br>
&gt;&gt;=C2=A0 =C2=A0 reporting every build as debuggable, so `adb root` ca=
n be refused on a<br>
&gt;&gt;=C2=A0 =C2=A0 production image.<br>
&gt;&gt;=C2=A0 - PACKAGECONFIG[auth-unless-debuggable]: hosts must authenti=
cate unless<br>
&gt;&gt;=C2=A0 =C2=A0 the build is debuggable, decided per connection. Toda=
y the Debian patch<br>
&gt;&gt;=C2=A0 =C2=A0 lets every host in without a key.<br>
&gt;&gt;=C2=A0 - ADBD_AUTH_KEY_PATHS: where adbd reads trusted host keys, i=
n place of<br>
&gt;&gt;=C2=A0 =C2=A0 Android&#39;s /adb_keys and /data/misc/adb/adb_keys.<=
br>
&gt;&gt;=C2=A0 - adbd keeps root across a restart only while the build is d=
ebuggable,<br>
&gt;&gt;=C2=A0 =C2=A0 so a root state written while it was does not outlive=
 it. Without<br>
&gt;&gt;=C2=A0 =C2=A0 debuggable-prop every Linux build is debuggable, so t=
his is a no-op.<br>
&gt;&gt;<br>
&gt;&gt; The last patch drops `killall adbd` from android-gadget-cleanup, w=
hich<br>
&gt;&gt; runs after adbd has already exited.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gma=
il.com" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Alex Kiernan (10):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools: adbd: forward the reboot =
target to RESTART2<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools: adbd: start adb shell in =
$HOME, without Android&#39;s TMPDIR<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools: adbd: fix the USB worker =
hanging on glibc after a cable pull<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools: adbd: restart after adb r=
oot/unroot<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools: adbd: signal readiness on=
ce functionfs is serviced<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools: add PACKAGECONFIG debugga=
ble-prop<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools: add PACKAGECONFIG auth-un=
less-debuggable<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools: add ADBD_AUTH_KEY_PATHS<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools: adbd: keep root only whil=
e the build is debuggable<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0android-tools-conf: android-gadget-clean=
up: don&#39;t killall adbd<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 .../android-tools-conf/android-gadget-cleanup=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt;=C2=A0 ...dbd-forward-the-reboot-target-to-RESTART2.patch |=C2=A0 4=
2 +++++++<br>
&gt;&gt;=C2=A0 ...start-in-HOME-and-drop-the-Android-only-T.patch |=C2=A0 4=
5 +++++++<br>
&gt;&gt;=C2=A0 ...-use-pthread_kill-as-a-thread-liveness-pr.patch | 118 +++=
+++++++++++++++<br>
&gt;&gt;=C2=A0 ...exit-after-adb-root-unroot-so-an-init-sup.patch |=C2=A0 6=
0 +++++++++<br>
&gt;&gt;=C2=A0 ...nal-readiness-once-functionfs-is-serviced.patch | 117 +++=
++++++++++++++<br>
&gt;&gt;=C2=A0 ...onally-read-ro.debuggable-from-build.prop.patch | 117 +++=
++++++++++++++<br>
&gt;&gt;=C2=A0 ...ally-require-authorization-unless-the-bui.patch | 138 +++=
++++++++++++++++++<br>
&gt;&gt;=C2=A0 ...h-optionally-take-the-trusted-key-paths-a.patch |=C2=A0 7=
2 +++++++++++<br>
&gt;&gt;=C2=A0 ...oot-on-Linux-only-while-the-build-is-debu.patch |=C2=A0 5=
1 ++++++++<br>
&gt;&gt;=C2=A0 .../android-tools/android-tools-adbd.service=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;&gt;=C2=A0 .../android-tools/<a href=3D"http://android-tools_35.0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">android-tools_35.0.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 ++++-<br>
&gt;&gt;=C2=A0 12 files changed, 788 insertions(+), 6 deletions(-)<br>
&gt;&gt; ---<br>
&gt;&gt; base-commit: 33db795031ddef81949db64aedf33070e1330fdd<br>
&gt;&gt; change-id: 20261106-android-tools-adbd-1c8f4decb0de<br>
&gt;&gt;<br>
&gt;&gt; Best regards,<br>
&gt;&gt; --<br>
&gt;&gt; Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" target=
=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#132097): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/132097" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/132097</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1221=
97686/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/122197686/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
<br>
<br>
--<br>
Alex Kiernan<br>
</blockquote></div></div>

--000000000000d6fdfa06602aef90--
