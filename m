Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AB0C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 19:13:55 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.19056.1681845225124374930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Apr 2023 12:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ZctqGPoM;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1681845225;
  x=1713381225;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8Pmc/YTn/eNGd7B0O9k1PNSDHiY4Gwg/eWRVLgucaNU=;
  b=ZctqGPoMYJSM/Akev9cfiGWAzsBwM1tRiMpz/JpkmqGqZ5XcRlGXeBgD
   ib3Ph4F4Gb1xI14JGI6I3xpnYmb7ZP146wXKCzAdadJJAZ2Utg0c2fK0M
   Q6GPelQbOjgVhGAVFXCm5hAd6hP0gCB3QEPvXlofwCTHy3jQS47GYZyn2
   Pasa2Bi0PYcugkJ2AiV+DrOWHXXF+y3ZwdBDMkt6ZaZvH5X96ZWmhhvBo
   0HgbGPBFKor1dAqrTIooiUWsORA4ZiOC4qaICpbmX47NXAPA7+TPlbRZi
   xa/LhvgdTLJ3YzupDKKaljLZ2dC2lA976Ez5hlCn+8OkWY3V+yr+wnVtm
   A==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENJ4/183nec4/OuwLx3sYtLxHa2PeWiQSN7I3cMsTKUajHzrwVr3bwsNRRSgiJXjmjSY1jcL9NoEMJmBOoPKErWC8KSROtfhms6GR2QLB3m3E1NgWX/WVMN9EHv01IaMbm9V5L6hChI8dLwg1iHbNBy2KbL3AHcRYWHlv3k2X7y/DTTEV0gQ5/ExX3LkSgxeo+d6wzuTBRCGE6CWZ3JrMCbAEo/MrnFziATsq77dIzupSEuUpI7lE48jF0+6lq8TouqbVciCJM6kx0j8qdw9HszkZuPINwEaPcXORMUrPSRwuQR0t2RMXq+ClC6roG7WlGNtHlyoupQnDDXF9SsfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Pmc/YTn/eNGd7B0O9k1PNSDHiY4Gwg/eWRVLgucaNU=;
 b=iEGoMjJb8QFE5QBvQsian9+xNDhzkYtPjISxPNzgIE7hv0Ytu169oJpXPZXfYO+1BFQJGkeX9JDme9oZ9cv3XpB3Y5Lny5f2j3DjIcScAQvmbqIn6TNOf/fqYy+GiY4dmCiXJXBp1D5w+8o865mJFwxHwQJ+88gsAXis1bKQcgrQKw7uIclB4KFgd1aAqdU0rvkCtTYQhBgkmmNNHyQHXArkd8CL47PQv0Fsk4ArLzwHB7ud4I/2lXJ+sDmeYazo0C1FqkyzicZfDugqofkJhse8pHuv8PgHrqRFXrF5J4hp4H3Ajck90BS+7lmc/5PsOtwHCNLT0+XbUz8KeqXuyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Pmc/YTn/eNGd7B0O9k1PNSDHiY4Gwg/eWRVLgucaNU=;
 b=fn0nDVaMnPib7+zabgOuOhwG2OXBoNZhqNeIacs0yDQkG/2TVqCCGpnMtYI4bHcaLGN3Ohf4jcWwliuhQPyZtvN7tkiTS3Q8wbsIExvQ7v+Uq80MjWbp99F/92BqVMoLnrEjhBopnlXpUP5CVWCKMUpkExwJa7cuUYDWSixsYa8=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-multimedia][PATCH] pipewire: update 0.3.63 -> 0.3.64
