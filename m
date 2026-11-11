Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.139.1794360500455005232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 17:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=edsOmL5F;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67990a45e02so2681516d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:28:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794360499; cv=none;
        d=google.com; s=arc-20260327;
        b=kEy8q+vGg/1hG2D/LKhNvLWa+8e8/NGOKl+TVfnbT+RIFcCyu/j3+TTopy2He/oA7T
         5qoo6XF+tq7QapB14ayXSgFol57skxnb0F2MJiktCfI4S1WUFQCOeV9QWv7g363h8V4n
         um76TBqNaDeoH62xojFxkG81mEIM3tLY+0gGOXkSy/iN+cKKxte/A5/ZTex32YHl932Z
         SXufKcA3B3z1ekUlhBGQg8pqI1QztBVWLv0ZX5TMaStioQ5MrNctyv7G/Eh0xmMgMmB+
         JSDt7EUqz/DrEnTnHHzN+6GyiV+0vtPaukdIxu6WNBLlDQqoptLfKzCOJ9M8O4BgkUJe
         SBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BihR1CeamKwD0xknvOCw/q8js2sWtNiu1Vs0uNmHUR8=;
        fh=OFle2CS3VNisdCAgSRXUV24N3cCDSB7jOnOizepy1to=;
        b=grDiBfKakuuh2io/fwJgJTLF49L4/r3MvSapuSE+L9rF4tjbJwI7SDl3enApXRum7m
         MkGW1V6AiE+KUS/pGP10Wm6G1koTWRtHY0y71UoPIQcAV7AuGFa9XBXYpXih4mRYKG6w
         uYWFBcuEghz6YHpx2kDxmocdJ+DZd+kexqUShyahfz1IY+kCYmjSRwtbX4WfzO6DUon4
         Ag4L3PRJPo+OsVJ+sLg9Ad9y2TpPFMSY5QGZ95nYKIL0hApz2lUF64MJBuEl5PYlq6k+
         GakPweMG7Ae9HqknuDUBn2eP1HG0lhCY6ALXXxPOvpB6m9w7//PD3IPvsVFQdqwkH13Y
         Gs6g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794360499; x=1794965299; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BihR1CeamKwD0xknvOCw/q8js2sWtNiu1Vs0uNmHUR8=;
        b=edsOmL5FpSYx91lsdkSZU0+Cn+dKQ/I0UOsmilk4c59Y7S6nULS8rHR44DxltBbSBR
         N3u4vyqwLlLDS+D0+hEzoPg8/9V2Wo21i7Zd5iQzQbd4rKI2tg0Ljt5LR9KdPbs4Ottn
         yMey1ILBMabs0r0LjZ7azNxku9RgnoqaWYmidEmkRcm2Z3AluwKkiG9BIPGS0I9//FTU
         qQ+aqJYz8EsLRpEZjdYV2SuRsGdbw8OlYpyKAd8+Q03FDnoMoOBDgwh9VhPHYm9q8lFO
         sQmDeQyzxWOIb4h/i2QogZf00LcNtRfNObNauSkW5AES0o4caXm/Rpde1u09QGrwXkbu
         DoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360499; x=1794965299;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BihR1CeamKwD0xknvOCw/q8js2sWtNiu1Vs0uNmHUR8=;
        b=hbIkSpved/lgF47rLZS+wuvoEp7HlhWU9lW4d/bkdrI5TRgwK9AAwf98DDainq8WeE
         kh3svXBMpX7dk0qyVx9q+hthu4cajtwHxn413ES8n7VY5ngtGACYp/Gokv4dBFDzlFkk
         i5ZLGu4fG2MEyWjZch0gYGvKPlDWen7mkQmSJta4A35g4N9oRA8KcuZhFAxMDqgpdbpI
         wKpf/H3wIAZfKfCJWy4MsyMn/0EXSH5klYnQWkBkhWqqhYEO8s1UPkC8ixSkXz1o4wST
         HbW2ejs+/rLSbs4kkNeEBfwcc+IsVOEmjMbJ9D8Ai9l2yTyH/+yCO7iZaXhEMYVmBFaP
         Y/cg==
