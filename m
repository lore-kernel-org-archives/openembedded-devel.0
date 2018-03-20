Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D0BA678830
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 22:03:18 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id i9so1178994pgq.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 15:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iq9Ks5S6dXP6ycol8CEA6+vXFE8BfBNqJfHaf+d2F7E=;
	b=vfl4MTNb6IkNsCXYAh/cWfxMEKCzZw+yOgMX/U0TFh+JJDWECdyHCLEm2+2VgbbviO
	B/783sktx7wbj05MhEgv0idxo4yI2tOXsxI/BKVECXK+b5hNSIIvWlYLvHSwc9uXsOuJ
	RvV5qiLxeaK7HuxxYyeCxfqtZE1c+6d/XBKMWTKo+zDHpF02OhgvVzbbgWCuYEmjsaQK
	xlfzdUW1fJwFKpafrQirE/71KsSitV7SEAMymj8P6CgyEDyF5wQVRMmE2wxCBctc6NAq
	hKk5kT+cHK66yzMx/sAV1cWoa3QPX7crX8NZvRRzJgyixdPNbpyPdrWaCtQ9NvSduHKn
	H3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iq9Ks5S6dXP6ycol8CEA6+vXFE8BfBNqJfHaf+d2F7E=;
	b=hMcc2DchwmEwdxOKMmLeB+WuzcRnuK4o762PNtEjMg19+m5iBEICGcPqKLtra4VP4L
	fvNo6wNu6na6H/66EXrGjwbg1O+56cDkO7JNbFv8iiLHstdXRxiEvSCtMk4Q86NBxUyo
	AtBA2nWR1HVeTODpXyw3P/qRM9Y/0NJh2wI26ZxR1+JXfvAYMs+J3suE21s4pnw1t9Kg
	ZhSQjUyOTMmdQqS6FEI4scWdSAMetkI4M1DBE4gVk6P2+gTa6zMTr2lOjM0EromGtYGN
	lbCCh4JmCP7OLE7qtSeBLBh6TjOJoWFKg8RAYbjNiKCiIrlF79Wmnup4BPxlQVmoqgzC
	TeDQ==
X-Gm-Message-State: AElRT7Fcnu2LTWV8Q1gWr24i88xZN6E0Mf9rrNiajLh3fDm/EP8k6jJC
	KrUeA30aJypYXX6Pau6nSwNUpgjxrCV7+spGWmb0fw==
X-Google-Smtp-Source: AG47ELuK8lNdeppptNo2Sd4vinx5RWrmyV4eFxDY6d7rXMFOlQKDtXUzoEW+ht26D/heuaaC+olxdp/Rw5y5wG0Txtg=
X-Received: by 10.101.73.207 with SMTP id t15mr12704471pgs.204.1521583398924; 
	Tue, 20 Mar 2018 15:03:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Tue, 20 Mar 2018 15:02:48 -0700 (PDT)
In-Reply-To: <CALbNGRQniLTF5Rmv7E_4Sj+WU84ovs94b6++=YrFJP6kJEforg@mail.gmail.com>
References: <20180313222055.47545-1-psaavedra@igalia.com>
	<CALbNGRRU1BZis6nTNj_q+gGX1nzvKCxjYpM_Sk7vdcK3km79Gw@mail.gmail.com>
	<CALbNGRQniLTF5Rmv7E_4Sj+WU84ovs94b6++=YrFJP6kJEforg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Mar 2018 15:02:48 -0700