Thread-Topic: [oe] [meta-multimedia][PATCH] pipewire: update 0.3.63 -> 0.3.64
Thread-Index: AQHZKkhFf51k5PMrlE2rAdP72i5r7q8x+uyw
Date: Tue, 18 Apr 2023 19:13:39 +0000
Message-ID: <DB5PR02MB1021393A00550A2C83F4B54FFEF9D9@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230117074931.92069-1-f_l_k@t-online.de>
In-Reply-To: <20230117074931.92069-1-f_l_k@t-online.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9992:EE_
x-ms-office365-filtering-correlation-id: 31751dca-fc19-4eab-7a36-08db4041049f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hD5WC31tP2j2WIu6Se/JsvzlNs/qCsMhLuyQSj5cb/mQcB1XX4NvCdwTNNKraIF358KjSHapbxA+NvflfivtMlCltDqVYMey63W21Bi6vfhfiJ6X5jmPDpc//my7jx5S0OnbQMphH0b5wxG5llRctRVCqmkf1U9txJYlGwfhj7roJPiBNuJHVUsw/VilKe8i89BPLC/CJbp3/JFpdeBQgx3XLfeVcOjz7GImjm5cyg8gw6Jtv2SNBpbGxt5JD/lN0DLY/BbrWRqCOG0Vy4FAWwX9bsERzKMdkaUlArzrnpnLG/dd3eil1WVXagJn2wbkb18ibcZH7nQlrDXBtVM8LfDpzgPkveVJjALAPRdQvo3wKU4cqowWSsMr3XgpRldTqsHJ1lhpoMCnWGj3eKFOz/WVaMIEsEP8q3/HiQQwSBq7XlC4xgiS6goADb0k/Ar24P3HDDFUc6QKF2ApOLs+qbM/Da8Z3iMCZk8EUxmJJpem6aQPBxLPo9VPnbQLcFzy+UKOCnfYsCOoNq7Acb8oad3v3pAdp/oJjgCzOkh8r8Kjtk+jcdEHLYN1rt7Y+oLBc+GrUntVhoXC5W+N6hMeCQNE/wkG8DFtGEfxBnBUOw49zWkcN2PPxobcGadCTqx8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(451199021)(9686003)(53546011)(6506007)(26005)(55016003)(186003)(83380400001)(71200400001)(7696005)(5660300002)(478600001)(38100700002)(8676002)(52536014)(316002)(38070700005)(8936002)(86362001)(41300700001)(122000001)(66946007)(64756008)(66446008)(76116006)(6916009)(66556008)(2906002)(4326008)(66476007)(15650500001)(44832011)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b2CfBZyu9F6GxDj8RPacLdcPxBNEN3lJuzBeTVbkqHr+76cT7n1AQmtgce5k?=
 =?us-ascii?Q?LQQam9sJ2AwnpxEe03RI9eBLNSNuLhjBZoimWS8YPRaWG0xat7yeAPxqeRKI?=
 =?us-ascii?Q?MpHLjTSzrlwpSS8baG/fVgDbiBF8hZjYx/VHp4xmjA1bu9+94ATE8joIgnP6?=
 =?us-ascii?Q?7dsbN7XyhiO9Xg9cpyjadQFt/4cLeLgxnNHP7PQT50wx00qbC4sQTaPmKa5D?=
 =?us-ascii?Q?JEpPcYm0HhQBfFxsjZ5vURNC+W/bKp8gWwC3HYjyA518COUJ3vguoYJ2IaSD?=
 =?us-ascii?Q?AvzaCQwdy9d6lo30adA+mSapVVKB/S/ig1sFEXndOkvyayMrrZOA5+mPzWtJ?=
 =?us-ascii?Q?Rb/UmVaV3W0n2xC9UkxNq469o6z1YWiH9ENTROHcidWKVUum3jalr4uN+OFJ?=
 =?us-ascii?Q?dL0ptxi/XWOD8V9fEB4GCD8sw0vQpR9pMFVqhzETI665EdR4icAYtP3zG5k5?=
 =?us-ascii?Q?N2EjsuLbc4nCaJdGJyU1zF0f3NTFRuZZV/O1mqAaS5LyEB4wRDIDll44ynqB?=
 =?us-ascii?Q?NVc8xoHwv/n5ywkysZhgv9DV9VwF8IEzch80UErnZNNSEa1PNxMTJ+390S4U?=
 =?us-ascii?Q?nqUGfvTvMNCbJl9BWWi3P3RGYHHxM2LWZwyu6jerT+Q+wpPBlYjvTPOG7k2e?=
 =?us-ascii?Q?GJBsqTGlxBvSqxcIPWaEB8cYbMDy2rx/CGf4HFmYYHQyrrwWEpg8h+upPqcf?=
 =?us-ascii?Q?V1WrVPgGv2NodzCIWYtOOkb/yOfDdpyHiiN+jerlf5NLOaj8HNJvfdnMwyNT?=
 =?us-ascii?Q?UMVaRtqF5QnPO9Mbtd3Q98hczZY/vsmobs0/cZL7rW/ww3+0hsD0GMZkpOdZ?=
 =?us-ascii?Q?mk6i9BoHNxh0TSHvweiadlogcm1hpKowGVWXGTxaaE74h04mP1nKl2Kkeuwb?=
 =?us-ascii?Q?CYhkhXO3vAngsWWqCHePmCbqGZIPYTOiEBam/mR3Q/FLCGFIfILAV6Vql2Dt?=
 =?us-ascii?Q?LBkoyJ/GwO8+3/L2dbDtHPclqMHzj9RX0jSNEfe3MposUHdAnch22lGku0+Z?=
 =?us-ascii?Q?LpFFEHHIG8lbPlHwtRm5D2ZZIxBCSeHHQMyFuAwSe1fNvUxEJAWuMzrTiRpU?=
 =?us-ascii?Q?IJECVtlDSpI1ulqtaB17lr/zScYKNXW1Q9e8It0uQVKQ+H0VD6XhE+ZtDkdQ?=
 =?us-ascii?Q?z0Qq5Cxjrrytv9lZ91bdSnTVN/UoRvAiHHYXUBCFLKzqElZp0BdQfQPYeI30?=
 =?us-ascii?Q?yha9noz7Bmo5CcNlH+MK9gA+byvKhJ9SnvxDAIP0RFA7ctxb4nFTNwUzWtxQ?=
 =?us-ascii?Q?neAw0WNzDWGiMqxot25FM3pthGtLvXP5/8VUK/SZhxkp3l8d3T/iIaNZOS9C?=
 =?us-ascii?Q?p4cHGbaFeCCAxaHQ5q7aMPWNakzV0V7IlxYw4f2ih/NKSE+CvKI9pETpYUge?=
 =?us-ascii?Q?vUPh0oku4tm8tMXTHdaJTtjJRvhqOnQZ7IshJgjCiU+Ju/6bmE74l5huCGTU?=
 =?us-ascii?Q?lQNl1kMFDuTZJIBAwtDd2dHusQDXyUsZipdPzWtIr1wlT0MRDYe5DZ1qlM1G?=
 =?us-ascii?Q?f1I1kFrLXorfhRNFtzlL80yUbv3NIcKWPjN5u9PidM6JvuxtJNov2tf3EBXd?=
 =?us-ascii?Q?ojJ+f0h6sBr6mJLz1xo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31751dca-fc19-4eab-7a36-08db4041049f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 19:13:39.7146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H8TtRbqqCMw8RYwk1PAv1MQ9GYy+yNdxDyWcZQcgG4P1w5kLKrYfk7LR1RlVOacW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9992
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Apr 2023 19:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102133

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Markus Volk
> Sent: den 17 januari 2023 08:50
> To: openembedded-devel@lists.openembedded.org
> Cc: Markus Volk <f_l_k@t-online.de>
> Subject: [oe] [meta-multimedia][PATCH] pipewire: update 0.3.63 -> 0.3.64
>=20
> This is a bugfix release that is API and ABI compatible with previous
> 0.3.x releases.
>=20
>   - Clear old buffer memory on ports to fix some SIGBUS errors.
>   - It is now possible to assign custom port names to the ports from an
>     adapter. This feature is helpful to those who use a multichannel
>     interface with long-term connections. This way they can label each
>     port with its designation, such as an instrument name or anything els=
e
>     to be displayed in a patchbay or DAW.
>   - Fix some issues with node suspend and quantum and rate calculations.
>   - Fix some regressions in pulse-tunnel and RTP-source adaptive resampli=
ng
>     that could cause synchronization problems.
>   - UCM devices now also have a Pro Audio profile.
>   - NODE_TARGET (with the object.id) is now deprecated, use TARGET_OBJECT
>     (with the object.serial, which is not reused and can avoid races).
>=20
>   - Clear all peer input port buffers when suspending. This fixes some
>     SIGBUS errors when some plugins were using old memory. (#2914)
>   - Fix a case where nodes that were not supposed to be suspended, were
>     kept suspended on a rate change. (#2929)
>   - Fix an error in the quantum and rate calculations that could cause
>     nodes to run with wrong quantum and rates when multiple rates were
>     allowed. (#2925)
>=20
>   - pw-dump will now sort dictionaries to make it easier to compare
>     different outputs.
>   - Improve output of pw-reserve.
>   - pw-loopback uses TARGET_OBJECT so you will need to use the serial
>     id (or better the name) as the target instead of the object id.
>=20
>   - The filter-chain modules has seen some cleanups, refactoring and
>     optimizations in the various DSP functions.
>   - The ROC module now supports setting a custom samplerate.
>   - ROC 0.2.X is now required.
>   - The pulse tunnel and RTP source were not updating the rate field
>     correctly which could cause synchronization problems. (#2891)
>   - The filter-chain now supports an arbitrary number of control
>     properties. (#2933)
>   - It is now possible to assign custom port names to the ports from an
>     adapter with the PW_KEY_NODE_CHANNELNAMES.
>   - Support was added for capture and playback props in echo-cancel.
>     (#2939)
>=20
>   - The ACP code now has an option to set the probe samplerate. (#1599)
>   - UCM devices now also have a Pro Audio profile.
>   - Filtering of Step ranges is now implemented.
>=20
>   - The channel-map is now set correctly on the echo-cancel module.
>   - source_master and sink_master are now correctly handled in module
>     echo-cancel.
>   - Fix a regression in DRAIN where resuming after a DRAIN would fail.
>     This caused problems for espeak. (#2928)
>   - TARGET_OBJECT is now used to make it possible to use the indexes
>     as a target.
>   - ladspa-source and remap-source can now also link to monitors.
>=20
>   - The ALSA plugin now handles the target.object correctly when set to
>     -1. (#2893)
>=20
>   - The v4l2 replacement library now also follows symlinks.
>   - Support for getting and setting controls was added.
>   - Support for G_PARM was added.
>   - The environment variable PIPEWIRE_V4L2_TARGET can be used to force
>     an application onto a specific camera.
>=20
>   - Fix compilation without ldac_abr.
>   - Fix a missing brace in CIND reply. This could cause some devices to
>     fail.
>   - Fix configuration of the initial latency.
>=20
>   - The device provider now supports setting an fd so that it can connect
>     to PipeWire sessions from the portal.
>   - DMABuf support was re-enabled in gstpipewiresrc.
>=20
> Build with support for gsettings and libcamera
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../pipewire/{pipewire_0.3.63.bb =3D> pipewire_0.3.64.bb}     | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.63.bb =
=3D> pipewire_0.3.64.bb} (98%)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.63.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
> similarity index 98%
> rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.63.b=
b
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
> index f7acb8db4..91945ca7d 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.63.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.64.bb
> @@ -13,12 +13,12 @@ LIC_FILES_CHKSUM =3D " \
>=20
>  DEPENDS =3D "dbus ncurses"
>=20
> -SRCREV =3D "5ff00f40b9d3ecfc38305edc27e9c2b01629802c"
> +SRCREV =3D "bba452695eb673461c5cf626eec57728991eadf7"
>  SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=
=3Dmaster;protocol=3Dhttps"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> -inherit meson pkgconfig systemd gettext useradd
> +inherit gsettings meson pkgconfig systemd gettext useradd

Why do you add inherit of gsettings? AFAICT, it is used to run=20
`glib-compile-schemas $D${datadir}/glib-2.0/schemas` when installing/
removing the package. However, pipewire does not install anything in=20
/usr/share/glib-2.0/schemas that I can see. And this now fails (with=20
master of poky and meta-oe) if I add IMAGE_INSTALL:append =3D " pipewire"=20
to my local.conf and build core-image-minimal:

  ERROR: core-image-minimal-1.0-r0 do_rootfs: Postinstall scriptlets of=20
  ['pipewire'] have failed. If the intention is to defer them to first=20
  boot, then please place them into pkg_postinst_ontarget:${PN} ().
  Deferring to first boot via 'exit 1' is no longer supported.

The actual error from log.do_rootfs:

  + glib-compile-schemas .../tmp/work/qemux86_64-poky-linux/core-image-mini=
mal/1.0-r0/rootfs/usr/share/glib-2.0/schemas
  Error opening directory ".../tmp/work/qemux86_64-poky-linux/core-image-mi=
nimal/1.0-r0/rootfs/usr/share/glib-2.0/schemas": No such file or directory

>=20
>  USERADD_PACKAGES =3D "${PN}"
>=20
> @@ -88,7 +88,7 @@ PACKAGECONFIG:class-target ??=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio gtk', 'gsettings=
', '', d)} \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} =
\
>      ${PIPEWIRE_SESSION_MANAGER} \
> -    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer jack libusb pw-cat raop =
sndfile v4l2 udev volume webrtc-echo-cancelling \
> +    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb pw=
-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling libcamera \

Why do you add an unconditional dependency on gsettings here when=20
there is a conditional dependency a couple of lines above?=20
Alternatively, why is the conditional dependency left?

>  "
>=20
>  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> --
> 2.34.1

//Peter