X-Gm-Message-State: APuU4Z+jGPg58JYhLnSA8zThFzz4XjXouXMLc6tiQ41OFQtvj0qrJ3Cb
	236d6lD/naQlJtQHpLF0pTy2TGGnHaf4KkqfWvFK6kgQGs7mTvqXQUJyKiif98FroRgoANGu1LZ
	/JmruiajFtyNWFvfnO82ULjYm430l9Fk=
X-Gm-Gg: AYBFou1elzuFc8aIC0tTq2KNjX0+WlkQHi7MB+WnbbgAFF/t8xDZtVZogesqBYLC7v2
	vtfAyt+94iPegnFXwTvyjVTi3IG0s/glLBupod3R5s7GJFPQsUanpAFldO+TdCosOoSykuk3zh2
	9WBGSWF08uR/vvgR/6O1cc4mJT4MrecWX4FZbnh9WrXgi+tUZF+oTWWGkitiguwpwkR7OMfGSJJ
	3m7gErZBWSFJz/IJvy/FEtWSGK3DKHvYx+mmAkAq3sVb/jJhh9rbPJKFELXejzuZ9mj33de6n7+
	ojrHkLa/I7g2KQ+lOVY9TAxk3yGxu4MhD6aQi7CVXI9/PHHKcDKLOsQOFXLLDLMGzSn2KVB9L2S
	CMvjWc1cbWeK60UugJdXGT5FAdcS3dqfnbvgJzDU1VbiPCcwnEJom9wUOmIMG8PmpnGE5K80V1v
	mmqaJjbWPK3942dwRjHIQuBHL9tqjCmbwkJ45Yr53hLBGYa+oalX08NyKCA9A9iIvuVqh5R5tUt
	Q6POkHaReA/ixreiCZlHwdevdbAa/Dw642LdmHrahbtLlS3Pnsmk3MkzvsWRJahD194xam3MuNE
	y5284NlPF5i5X8esEbW6cKeEoEU7GS0D0dzfU12bOgtN7O3aiXjKakqjLYqZEruNiHevO/9R3QI
	gzmW68SUxCopkBzCj4b8wZpvfa/cOJfYPHaKp+3Y87XE=
X-Received: by 2002:a05:690e:1444:b0:677:c7f2:ba0 with SMTP id
 956f58d0204a3-67c67f51027mr1007991d50.42.1794360499242; Tue, 10 Nov 2026
 17:28:19 -0800 (PST)
MIME-Version: 1.0
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Nov 2026 17:27:53 -0800
X-Gm-Features: AclHuK9NizPUoUp3aOLMkcI5N9xtC6fS_4Sk4rU-3qjerMmo5PZA8ep69IKudRs
Message-ID: <CAMKF1sqnzQEBmAnpMZoEkuHzQwVQj0zF0wYTi2nAB1EWYTckYQ@mail.gmail.com>
Subject: Re: [oe] [PATCH meta-oe 00/10] android-tools: adbd fixes and opt-in
 access control for Linux systems
To: alex.kiernan@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000280dd4065ff61ce9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 01:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132108

--000000000000280dd4065ff61ce9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is significant amount of patches to carry with Pending status, could
you update on your upstreaming effort around this into android-tools
itself ?

On Tue, Nov 10, 2026 at 9:35=E2=80=AFAM Alex Kiernan via openembedded-devel
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:

