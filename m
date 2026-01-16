Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA874D4A613
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 08:43:54 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1941.1768553028340205505
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 00:43:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=UDCF9wJ0;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.42, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-655b5094119so38941a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 00:43:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768553027; cv=none;
        d=google.com; s=arc-20240605;
        b=LvLxoEFAsu1ZU/FqIrQMSYYnB5Tqz04WcM/4v0pYjK0IXwKL29K9TyYiddid+MaXE/
         MwtaTsg1vv9zQ4VgRxxm9+Id1g2HYhvbvcKurZsxUXyJdpzozKPMk7SRIOpUXnVpn4sI
         lpMgHbx+iQXoDxa13QkFpyRUxhbdxCdkn3ROPem+TNElQo3cRjZJCo6dGayfySh6g1Bk
         6nJDRdM00ChvrouZmJKUFAw0NmrG9CZULSEA+MvRZTuyH137vnYKnVveNJA0SniAmkqg
         983xOv55ML4Lci2Zrv04f5m4pPGxv9NiWPc0+kyHT1BCSmOinLJ81sVfOd9U/QR1wIaE
         iIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m+tdXxOzXHGxNm5uXRpVMJ3pBpbaq9vl5ZQA6ZSjG40=;
        fh=kqtH9RvdTS8z4R7bH+N1q4tJTvX5kZFkdgAseXKYH84=;
        b=LefadmpHqoIDc8hDOxt0MKI6KJohrO9aJFoYukOfjtHRCDYng6JesqdLjPpGNQkod/
         3tdVo39VfxQ9sELq9vgNFJ6JSM8140Gh5yGSw84dcF1PL8x0Vu3Aic2keU+tRHt2AEOv
         8Z6Ximij33UGIQ1bQQrWIlWwngpAgmVlfYUuZttOUwtkNzRo7/p6+bun0Omtn0D0awXm
         yqBx5n39mZhPRWWrZMiYsPAcs75k0UfQMHs9Pi15Rcd9NSClRyA6i99tpoaICStb10Tq
         zs7TBdv2uQbjmq+l6VNsUsqVI5DTaGv9Mi0OH5R66hrxq+n3Ionm6FWrAJqkTk5TWc4T
         QVmA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768553027; x=1769157827; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m+tdXxOzXHGxNm5uXRpVMJ3pBpbaq9vl5ZQA6ZSjG40=;
        b=UDCF9wJ0VpE3Lcvuxss3vYupQNpiWb3YuoEeOCFPob+NE4PHZCI3aRji1/PHwC3j1q
         Q1QsVSDJ3mu5YLF2acH9MYTYEFKOw1BX7YPMbtaJsIc0DbAKzrzxxfUt5pfHlQTpbQ6K
         zkI5bGQcV7QvjmMfqQkNV5w2aSwTMgnn6Vb14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768553027; x=1769157827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+tdXxOzXHGxNm5uXRpVMJ3pBpbaq9vl5ZQA6ZSjG40=;
        b=ZnV7NGFts0oiyEy3ScroIlVzPyGFofLD0nD8KEPlGAZSO/oHIMMH8EJ3cQ/NThnZlu
         RM7epW+JDIJ6GHbqQS3H1UOTV10ubtfdsTWUSNbpH8eOFRax+lRDzg4jjpLSb2Y/ZIah
         VfhcIv+0/MMfNzUaKbM4Umio1PI4CZI0eS3euqfjtqs6VI52dfv2zmxVom0JWqA+Bn1g
         ijGkxFnkmI2t+dvlQUiqyiG/LUciflLHstgaiIEZIh8XDsyaaShn8Ac/vXQBV+uOE8q0
         kttnCIiyt2hRNvrT8P3FcrYUEG/naI52MaT1WOVVo3em8HpBnfVQDr3GqXAZn4PHpJcC
         S0MQ==
X-Gm-Message-State: AOJu0YzR4Bqm9WvrBTJVXG96IuIY895U7X0LqfDx9445qzotan6yQ/z3
	LQCiBzyBN+6OCj2yybDWoTgu60zuQK+TTf+/Wp2T1f/c/uelpQO/HA3p2FnOlUYEZOwDe7CaBOC
	mXVu2uc8STo+REWKBqagGxjswYV0yd9YgTt82tlgDWg==
