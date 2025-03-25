Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A6EC35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 03:56:37 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.58451.1742874995867930625
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 20:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fACdI0mF;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2c1c9b7bd9aso2801462fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 20:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742874995; x=1743479795; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96XI2h0gaZr0YQ5yNlUBn1bqj0pV15sD6wY20E/7idk=;
        b=fACdI0mFuq45o+nlHHPBduxXUs4PkSrJyLAzsVK6AO4sTqkuGi6bZTSRhaXhYlvRG4
         SnAqFDV/DEsrvsxdSLnmp+ZPuztW3QQX26C4MjI1W3jx/cYS+kEM/0hauzK1yfBpmC9B
         w/FmOaR9fIHmA4STO43yWsaKzohMj3GNcki5HflJpi9/LHDRlwPXMLOjy17PeL+IIKjw
         ifahIbZ3SJaOweAv22wRvdLgFdSwy6s2Gx0IuHs73LHBO5eUcAaDLdaD0osTeafHRZM9
         Su9J+bK5ZaJ0c4b2UL0Glh9Bts6H0AbLVv67HgvkiFiaD16jrapk3xRjVBYFvtMyF10F
         cBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742874995; x=1743479795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96XI2h0gaZr0YQ5yNlUBn1bqj0pV15sD6wY20E/7idk=;
        b=wUpVWhUb8H+kUioOoDYW80Z1fn59S3BCwWjFMNvf/pdWjvSmd5NttLG/fDspwWsxYI
         TfevT1FkfrgAVNgnKHoCihnzapWQoNRxehhY8ROGziz30cv6wxKQWbxHyOp8LUISt5mr
         mkDK1L74y9pFN3cNsey36P+8DpjA/hUBViU8zzv8RoEZq2f6dU6XdYkFKXmbDIPP8KtN
         H7K59eyQ42CRwTIgaXsnhkuUXBNQB2ehlQItTNpHyC+y0IdkpNyijfZUMu3MmVdjkObO
         imFsoliw0Z4zibmEJfbO7K+QG6FPjtsCTcrYkbjksuG5ijOsuNUPx3Ro/En3CUkYYng4
         wHXQ==
X-Gm-Message-State: AOJu0Ywaae0U++YVyaJsa6hOMwnJXxInFohvo77WcQbBUDDoeNOQ6WxF
	OJusQpQGeAL3k5zpRfzVPSkiaE/fZtLW0x+64lds9LsVtVy/HotOaz0sAYmLGNNlqJqTC9tnhIj
	O6CEaShE2X1oYGWUALpe3tk1W9kKNvvDZ
X-Gm-Gg: ASbGncu9eTCIqTpTfVL03lKOZxS4GfScEUBYgAWJD9gDLzpuaWN4VblyT+8h9jhrh8y
	TWx1gBHUCTRlL4fqDyiYxKgGa4mNWm2ZaGbpIauitEb/VRw5Gyfoi5dCZQSnkpECnX7EHOR0iJh
	SmBqJaZNV4/ewNGOzFvEPMFLxt
X-Google-Smtp-Source: AGHT+IH9wihBVa7Zs49fNDXKlkuYL3N3tygKasW3tQ9m59RcLvRj6/SMLt6CVgivMVX6rWBAZOdCzhVbdK+Jf4Q0vzU=
X-Received: by 2002:a05:6871:a58f:b0:2bc:8c86:ea31 with SMTP id
 586e51a60fabf-2c7802fff9emr8453505fac.20.1742874994867; Mon, 24 Mar 2025
 20:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250325032203.3034-1-f_l_k@t-online.de>
In-Reply-To: <20250325032203.3034-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 20:56:08 -0700
X-Gm-Features: AQ5f1Jrob1pUlTr7Ht5OhJPlUPpLbqsps7rktd5Skiv8ZuKoGrMEnqarn2kVtLs
Message-ID: <CAMKF1sq8yi1CimE5Tk0nYZZfWyPiyr7LXWnn5mfesoKXpqnLZg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] upower-profiles-daemon: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 03:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116219

