Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2495.1794370506279513397
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 20:15:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YOEjLPWk;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67c00f291e1so2079445d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 20:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794370505; cv=none;
        d=google.com; s=arc-20260327;
        b=gdReoUnyK+MNuHz98/vZrdNIx2sKmZRvCJs50TpLLxHpoQZwkQKot+5M6ru80mUbMH
         sd2FGnbQaaaMfkdXMZW6GOxGavhmfCbwaFu6mMzDulYzgLkm6fuTtruk+5Usvhwx6RXI
         ymq3pltT61l1NpXHcbHvvN3FW+sd/2aSX8Nv/oG73BVXnzWA/ozMpPJXbvKv1TZyJ/rX
         6Z4buz+HzprSl+CZZZpdir+6tgcgnGgmIjrVBetdIVyKuXrRizss2k8+i9qNvQogL0Sl
         44w/7U5v5ZQEclkIt3wj6RqcpfHZ02z4/8+qCaXq6lReVc6lfeA50KP2bpduDJus4/2D
         wN/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eB/hw0a7emfLDw4MzJ2mif0kFwxz+4qCld+dnbHXAMo=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=FMXvr8LRkAYdGu8N3TdUsbDTjQ0oe2Bj0tI8Bj4gLdq9lXuw3qI4Dyg9L6M7diXB40
         X3Sj8WF8y9rmWNZuTyVtVpIsAFwuoCFxFrVm4fwkhpiZrcktULBZKH80aTCPuckiyqPF
         dPWupHa92DNODoe0AA5BpHtOJWsWMuMp67j2xGC0Fz1bDhriDYEhxL6YSBi4df6BpRz2
         cs1ssk3IVyV4SNDT6wYayq0Rc5KP5/gSijV5JWT1to54X0vplY9jFWDSaISn8I+c9fH4
         Y44h2POnSG2V2eoF61ikD7kSGZpAzI8sTtHzua/J6JKAZo0kEVgqS1Wdp0yiR406VcHK
         0tAQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370505; x=1794975305; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eB/hw0a7emfLDw4MzJ2mif0kFwxz+4qCld+dnbHXAMo=;
        b=YOEjLPWkqPSRbUQtWZiVp5KtuK853YgsEpKWUbsnFiHqSTFx1EYMP9o1jzT0ZO/GY3
         aG8vwSQDEc+ER9i+UyloyJd/UybzYQp/ZowbitQt0/7o2HOruiw4/2/Ve7qlVMUiEpf6
         BOHPW+iXboYw6zd8b8JBD6PfxCAPO0sppO52v++pV5EzPITF197FZNyxdD8l+PphBXJk
         syk4CfZa2tKoVE3wwItA/o3BLnnEWxiul+AGo9KF19+owmBK+AF42qluOBPesTEenPgC
         +S9c1wQlRTD9KwHwgGoz0KsJwJA3N4/N2HyBmCmAlcAtHq0h1QSc5BblrHCd4PysBJA6
         tMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370505; x=1794975305;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eB/hw0a7emfLDw4MzJ2mif0kFwxz+4qCld+dnbHXAMo=;
        b=viBwHI7FPCDn3xu3Vsd4aGQLoj46CX73I6B2yAnKzGzv/8R58dn5I53sdmPYt2TAU8
         ZOeuGaVyVAXfST3EgZL27/7ncGdfDDDe1g0pYlkEH3JjDJ0JqNSt4tjXrZkklRDmSrsf
         glWHxK85OGybKND0oSuJuBv3UT7PJOX10NACYAaGP+wJFnEVB6+EIMYi1uVLk9Qh3taC
         QU2stVTdYx6XwU1cnI8w04DXf9g0Aa1hZN0v/Fb+scn8vbVrYm/MTQq1dEurh0OraStu
         8534PNPYjla8aPYpsmEWVPWyasFymT73Dt5SnE+uBJyZ/xmr0DQDzg+8Tj+GyX//i6EN
         gR2g==
X-Gm-Message-State: APuU4Z/lEJPcGeyS6rxd04SvwBP8nb85usQSGilPnVFa9hyLNDbwCvsf
	kFSHyLY4ZuVcFovT7h4hPo5owuIJTMdr9xroNYMIHhjE0nWa7fCEJnDT6cC/TXgsuxJlfJ3BaFJ
	MIaiKG8HeNXegmHnfZ+hLhdFXVvsE2Hd/LItC/zo=
X-Gm-Gg: AYBFou1NzNGHeTizOgirkNFyGwon4daE897hwuIlHrrAJ7Z673SPPLIDhBAU+gAw4mn
	9ZEGRbG8ya6hY4oeFYXWhVokvCOA0UyC+hsbQt8L8dJoROMyRaQynSNO2qM6KUCTYUxfokoRZ6D
	W+HZ5M78pnqO/xDBbnS9+PLDLe2D2Y8UYC1fKPHvI6yCnobJ4UVmo3cf5g6RsyEzyMugdcHVpZ5
	wQ0NCs0WmoLMtzg/wLKwJv6wpFOBvm/3TXt4r76nOBhrx1ocqxAm04W09WVTekXbTQ2rScdWoFx
	3R/cWUOcVXI3TLlGjB3NpqV2hnpkWZW10bCkc6yj95LLjym/7oUnofB0mEbyl0TzD4O5gnKjcG5
	mmPCA1wURnE9ww2FrDEZY4xj5vl2MY7kMn55Ag6ibrggm81xNlwyOuV8ax9gvP/+n5wvwe6m/Ho
	nALbtRg1/FWA4lhdSlxlfpNQH+lZxvnWfOCNz/kEvdkYejA6DcN+Gd3uNvsAaeNYKyBAoK+Rjz1
	QjVJvcu72/VYeKCqczf+50KNwh2pQbpZmeMhomEIx6PKYt+diw354MNghKThHWFeOVlEopY91C/
	sOH7aQVu58IGCrv4Ip0PvQ+1mmRn8laxNBYi/etQEdIoR34TIirURnV98v4DqzD6SIiL0mmPPk8
	hsoJMzrrgLJo=
X-Received: by 2002:a05:690e:4885:10b0:679:be6b:42d5 with SMTP id
 956f58d0204a3-67c68060dcemr545380d50.98.1794370504931; Tue, 10 Nov 2026
 20:15:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1794302275.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1794302275.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Nov 2026 20:14:38 -0800
X-Gm-Features: AclHuK85tlh2cwF0JdxTbl1rC-6vTo5njZvaM5xOkBmMoqoPMSXZmlBIm8ER5Pg
Message-ID: <CAMKF1srvOg0_ayDvTvHhyaBOPEA4uscnPEjOnVsq4WZUP3EQ6A@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/74] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008abeef065ff8704d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 04:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132111