X-Gm-Gg: AY/fxX6zkRPPHjS2zj4iOfUtUoLh8Tn9GyCJYv15h6DvuEZ5IpcUhqLq086hnMMjj26
	tQeNFP0T/cTXSs44Y2K3KkAQN8SfP+m42V2XDp//RjOw0d0JNmgvn6cfzwOg7FkNQaxNGDBX00T
	Wk1ZmtGV37IXl+TDkANDXuxBOKsM5TS8P6LaaZBavw8mYgxdT7IVZHeYN6xQ0zTI8gPtIYMbnu2
	llIWda7zuhYQEadLclvCFb9SKYA3RvYxGrDDzHIIHkFRs6CUTp68JsxwusQN1zLXMVopo2ZkaBB
	4WOiwumDsI4hivo/TSqZ6iDnj4kZ
X-Received: by 2002:a05:6402:2551:b0:649:9fef:5b14 with SMTP id
 4fb4d7f45d1cf-654516f66bemr964926a12.0.1768553026678; Fri, 16 Jan 2026
 00:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20260115103503.200126-1-adam.duskett@amarulasolutions.com>
 <20260115103503.200126-2-adam.duskett@amarulasolutions.com> <CAMKF1sqEevw=WBZQr4pqu4_a3u_skRbP-JN9+N7QzDp8ZABQrQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqEevw=WBZQr4pqu4_a3u_skRbP-JN9+N7QzDp8ZABQrQ@mail.gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 16 Jan 2026 09:43:35 +0100
X-Gm-Features: AZwV_QiIfMF0q98lyBUdoDBFyksPn9OEUgc8xz2dUoJaemS_C5LBpIYtQsmmCYE
Message-ID: <CAHDQB6MXMr21pnrYhDUe-RRFT+27DvVU_H0rvt0aNneXxt4KdA@mail.gmail.com>
Subject: Re: [oe] [PATCH v2 2/2] kmscon: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec013706487d5676"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 08:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123529

--000000000000ec013706487d5676
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem!

Thanks for the test! I didn't know about TOOLCHAIN =3D "clang" and will get
it fixed!

Thanks again!

Adam Duskett