> adbd built from this recipe runs on Linux devices rather than Android, an=
d
> several things that Android's init or property service would normally
> provide are missing. This series fixes the bugs that follow from that, an=
d
> adds opt-in controls for who may use adbd.
>
> The first five patches are fixes and change behaviour without any opt-in:
>
>  - `adb reboot recovery` / `bootloader` pass their target to RESTART2
>    instead of a fixed "adb", so kernels whose reboot-mode driver picks th=
e
>    boot mode from the reason string reboot into the requested mode.
>  - `adb shell` starts in the user's home directory and no longer gets
>    Android's TMPDIR=3D/data/local/tmp.
>  - On glibc, UsbFfsConnection::StopWorker() no longer spins for ever
>    after a cable pull: it relied on bionic's pthread_kill() behaviour, an=
d
>    the host saw the device as offline until adbd was restarted.
>  - adbd exits after `adb root` / `adb unroot` so the service manager
>    restarts it with the new privilege state; the unit becomes
>    Restart=3Dalways.
>  - Readiness is signalled once functionfs is being serviced, not
>    immediately after the USB thread starts. sd_notify(READY=3D1) raced
>    open_functionfs(), and 10-adbd-configfs.conf binds the UDC on READY=3D=
1
>    with no delay, so the bind could be dropped and the host never reached
>    CONFIGURED. Builds without systemd can get the same signal through a
>    FIFO named in $ADBD_READY_FIFO.
>
> The next four are opt-in, and change nothing unless enabled:
>
>  - PACKAGECONFIG[debuggable-prop]: liblog reads ro.debuggable from the
>    build.prop-style files in ADB_DEBUGGABLE_PROP_FILES rather than
>    reporting every build as debuggable, so `adb root` can be refused on a
>    production image.
>  - PACKAGECONFIG[auth-unless-debuggable]: hosts must authenticate unless
>    the build is debuggable, decided per connection. Today the Debian patc=
h
>    lets every host in without a key.
>  - ADBD_AUTH_KEY_PATHS: where adbd reads trusted host keys, in place of
>    Android's /adb_keys and /data/misc/adb/adb_keys.
>  - adbd keeps root across a restart only while the build is debuggable,
>    so a root state written while it was does not outlive it. Without
>    debuggable-prop every Linux build is debuggable, so this is a no-op.
>
> The last patch drops `killall adbd` from android-gadget-cleanup, which
> runs after adbd has already exited.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
> Alex Kiernan (10):
>       android-tools: adbd: forward the reboot target to RESTART2
>       android-tools: adbd: start adb shell in $HOME, without Android's
> TMPDIR
>       android-tools: adbd: fix the USB worker hanging on glibc after a
> cable pull
>       android-tools: adbd: restart after adb root/unroot
>       android-tools: adbd: signal readiness once functionfs is serviced
>       android-tools: add PACKAGECONFIG debuggable-prop
>       android-tools: add PACKAGECONFIG auth-unless-debuggable
>       android-tools: add ADBD_AUTH_KEY_PATHS
>       android-tools: adbd: keep root only while the build is debuggable
>       android-tools-conf: android-gadget-cleanup: don't killall adbd
>
>  .../android-tools-conf/android-gadget-cleanup      |   4 +-
>  ...dbd-forward-the-reboot-target-to-RESTART2.patch |  42 +++++++
>  ...start-in-HOME-and-drop-the-Android-only-T.patch |  45 +++++++
>  ...-use-pthread_kill-as-a-thread-liveness-pr.patch | 118
> ++++++++++++++++++
>  ...exit-after-adb-root-unroot-so-an-init-sup.patch |  60 +++++++++
>  ...nal-readiness-once-functionfs-is-serviced.patch | 117 +++++++++++++++=
++
>  ...onally-read-ro.debuggable-from-build.prop.patch | 117 +++++++++++++++=
++
>  ...ally-require-authorization-unless-the-bui.patch | 138
> +++++++++++++++++++++
>  ...h-optionally-take-the-trusted-key-paths-a.patch |  72 +++++++++++
>  ...oot-on-Linux-only-while-the-build-is-debu.patch |  51 ++++++++
>  .../android-tools/android-tools-adbd.service       |   2 +-
>  .../android-tools/android-tools_35.0.2.bb          |  28 ++++-
>  12 files changed, 788 insertions(+), 6 deletions(-)
> ---
> base-commit: 33db795031ddef81949db64aedf33070e1330fdd
> change-id: 20261106-android-tools-adbd-1c8f4decb0de
>
> Best regards,
> --
> Alex Kiernan <alex.kiernan@gmail.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132097):
> https://lists.openembedded.org/g/openembedded-devel/message/132097
> Mute This Topic: https://lists.openembedded.org/mt/122197686/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000280dd4065ff61ce9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is significant amount of patches to carry with Pendin=
g status, could you update on your upstreaming effort around this into andr=
oid-tools itself=C2=A0?</div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 10, 2026 at 9:35=
=E2=80=AFAM Alex Kiernan via openembedded-devel &lt;alex.kiernan=3D<a href=
=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">adbd built from this recipe runs on Linux devices rather than Android, an=
d<br>
several things that Android&#39;s init or property service would normally<b=
r>
provide are missing. This series fixes the bugs that follow from that, and<=
br>
adds opt-in controls for who may use adbd.<br>
<br>
The first five patches are fixes and change behaviour without any opt-in:<b=
r>
<br>
=C2=A0- `adb reboot recovery` / `bootloader` pass their target to RESTART2<=
br>
=C2=A0 =C2=A0instead of a fixed &quot;adb&quot;, so kernels whose reboot-mo=
de driver picks the<br>
=C2=A0 =C2=A0boot mode from the reason string reboot into the requested mod=
e.<br>
=C2=A0- `adb shell` starts in the user&#39;s home directory and no longer g=
ets<br>
=C2=A0 =C2=A0Android&#39;s TMPDIR=3D/data/local/tmp.<br>
=C2=A0- On glibc, UsbFfsConnection::StopWorker() no longer spins for ever<b=
r>
=C2=A0 =C2=A0after a cable pull: it relied on bionic&#39;s pthread_kill() b=
ehaviour, and<br>
=C2=A0 =C2=A0the host saw the device as offline until adbd was restarted.<b=
r>
=C2=A0- adbd exits after `adb root` / `adb unroot` so the service manager<b=
r>
=C2=A0 =C2=A0restarts it with the new privilege state; the unit becomes<br>
=C2=A0 =C2=A0Restart=3Dalways.<br>
=C2=A0- Readiness is signalled once functionfs is being serviced, not<br>
=C2=A0 =C2=A0immediately after the USB thread starts. sd_notify(READY=3D1) =
raced<br>
=C2=A0 =C2=A0open_functionfs(), and 10-adbd-configfs.conf binds the UDC on =
READY=3D1<br>
=C2=A0 =C2=A0with no delay, so the bind could be dropped and the host never=
 reached<br>
