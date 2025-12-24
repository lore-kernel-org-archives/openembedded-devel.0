Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13F5E78491
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 20:25:15 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127326.1766607910726177592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 12:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAleDxoT;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78fb6c7874cso52222797b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 12:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766607910; x=1767212710; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=14I7hgBnieWJBsjJ/rUSBlD+4s+pImBrO0gpJsFpWW4=;
        b=hAleDxoT8Q3K2lcIs3wlWlLYecAXgleW02h2MedmfzTAHlt2N4Vt/3oCW/Bmmr/J2Z
         4+TGXu6Nox44TmM2iR239lrxAlOwZs9L8NrgoneiWmnTOf6erYcHDqrPtVLdT2xdHENW
         /FWNIVP+wO8IgviJe0/UU7PmW0Q2b1Rt3usJsi7C0ulmFDVh7tHM/gMVGaSrRjBuNrBb
         uwbtzMLy3PPygAO3hZzssmW52RvZkJcMpTNMSv/SpH7EdJEckfHWrwTDmu8LfgHbnr6v
         nNtDp+JfT+mUJ2My+KiDiqokAGEFMy6K5zUSetvZEzl9/DsMzWGQXGe/0xyWxjOhG6Ox
         KtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766607910; x=1767212710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14I7hgBnieWJBsjJ/rUSBlD+4s+pImBrO0gpJsFpWW4=;
        b=D4pXLpHAESQ/79stOs68oSIm0O9mZnNPC4FSIt8GoqxCzSDikIn3P8T7MD+zENkSdz
         fMzs+Jdcui2hpFYGuzHtEyVL4RspFFF2cljyLbUa4Jvl8wZPNJTmc8l3fvW6M5xqiMC4
         dcwlv1RfOLQQ6kjjVU71GqjDbj/FEfAaLB1cv+7gkthqDePxIk/YqdOLfNN0P/1PrZcS
         pI/StP8BRgb+Y7EIgbuD2qwykuzz5zVjQA3GdAQLR2RnSxXQRTN5YgR02gz2oKsM3Oxf
         yV6/8WlwvjpDkeJ0eO4dMf17DtEAhUlDOQ95GIxp0Gup47pILA8z8zPpU1zB49O7JpAW
         5nIw==
X-Gm-Message-State: AOJu0Ywb58QKrAlsD28Te/RlfAZNgw5+3lWXjtLwBNMBU+Kv8GmKvwoq
	R+DE+jxUi/QPvI43HRBonXF/5eRDGHAtgTYS8dV52mFGIESEwhTBKhQOjmALnU8+MYftgfbOooD
	Sli3Arx2Jdz8R9FtsWD7R5qcxlluGugo=
X-Gm-Gg: AY/fxX5UWjR5xw+lPr8K5hJEMOr0tXjjQINWzc41HMWC+dbxl5a6+anWZgIgXbGvfuq
	yCdcb83aqF8HmUsIsYudeXkb2J3s8lgoPRFfCGXTK5u+fHWyCP3a4WjfzBreZxltaRYrAt0G17y
	UP5TMClRwS368G/VB22KMLD33zPc1LlekrgXPQfR5j6g8L/rA/BsAbuemiLnFI2AbZyPMtGqi7U
	hyC9+UA9ZQNevzaKhXVS5yKMF1ETLO/7cRHz45u1/dUKtOMU3BtHkYlMbw5l+wkN42XDNdqtz1+
	Cv+Kw+Ba9owKWU7cqOJtmUwDEvAxbkm9+zxuB+ISZgxaWlTm6s22ciCwlg1MjqYZjayqbGnviVs
	sjov/63YythR7
X-Google-Smtp-Source: AGHT+IF3GBiUdQJFjmxWoTuhamYklhSdXGvt0tW7teW6tKJJZxC5A6YkkfccbHJfpRaUFu5HaXv6gtgU8tmQzpV+JKc=
X-Received: by 2002:a05:690c:c83:b0:78f:a5c4:7923 with SMTP id
 00721157ae682-78fb4067f9amr167382187b3.56.1766607909704; Wed, 24 Dec 2025
 12:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20251224192519.2630037-1-skandigraun@gmail.com> <20251224192519.2630037-5-skandigraun@gmail.com>
In-Reply-To: <20251224192519.2630037-5-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Dec 2025 12:24:43 -0800
X-Gm-Features: AQt7F2q04kfVrcw5jEHdeyGCLVHGxf2jnHjw1L-HunkQzhGrzdzJTnGPC2P8CSY
Message-ID: <CAMKF1soJ7Cgy1V4DbkiDSQ+ADEnzyfpcTxYUFGHp=iXT74pLgg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 5/6] wireplumber: upgrade 0.5.11 -> 0.5.13
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ea596e0646b874d6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 20:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122900