On Thu, Jan 15, 2026 at 5:08=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> Thanks for your submission. This fails to build with TOOLCHAIN =3D "clang=
"
>
> https://errors.yoctoproject.org/Errors/Details/896251/
>
> On Thu, Jan 15, 2026 at 2:40=E2=80=AFAM Adam Duskett via lists.openembedd=
ed.org
> <adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:
>
>> Provide sane defaults that do not have dependencies, such as
>> a dummy and terminal session support and basic fbdev support.
>>
>> kmsconvt@.service must be added separatly or else
>> do_rootfs fails with the following error:
>>
>> ```
>> do_rootfs: Postinstall scriptlets of ['kmscon'] have failed. If the
>> intention
>> is to defer them to first boot, then please place them into
>> pkg_postinst_ontarget:${PN} (). Deferring to first boot via 'exit 1' is =
no
>> longer supported.
>> ```
>>
>> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
>> ---
>> v1 -> v2: add tag=3Dv${PV} to the SRC_URI
>>
>>  .../recipes-graphics/kmscon/kmscon_9.2.1.bb   | 63 +++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>  create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>>
>> diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>> b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>> new file mode 100644
>> index 0000000000..6c4060763b
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/kmscon/kmscon_9.2.1.bb
>> @@ -0,0 +1,63 @@
>> +SUMMARY =3D "Simple terminal emulator based on linux kernel mode settin=
g
>> (KMS)."
>> +DESCRIPTION =3D "\
>> +    Kmscon is a simple terminal emulator based on linux kernel mode
>> setting \
>> +    (KMS). It is an attempt to replace the in-kernel VT implementation
>> with \
>> +    a userspace console. \
>> +"
>> +HOMEPAGE =3D "https://github.com/kmscon/kmscon"
>> +BUGTRACKER =3D "https://github.com/kmscon/kmscon/issues"
>> +CVE_PRODUCT =3D "kmscon"
>> +
>> +SECTION =3D "graphics"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6d4602d249f8a3401040238e9836=
7d9e"
>> +
>> +DEPENDS =3D "\
>> +    libtsm \
>> +    libxkbcommon \
>> +    udev \
>> +"
>> +
>> +SRC_URI =3D "git://
>> github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}
>> <http://github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dmain;tag=3Dv$=
%7BPV%7D>
>> "
>> +SRCREV =3D "7d46650dbb0826f9b89de42f879be879391c14fd"
>> +
>> +inherit meson pkgconfig systemd
>> +
>> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)=
}"
>> +
>> +PACKAGECONFIG[backspace_sends_delete] =3D "-Dbackspace_sends_delete=3Dt=
rue,
>> -Dbackspace_sends_delete=3Dfalse"
>> +PACKAGECONFIG[font_pango] =3D "-Dfont_pango=3Denabled,
>> -Dfont_pango=3Ddisabled, pango"
>> +PACKAGECONFIG[multi_seat] =3D "-Dmulti_seat=3Denabled,
>> -Dmulti_seat=3Ddisabled, systemd"
>> +PACKAGECONFIG[opengl] =3D "-Drenderer_gltex=3Denabled -Dvideo_drm3d=3De=
nabled,
>> -Drenderer_gltex=3Ddisabled -Dvideo_drm3d=3Ddisabled, libdrm virtual/egl
>> virtual/libgles2 virtual/libgbm"
>> +PACKAGECONFIG[video_drm2d] =3D "-Dvideo_drm2d=3Denabled,
>> -Dvideo_drm2d=3Ddisabled, libdrm"
>> +
>> +EXTRA_OEMESON =3D "\
>> +    -Delogind=3Ddisabled \
>> +    -Dextra_debug=3Dfalse \
>> +    -Dfont_unifont=3Denabled \
>> +    -Dsession_dummy=3Denabled \
>> +    -Dsession_terminal=3Denabled \
>> +    -Dtests=3Dfalse \
>> +    -Dvideo_fbdev=3Denabled \
>> +"
>> +
>> +SYSTEMD_SERVICE:${PN} =3D "kmscon.service"
>> +FILES:${PN} +=3D "${systemd_system_unitdir}/kmsconvt@.service"
>> +
>> +do_install:append() {
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
>> 'false', d)}; then
>> +        install -d ${D}${sysconfdir}/systemd/system
>> +        ln -sf ${systemd_system_unitdir}/kmsconvt@.service \
>> +            ${D}${sysconfdir}/systemd/system/autovt@.service
>> +    fi
>> +
>> +    if ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'true', 'false',
>> d)}; then
>> +        sed -e "s@#drm@drm@g" \
>> +            -e "s@#hwaccel@hwaccel@g" \
>> +            -e "s@#render-engine=3Dgltex@render-engine=3Dgltex@g" \
>> +            -i ${D}${sysconfdir}/kmscon/kmscon.conf
>> +    fi
>> +}
>> +
>> +RDEPENDS:${PN} =3D "xkeyboard-config"
>> --
>> 2.52.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#123502):
>> https://lists.openembedded.org/g/openembedded-devel/message/123502
>> Mute This Topic: https://lists.openembedded.org/mt/117277014/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000ec013706487d5676
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Khem!</div><div><br></div><div>Thanks for the test=
! I didn&#39;t know about TOOLCHAIN =3D &quot;clang&quot; and will get it f=
ixed!</div><div><br></div><div>Thanks again!</div><div><br></div><div><div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-height:1.7999999999999998=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-famil=
y:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transparent;vertical-=
align:baseline;white-space:pre-wrap">Adam Duskett</span></p></span><br></di=
v></div></div></div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15, 2026 at 5:08=E2=80=AFPM=
 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr">Thanks for your submission. This fails=C2=A0to build with TOOLC=