=C2=A0 =C2=A0CONFIGURED. Builds without systemd can get the same signal thr=
ough a<br>
=C2=A0 =C2=A0FIFO named in $ADBD_READY_FIFO.<br>
<br>
The next four are opt-in, and change nothing unless enabled:<br>
<br>
=C2=A0- PACKAGECONFIG[debuggable-prop]: liblog reads ro.debuggable from the=
<br>
=C2=A0 =C2=A0build.prop-style files in ADB_DEBUGGABLE_PROP_FILES rather tha=
n<br>
=C2=A0 =C2=A0reporting every build as debuggable, so `adb root` can be refu=
sed on a<br>
=C2=A0 =C2=A0production image.<br>
=C2=A0- PACKAGECONFIG[auth-unless-debuggable]: hosts must authenticate unle=
ss<br>
=C2=A0 =C2=A0the build is debuggable, decided per connection. Today the Deb=
ian patch<br>
=C2=A0 =C2=A0lets every host in without a key.<br>
=C2=A0- ADBD_AUTH_KEY_PATHS: where adbd reads trusted host keys, in place o=
f<br>
=C2=A0 =C2=A0Android&#39;s /adb_keys and /data/misc/adb/adb_keys.<br>
=C2=A0- adbd keeps root across a restart only while the build is debuggable=
,<br>
=C2=A0 =C2=A0so a root state written while it was does not outlive it. With=
out<br>
=C2=A0 =C2=A0debuggable-prop every Linux build is debuggable, so this is a =
no-op.<br>
<br>
The last patch drops `killall adbd` from android-gadget-cleanup, which<br>
runs after adbd has already exited.<br>
<br>
Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" t=
arget=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
---<br>
Alex Kiernan (10):<br>
=C2=A0 =C2=A0 =C2=A0 android-tools: adbd: forward the reboot target to REST=
ART2<br>
=C2=A0 =C2=A0 =C2=A0 android-tools: adbd: start adb shell in $HOME, without=
 Android&#39;s TMPDIR<br>