On Mon, Mar 24, 2025 at 8:21=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> 0.30
> ----
>
> Add support for configuring actions to be enabled or disabled over dbus:
>   - Actions can be listed via `powerprofilesctl list-actions`
>   - These can be controlled via `powerprofilesctl configure-action`
> Add support for configuring whether PPD reacts to battery/AC charger even=
ts:
>   - It can be queried and controlled via:
>     `powerprofilesctl query-battery-aware` and
>     `powerprofilesctl configure-battery-aware`
> Add better better compatibility with kernel 6.14.
>
> 0.23
> ----
>
> Bugfix release for a performance regression with users who manually
> adjusted AMD dGPU settings using other software.
>
> 0.22
> ----
>
> Since this release power-profiles-daemon is also battery-level aware and
> some drivers use this value to be smarter at tuning their optimizations.
> In particular both the AMD panel power action now uses a progressive appr=
oach,
> changing the the ABM based on the battery percentage.
>
> AMD p-state received various features and improvements:
>  - it supports core performance boost when not in power-saver mode.
>  - uses minimum frequency to lowest non-linear frequency
>  - it is more impervious to faulty firmware and kernel bugs
>
> Added support for changing DPM clocks on amdgpu, to explicitly set the DP=
M
> clocks down to "low" when in power-saver mode.
>
> The daemon command line interface now allows to disable logind and upower
> integration.
>
> Fixes handling of turbo_pct (now assumed as not present by default).
>
> The systemd service lockdown settings have been restricted even more.
>
> The systemd service starts later in the boot to avoid conflicts with
> module loading.
>
> 0.21
> ----
>
> Since this release power-profiles-daemon is battery-state aware and some =
drivers
> use a more power efficient state when using the balanced profile on batte=
ry.
> In particular both the AMD and Intel P-State drivers will use the
> balance_power EPP profile, while for Intel one we also set the energy
> performance bias to 8 (instead of 6).
>
> This release also contains various fixes for the powerprofilesctl command=
 line
> tool when using the launch or version commands.
> The tool is now better documented as we generate a manual page for it (if
> python3-argparse is installed) and bash completions. We're even generatin=
g the
> ZSH completions, but the install path must be provided.
>
> The daemon command line interface has been improved for debugging, so use
> --help-debug for further information.
>
> The systemd service lockdown settings have been restricted even more.
>
> Various code optimizations.
>
> 0.20
> ----
>
> The project has moved under the freedesktop 'Upower' group. The service i=
s
> now advertised as 'org.freedesktop.UPower.PowerProfiles' in addition to t=
he
> previous 'net.hadess.PowerProfiles' for compatibility reasons.
>
> This release adds support for:
>
> * Multiple power-profiles-daemon drivers to load simultaneously.  This no=
tably
>   allows both CPU based control with amd-pstate or intel-pstate as well a=
s
>   ACPI platform profile based control.
>
> * amdgpu panel power savings which uses dedicated hardware in systems wit=
h
>   integrated Radeon graphics to decrease panel power consumption when the
>   system is on battery.
>
> This release also enables the test suite by default, so distribution vend=
ors
> should update packaging accordingly.
>
> 0.13
> ----
>
> This release adds support for the AMD P-State driver that's been added to=
 the
> 6.3 Linux kernel. This release also fixes mismatched profiles on some HP
> laptops and some miscellaneous bug fixes.
>
> 0.12
> ----
>
> This release adds support for the Intel "Energy Performance Bias" feature=
, which
> can be used on hardware that doesn't have a platform_profile or doesn't s=
upport
> HWP. It will also be used to eke out a bit more performance, or power, on=
 systems