HAIN =3D &quot;clang&quot;<div><br></div><div><a href=3D"https://errors.yoc=
toproject.org/Errors/Details/896251/" target=3D"_blank">https://errors.yoct=
oproject.org/Errors/Details/896251/</a></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 15, 2026 at 2:40=
=E2=80=AFAM Adam Duskett via <a href=3D"http://lists.openembedded.org" targ=
et=3D"_blank">lists.openembedded.org</a> &lt;adam.duskett=3D<a href=3D"mail=
to:amarulasolutions.com@lists.openembedded.org" target=3D"_blank">amarulaso=
lutions.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Provide sane defaults that do not have de=
pendencies, such as<br>
a dummy and terminal session support and basic fbdev support.<br>
<br>
kmsconvt@.service must be added separatly or else<br>
do_rootfs fails with the following error:<br>
<br>
```<br>
do_rootfs: Postinstall scriptlets of [&#39;kmscon&#39;] have failed. If the=
 intention<br>
is to defer them to first boot, then please place them into<br>
pkg_postinst_ontarget:${PN} (). Deferring to first boot via &#39;exit 1&#39=
; is no<br>
longer supported.<br>
```<br>
<br>
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
---<br>
v1 -&gt; v2: add tag=3Dv${PV} to the SRC_URI<br>
<br>
=C2=A0.../recipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1.bb" rel=3D=
"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a>=C2=A0 =C2=A0| 63 +++++++=
++++++++++++<br>
=C2=A01 file changed, 63 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/kmscon/<a href=3D"http://=
kmscon_9.2.1.bb" rel=3D"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a><b=
r>
<br>
diff --git a/meta-oe/recipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1=
.bb" rel=3D"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a> b/meta-oe/rec=
ipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1.bb" rel=3D"noreferrer" =
target=3D"_blank">kmscon_9.2.1.bb</a><br>
new file mode 100644<br>
index 0000000000..6c4060763b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/kmscon/<a href=3D"http://kmscon_9.2.1.bb" re=
l=3D"noreferrer" target=3D"_blank">kmscon_9.2.1.bb</a><br>
@@ -0,0 +1,63 @@<br>
+SUMMARY =3D &quot;Simple terminal emulator based on linux kernel mode sett=
ing (KMS).&quot;<br>
+DESCRIPTION =3D &quot;\<br>
+=C2=A0 =C2=A0 Kmscon is a simple terminal emulator based on linux kernel m=
ode setting \<br>
+=C2=A0 =C2=A0 (KMS). It is an attempt to replace the in-kernel VT implemen=
tation with \<br>
+=C2=A0 =C2=A0 a userspace console. \<br>
+&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/kmscon/kmscon" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/kmscon/kmscon</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/kmscon/kmscon/issues" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/kmscon/kmscon/issues=
</a>&quot;<br>
+CVE_PRODUCT =3D &quot;kmscon&quot;<br>
+<br>
+SECTION =3D &quot;graphics&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6d4602d249f8a3401040238e98=
367d9e&quot;<br>
+<br>
+DEPENDS =3D &quot;\<br>
+=C2=A0 =C2=A0 libtsm \<br>
+=C2=A0 =C2=A0 libxkbcommon \<br>
+=C2=A0 =C2=A0 udev \<br>
+&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/kmscon/kmscon;protoco=
l=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}</a=
>&quot;<br>
+SRCREV =3D &quot;7d46650dbb0826f9b89de42f879be879391c14fd&quot;<br>
+<br>
+inherit meson pkgconfig systemd<br>
+<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;opengl&#39;, d)}&quot;<br>
+<br>
+PACKAGECONFIG[backspace_sends_delete] =3D &quot;-Dbackspace_sends_delete=
=3Dtrue, -Dbackspace_sends_delete=3Dfalse&quot;<br>
+PACKAGECONFIG[font_pango] =3D &quot;-Dfont_pango=3Denabled, -Dfont_pango=
=3Ddisabled, pango&quot;<br>
+PACKAGECONFIG[multi_seat] =3D &quot;-Dmulti_seat=3Denabled, -Dmulti_seat=
=3Ddisabled, systemd&quot;<br>
+PACKAGECONFIG[opengl] =3D &quot;-Drenderer_gltex=3Denabled -Dvideo_drm3d=
=3Denabled, -Drenderer_gltex=3Ddisabled -Dvideo_drm3d=3Ddisabled, libdrm vi=
rtual/egl virtual/libgles2 virtual/libgbm&quot;<br>
+PACKAGECONFIG[video_drm2d] =3D &quot;-Dvideo_drm2d=3Denabled, -Dvideo_drm2=
d=3Ddisabled, libdrm&quot;<br>
+<br>
+EXTRA_OEMESON =3D &quot;\<br>
+=C2=A0 =C2=A0 -Delogind=3Ddisabled \<br>
+=C2=A0 =C2=A0 -Dextra_debug=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dfont_unifont=3Denabled \<br>
+=C2=A0 =C2=A0 -Dsession_dummy=3Denabled \<br>
+=C2=A0 =C2=A0 -Dsession_terminal=3Denabled \<br>
+=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dvideo_fbdev=3Denabled \<br>
+&quot;<br>
+<br>
+SYSTEMD_SERVICE:${PN} =3D &quot;kmscon.service&quot;<br>
+FILES:${PN} +=3D &quot;${systemd_system_unitdir}/kmsconvt@.service&quot;<b=
r>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;syst=
emd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/systemd/system<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${systemd_system_unitdir}/kmsconvt@.ser=
vice \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/systemd/system=
/autovt@.service<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;opengl=
&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &quot;s@#drm@drm@g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s@#hwaccel@hwaccel@g&qu=
ot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &quot;s@#render-engine=3Dglte=
x@render-engine=3Dgltex@g&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${sysconfdir}/kmscon/kmsc=
on.conf<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+RDEPENDS:${PN} =3D &quot;xkeyboard-config&quot;<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123502): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123502" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123502</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117277014/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117277014/1997914</a><br>
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
</blockquote></div>

--000000000000ec013706487d5676--