--000000000000ea596e0646b874d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 11:25=E2=80=AFAM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> Changelog:
> 0.5.13:
> Additions & Enhancements:
> - Added internal filter graph support for audio nodes, allowing users to
>   create audio preprocessing and postprocessing chains without exposing
>   filters to applications, useful for software DSP
> - Added new Lua Properties API that significantly improves performance by
>   avoiding constant serialization between WpProperties and Lua tables,
>   resulting in approximately 40% faster node linking
> - Added WpIterator Lua API for more efficient parameter enumeration
> - Added bash completions for wpctl command
> - Added script to find suitable volume control when using role-based
> policy,
>   allowing volume sliders to automatically adjust the volume of the
> currently
>   active role (e.g., ringing, call, media)
> - Added experimental HDMI channel detection setting to use HDMI ELD
>   information for channel configuration
> - Enhanced role-based policy to allow setting preferred target sinks for
>   media role loopbacks via policy.role-based.preferred-target
> - Enhanced Bluetooth profile autoswitch logic to be more robust and handl=
e
>   saved profiles correctly, including support for loopback sink nodes
> - Enhanced ALSA monitor to include alsa.* device properties on nodes for
>   rule matching
> - Optimized stream node linking for common cases to reduce latency when n=
ew
>   audio/video streams are added
> - Improved event dispatcher performance by using hash table registration
> for
>   event hooks, eliminating performance degradation as more hooks are
>   registered
> - Increased audio headroom for VMware and VirtualBox virtual machines
> - Added setting to prevent restoring "Off" profiles via
>   session.dont-restore-off-profile property
> - Added support for 128 audio channels when compiled with a recent versio=
n
> of
>   PipeWire
>
> Fixes:
> - Fixed memory leaks and issues in the modem manager module
> - Fixed MPRIS module incorrectly treating GHashTable as GObject
> - Fixed warning messages when process files in /proc/<pid>/* don't exist,
>   particularly when processes are removed quickly
> - Fixed MONO audio configuration to only apply to device sink nodes,
> allowing
>   multi-channel mixing in the graph
> - Fixed event dispatcher hook registration and removal to avoid spurious
>   errors
> - Improved logging for standard-link activation failures
> - Simplified event-hook interest matching for better performance
>
> 0.5.12:
> Additions & Enhancements:
> - Added mono audio configuration support via node.features.audio.mono
>   setting that can be changed at runtime with wpctl
> - Added automatic muting of ALSA devices when a running node is removed,
>   helping prevent loud audio on speakers when headsets are unplugged
> - Added notifications API module for sending system notifications
> - Added comprehensive wpctl man page and documentation
> - Enhanced object interest handling for PipeWire properties on session
> items
>
> Fixes:
> - Fixed race condition during shutdown in the permissions portal module
> that
>   could cause crashes in GDBus signal handling
> - Added device validity check in state-routes handling to prevent issues
>   when devices are removed during async operations
> - Fixed Log.critical undefined function error in device-info-cache
> - Improved device hook documentation and configuration
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../{wireplumber_0.5.11.bb =3D> wireplumber_0.5.13.bb}       | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>  rename meta-multimedia/recipes-multimedia/wireplumber/{
> wireplumber_0.5.11.bb =3D> wireplumber_0.5.13.bb} (95%)
>
> diff --git a/meta-multimedia/recipes-multimedia/wireplumber/
> wireplumber_0.5.11.bb b/meta-multimedia/recipes-multimedia/wireplumber/
> wireplumber_0.5.13.bb
> similarity index 95%
> rename from meta-multimedia/recipes-multimedia/wireplumber/
> wireplumber_0.5.11.bb
> rename to meta-multimedia/recipes-multimedia/wireplumber/
> wireplumber_0.5.13.bb
> index 665efd95af..334861b6db 100644
> --- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.11.b=
b
> +++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.13.b=
b
> @@ -10,9 +10,9 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
>      ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
,
> "python3-native python3-lxml-native doxygen-native", "", d)} \
>  "
>
> -SRCREV =3D "3a785e502642ddb1e91d953e587c7b06444e0b51"
> +SRCREV =3D "84429b47943d789389fbde17c06b82efb197d04e"
>  SRC_URI =3D " \
> -    git://
> gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaster;protocol=
=3Dhttps
> \
> +    git://
> gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaster;protocol=
=3Dhttps;tag=3D${PV}
> <http://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaster;p=
rotocol=3Dhttps;tag=3D$%7BPV%7D>
> \
>      file://90-OE-disable-session-dbus-dependent-features.lua \
>  "
>
> @@ -114,6 +114,7 @@ python set_dynamic_metapkg_rdepends () {
>
>  PACKAGES =3D+ "\
>      libwireplumber \
> +    ${PN}-bash-completion \
>      ${PN}-default-config \
>      ${PN}-scripts \
>      ${PN}-modules \
> @@ -132,6 +133,7 @@ CONFFILES:${PN} +=3D " \
>  RRECOMMENDS:${PN} +=3D "pipewire ${PN}-scripts ${PN}-modules-meta"
>
>  FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir}
> ${datadir}/zsh"
> +FILES:${PN}-bash-completion +=3D
> "${datadir}/bash-completion/completions/wpctl"
>
>  FILES:libwireplumber =3D " \
>      ${libdir}/libwireplumber-*.so.* \
> @@ -142,3 +144,4 @@ FILES:${PN}-scripts +=3D
> "${datadir}/wireplumber/scripts/*"
>  # Dynamic packages (see set_dynamic_metapkg_rdepends).
>  FILES:${PN}-modules =3D ""
>  RRECOMMENDS:${PN}-modules +=3D "${PN}-modules-meta"
> +RDEPENDS:${PN}-bash-completion =3D "bash bash-completion"
>

Perhaps it needs to inherit bash-completion class instead.


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122890):
> https://lists.openembedded.org/g/openembedded-devel/message/122890
> Mute This Topic: https://lists.openembedded.org/mt/116933400/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ea596e0646b874d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 24,=
 2025 at 11:25=E2=80=AFAM Gyorgy Sarvari via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Changelog=
:<br>
0.5.13:<br>
Additions &amp; Enhancements:<br>
- Added internal filter graph support for audio nodes, allowing users to<br=
>
=C2=A0 create audio preprocessing and postprocessing chains without exposin=
g<br>
=C2=A0 filters to applications, useful for software DSP<br>
- Added new Lua Properties API that significantly improves performance by<b=
r>
=C2=A0 avoiding constant serialization between WpProperties and Lua tables,=
<br>
=C2=A0 resulting in approximately 40% faster node linking<br>
- Added WpIterator Lua API for more efficient parameter enumeration<br>
- Added bash completions for wpctl command<br>
- Added script to find suitable volume control when using role-based policy=
,<br>
=C2=A0 allowing volume sliders to automatically adjust the volume of the cu=
rrently<br>
=C2=A0 active role (e.g., ringing, call, media)<br>
- Added experimental HDMI channel detection setting to use HDMI ELD<br>
=C2=A0 information for channel configuration<br>
- Enhanced role-based policy to allow setting preferred target sinks for<br=
>
=C2=A0 media role loopbacks via policy.role-based.preferred-target<br>
- Enhanced Bluetooth profile autoswitch logic to be more robust and handle<=
br>
=C2=A0 saved profiles correctly, including support for loopback sink nodes<=
br>
- Enhanced ALSA monitor to include alsa.* device properties on nodes for<br=
>
=C2=A0 rule matching<br>
- Optimized stream node linking for common cases to reduce latency when new=
<br>
=C2=A0 audio/video streams are added<br>
- Improved event dispatcher performance by using hash table registration fo=
r<br>
=C2=A0 event hooks, eliminating performance degradation as more hooks are<b=
r>
=C2=A0 registered<br>
- Increased audio headroom for VMware and VirtualBox virtual machines<br>
- Added setting to prevent restoring &quot;Off&quot; profiles via<br>
=C2=A0 session.dont-restore-off-profile property<br>
- Added support for 128 audio channels when compiled with a recent version =
of<br>
=C2=A0 PipeWire<br>
<br>
Fixes:<br>
- Fixed memory leaks and issues in the modem manager module<br>
- Fixed MPRIS module incorrectly treating GHashTable as GObject<br>
- Fixed warning messages when process files in /proc/&lt;pid&gt;/* don&#39;=
t exist,<br>
=C2=A0 particularly when processes are removed quickly<br>
- Fixed MONO audio configuration to only apply to device sink nodes, allowi=
ng<br>
=C2=A0 multi-channel mixing in the graph<br>
- Fixed event dispatcher hook registration and removal to avoid spurious<br=
>
=C2=A0 errors<br>
- Improved logging for standard-link activation failures<br>
- Simplified event-hook interest matching for better performance<br>
<br>
0.5.12:<br>
Additions &amp; Enhancements:<br>
- Added mono audio configuration support via node.features.audio.mono<br>
=C2=A0 setting that can be changed at runtime with wpctl<br>
- Added automatic muting of ALSA devices when a running node is removed,<br=
>
=C2=A0 helping prevent loud audio on speakers when headsets are unplugged<b=
r>
- Added notifications API module for sending system notifications<br>
- Added comprehensive wpctl man page and documentation<br>
- Enhanced object interest handling for PipeWire properties on session item=
s<br>
<br>
Fixes:<br>
- Fixed race condition during shutdown in the permissions portal module tha=
t<br>
=C2=A0 could cause crashes in GDBus signal handling<br>
- Added device validity check in state-routes handling to prevent issues<br=
>
=C2=A0 when devices are removed during async operations<br>
- Fixed Log.critical undefined function error in device-info-cache<br>
- Improved device hook documentation and configuration<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://wireplumber_0.5.11.bb" rel=3D"noreferrer" targ=
et=3D"_blank">wireplumber_0.5.11.bb</a> =3D&gt; <a href=3D"http://wireplumb=
er_0.5.13.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0.5.13.bb</a=
>}=C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/wireplumber/{<a href=3D"htt=
p://wireplumber_0.5.11.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber=
_0.5.11.bb</a> =3D&gt; <a href=3D"http://wireplumber_0.5.13.bb" rel=3D"nore=
ferrer" target=3D"_blank">wireplumber_0.5.13.bb</a>} (95%)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http=
://wireplumber_0.5.11.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_=
0.5.11.bb</a> b/meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"h=
ttp://wireplumber_0.5.13.bb" rel=3D"noreferrer" target=3D"_blank">wireplumb=
er_0.5.13.bb</a><br>
similarity index 95%<br>
rename from meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http:=
//wireplumber_0.5.11.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0=
.5.11.bb</a><br>
rename to meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http://=
wireplumber_0.5.13.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0.5=
.13.bb</a><br>
index 665efd95af..334861b6db 100644<br>
--- a/meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http://wire=
plumber_0.5.11.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0.5.11.=
bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/wireplumber/<a href=3D"http://wire=
plumber_0.5.13.bb" rel=3D"noreferrer" target=3D"_blank">wireplumber_0.5.13.=
bb</a><br>
@@ -10,9 +10,9 @@ DEPENDS =3D &quot;glib-2.0 glib-2.0-native lua pipewire \=
<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot=
;gobject-introspection-data&quot;, &quot;python3-native python3-lxml-native=
 doxygen-native&quot;, &quot;&quot;, d)} \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;3a785e502642ddb1e91d953e587c7b06444e0b51&quot;<br>
+SRCREV =3D &quot;84429b47943d789389fbde17c06b82efb197d04e&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://gitlab.freedesktop.org/pipewire/wire=
plumber.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">gitlab.freedesktop.org/pipewire/wireplumber.git;branch=3Dmaster;pro=
tocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://gitlab.freedesktop.org/pipewire/wire=
plumber.git;branch=3Dmaster;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"norefe=
rrer" target=3D"_blank">gitlab.freedesktop.org/pipewire/wireplumber.git;bra=
nch=3Dmaster;protocol=3Dhttps;tag=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://90-OE-disable-session-dbus-dependent-features.lu=
a \<br>
=C2=A0&quot;<br>
<br>
@@ -114,6 +114,7 @@ python set_dynamic_metapkg_rdepends () {<br>
<br>
=C2=A0PACKAGES =3D+ &quot;\<br>
=C2=A0 =C2=A0 =C2=A0libwireplumber \<br>
+=C2=A0 =C2=A0 ${PN}-bash-completion \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-default-config \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-scripts \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-modules \<br>
@@ -132,6 +133,7 @@ CONFFILES:${PN} +=3D &quot; \<br>
=C2=A0RRECOMMENDS:${PN} +=3D &quot;pipewire ${PN}-scripts ${PN}-modules-met=
a&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${systemd_user_unitdir} ${systemd_system_unitd=
ir} ${datadir}/zsh&quot;<br>
+FILES:${PN}-bash-completion +=3D &quot;${datadir}/bash-completion/completi=
ons/wpctl&quot;<br>
<br>
=C2=A0FILES:libwireplumber =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libwireplumber-*.so.* \<br>
@@ -142,3 +144,4 @@ FILES:${PN}-scripts +=3D &quot;${datadir}/wireplumber/s=
cripts/*&quot;<br>
=C2=A0# Dynamic packages (see set_dynamic_metapkg_rdepends).<br>
=C2=A0FILES:${PN}-modules =3D &quot;&quot;<br>
=C2=A0RRECOMMENDS:${PN}-modules +=3D &quot;${PN}-modules-meta&quot;<br>
+RDEPENDS:${PN}-bash-completion =3D &quot;bash bash-completion&quot;<br></b=
lockquote><div><br></div><div>Perhaps it needs to inherit bash-completion c=
lass instead.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122890): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122890" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122890</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116933400/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116933400/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ea596e0646b874d6--