> which already supported HWP.
>
> More information is available in the README.
>
> 0.11.1
> ------
>
> This release stops power-profiles-daemon from modifying the cpufreq drive=
r when
> driver when the user/administrator has chosen to disable the Intel P-Stat=
e scaling
> governor (eg. forcing a passive operation mode).
>
> More information is available in the README.
>
> 0.11
> ----
>
> This release fixes problems on Intel machines when the CPUs didn't suppor=
t turbo at
> all, or the performance scaling governor was built as default in the kern=
el.
>
> It also adds better end-user documentation, fixes in the command-line too=
l to not
> cause bug report tools to popup on not-uncommon errors, and a bug fix for=
 running
> on some systems with controllable charge speeds.
>
> 0.10.1
> ------
>
> This release fixes a bug in the authorization codepath added in 0.10.0, w=
here holding
> a profile could still succeed despite having sent a denial to the calling=
 process.
>
> This release also makes the pylint test optional. It should not be used u=
nless the goal
> is to contribute patches to assuage it.
>
> 0.10.0
> ------
>
> This release adds authorization checks for the profile holds and profile =
switching
> features of the backend daemon, through polkit. It is recommended that al=
l
> distributions upgrade to this version as soon as possible.
>
> This release also adds support for the "quiet" kernel platform profile us=
ed
> in some systems.
>
> 0.9.0
> -----
>
> This release adds support for "holding" a power profile while running a t=
ask
> or application, making it possible to switch to a performance profile dur=
ing
> a compilation, or to a power-saver profile when low on battery, reverting=
 to
> the original profile when done.
>
> This release also removes the "inhibited" property for the performance pr=
ofile,
> which made it impossible to switch to that profile, and replaces it with =
the
> "degraded" property which lists why performance is degraded.
>
> Finally, the last used profile is now remembered across reboots.
>
> 0.8.1
> -----
>
> This release works-around a cosmetic issue in gnome-shell animations when
> on battery and using the intel-pstate driver.
>
> 0.8
> ---
>
> This release adds support for the new generic `platform_profile` kernel
> API to replace the Lenovo specific `dytc_perfmode`, meaning it should als=
o
> support profile selection on a number of HP and Microsoft Surface devices=
.
>
> This release also add the `powerprofilesctl` command-line application.
>
> 0.1
> ---
>
> This is the first version of power-profiles-daemon.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../upower/power-profiles-daemon_0.30.bb      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-support/upower/power-profiles-daemon_=
0.30.bb
>
> diff --git a/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb=
 b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
> new file mode 100644
> index 0000000000..687e39145d
> --- /dev/null
> +++ b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "Makes power profiles handling available over D-Bus"
> +HOMEPAGE =3D "https://gitlab.freedesktop.org/upower/power-profile-daemon=
"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +
> +DEPENDS =3D " \
> +    glib-2.0 \
> +    polkit \
> +    upower \
> +    libgudev \
> +"
> +
> +inherit meson pkgconfig systemd features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "polkit"
> +
> +EXTRA_OEMESON =3D "-Dtests=3Dfalse"
> +
> +SRCREV =3D "5b4994c8a91290481bef87a5bae95391d0ec677f"
> +SRC_URI =3D "git://gitlab.freedesktop.org/upower/power-profiles-daemon;b=
ranch=3Dmain;protocol=3Dhttps"
> +S =3D "${WORKDIR}/git"
> +
> +do_install:append() {
> +       install -d ${D}${sysconfdir}/tmpfiles.d
> +       echo "d ${localstatedir}/lib/power-profiles-daemon 700 root root =
- -" > ${D}${sysconfdir}/tmpfiles.d/power-profiles-daemon.conf
> +}
> +
> +do_install:append() {
> +    sed -i -e 's|After=3Dmulti-user.target |After=3D|g' ${D}${systemd_sy=
stem_unitdir}/power-profiles-daemon.service
> +}
> +

there are two appends one after another above. Lets merge them into one.

> +FILES:${PN} +=3D "${sysconfdir}/tmpfiles.d ${datadir}/dbus-1 ${datadir}/=
polkit-1 ${systemd_system_unitdir}"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116214): https://lists.openembedded.org/g/openembedde=
d-devel/message/116214
> Mute This Topic: https://lists.openembedded.org/mt/111891234/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