=C2=A0 =C2=A0 =C2=A0 android-tools: adbd: fix the USB worker hanging on gli=
bc after a cable pull<br>
=C2=A0 =C2=A0 =C2=A0 android-tools: adbd: restart after adb root/unroot<br>
=C2=A0 =C2=A0 =C2=A0 android-tools: adbd: signal readiness once functionfs =
is serviced<br>
=C2=A0 =C2=A0 =C2=A0 android-tools: add PACKAGECONFIG debuggable-prop<br>
=C2=A0 =C2=A0 =C2=A0 android-tools: add PACKAGECONFIG auth-unless-debuggabl=
e<br>
=C2=A0 =C2=A0 =C2=A0 android-tools: add ADBD_AUTH_KEY_PATHS<br>
=C2=A0 =C2=A0 =C2=A0 android-tools: adbd: keep root only while the build is=
 debuggable<br>
=C2=A0 =C2=A0 =C2=A0 android-tools-conf: android-gadget-cleanup: don&#39;t =
killall adbd<br>
<br>
=C2=A0.../android-tools-conf/android-gadget-cleanup=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
=C2=A0...dbd-forward-the-reboot-target-to-RESTART2.patch |=C2=A0 42 +++++++=
<br>
=C2=A0...start-in-HOME-and-drop-the-Android-only-T.patch |=C2=A0 45 +++++++=
<br>
=C2=A0...-use-pthread_kill-as-a-thread-liveness-pr.patch | 118 ++++++++++++=
++++++<br>
=C2=A0...exit-after-adb-root-unroot-so-an-init-sup.patch |=C2=A0 60 +++++++=
++<br>
=C2=A0...nal-readiness-once-functionfs-is-serviced.patch | 117 ++++++++++++=
+++++<br>
=C2=A0...onally-read-ro.debuggable-from-build.prop.patch | 117 ++++++++++++=
+++++<br>
=C2=A0...ally-require-authorization-unless-the-bui.patch | 138 ++++++++++++=
+++++++++<br>
=C2=A0...h-optionally-take-the-trusted-key-paths-a.patch |=C2=A0 72 +++++++=
++++<br>
=C2=A0...oot-on-Linux-only-while-the-build-is-debu.patch |=C2=A0 51 +++++++=
+<br>
=C2=A0.../android-tools/android-tools-adbd.service=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../android-tools/<a href=3D"http://android-tools_35.0.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">android-tools_35.0.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 28 ++++-<br>
=C2=A012 files changed, 788 insertions(+), 6 deletions(-)<br>
---<br>
base-commit: 33db795031ddef81949db64aedf33070e1330fdd<br>
change-id: 20261106-android-tools-adbd-1c8f4decb0de<br>
<br>
Best regards,<br>
--=C2=A0 <br>
Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.com" target=3D"_blank=
">alex.kiernan@gmail.com</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132097): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132097" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132097</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122197686/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122197686/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000280dd4065ff61ce9--