Message-ID: <CAMKF1sqDf7sVcLmor+GdkdBuDFsy1X+4_a9=NMG=r98b3Ks4vw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] networkmanager upgrade to 1.10.6
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
X-List-Received-Date: Tue, 20 Mar 2018 22:03:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 2:57 PM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> On Thu, Mar 15, 2018 at 3:33 PM, Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
>> On Tue, Mar 13, 2018 at 11:20 PM, Pablo Saavedra <psaavedra@igalia.com> =
wrote:
>>> * Upgraded to latest stable version [1]
>>> * Forward-port of the Yocto patches
>>> * Disabled 0004-Define-missing-features-to-cater-for-musl.patch
>>> * This version keeps fixed 'Fixed setting 802-1x.password-raw
>>>   property in nmcli' error. Fixed on 1.6.4 [2].
>>>
>>> References:
>>>
>>> [1] https://cgit.freedesktop.org/NetworkManager/NetworkManager/tree/NEW=
S?h=3Dnm-1-10
>>> [2] https://cgit.freedesktop.org/NetworkManager/NetworkManager/tree/NEW=
S?h=3D1.6.4#n11
>>>
>>> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
>>> ---
>>>  ...adjust-net-headers-for-musl-compatibility.patch |  32 +-
>>>  ...dns-resolved-add-systemd-resolved-backend.patch | 621 -------------=
--------
>>>  ...ed-also-check-for-etc-resolv-conf.systemd.patch |  29 -
>>>  ...o-run-sbin-dhclient-to-get-the-version-nu.patch |  36 --
>>>  ...stemd-xlocale.h-is-dropped-by-newer-glibc.patch |  29 -
>>>  .../0002-Fix-nm-version-macro-includes.patch       |  58 --
>>>  ...et-util.h-Include-linux-sockios.h-on-musl.patch |  14 +-
>>>  ...-string-in-g_dbus_message_new_method_erro.patch |  67 ---
>>>  .../networkmanager/0003-Define-ETH_ALEN.patch      |  10 +-
>>>  ...Define-missing-features-to-cater-for-musl.patch |  41 +-
>>>  ...emove-net-ethernet.h-seems-to-be-over-spe.patch |  44 +-
>>>  ... 0006-check-for-strndupa-before-using-it.patch} |  22 +-
>>>  ...figure.ac-Fix-pkgconfig-sysroot-locations.patch |  25 +
>>>  ...rkmanager_1.4.4.bb =3D> networkmanager_1.10.6.bb} |  21 +-
>>>  14 files changed, 119 insertions(+), 930 deletions(-)
>>>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager=
/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
>>>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager=
/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.pa=
tch
>>>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager=
/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.p=
atch
>>>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager=
/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
>>>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager=
/networkmanager/0002-Fix-nm-version-macro-includes.patch
>>>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager=
/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.p=
atch
>>>  rename meta-networking/recipes-connectivity/networkmanager/networkmana=
ger/{0001-check-for-strndupa-before-using-it.patch =3D> 0006-check-for-strn=
dupa-before-using-it.patch} (77%)
>>>  create mode 100644 meta-networking/recipes-connectivity/networkmanager=
/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.pat=
ch
>>>  rename meta-networking/recipes-connectivity/networkmanager/{networkman=
ager_1.4.4.bb =3D> networkmanager_1.10.6.bb} (81%)
>>>
>>> diff --git a/meta-networking/recipes-connectivity/networkmanager/networ=
kmanager_1.4.4.bb b/meta-networking/recipes-connectivity/networkmanager/net=
workmanager_1.10.6.bb
>>> similarity index 81%
>>> rename from meta-networking/recipes-connectivity/networkmanager/network=
manager_1.4.4.bb
>>> rename to meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.10.6.bb
>>> index d5f456f37..6538e7b82 100644
>>> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_1.4.4.bb
>>> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_1.10.6.bb
>>> @@ -5,7 +5,7 @@ SECTION =3D "net/misc"
>>>  LICENSE =3D "GPLv2+"
>>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ada506640fe950a=
4823b \
>>>                      file://libnm-util/COPYING;md5=3D1c4fa765d6eb3cd2fb=
d84344a1b816cd \
>>> -                    file://docs/api/html/license.html;md5=3D8eb8e72bab=
097b9d11763002cb003697 \
>>> +                    file://docs/api/html/license.html;md5=3D77b9e36269=
0c149da196aefe7712db30 \
>>>  "
>>>
>>>  DEPENDS =3D " \
>>> @@ -20,6 +20,7 @@ DEPENDS =3D " \
>>>      libnewt \
>>>      polkit \
>>>      jansson \
>>> +    curl \
>>>  "
>>>
>>>  inherit gnomebase gettext systemd bluetooth bash-completion vala gobje=
ct-introspection
>>> @@ -27,21 +28,15 @@ inherit gnomebase gettext systemd bluetooth bash-co=
mpletion vala gobject-introsp
>>>  GI_DATA_ENABLED_libc-musl =3D "False"
>>>
>>>  SRC_URI =3D "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/=
NetworkManager-${PV}.tar.xz \
>>> -           file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-versi=
on-nu.patch \
>>> -           file://0002-Fix-nm-version-macro-includes.patch \
>>>             file://0001-adjust-net-headers-for-musl-compatibility.patch=
 \