--0000000000008abeef065ff8704d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

applied, thanks Anuj

On Tue, Nov 10, 2026 at 1:23=E2=80=AFAM Anuj Mittal via openembedded-devel
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in wrynose. Tested locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1946
>
> The following changes since commit
> c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e:
>
>   frr: Fix native clippy failing to load libatomic.so.1 (2026-10-29
> 10:19:10 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to c0fcd7cca3760ef24e087ac4a31b8f357cb204da:
>
>   pgpool2: 4.6.4 -> 4.6.6 (2026-11-09 11:17:15 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (23):
>   zchunk: upgrade 1.5.4 -> 1.5.5
>   wireshark: upgrade 4.6.8 -> 4.6.9
>   crow: upgrade 1.3.2 -> 1.3.3
>   crow: upgrade 1.3.3 -> 1.3.4
>   hdf5: patch CVE-2026-19026, CVE-2026-19027 and CVE-2026-19028
>   hdf5: patch CVE-2026-19023 and CVE-2026-19024
>   hdf5: patch CVE-2026-120689
>   hdf5: patch CVE-2026-120754 and CVE-2026-120755
>   hdf5: patch CVE-2026-120756
>   hdf5: patch CVE-2026-120757
>   hdf5: patch CVE-2026-120758
>   libgphoto2: patch CVE-2026-120451
>   libgphoto2: patch CVE-2026-120452
>   smarty: upgrade 5.8.4 -> 5.8.5
>   valkey: upgrade 9.0.6 -> 9.0.7
>   uriparser: upgrade 1.0.2 -> 1.0.3
>   python3-django: upgrade 6.0.9 -> 6.0.10
>   python3-django: upgrade 5.2.18 -> 5.2.19
>   mtr: patch CVE-2026-14461
>   libvncserver: patch CVE-2026-44988
>   libmspack: patch CVE-2026-110602
>   ndpi: patch CVE-2026-116744
>   ncp: ignore CVE-2025-14577 and CVE-2026-35087
>
> Ashishkumar Parmar (1):
>   nmap: Fix CVE-2026-72712
>
> Darsh Kelaiya (10):
>   libhtml-parser-perl: fix CVE-2026-8829
>   ntfs-3g-ntfsprogs: fix CVE-2026-56135
>   ntfs-3g-ntfsprogs: mark CVE-2026-56136 as fixed
>   python3-aiohttp: fix CVE-2026-111066
>   python3-aiohttp: fix CVE-2026-111750
>   python3-aiohttp: fix CVE-2026-111749
>   python3-aiohttp: fix CVE-2026-111065
>   python3-aiohttp: fix CVE-2026-111748
>   python3-aiohttp: fix CVE-2026-111063
>   python3-aiohttp: fix CVE-2026-111064
>
> Hetvi Thakar (21):
>   nginx: fix CVE-2026-95101
>   nginx: fix CVE-2026-97629
>   nginx: fix CVE-2026-15176
>   python3-virtualenv: fix CVE-2026-102938
>   python3-virtualenv: fix CVE-2026-102930
>   python3-virtualenv: fix CVE-2026-102925
>   python3-virtualenv: fix CVE-2026-113732
>   python3-virtualenv: fix CVE-2026-113776
>   python3-virtualenv: fix CVE-2026-113726
>   python3-virtualenv: fix CVE-2026-113725
>   python3-virtualenv: fix CVE-2026-113723
>   python3-virtualenv: fix CVE-2026-113715
>   python3-virtualenv: fix CVE-2026-113720
>   python3-virtualenv: fix CVE-2026-113719
>   python3-virtualenv: fix CVE-2026-113721
>   python3-virtualenv: fix CVE-2026-113716
>   python3-virtualenv: fix CVE-2026-113722
>   python3-virtualenv: fix CVE-2026-113713
>   python3-virtualenv: Ignore CVE-2026-102937
>   python3-virtualenv: Ignore CVE-2026-113718
>   python3-virtualenv: Ignore CVE-2026-113724
>
> Jason Schonberg (1):
>   nodejs: 22.23.3 -> 22.23.4
>
> Khem Raj (3):
>   fwupd-efi: Use the cross linker instead of the host ld.bfd
>   clight: Fix build with musl
>   fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE
>
> Kris Gavvala (1):
>   python3-pillow: patch CVE-2026-112393
>
> Markus Volk (1):
>   mpv: fix a file descriptor leak in the render API
>
> Nate Kent (1):
>   nng: correct upstream branch name
>
> Peter Marko (1):
>   libwebsockets: patch CVE-2026-114550
>
> Poornima Lokesh (1):
>   mariadb: upgrade 11.4.12 -> 11.4.13
>
> Wang Mingyu (2):
>   zchunk: upgrade 1.5.3 -> 1.5.4
>   pgpool2: 4.6.4 -> 4.6.6
>
> Yogita Urade (8):
>   python3-tornado: Fix CVE-2026-103261
>   python3-tornado: Fix CVE-2026-103262
>   python3-tornado: Fix CVE-2026-103263
>   python3-tornado: Fix CVE-2026-115927
>   python3-tornado: Fix CVE-2026-116577
>   python3-tornado: Fix CVE-2026-116578
>   python3-pymongo: Fix CVE-2026-88029
>   python3-pymongo: Fix CVE-2026-106435
>
>  ...72_CVE-2026-42617_CVE-2026-56136_p1.patch} |    2 +-
>  ...72_CVE-2026-42617_CVE-2026-56136_p2.patch} |    2 +-
>  ...72_CVE-2026-42617_CVE-2026-56136_p3.patch} |    2 +-
>  .../files/CVE-2026-56135_p1.patch             |  140 ++
>  .../files/CVE-2026-56135_p2.patch             |   36 +
>  .../files/CVE-2026-56135_p3.patch             |  203 +++
>  .../files/CVE-2026-56135_p4.patch             |   94 ++
>  .../ntfs-3g-ntfsprogs_2022.10.3.bb            |   10 +-
>  ...nclude-fcntl.h-for-open-and-O_-flags.patch |   27 +
>  .../recipes-multimedia/clight/clight_4.11.bb  |    1 +
>  .../recipes-connectivity/nanomsg/nng_1.11.bb  |    2 +-
>  .../mtr/mtr/CVE-2026-14461.patch              |   32 +
>  .../recipes-support/mtr/mtr_0.96.bb           |    4 +-
>  .../recipes-support/ncp/ncp_1.2.4.bb          |    3 +
>  .../ntopng/files/CVE-2026-116744.patch        |   33 +
>  .../recipes-support/ntopng/ndpi_5.0.bb        |    1 +
>  .../{pgpool2_4.6.4.bb =3D> pgpool2_4.6.6.bb}    |    4 +-
>  ...{wireshark_4.6.8.bb =3D> wireshark_4.6.9.bb} |    2 +-
>  meta-oe/recipes-bsp/fwupd/fwupd-efi_1.8.bb    |   10 +
>  .../libwebsockets/CVE-2026-114550.patch       |   31 +
>  .../libwebsockets/libwebsockets_4.5.8.bb      |    1 +
>  ...e_11.4.12.bb =3D> mariadb-native_11.4.13.bb} |    0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |    4 +-
>  ...b11be28ae9b2432b2a661bf38a197cf9514d.patch |   52 -
>  ...{mariadb_11.4.12.bb =3D> mariadb_11.4.13.bb} |    0
>  .../{nodejs_22.23.3.bb =3D> nodejs_22.23.4.bb}  |    2 +-
>  .../{valkey_9.0.6.bb =3D> valkey_9.0.7.bb}      |    2 +-
>  .../gphoto2/libgphoto2/CVE-2026-120451.patch  |   43 +
>  .../gphoto2/libgphoto2/CVE-2026-120452.patch  |   40 +
>  .../gphoto2/libgphoto2_2.5.33.bb              |    2 +
>  .../libvncserver/CVE-2026-44988.patch         |   71 +
>  .../libvncserver/libvncserver_0.9.15.bb       |    1 +
>  ...equire-swap_buffers-param-for-FenceS.patch |   35 +
>  .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |    5 +-
>  .../nmap/files/CVE-2026-72712.patch           |   50 +
>  meta-oe/recipes-security/nmap/nmap_7.95.bb    |    1 +
>  .../libmspack/CVE-2026-110602.patch           |   41 +
>  .../cabextract/libmspack_0.11alpha.bb         |    4 +-
>  .../crow/{crow_1.3.2.bb =3D> crow_1.3.4.bb}     |    2 +-
>  ...-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch |   43 +
>  meta-oe/recipes-support/fftw/fftw_3.3.11.bb   |    1 +
>  .../hdf5/files/CVE-2026-120689.patch          |   60 +
>  .../CVE-2026-120754-CVE-2026-120755.patch     |  172 +++
>  .../hdf5/files/CVE-2026-120756.patch          |   45 +
>  .../hdf5/files/CVE-2026-120757.patch          |   63 +
>  .../hdf5/files/CVE-2026-120758.patch          |  143 ++
>  .../files/CVE-2026-19023-CVE-2026-19024.patch |  176 +++
>  ...-19026-CVE-2026-19027-CVE-2026-19028.patch |  579 ++++++++
>  meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |    7 +
>  .../{smarty_5.8.4.bb =3D> smarty_5.8.5.bb}      |    2 +-
>  ...{uriparser_1.0.2.bb =3D> uriparser_1.0.3.bb} |    2 +-
>  .../{zchunk_1.5.3.bb =3D> zchunk_1.5.5.bb}      |    4 +-
>  .../libhtml/files/CVE-2026-8829.patch         |  127 ++
>  .../libhtml/libhtml-parser-perl_3.83.bb       |    4 +-
>  .../python3-aiohttp/CVE-2026-111063_p1.patch  |  137 ++
>  .../python3-aiohttp/CVE-2026-111063_p2.patch  |  244 ++++
>  .../python3-aiohttp/CVE-2026-111064.patch     |  285 ++++
>  .../python3-aiohttp/CVE-2026-111065.patch     |  176 +++
>  .../python3-aiohttp/CVE-2026-111066_p1.patch  |  400 ++++++
>  .../python3-aiohttp/CVE-2026-111066_p2.patch  |   57 +
>  .../python3-aiohttp/CVE-2026-111748_p1.patch  |  376 +++++
>  .../python3-aiohttp/CVE-2026-111748_p2.patch  |  282 ++++
>  .../python3-aiohttp/CVE-2026-111749.patch     |  205 +++
>  .../python3-aiohttp/CVE-2026-111750.patch     |   83 ++
>  .../python/python3-aiohttp_3.13.5.bb          |   10 +
>  ...ngo_5.2.18.bb =3D> python3-django_5.2.19.bb} |    2 +-
>  ...ango_6.0.9.bb =3D> python3-django_6.0.10.bb} |    2 +-
>  .../python3-pillow/CVE-2026-112393.patch      |  124 ++
>  .../python/python3-pillow_12.2.0.bb           |    1 +
>  .../CVE-2026-106435-regression.patch          |   92 ++
>  .../python3-pymongo/CVE-2026-106435.patch     |  122 ++
>  .../python3-pymongo/CVE-2026-88029.patch      | 1255 +++++++++++++++++
>  .../python/python3-pymongo_4.16.0.bb          |    5 +
>  .../python3-tornado/CVE-2026-103261.patch     |   98 ++
>  .../python3-tornado/CVE-2026-103262.patch     | 1117 +++++++++++++++
>  .../CVE-2026-103263-dependent.patch           |  255 ++++
>  .../python3-tornado/CVE-2026-103263.patch     |  422 ++++++
>  .../python3-tornado/CVE-2026-115927.patch     |  397 ++++++
>  .../python3-tornado/CVE-2026-116577_p1.patch  |  195 +++
>  .../python3-tornado/CVE-2026-116577_p2.patch  |   99 ++
>  .../python3-tornado/CVE-2026-116577_p3.patch  |  101 ++
>  .../python3-tornado/CVE-2026-116578_p1.patch  |   62 +
>  .../python3-tornado/CVE-2026-116578_p2.patch  |  106 ++
>  .../python3-tornado/CVE-2026-116578_p3.patch  |  192 +++
>  .../python/python3-tornado_6.5.7.bb           |   11 +
>  .../python3-virtualenv/CVE-2026-102925.patch  |  296 ++++
>  .../CVE-2026-102930-dependent.patch           |  115 ++
>  .../CVE-2026-102930_p1.patch                  |  309 ++++
>  .../CVE-2026-102930_p2.patch                  |  293 ++++
>  .../CVE-2026-102930_p3.patch                  |  777 ++++++++++
>  .../python3-virtualenv/CVE-2026-102938.patch  |  141 ++
>  .../python3-virtualenv/CVE-2026-113713.patch  |  113 ++
>  .../python3-virtualenv/CVE-2026-113715.patch  |  165 +++
>  .../python3-virtualenv/CVE-2026-113716.patch  |  208 +++
>  .../python3-virtualenv/CVE-2026-113719.patch  |  207 +++
>  .../python3-virtualenv/CVE-2026-113720.patch  |  156 ++
>  .../python3-virtualenv/CVE-2026-113721.patch  |  477 +++++++
>  .../CVE-2026-113722_p1.patch                  |  262 ++++
>  .../CVE-2026-113722_p2.patch                  |   50 +
>  .../python3-virtualenv/CVE-2026-113723.patch  |  233 +++
>  .../python3-virtualenv/CVE-2026-113725.patch  |   88 ++
>  .../CVE-2026-113726-dependent.patch           |  168 +++
>  .../python3-virtualenv/CVE-2026-113726.patch  |  149 ++
>  .../CVE-2026-113732_p1.patch                  |  116 ++
>  .../CVE-2026-113732_p2.patch                  |  120 ++
>  .../python3-virtualenv/CVE-2026-113776.patch  |  133 ++
>  .../python3-virtualenv/CVE-2026-115586.patch  |  526 +++++++
>  .../python/python3-virtualenv_21.2.1.bb       |   31 +
>  .../nginx/files/CVE-2026-15176.patch          |   54 +
>  .../nginx/files/CVE-2026-95101.patch          |   68 +
>  .../nginx/files/CVE-2026-97629.patch          |   45 +
>  .../recipes-httpd/nginx/nginx_1.28.3.bb       |    3 +
>  .../recipes-httpd/nginx/nginx_1.29.7.bb       |    3 +
>  113 files changed, 14565 insertions(+), 77 deletions(-)
>  rename
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46=
572_CVE-2026-42617_p1.patch
> =3D> CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch} (97%)
>  rename
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46=
572_CVE-2026-42617_p2.patch
> =3D> CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch} (98%)
>  rename
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46=
572_CVE-2026-42617_p3.patch
> =3D> CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch} (96%)
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-561=
35_p1.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-561=
35_p2.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-561=
35_p3.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-561=
35_p4.patch
>  create mode 100644
> meta-multimedia/recipes-multimedia/clight/clight/0001-log-Include-fcntl.h=
-for-open-and-O_-flags.patch
>  create mode 100644
> meta-networking/recipes-support/mtr/mtr/CVE-2026-14461.patch
>  create mode 100644
> meta-networking/recipes-support/ntopng/files/CVE-2026-116744.patch
>  rename meta-networking/recipes-support/pgpool2/{pgpool2_4.6.4.bb =3D>
> pgpool2_4.6.6.bb} (92%)
>  rename meta-networking/recipes-support/wireshark/{wireshark_4.6.8.bb =3D=
>
> wireshark_4.6.9.bb} (97%)
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.=
patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.12.bb =3D>
> mariadb-native_11.4.13.bb} (100%)
>  delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2432b2a661bf38a197cf9514=
d.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.12.bb =3D>
> mariadb_11.4.13.bb} (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.3.bb =3D>
> nodejs_22.23.4.bb} (99%)
>  rename meta-oe/recipes-extended/valkey/{valkey_9.0.6.bb =3D>
> valkey_9.0.7.bb} (98%)
>  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120451.patch
>  create mode 100644
> meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-120452.patch
>  create mode 100644
> meta-oe/recipes-graphics/libvncserver/libvncserver/CVE-2026-44988.patch
>  create mode 100644
> meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl-context-require-swap_b=
uffers-param-for-FenceS.patch
>  create mode 100644
> meta-oe/recipes-security/nmap/files/CVE-2026-72712.patch
>  create mode 100644
> meta-oe/recipes-support/cabextract/libmspack/CVE-2026-110602.patch
>  rename meta-oe/recipes-support/crow/{crow_1.3.2.bb =3D> crow_1.3.4.bb}
> (92%)
>  create mode 100644
> meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE=
-on-Linux.patch
>  create mode 100644
> meta-oe/recipes-support/hdf5/files/CVE-2026-120689.patch
>  create mode 100644
> meta-oe/recipes-support/hdf5/files/CVE-2026-120754-CVE-2026-120755.patch
>  create mode 100644
> meta-oe/recipes-support/hdf5/files/CVE-2026-120756.patch
>  create mode 100644
> meta-oe/recipes-support/hdf5/files/CVE-2026-120757.patch
>  create mode 100644
> meta-oe/recipes-support/hdf5/files/CVE-2026-120758.patch
>  create mode 100644
> meta-oe/recipes-support/hdf5/files/CVE-2026-19023-CVE-2026-19024.patch
>  create mode 100644
> meta-oe/recipes-support/hdf5/files/CVE-2026-19026-CVE-2026-19027-CVE-2026=
-19028.patch
>  rename meta-oe/recipes-support/smarty/{smarty_5.8.4.bb =3D> smarty_5.8.5=
.bb}
> (96%)
>  rename meta-oe/recipes-support/uriparser/{uriparser_1.0.2.bb =3D>
> uriparser_1.0.3.bb} (91%)
>  rename meta-oe/recipes-support/zchunk/{zchunk_1.5.3.bb =3D> zchunk_1.5.5=
.bb}
> (81%)
>  create mode 100644
> meta-perl/recipes-perl/libhtml/files/CVE-2026-8829.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p1.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111063_p2.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111064.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111065.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p1.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111066_p2.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p1.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111748_p2.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111749.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-111750.patch
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.18.bb =3D=
>
> python3-django_5.2.19.bb} (70%)
>  rename meta-python/recipes-devtools/python/{python3-django_6.0.9.bb =3D>
> python3-django_6.0.10.bb} (79%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regre=
ssion.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-88029.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103261.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103262.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263-depen=
dent.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-103263.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-115927.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p1.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p2.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116577_p3.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p1.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p2.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-116578_p3.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102925.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930-de=
pendent.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p1=
.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p2=
.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102930_p3=
.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-102938.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113713.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113715.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113716.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113719.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113720.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113721.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p1=
.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113722_p2=
.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113723.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113725.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726-de=
pendent.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113726.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p1=
.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113732_p2=
.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-113776.pa=
tch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-115586.pa=
tch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-15176.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-95101.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-97629.patch
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132072):
> https://lists.openembedded.org/g/openembedded-devel/message/132072
> Mute This Topic: https://lists.openembedded.org/mt/122190999/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008abeef065ff8704d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">applied, thanks Anuj</div><br><div class=3D"gmail_quote gm=
ail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 10, =
2026 at 1:23=E2=80=AFAM Anuj Mittal via openembedded-devel &lt;anuj.mittal=
=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.=
com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Please merge these changes in wrynose. Tested loc=
ally and on autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1946" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1946</a><br>
<br>
The following changes since commit c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e=
:<br>
<br>
=C2=A0 frr: Fix native clippy failing to load libatomic.so.1 (2026-10-29 10=
:19:10 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/wrynose<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/wrynose" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/meta-openembedded-contrib/log/?h=3Danujm/wrynose</a><br>
<br>
for you to fetch changes up to c0fcd7cca3760ef24e087ac4a31b8f357cb204da:<br=
>
<br>
=C2=A0 pgpool2: 4.6.4 -&gt; 4.6.6 (2026-11-09 11:17:15 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (23):<br>
=C2=A0 zchunk: upgrade 1.5.4 -&gt; 1.5.5<br>
=C2=A0 wireshark: upgrade 4.6.8 -&gt; 4.6.9<br>
=C2=A0 crow: upgrade 1.3.2 -&gt; 1.3.3<br>
=C2=A0 crow: upgrade 1.3.3 -&gt; 1.3.4<br>
=C2=A0 hdf5: patch CVE-2026-19026, CVE-2026-19027 and CVE-2026-19028<br>
=C2=A0 hdf5: patch CVE-2026-19023 and CVE-2026-19024<br>
=C2=A0 hdf5: patch CVE-2026-120689<br>
=C2=A0 hdf5: patch CVE-2026-120754 and CVE-2026-120755<br>
=C2=A0 hdf5: patch CVE-2026-120756<br>
=C2=A0 hdf5: patch CVE-2026-120757<br>
=C2=A0 hdf5: patch CVE-2026-120758<br>
=C2=A0 libgphoto2: patch CVE-2026-120451<br>
=C2=A0 libgphoto2: patch CVE-2026-120452<br>
=C2=A0 smarty: upgrade 5.8.4 -&gt; 5.8.5<br>
=C2=A0 valkey: upgrade 9.0.6 -&gt; 9.0.7<br>
=C2=A0 uriparser: upgrade 1.0.2 -&gt; 1.0.3<br>
=C2=A0 python3-django: upgrade 6.0.9 -&gt; 6.0.10<br>
=C2=A0 python3-django: upgrade 5.2.18 -&gt; 5.2.19<br>
=C2=A0 mtr: patch CVE-2026-14461<br>
=C2=A0 libvncserver: patch CVE-2026-44988<br>
=C2=A0 libmspack: patch CVE-2026-110602<br>
=C2=A0 ndpi: patch CVE-2026-116744<br>
=C2=A0 ncp: ignore CVE-2025-14577 and CVE-2026-35087<br>
<br>
Ashishkumar Parmar (1):<br>
=C2=A0 nmap: Fix CVE-2026-72712<br>
<br>
Darsh Kelaiya (10):<br>
=C2=A0 libhtml-parser-perl: fix CVE-2026-8829<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-56135<br>
=C2=A0 ntfs-3g-ntfsprogs: mark CVE-2026-56136 as fixed<br>
=C2=A0 python3-aiohttp: fix CVE-2026-111066<br>
=C2=A0 python3-aiohttp: fix CVE-2026-111750<br>
=C2=A0 python3-aiohttp: fix CVE-2026-111749<br>
=C2=A0 python3-aiohttp: fix CVE-2026-111065<br>
=C2=A0 python3-aiohttp: fix CVE-2026-111748<br>
=C2=A0 python3-aiohttp: fix CVE-2026-111063<br>
=C2=A0 python3-aiohttp: fix CVE-2026-111064<br>
<br>
Hetvi Thakar (21):<br>
=C2=A0 nginx: fix CVE-2026-95101<br>
=C2=A0 nginx: fix CVE-2026-97629<br>
=C2=A0 nginx: fix CVE-2026-15176<br>
=C2=A0 python3-virtualenv: fix CVE-2026-102938<br>
=C2=A0 python3-virtualenv: fix CVE-2026-102930<br>
=C2=A0 python3-virtualenv: fix CVE-2026-102925<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113732<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113776<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113726<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113725<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113723<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113715<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113720<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113719<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113721<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113716<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113722<br>
=C2=A0 python3-virtualenv: fix CVE-2026-113713<br>
=C2=A0 python3-virtualenv: Ignore CVE-2026-102937<br>
=C2=A0 python3-virtualenv: Ignore CVE-2026-113718<br>
=C2=A0 python3-virtualenv: Ignore CVE-2026-113724<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 nodejs: 22.23.3 -&gt; 22.23.4<br>
<br>
Khem Raj (3):<br>
=C2=A0 fwupd-efi: Use the cross linker instead of the host ld.bfd<br>
=C2=A0 clight: Fix build with musl<br>
=C2=A0 fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE<br>
<br>
Kris Gavvala (1):<br>
=C2=A0 python3-pillow: patch CVE-2026-112393<br>
<br>
Markus Volk (1):<br>
=C2=A0 mpv: fix a file descriptor leak in the render API<br>
<br>
Nate Kent (1):<br>
=C2=A0 nng: correct upstream branch name<br>
<br>
Peter Marko (1):<br>
=C2=A0 libwebsockets: patch CVE-2026-114550<br>
<br>
Poornima Lokesh (1):<br>
=C2=A0 mariadb: upgrade 11.4.12 -&gt; 11.4.13<br>
<br>
Wang Mingyu (2):<br>
=C2=A0 zchunk: upgrade 1.5.3 -&gt; 1.5.4<br>
=C2=A0 pgpool2: 4.6.4 -&gt; 4.6.6<br>
<br>
Yogita Urade (8):<br>
=C2=A0 python3-tornado: Fix CVE-2026-103261<br>
=C2=A0 python3-tornado: Fix CVE-2026-103262<br>
=C2=A0 python3-tornado: Fix CVE-2026-103263<br>
=C2=A0 python3-tornado: Fix CVE-2026-115927<br>
=C2=A0 python3-tornado: Fix CVE-2026-116577<br>
=C2=A0 python3-tornado: Fix CVE-2026-116578<br>
=C2=A0 python3-pymongo: Fix CVE-2026-88029<br>
=C2=A0 python3-pymongo: Fix CVE-2026-106435<br>
<br>
=C2=A0...72_CVE-2026-42617_CVE-2026-56136_p1.patch} |=C2=A0 =C2=A0 2 +-<br>
=C2=A0...72_CVE-2026-42617_CVE-2026-56136_p2.patch} |=C2=A0 =C2=A0 2 +-<br>
=C2=A0...72_CVE-2026-42617_CVE-2026-56136_p3.patch} |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../files/CVE-2026-56135_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 140 ++<br>
=C2=A0.../files/CVE-2026-56135_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A036 +<br>
=C2=A0.../files/CVE-2026-56135_p3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 203 +++<br>
=C2=A0.../files/CVE-2026-56135_p4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A094 ++<br>
=C2=A0.../<a href=3D"http://ntfs-3g-ntfsprogs_2022.10.3.bb" rel=3D"noreferr=
er" target=3D"_blank">ntfs-3g-ntfsprogs_2022.10.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +-<br>
=C2=A0...nclude-fcntl.h-for-open-and-O_-flags.patch |=C2=A0 =C2=A027 +<br>
=C2=A0.../recipes-multimedia/clight/<a href=3D"http://clight_4.11.bb" rel=
=3D"noreferrer" target=3D"_blank">clight_4.11.bb</a>=C2=A0 |=C2=A0 =C2=A0 1=
 +<br>