>>>             file://0002-socket-util.h-Include-linux-sockios.h-on-musl.p=
atch \
>>>             file://0003-Define-ETH_ALEN.patch \
>>> -           file://0004-Define-missing-features-to-cater-for-musl.patch=
 \
>>>             file://0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-ove=
r-spe.patch \
>>> -           file://0001-check-for-strndupa-before-using-it.patch \
>>> -           file://0001-dns-resolved-add-systemd-resolved-backend.patch=
 \
>>> -           file://0001-dns-resolved-also-check-for-etc-resolv-conf.sys=
temd.patch \
>>> -           file://0001-systemd-xlocale.h-is-dropped-by-newer-glibc.pat=
ch \
>>> -           file://0002-user-format-string-in-g_dbus_message_new_method=
_erro.patch \
>>> +           file://0006-check-for-strndupa-before-using-it.patch \
>>> +           file://0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locati=
ons.patch \
>>>             "
>>> -SRC_URI[md5sum] =3D "63f1e0d6d7e9099499d062c84c927a75"
>>> -SRC_URI[sha256sum] =3D "829378f318cc008d138a23ca6a9191928ce75344e7e47a=
2f2c35f4ac82133309"
>>> +SRC_URI[md5sum] =3D "de3c7147a693da6f80eb22f126086a14"
>>> +SRC_URI[sha256sum] =3D "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182=
aaec8aad16481fac76"
>>>
>>>  S =3D "${WORKDIR}/NetworkManager-${PV}"
>>>
>>> @@ -49,6 +44,7 @@ EXTRA_OECONF =3D " \
>>>      --disable-ifcfg-rh \
>>>      --disable-ifnet \
>>>      --disable-ifcfg-suse \
>>> +    --disable-introspection \
>> ^ Why disable introspection?
>>>      --disable-more-warnings \
>>>      --with-iptables=3D${sbindir}/iptables \
>>>      --with-tests \
>>> @@ -73,7 +69,6 @@ PACKAGECONFIG[systemd] =3D " \
>>>  PACKAGECONFIG[bluez5] =3D "--enable-bluez5-dun,--disable-bluez5-dun,bl=
uez5"
>>>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
>>>  PACKAGECONFIG[consolekit] =3D "--with-session-tracking=3Dconsolekit,,c=
onsolekit,consolekit"
>>> -PACKAGECONFIG[concheck] =3D "--with-libsoup=3Dyes,--with-libsoup=3Dno,=
libsoup-2.4"
>>>  PACKAGECONFIG[modemmanager] =3D "--with-modem-manager-1=3Dyes,--with-m=
odem-manager-1=3Dno,modemmanager"
>>>  PACKAGECONFIG[ppp] =3D "--enable-ppp,--disable-ppp,ppp,ppp"
>>>  # Use full featured dhcp client instead of internal one
>>> @@ -101,6 +96,8 @@ FILES_${PN} +=3D " \
>>>      ${libexecdir} \
>>>      ${libdir}/pppd/*/nm-pppd-plugin.so \
>>>      ${libdir}/NetworkManager/*.so \
>>> +    ${libdir}/NetworkManager/VPN \
>>> +    ${libdir}/NetworkManager/conf.d \
>>>      ${datadir}/polkit-1 \
>>>      ${datadir}/dbus-1 \
>>>      ${base_libdir}/udev/* \
>>> --
>>> 2.11.0
>>>
> Just build tested this patch: It breaks networkmanager-applet. From
> the first glance it seems error is caused by missing introspection -
> but I have to update nm-applet to check further.
>
> Suggestion: I take care of nm-applet-update/introspection (based on
> this patch - or do you have V2 close to send?)  and you (and/or Khem)
> take care of musl?

I can help with musl once we have other regressions fixed.

>
> Andreas