=C2=A0.../recipes-connectivity/nanomsg/<a href=3D"http://nng_1.11.bb" rel=
=3D"noreferrer" target=3D"_blank">nng_1.11.bb</a>=C2=A0 |=C2=A0 =C2=A0 2 +-=
<br>
=C2=A0.../mtr/mtr/CVE-2026-14461.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A032 +<br>
=C2=A0.../recipes-support/mtr/<a href=3D"http://mtr_0.96.bb" rel=3D"norefer=
rer" target=3D"_blank">mtr_0.96.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 4 +-<br>
=C2=A0.../recipes-support/ncp/<a href=3D"http://ncp_1.2.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">ncp_1.2.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 3 +<br>
=C2=A0.../ntopng/files/CVE-2026-116744.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A033 +<br>
=C2=A0.../recipes-support/ntopng/<a href=3D"http://ndpi_5.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">ndpi_5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 1 +<br>
=C2=A0.../{<a href=3D"http://pgpool2_4.6.4.bb" rel=3D"noreferrer" target=3D=
"_blank">pgpool2_4.6.4.bb</a> =3D&gt; <a href=3D"http://pgpool2_4.6.6.bb" r=
el=3D"noreferrer" target=3D"_blank">pgpool2_4.6.6.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 4 +-<br>
=C2=A0...{<a href=3D"http://wireshark_4.6.8.bb" rel=3D"noreferrer" target=
=3D"_blank">wireshark_4.6.8.bb</a> =3D&gt; <a href=3D"http://wireshark_4.6.=
9.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_4.6.9.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0meta-oe/recipes-bsp/fwupd/<a href=3D"http://fwupd-efi_1.8.bb" rel=3D"=
noreferrer" target=3D"_blank">fwupd-efi_1.8.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A010 +<br>
=C2=A0.../libwebsockets/CVE-2026-114550.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A031 +<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.5.8.bb" rel=3D"no=
referrer" target=3D"_blank">libwebsockets_4.5.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 1 +<br>
=C2=A0...<a href=3D"http://e_11.4.12.bb" rel=3D"noreferrer" target=3D"_blan=
k">e_11.4.12.bb</a> =3D&gt; <a href=3D"http://mariadb-native_11.4.13.bb" re=
l=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.13.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 4 +-<br>
=C2=A0...b11be28ae9b2432b2a661bf38a197cf9514d.patch |=C2=A0 =C2=A052 -<br>
=C2=A0...{<a href=3D"http://mariadb_11.4.12.bb" rel=3D"noreferrer" target=
=3D"_blank">mariadb_11.4.12.bb</a> =3D&gt; <a href=3D"http://mariadb_11.4.1=
3.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.13.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0.../{<a href=3D"http://nodejs_22.23.3.bb" rel=3D"noreferrer" target=
=3D"_blank">nodejs_22.23.3.bb</a> =3D&gt; <a href=3D"http://nodejs_22.23.4.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.23.4.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://valkey_9.0.6.bb" rel=3D"noreferrer" target=3D"=
_blank">valkey_9.0.6.bb</a> =3D&gt; <a href=3D"http://valkey_9.0.7.bb" rel=
=3D"noreferrer" target=3D"_blank">valkey_9.0.7.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../gphoto2/libgphoto2/CVE-2026-120451.patch=C2=A0 |=C2=A0 =C2=A043 +=
<br>
=C2=A0.../gphoto2/libgphoto2/CVE-2026-120452.patch=C2=A0 |=C2=A0 =C2=A040 +=
<br>
=C2=A0.../gphoto2/<a href=3D"http://libgphoto2_2.5.33.bb" rel=3D"noreferrer=
" target=3D"_blank">libgphoto2_2.5.33.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../libvncserver/CVE-2026-44988.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A071 +<br>
=C2=A0.../libvncserver/<a href=3D"http://libvncserver_0.9.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">libvncserver_0.9.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0...equire-swap_buffers-param-for-FenceS.patch |=C2=A0 =C2=A035 +<br>
=C2=A0.../recipes-multimedia/mplayer/<a href=3D"http://mpv_0.41.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mpv_0.41.0.bb</a>=C2=A0 |=C2=A0 =C2=A0 5 =
+-<br>
=C2=A0.../nmap/files/CVE-2026-72712.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A050 +<br>
=C2=A0meta-oe/recipes-security/nmap/<a href=3D"http://nmap_7.95.bb" rel=3D"=
noreferrer" target=3D"_blank">nmap_7.95.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
1 +<br>
=C2=A0.../libmspack/CVE-2026-110602.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A041 +<br>
=C2=A0.../cabextract/<a href=3D"http://libmspack_0.11alpha.bb" rel=3D"noref=
errer" target=3D"_blank">libmspack_0.11alpha.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
=C2=A0.../crow/{<a href=3D"http://crow_1.3.2.bb" rel=3D"noreferrer" target=
=3D"_blank">crow_1.3.2.bb</a> =3D&gt; <a href=3D"http://crow_1.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">crow_1.3.4.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0...-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch |=C2=A0 =C2=A043 +<br>
=C2=A0meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.11.bb" rel=3D=
"noreferrer" target=3D"_blank">fftw_3.3.11.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 1 +<br>
=C2=A0.../hdf5/files/CVE-2026-120689.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A060 +<br>
=C2=A0.../CVE-2026-120754-CVE-2026-120755.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
172 +++<br>
=C2=A0.../hdf5/files/CVE-2026-120756.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A045 +<br>
=C2=A0.../hdf5/files/CVE-2026-120757.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A063 +<br>
=C2=A0.../hdf5/files/CVE-2026-120758.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 143 ++<br>
=C2=A0.../files/CVE-2026-19023-CVE-2026-19024.patch |=C2=A0 176 +++<br>
=C2=A0...-19026-CVE-2026-19027-CVE-2026-19028.patch |=C2=A0 579 ++++++++<br=
>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">hdf5_2.0.0.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
 7 +<br>
=C2=A0.../{<a href=3D"http://smarty_5.8.4.bb" rel=3D"noreferrer" target=3D"=
_blank">smarty_5.8.4.bb</a> =3D&gt; <a href=3D"http://smarty_5.8.5.bb" rel=
=3D"noreferrer" target=3D"_blank">smarty_5.8.5.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 2 +-<br>
=C2=A0...{<a href=3D"http://uriparser_1.0.2.bb" rel=3D"noreferrer" target=
=3D"_blank">uriparser_1.0.2.bb</a> =3D&gt; <a href=3D"http://uriparser_1.0.=
3.bb" rel=3D"noreferrer" target=3D"_blank">uriparser_1.0.3.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://zchunk_1.5.3.bb" rel=3D"noreferrer" target=3D"=
_blank">zchunk_1.5.3.bb</a> =3D&gt; <a href=3D"http://zchunk_1.5.5.bb" rel=
=3D"noreferrer" target=3D"_blank">zchunk_1.5.5.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 4 +-<br>
=C2=A0.../libhtml/files/CVE-2026-8829.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 127 ++<br>
=C2=A0.../libhtml/<a href=3D"http://libhtml-parser-perl_3.83.bb" rel=3D"nor=
eferrer" target=3D"_blank">libhtml-parser-perl_3.83.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
=C2=A0.../python3-aiohttp/CVE-2026-111063_p1.patch=C2=A0 |=C2=A0 137 ++<br>
=C2=A0.../python3-aiohttp/CVE-2026-111063_p2.patch=C2=A0 |=C2=A0 244 ++++<b=
r>
=C2=A0.../python3-aiohttp/CVE-2026-111064.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
285 ++++<br>
=C2=A0.../python3-aiohttp/CVE-2026-111065.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
176 +++<br>
=C2=A0.../python3-aiohttp/CVE-2026-111066_p1.patch=C2=A0 |=C2=A0 400 ++++++=
<br>
=C2=A0.../python3-aiohttp/CVE-2026-111066_p2.patch=C2=A0 |=C2=A0 =C2=A057 +=
<br>
=C2=A0.../python3-aiohttp/CVE-2026-111748_p1.patch=C2=A0 |=C2=A0 376 +++++<=
br>
=C2=A0.../python3-aiohttp/CVE-2026-111748_p2.patch=C2=A0 |=C2=A0 282 ++++<b=
r>
=C2=A0.../python3-aiohttp/CVE-2026-111749.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
205 +++<br>
=C2=A0.../python3-aiohttp/CVE-2026-111750.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A083 ++<br>
=C2=A0.../python/<a href=3D"http://python3-aiohttp_3.13.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-aiohttp_3.13.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A010 +<br>
=C2=A0...<a href=3D"http://ngo_5.2.18.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_5.2.18.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.19.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_5.2.19.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://ango_6.0.9.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ango_6.0.9.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.10.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_6.0.10.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../python3-pillow/CVE-2026-112393.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
124 ++<br>
=C2=A0.../python/<a href=3D"http://python3-pillow_12.2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pillow_12.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../CVE-2026-106435-regression.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A092 ++<br>
=C2=A0.../python3-pymongo/CVE-2026-106435.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
122 ++<br>
=C2=A0.../python3-pymongo/CVE-2026-88029.patch=C2=A0 =C2=A0 =C2=A0 | 1255 +=
++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-pymongo_4.16.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-pymongo_4.16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
=C2=A0.../python3-tornado/CVE-2026-103261.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A098 ++<br>
=C2=A0.../python3-tornado/CVE-2026-103262.patch=C2=A0 =C2=A0 =C2=A0| 1117 +=
++++++++++++++<br>
=C2=A0.../CVE-2026-103263-dependent.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 255 ++++<br>
=C2=A0.../python3-tornado/CVE-2026-103263.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
422 ++++++<br>
=C2=A0.../python3-tornado/CVE-2026-115927.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
397 ++++++<br>
=C2=A0.../python3-tornado/CVE-2026-116577_p1.patch=C2=A0 |=C2=A0 195 +++<br=
>
=C2=A0.../python3-tornado/CVE-2026-116577_p2.patch=C2=A0 |=C2=A0 =C2=A099 +=
+<br>
=C2=A0.../python3-tornado/CVE-2026-116577_p3.patch=C2=A0 |=C2=A0 101 ++<br>
=C2=A0.../python3-tornado/CVE-2026-116578_p1.patch=C2=A0 |=C2=A0 =C2=A062 +=
<br>
=C2=A0.../python3-tornado/CVE-2026-116578_p2.patch=C2=A0 |=C2=A0 106 ++<br>
=C2=A0.../python3-tornado/CVE-2026-116578_p3.patch=C2=A0 |=C2=A0 192 +++<br=
>
=C2=A0.../python/<a href=3D"http://python3-tornado_6.5.7.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-tornado_6.5.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A011 +<br>
=C2=A0.../python3-virtualenv/CVE-2026-102925.patch=C2=A0 |=C2=A0 296 ++++<b=
r>
=C2=A0.../CVE-2026-102930-dependent.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 115 ++<br>
=C2=A0.../CVE-2026-102930_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 309 ++++<br>
=C2=A0.../CVE-2026-102930_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 293 ++++<br>
=C2=A0.../CVE-2026-102930_p3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 777 ++++++++++<br>
=C2=A0.../python3-virtualenv/CVE-2026-102938.patch=C2=A0 |=C2=A0 141 ++<br>
=C2=A0.../python3-virtualenv/CVE-2026-113713.patch=C2=A0 |=C2=A0 113 ++<br>
=C2=A0.../python3-virtualenv/CVE-2026-113715.patch=C2=A0 |=C2=A0 165 +++<br=
>
=C2=A0.../python3-virtualenv/CVE-2026-113716.patch=C2=A0 |=C2=A0 208 +++<br=
>
=C2=A0.../python3-virtualenv/CVE-2026-113719.patch=C2=A0 |=C2=A0 207 +++<br=
>
=C2=A0.../python3-virtualenv/CVE-2026-113720.patch=C2=A0 |=C2=A0 156 ++<br>
=C2=A0.../python3-virtualenv/CVE-2026-113721.patch=C2=A0 |=C2=A0 477 ++++++=
+<br>
=C2=A0.../CVE-2026-113722_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 262 ++++<br>
=C2=A0.../CVE-2026-113722_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A050 +<br>
=C2=A0.../python3-virtualenv/CVE-2026-113723.patch=C2=A0 |=C2=A0 233 +++<br=
>
=C2=A0.../python3-virtualenv/CVE-2026-113725.patch=C2=A0 |=C2=A0 =C2=A088 +=
+<br>
=C2=A0.../CVE-2026-113726-dependent.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 168 +++<br>
=C2=A0.../python3-virtualenv/CVE-2026-113726.patch=C2=A0 |=C2=A0 149 ++<br>
=C2=A0.../CVE-2026-113732_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 116 ++<br>
=C2=A0.../CVE-2026-113732_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 120 ++<br>
=C2=A0.../python3-virtualenv/CVE-2026-113776.patch=C2=A0 |=C2=A0 133 ++<br>
=C2=A0.../python3-virtualenv/CVE-2026-115586.patch=C2=A0 |=C2=A0 526 ++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-virtualenv_21.2.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-virtualenv_21.2.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A031 +<br>
=C2=A0.../nginx/files/CVE-2026-15176.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A054 +<br>
=C2=A0.../nginx/files/CVE-2026-95101.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A068 +<br>
=C2=A0.../nginx/files/CVE-2026-97629.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A045 +<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.28.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.28.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 3 +<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.29.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.29.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 3 +<br>
=C2=A0113 files changed, 14565 insertions(+), 77 deletions(-)<br>
=C2=A0rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{=
CVE-2026-46572_CVE-2026-42617_p1.patch =3D&gt; CVE-2026-46572_CVE-2026-4261=
7_CVE-2026-56136_p1.patch} (97%)<br>
=C2=A0rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{=
CVE-2026-46572_CVE-2026-42617_p2.patch =3D&gt; CVE-2026-46572_CVE-2026-4261=
7_CVE-2026-56136_p2.patch} (98%)<br>
=C2=A0rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{=
CVE-2026-46572_CVE-2026-42617_p3.patch =3D&gt; CVE-2026-46572_CVE-2026-4261=
7_CVE-2026-56136_p3.patch} (96%)<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-56135_p1.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-56135_p2.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-56135_p3.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-56135_p4.patch<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/clight/clight/0=
001-log-Include-fcntl.h-for-open-and-O_-flags.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/mtr/mtr/CVE-2026-1=
4461.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2=
026-116744.patch<br>
=C2=A0rename meta-networking/recipes-support/pgpool2/{<a href=3D"http://pgp=
ool2_4.6.4.bb" rel=3D"noreferrer" target=3D"_blank">pgpool2_4.6.4.bb</a> =
=3D&gt; <a href=3D"http://pgpool2_4.6.6.bb" rel=3D"noreferrer" target=3D"_b=
lank">pgpool2_4.6.6.bb</a>} (92%)<br>
=C2=A0rename meta-networking/recipes-support/wireshark/{<a href=3D"http://w=
ireshark_4.6.8.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_4.6.8.bb<=
/a> =3D&gt; <a href=3D"http://wireshark_4.6.9.bb" rel=3D"noreferrer" target=
=3D"_blank">wireshark_4.6.9.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-114550.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_11=
.4.12.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.12.bb</a=
> =3D&gt; <a href=3D"http://mariadb-native_11.4.13.bb" rel=3D"noreferrer" t=
arget=3D"_blank">mariadb-native_11.4.13.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c21bb11be28ae9b2=
432b2a661bf38a197cf9514d.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_11.4.12.b=
b" rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.12.bb</a> =3D&gt; <a h=
ref=3D"http://mariadb_11.4.13.bb" rel=3D"noreferrer" target=3D"_blank">mari=
adb_11.4.13.bb</a>} (100%)<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_22.2=
3.3.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.23.3.bb</a> =3D&gt; =
<a href=3D"http://nodejs_22.23.4.bb" rel=3D"noreferrer" target=3D"_blank">n=
odejs_22.23.4.bb</a>} (99%)<br>
=C2=A0rename meta-oe/recipes-extended/valkey/{<a href=3D"http://valkey_9.0.=
6.bb" rel=3D"noreferrer" target=3D"_blank">valkey_9.0.6.bb</a> =3D&gt; <a h=
ref=3D"http://valkey_9.0.7.bb" rel=3D"noreferrer" target=3D"_blank">valkey_=
9.0.7.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-20=
26-120451.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-20=
26-120452.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver=
/CVE-2026-44988.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-opengl=
-context-require-swap_buffers-param-for-FenceS.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-72712=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/cabextract/libmspack/CVE-2=
026-110602.patch<br>
=C2=A0rename meta-oe/recipes-support/crow/{<a href=3D"http://crow_1.3.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">crow_1.3.2.bb</a> =3D&gt; <a href=3D"=
http://crow_1.3.4.bb" rel=3D"noreferrer" target=3D"_blank">crow_1.3.4.bb</a=
>} (92%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-=
not-use-CLOCK_SGI_CYCLE-on-Linux.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120689=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120754=
-CVE-2026-120755.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120756=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120757=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-120758=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19023-=
CVE-2026-19024.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-19026-=
CVE-2026-19027-CVE-2026-19028.patch<br>
=C2=A0rename meta-oe/recipes-support/smarty/{<a href=3D"http://smarty_5.8.4=
.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5.8.4.bb</a> =3D&gt; <a hr=
ef=3D"http://smarty_5.8.5.bb" rel=3D"noreferrer" target=3D"_blank">smarty_5=
.8.5.bb</a>} (96%)<br>
=C2=A0rename meta-oe/recipes-support/uriparser/{<a href=3D"http://uriparser=
_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">uriparser_1.0.2.bb</a> =3D&=
gt; <a href=3D"http://uriparser_1.0.3.bb" rel=3D"noreferrer" target=3D"_bla=
nk">uriparser_1.0.3.bb</a>} (91%)<br>
=C2=A0rename meta-oe/recipes-support/zchunk/{<a href=3D"http://zchunk_1.5.3=
.bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1.5.3.bb</a> =3D&gt; <a hr=
ef=3D"http://zchunk_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">zchunk_1=
.5.5.bb</a>} (81%)<br>
=C2=A0create mode 100644 meta-perl/recipes-perl/libhtml/files/CVE-2026-8829=
.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111063_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111063_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111064.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111065.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111066_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111066_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111748_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111748_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111749.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-111750.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.18.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.=
18.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.19.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_5.2.19.bb</a>} (70%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_6.0.9.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.9=
.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.10.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-django_6.0.10.bb</a>} (79%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-112393.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pymong=
o/CVE-2026-106435-regression.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pymong=
o/CVE-2026-106435.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pymong=
o/CVE-2026-88029.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-103261.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-103262.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-103263-dependent.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-103263.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-115927.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-116577_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-116577_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-116577_p3.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-116578_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-116578_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-116578_p3.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-102925.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-102930-dependent.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-102930_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-102930_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-102930_p3.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-102938.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113713.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113715.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113716.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113719.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113720.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113721.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113722_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113722_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113723.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113725.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113726-dependent.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113726.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113732_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113732_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-113776.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-virtua=
lenv/CVE-2026-115586.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
15176.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
95101.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
97629.patch<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132072): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132072" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132072</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122190999/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122190999/1997914</a><br>
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

--0000000000008abeef065ff8704d--
