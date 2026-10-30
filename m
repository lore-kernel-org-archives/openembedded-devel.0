Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3401.1793327529506877348
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 19:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=FrxGyIEp;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ae8607e8afso1845787b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 19:32:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793327528; cv=none;
        d=google.com; s=arc-20260327;
        b=m4yhipMp42hFnDx8ZjFst9wwKOkooNisIpUWWVq+BglIRzNUYCRg13fBzCZrF0gKYo
         ocluAbimlN1jIhVAyfAoecNhk/fkc+okfdLPdDm7zdSySNk4el1weYtixNB+XqtwfawU
         Vw4tv8ehs63E0pksrQtl7djijGOMB1zrHHkuV7qq/lEBYfVK+xEI7LLEojLKJo0luy01
         OeOHM6+EYJ2ZFARcX0s087/gvOP/w2qFcubHaukNqiEmEnOVklghXoV0hsO2u0HJ7xbQ
         qtZeiEoVCmXADWLQ5cNuSoQR9AtjWXdDvNgidsN002MiIOLMEWmhuiNQSVRQvl1IfkKc
         axpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CgvQWiRhu4GW6taQg0T80lTEGdHBchNP+5Lw3kXiBDg=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=DL3ZcfbkrkBThnR7HviBnNlVlSSPtKbEl/IIhrJJvsiTO5Sk95mr2vk8BGzmgA10xj
         clFJmS5Bsp+DWy6aTMqURbCR7KxtDbFziU4sj4k+KJCUvZJIOkda7Yh1Qiq7wagvoDwt
         v8LSMsr+CzpPUYzHRIv59rnFirYZul1OFeC1jTgBm2g/cUrrgfI4kdL34mjcG53dBBco
         qYgRD3HpHbpBVziKx/mdlYuNMkYAjzwLVPCKmJ0p2geuFTIjQQm8FKhii8jNQ2pyv4sA
         Sm11Jqy0sh3iTy8I2MbUgwa2XxIQcPXqbFYXjL9h/wzRNPUCreTSzDvZHjovcq/27NyK
         iVCA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793327528; x=1793932328; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgvQWiRhu4GW6taQg0T80lTEGdHBchNP+5Lw3kXiBDg=;
        b=FrxGyIEpqIxYakFuXdr6juHhoRChgNbifXnh/uOGvBWqT55HOu9nTmXlGe7RXummKl
         TXrhBsEB3aghZNGosKlqoYCd7CW8HTRUYIQccAg2KE3DRSUIxpu25AVwcALEwDT76RBw
         bhWqoQ0nDo9FKeZzPQ3bONjWDOdi2g02mUbxU2coR+fuLz7cxErdI27zvEXBKkZQXFDU
         7lQsOKxXmGEvWi5pJpyyh73s3O2L6GH+iL9Pi0lmsTTx0sHykWXjsjpLvLT9hDnoIkf+
         6FbqhoKW6jr/In52BqM1+nNM8XAEcUk5v6j8La0CC8plgBsNk3XUhvT359s6l8aZiIMD
         B0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793327528; x=1793932328;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CgvQWiRhu4GW6taQg0T80lTEGdHBchNP+5Lw3kXiBDg=;
        b=JNBx+LvqWHUQuQC2LDANWQxwYsWp0nf3wI46ebmj8uqdEcWGE+H6fFrz/bSU3viv2w
         H8Bu2QcBj8tI2PT07S3eOb2PzKrpDva+0lm4825nNZkAY9k2GiBxaZYgN+zjgdFgGmXQ
         Oatq9JNK3sM6qqgHSyt0e8tJyG/ZSVzLQujhyM6ZRL3pB3c5wqWvi7yEZRWMIGpt64hO
         UbbzyxUp6EZ+hGIueXudS8AEQdwb3rn5dyftdfBRJDGeX/kCttgdkofJDktd1i3ZYZdk
         YyYzOQOVtYsMx5E1SSIjtYK2NFrlI/eZ4+0VC9KarA7kJA67/Ulk5BQLpYQj6gcvyiJu
         FiiA==
X-Gm-Message-State: AFq9FYLD7pBzpkD713LmTZN1R1vCPhkVeA5tOZXuXemCsvq5Ar3qAHeC
	rZ1EvRf4fj9M/YV17WSkRM4/j5kH1qPAm8VUPprMHOISVP3dJqDnvdJ7YJyANYNE8dYy8tCN9E6
	KxkcD6Sap7zQFa8zRNrDxw2CBInXgtYjqYA==
X-Gm-Gg: AYBFou1liP1i/B3KIe7u3OA70GtqXdlNERkN0thNhFO/VUH9mIH3oIp4Mp4kcMwZqsC
	lYFJxIp5oQJ96aqH19GzhwBT6ElLIM05d4/0n1wqTMudrQeULY/PvaXOubXFm3LK4z/D9IFDFMW
	SG5QCxnbOeYZB8xZvGxyNo7i/XRgcbBfqjeJDxiZQQlK06Xjj3YqD76hVNke8E5+canpN21Udo2
	XGbDYI2D2LpigMdtodKmdacUn/6dSUO7MeCFW8220B52tPQl8AnBnp3SrT9fJsDtgCQgNpUU9Pe
	G+tZx1zwf24xPiUAQGd3cPRF+N2Il75kWAMGDnTNysNUpjDMYiYWn9Er+L2UZFhW7SYQOLHi1ds
	3cu57JkXNDZ4onjQwupcUpG/fv64iElv3Oee5rQ58Y4qV/ybeTemlFGkkegnGprqAzNLnMrTSut
	O/QtPG5lc4jjbq3tDyV3LYuQKigyZ4e2emhtt2GIeyjoG3JysenyyxGs1kNw46KXoYqFfBhvs4/
	YDlAReVJvHgoJfYjq7tXU2PhC2RNDK/xiJ5SyvszO4L/VpVBuzHLpejBBbbG5NVJJDr5e1cWCXX
	rtjcmz2siBNOjOliX3jN/2fdWxOszqeYqvMQCojSB7TP0WZSV4q5YJzDR+oiHqUzmcPq9el0K23
	cDyiWBd08xLBcGhlEuE5bJbc=
X-Received: by 2002:a05:690c:9e:b0:8b0:9e38:f407 with SMTP id
 00721157ae682-8b2b672f790mr6165567b3.32.1793327528163; Thu, 29 Oct 2026
 19:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1793262316.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1793262316.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Oct 2026 19:31:41 -0700
X-Gm-Features: AclHuK9JG2o3zHuEI3AisLCXcZq3K4HGQwI3o68JywBqXznHH4sAMTU65gyZLUM
Message-ID: <CAMKF1so-hVosSfVsW+8Cw_dNygF8SAy+kyjmqJ6bkaAOswnYNA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/85] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000483e34065f059a20"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 02:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131679

--000000000000483e34065f059a20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

applied now thanks Anuj

On Thu, Oct 29, 2026 at 1:36=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in wrynose. Tested locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1914
>
> The following changes since commit
> f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db:
>
>   vboxguestdrivers: fix vboxvideo build on kernels lacking
> drm_fb_helper_alloc_info (2026-10-06 13:52:06 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e:
>
>   frr: Fix native clippy failing to load libatomic.so.1 (2026-10-29
> 10:19:10 +0530)
>
> ----------------------------------------------------------------
>
> Altair Bueno Calvente (1):
>   mdio-tools,mdio-netlink: upgrade 1.3.1 -> 1.3.2
>
> Ankur Tyagi (19):
>   rabbitmq-c: patch CVE-2026-44235
>   squid: upgrade 7.6 -> 7.7
>   cryptsetup: upgrade 2.8.7 -> 2.8.8
>   znc: upgrade 1.10.2 -> 1.10.3
>   srt: upgrade 1.5.6 -> 1.5.7
>   swagger-ui: upgrade 5.32.14 -> 5.32.15
>   python3-sdbus: upgrade 0.14.2 -> 0.14.3
>   python3-werkzeug: upgrade 3.1.8 -> 3.1.9
>   apache2: upgrade 2.4.68 -> 2.4.69
>   xdg-dbus-proxy: upgrade 0.1.7 -> 0.1.9
>   python3-tzdata: upgrade 2026.4 -> 2026.5
>   python3-django: upgrade 5.2.17 -> 5.2.18
>   python3-django: upgrade 6.0.8 -> 6.0.9
>   tinyproxy: patch CVE-2026-54388
>   zeroconf: ignore CVEs
>   tmate: patch CVE-2026-4751
>   udisks2: patch CVE-2026-7867
>   libspdm: upgrade 3.8.2 -> 3.8.3
>   postfix: upgrade 3.10.13 -> 3.10.14
>
> Darsh Kelaiya (14):
>   libdbi-perl: fix CVE-2026-73194
>   libdbi-perl: fix CVE-2026-73193
>   python3-aiohttp: fix CVE-2026-54273
>   python3-aiohttp: fix CVE-2026-59881
>   python3-aiohttp: fix CVE-2026-69243
>   python3-aiohttp: fix CVE-2026-69244
>   net-snmp: fix CVE-2026-89147
>   ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617
>   ntfs-3g-ntfsprogs: fix CVE-2026-46571
>   ntfs-3g-ntfsprogs: fix CVE-2026-46570
>   ntfs-3g-ntfsprogs: fix CVE-2026-46569
>   ntfs-3g-ntfsprogs: fix CVE-2026-42618
>   ntfs-3g-ntfsprogs: fix CVE-2026-42616
>   ntfs-3g-ntfsprogs: fix CVE-2026-40706
>
> Hetvi Thakar (24):
>   python3-grpcio-tools: set status for CVE-2023-33953
>   python3-grpcio-tools: set status for CVE-2024-37168
>   python3-grpcio-tools: set status for CVE-2026-33186
>   python3-pyjwt: fix CVE-2026-103001
>   python3-pyjwt: fix CVE-2026-102274
>   python3-pyjwt: fix CVE-2026-102269
>   python3-pyjwt: fix CVE-2026-102267
>   python3-pyjwt: fix CVE-2026-102268 and CVE-2026-102270
>   python3-pyjwt: fix CVE-2026-102271
>   python3-pyjwt: fix CVE-2026-101917
>   python3-pyjwt: fix CVE-2026-102275
>   python3-pyjwt: fix CVE-2026-101918
>   wireshark: upgrade 4.6.4 -> 4.6.8
>   nginx: Fix CVE-2026-40701
>   nginx: fix CVE-2026-42934
>   nginx: fix CVE-2026-42946
>   nginx: fix CVE-2026-42945
>   nginx: fix CVE-2026-9256
>   nginx: fix CVE-2026-42055
>   nginx: fix CVE-2026-48142
>   nginx: fix CVE-2026-42533
>   nginx: fix CVE-2026-56434
>   nginx: Ignore CVE-2026-40460
>   nginx: Ignore CVE-2026-60005
>
> Jason Schonberg (3):
>   c-ares: upgrade 1.34.8 -> 1.34.9
>   php: upgrade 8.5.11 -> 8.5.12
>   brotli: upgrade 1.2.0 -> 1.2.1
>
> Khem Raj (4):
>   squid: upgrade 7.5 -> 7.6
>   srt: Match SRCREV to tag
>   pcp: Add readline-native and ncurses-native to pcp-native DEPENDS
>   frr: Fix native clippy failing to load libatomic.so.1
>
> Leon Anavi (1):
>   python3-brotli: Upgrade 1.2.0 -> 1.2.1
>
> Markus Volk (1):
>   fwupd: create the fwupd-refresh user
>
> Peter Marko (4):
>   libwebsockets: patch CVE-2026-78161
>   nss: remove compromised eMudhra certificates
>   grpc: update gRPC repo roots
>   python3-grpcio: update gRPC repo roots
>
> Primoz Fiser (1):
>   opencv: rewrite build-tree paths in all CPU-dispatch stub files
>
> Yogita Urade (13):
>   redis: fix CVE-2026-23479
>   redis: fix CVE-2026-23631
>   redis: fix CVE-2026-25243
>   redis: fix CVE-2026-66373
>   python3-pillow: Fix CVE-2026-54059 CVE-2026-54060 CVE-2026-55379
>   python3-pillow: Fix CVE-2026-55380
>   python3-pillow: Fix CVE-2026-59197
>   python3-pillow: Fix CVE-2026-59198
>   python3-pillow: Fix CVE-2026-59199
>   python3-pillow: Fix CVE-2026-59200
>   python3-pillow: Fix CVE-2026-59203
>   python3-pillow: Fix CVE-2026-59205
>   python3-pillow: CVE_STATUS for CVE-2026-55798
>
>  .../files/CVE-2026-40706_p1.patch             |    60 +
>  .../files/CVE-2026-40706_p2.patch             |    34 +
>  .../files/CVE-2026-42616_p1.patch             |    70 +
>  .../files/CVE-2026-42616_p2.patch             |    79 +
>  .../files/CVE-2026-42618_p1.patch             |    53 +
>  .../files/CVE-2026-42618_p2.patch             |   221 +
>  .../files/CVE-2026-46569.patch                |    62 +
>  .../files/CVE-2026-46570.patch                |    42 +
>  .../files/CVE-2026-46571.patch                |    50 +
>  .../CVE-2026-46572_CVE-2026-42617_p1.patch    |    66 +
>  .../CVE-2026-46572_CVE-2026-42617_p2.patch    |   104 +
>  .../CVE-2026-46572_CVE-2026-42617_p3.patch    |    35 +
>  .../ntfs-3g-ntfsprogs_2022.10.3.bb            |    12 +
>  .../srt/{srt_1.5.6.bb =3D> srt_1.5.7.bb}        |     2 +-
>  ...{postfix_3.10.13.bb =3D> postfix_3.10.14.bb} |     2 +-
>  ...e-reference-to-nonexisting-directory.patch |     5 +-
>  ...quid-conf-tests-run-on-target-device.patch |    12 +-
>  .../files/Set-up-for-cross-compilation.patch  |     8 +-
>  .../files/Skip-AC_RUN_IFELSE-tests.patch      |     9 +-
>  ...-serial-tests-config-needed-by-ptest.patch |     5 +-
>  .../squid/{squid_7.5.bb =3D> squid_7.7.bb}      |     2 +-
>  .../znc/{znc_1.10.2.bb =3D> znc_1.10.3.bb}      |     2 +-
>  .../recipes-protocols/frr/frr_10.6.1.bb       |     8 +
>  .../net-snmp/net-snmp/CVE-2026-89147.patch    |   399 +
>  .../net-snmp/net-snmp_5.9.5.2.bb              |     1 +
>  .../zeroconf/zeroconf_0.9.bb                  |     6 +
>  ...netlink_1.3.1.bb =3D> mdio-netlink_1.3.2.bb} |     0
>  .../recipes-support/mdio-tools/mdio-tools.inc |     4 +-
>  ...dio-tools_1.3.1.bb =3D> mdio-tools_1.3.2.bb} |     1 +
>  .../tinyproxy/tinyproxy/CVE-2026-54388.patch  |    32 +
>  .../tinyproxy/tinyproxy_1.11.3.bb             |     1 +
>  ...{wireshark_4.6.4.bb =3D> wireshark_4.6.8.bb} |     2 +-
>  meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb     |     5 +-
>  .../libwebsockets/CVE-2026-78161.patch        |    45 +
>  .../libwebsockets/libwebsockets_4.5.8.bb      |     1 +
>  .../rabbitmq-c/CVE-2026-44235.patch           |    85 +
>  .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |     1 +
>  ...ryptsetup_2.8.7.bb =3D> cryptsetup_2.8.8.bb} |     2 +-
>  ...e-repo-roots-to-chromium-roots-42094.patch | 14387 ++++++++++++++++
>  ...curity-Update-gRPC-repo-roots.-43699.patch |  2617 +++
>  meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb  |     2 +
>  .../perl/libdbi-perl/CVE-2026-73193_p1.patch  |    51 +
>  .../perl/libdbi-perl/CVE-2026-73193_p2.patch  |    38 +
>  .../perl/libdbi-perl/CVE-2026-73194_p1.patch  |    80 +
>  .../perl/libdbi-perl/CVE-2026-73194_p2.patch  |    37 +
>  .../perl/libdbi-perl/CVE-2026-73194_p3.patch  |    34 +
>  .../perl/libdbi-perl_1.647.bb                 |     5 +
>  .../php/{php_8.5.11.bb =3D> php_8.5.12.bb}      |     2 +-
>  .../{brotli_1.2.0.bb =3D> brotli_1.2.1.bb}      |     4 +-
>  .../redis/redis-8.0.6/CVE-2026-23479.patch    |    77 +
>  .../redis/redis-8.0.6/CVE-2026-23631.patch    |   119 +
>  .../redis/redis-8.0.6/CVE-2026-25243.patch    |   275 +
>  .../redis/redis-8.0.6/CVE-2026-66373.patch    |    96 +
>  meta-oe/recipes-extended/redis/redis_8.0.6.bb |     4 +
>  .../tmate/files/CVE-2026-4751.patch           |    75 +
>  meta-oe/recipes-extended/tmate/tmate_2.4.0.bb |     1 +
>  .../{c-ares_1.34.8.bb =3D> c-ares_1.34.9.bb}    |     2 +-
>  .../{libspdm_3.8.2.bb =3D> libspdm_3.8.3.bb}    |     2 +-
>  ...ve-eMudhra-emSign-Root-CA-C1-and-emS.patch |   272 +
>  ...ve-eMudhra-emSign-Root-CA-G3-from-NS.patch |   143 +
>  meta-oe/recipes-support/nss/nss_3.122.bb      |     2 +
>  .../recipes-support/opencv/opencv_4.13.0.bb   |     6 +-
>  .../recipes-support/pcp/pcp-native_6.3.8.bb   |     2 +-
>  .../udisks/udisks2/CVE-2026-7867-1.patch      |   249 +
>  .../udisks/udisks2/CVE-2026-7867-2.patch      |   208 +
>  .../udisks/udisks2/CVE-2026-7867-3.patch      |    53 +
>  .../udisks/udisks2/CVE-2026-7867-4.patch      |    40 +
>  .../udisks/udisks2/CVE-2026-7867-5.patch      |   348 +
>  .../recipes-support/udisks/udisks2_2.10.2.bb  |     9 +-
>  ...proxy_0.1.7.bb =3D> xdg-dbus-proxy_0.1.9.bb} |     2 +-
>  .../python/files/CVE-2026-101917.patch        |   311 +
>  .../python/files/CVE-2026-101918.patch        |   122 +
>  .../python/files/CVE-2026-102267.patch        |   223 +
>  .../CVE-2026-102268_CVE-2026-102270.patch     |   113 +
>  .../python/files/CVE-2026-102269.patch        |   133 +
>  .../python/files/CVE-2026-102271.patch        |   136 +
>  .../python/files/CVE-2026-102274.patch        |    63 +
>  .../python/files/CVE-2026-102275.patch        |    82 +
>  .../python/files/CVE-2026-103001.patch        |   128 +
>  .../python3-aiohttp/CVE-2026-54273_p1.patch   |   773 +
>  .../python3-aiohttp/CVE-2026-54273_p2.patch   |   177 +
>  .../python3-aiohttp/CVE-2026-59881.patch      |   103 +
>  .../python3-aiohttp/CVE-2026-69243.patch      |   307 +
>  .../python3-aiohttp/CVE-2026-69244.patch      |   159 +
>  .../python/python3-aiohttp_3.13.5.bb          |    14 +-
>  ...rotli_1.2.0.bb =3D> python3-brotli_1.2.1.bb} |     2 +-
>  ...ngo_5.2.17.bb =3D> python3-django_5.2.18.bb} |     2 +-
>  ...jango_6.0.8.bb =3D> python3-django_6.0.9.bb} |     2 +-
>  .../python/python3-grpcio-tools_1.76.0.bb     |     3 +
>  .../0001-Update-gRPC-repo-roots.-43699.patch  |  2617 +++
>  ...e-repo-roots-to-chromium-roots-42094.patch | 14324 +++++++++++++++
>  .../python/python3-grpcio_1.78.0.bb           |     6 +
>  ...-54059_CVE-2026-54060_CVE-2026-55379.patch |   168 +
>  .../python3-pillow/CVE-2026-55380.patch       |    62 +
>  .../python3-pillow/CVE-2026-59197.patch       |    74 +
>  .../python3-pillow/CVE-2026-59198.patch       |    57 +
>  .../python3-pillow/CVE-2026-59199.patch       |    84 +
>  .../python3-pillow/CVE-2026-59200.patch       |    82 +
>  .../python3-pillow/CVE-2026-59203.patch       |    45 +
>  .../python3-pillow/CVE-2026-59205.patch       |    66 +
>  .../python/python3-pillow_12.2.0.bb           |     9 +
>  .../python/python3-pyjwt_2.12.1.bb            |    10 +-
>  ...dbus_0.14.2.bb =3D> python3-sdbus_0.14.3.bb} |     2 +-
>  ...ata_2026.4.bb =3D> python3-tzdata_2026.5.bb} |     2 +-
>  ...eug_3.1.8.bb =3D> python3-werkzeug_3.1.9.bb} |     2 +-
>  ...er-ui_5.32.14.bb =3D> swagger-ui_5.32.15.bb} |     2 +-
>  .../{apache2_2.4.68.bb =3D> apache2_2.4.69.bb}  |     2 +-
>  .../nginx/files/CVE-2026-40701.patch          |    74 +
>  .../nginx/files/CVE-2026-42533_p1.patch       |   127 +
>  .../nginx/files/CVE-2026-42533_p2.patch       |   381 +
>  .../nginx/files/CVE-2026-42533_p3.patch       |   704 +
>  .../nginx/files/CVE-2026-42533_p5.patch       |   254 +
>  .../nginx/files/CVE-2026-42934.patch          |    80 +
>  .../nginx/files/CVE-2026-42945.patch          |    47 +
>  .../nginx/files/CVE-2026-42946_p1.patch       |    47 +
>  .../nginx/files/CVE-2026-42946_p2.patch       |    92 +
>  .../nginx/files/CVE-2026-48142.patch          |    42 +
>  .../nginx/files/CVE-2026-56434.patch          |    71 +
>  .../nginx/files/CVE-2026-9256.patch           |    77 +
>  .../nginx/nginx-1.28.3/CVE-2026-42055.patch   |   108 +
>  .../nginx-1.28.3/CVE-2026-42533_p4.patch      |   587 +
>  .../nginx/nginx-1.29.7/CVE-2026-42055.patch   |   188 +
>  .../nginx-1.29.7/CVE-2026-42533_p4.patch      |   723 +
>  .../recipes-httpd/nginx/nginx_1.28.3.bb       |    19 +
>  .../recipes-httpd/nginx/nginx_1.29.7.bb       |    19 +
>  125 files changed, 44822 insertions(+), 55 deletions(-)
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-407=
06_p1.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-407=
06_p2.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-426=
16_p1.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-426=
16_p2.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-426=
18_p1.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-426=
18_p2.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-465=
69.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-465=
70.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-465=
71.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-465=
72_CVE-2026-42617_p1.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-465=
72_CVE-2026-42617_p2.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-465=
72_CVE-2026-42617_p3.patch
>  rename meta-multimedia/recipes-support/srt/{srt_1.5.6.bb =3D> srt_1.5.7.=
bb}
> (95%)
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.10.13.bb =3D>
> postfix_3.10.14.bb} (99%)
>  rename meta-networking/recipes-daemons/squid/{squid_7.5.bb =3D>
> squid_7.7.bb} (98%)
>  rename meta-networking/recipes-irc/znc/{znc_1.10.2.bb =3D> znc_1.10.3.bb=
}
> (94%)
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch
>  rename meta-networking/recipes-support/mdio-tools/{mdio-netlink_1.3.1.bb
> =3D> mdio-netlink_1.3.2.bb} (100%)
>  rename meta-networking/recipes-support/mdio-tools/{mdio-tools_1.3.1.bb
> =3D> mdio-tools_1.3.2.bb} (99%)
>  create mode 100644
> meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_4.6.4.bb =3D=
>
> wireshark_4.6.8.bb} (97%)
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-78161.p=
atch
>  create mode 100644
> meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch
>  rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.7.bb =3D>
> cryptsetup_2.8.8.bb} (98%)
>  create mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-Security-Update-repo-roots-to-chr=
omium-roots-42094.patch
>  create mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-security-Update-gRPC-repo-roots.-=
43699.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p1.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p2.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p1.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p2.patch
>  create mode 100644
> meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p3.patch
>  rename meta-oe/recipes-devtools/php/{php_8.5.11.bb =3D> php_8.5.12.bb}
> (99%)
>  rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb =3D>
> brotli_1.2.1.bb} (79%)
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23479.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23631.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-25243.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-66373.patch
>  create mode 100644
> meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch
>  rename meta-oe/recipes-support/c-ares/{c-ares_1.34.8.bb =3D>
> c-ares_1.34.9.bb} (93%)
>  rename meta-oe/recipes-support/libspdm/{libspdm_3.8.2.bb =3D>
> libspdm_3.8.3.bb} (97%)
>  create mode 100644
> meta-oe/recipes-support/nss/nss/0008-Bug-2083709-Remove-eMudhra-emSign-Ro=
ot-CA-C1-and-emS.patch
>  create mode 100644
> meta-oe/recipes-support/nss/nss/0009-Bug-2084101-Remove-eMudhra-emSign-Ro=
ot-CA-G3-from-NS.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-1.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-2.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-3.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-4.patch
>  create mode 100644
> meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-5.patch
>  rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.7.bb
> =3D> xdg-dbus-proxy_0.1.9.bb} (93%)
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-101917.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-101918.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-102267.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-102268_CVE-2026-102270=
.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-102269.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-102271.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-102274.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-102275.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-103001.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p1.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-59881.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch
>  rename meta-python/recipes-devtools/python/{python3-brotli_1.2.0.bb =3D>
> python3-brotli_1.2.1.bb} (84%)
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.17.bb =3D=
>
> python3-django_5.2.18.bb} (70%)
>  rename meta-python/recipes-devtools/python/{python3-django_6.0.8.bb =3D>
> python3-django_6.0.9.bb} (79%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/0001-Update-gRPC-repo-=
roots.-43699.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/0001-Update-repo-roots=
-to-chromium-roots-42094.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059_CVE-202=
6-54060_CVE-2026-55379.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59197.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59199.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59200.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59203.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59205.patch
>  rename meta-python/recipes-devtools/python/{python3-sdbus_0.14.2.bb =3D>
> python3-sdbus_0.14.3.bb} (83%)
>  rename meta-python/recipes-devtools/python/{python3-tzdata_2026.4.bb =3D=
>
> python3-tzdata_2026.5.bb} (86%)
>  rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.8.bb =
=3D>
> python3-werkzeug_3.1.9.bb} (91%)
>  rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.14.bb
> =3D> swagger-ui_5.32.15.bb} (94%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb =3D>
> apache2_2.4.69.bb} (99%)
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-40701.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p1.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p2.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p3.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p5.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-42934.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-42945.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p1.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p2.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-48142.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-56434.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/CVE-2026-9256.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42055.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42533_p4.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42055.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42533_p4.patch
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131643):
> https://lists.openembedded.org/g/openembedded-devel/message/131643
> Mute This Topic: https://lists.openembedded.org/mt/121990927/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000483e34065f059a20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">applied now thanks Anuj</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 2=
9, 2026 at 1:36=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:os=
s.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Please merge these changes in wrynose. Tested locally and on autobuilder=
.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1914" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1914</a><br>
<br>
The following changes since commit f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db=
:<br>
<br>
=C2=A0 vboxguestdrivers: fix vboxvideo build on kernels lacking drm_fb_help=
er_alloc_info (2026-10-06 13:52:06 +0530)<br>
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
for you to fetch changes up to c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e:<br=
>
<br>
=C2=A0 frr: Fix native clippy failing to load libatomic.so.1 (2026-10-29 10=
:19:10 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Altair Bueno Calvente (1):<br>
=C2=A0 mdio-tools,mdio-netlink: upgrade 1.3.1 -&gt; 1.3.2<br>
<br>
Ankur Tyagi (19):<br>
=C2=A0 rabbitmq-c: patch CVE-2026-44235<br>
=C2=A0 squid: upgrade 7.6 -&gt; 7.7<br>
=C2=A0 cryptsetup: upgrade 2.8.7 -&gt; 2.8.8<br>
=C2=A0 znc: upgrade 1.10.2 -&gt; 1.10.3<br>
=C2=A0 srt: upgrade 1.5.6 -&gt; 1.5.7<br>
=C2=A0 swagger-ui: upgrade 5.32.14 -&gt; 5.32.15<br>
=C2=A0 python3-sdbus: upgrade 0.14.2 -&gt; 0.14.3<br>
=C2=A0 python3-werkzeug: upgrade 3.1.8 -&gt; 3.1.9<br>
=C2=A0 apache2: upgrade 2.4.68 -&gt; 2.4.69<br>
=C2=A0 xdg-dbus-proxy: upgrade 0.1.7 -&gt; 0.1.9<br>
=C2=A0 python3-tzdata: upgrade 2026.4 -&gt; 2026.5<br>
=C2=A0 python3-django: upgrade 5.2.17 -&gt; 5.2.18<br>
=C2=A0 python3-django: upgrade 6.0.8 -&gt; 6.0.9<br>
=C2=A0 tinyproxy: patch CVE-2026-54388<br>
=C2=A0 zeroconf: ignore CVEs<br>
=C2=A0 tmate: patch CVE-2026-4751<br>
=C2=A0 udisks2: patch CVE-2026-7867<br>
=C2=A0 libspdm: upgrade 3.8.2 -&gt; 3.8.3<br>
=C2=A0 postfix: upgrade 3.10.13 -&gt; 3.10.14<br>
<br>
Darsh Kelaiya (14):<br>
=C2=A0 libdbi-perl: fix CVE-2026-73194<br>
=C2=A0 libdbi-perl: fix CVE-2026-73193<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54273<br>
=C2=A0 python3-aiohttp: fix CVE-2026-59881<br>
=C2=A0 python3-aiohttp: fix CVE-2026-69243<br>
=C2=A0 python3-aiohttp: fix CVE-2026-69244<br>
=C2=A0 net-snmp: fix CVE-2026-89147<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-46571<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-46570<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-46569<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-42618<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-42616<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-40706<br>
<br>
Hetvi Thakar (24):<br>
=C2=A0 python3-grpcio-tools: set status for CVE-2023-33953<br>
=C2=A0 python3-grpcio-tools: set status for CVE-2024-37168<br>
=C2=A0 python3-grpcio-tools: set status for CVE-2026-33186<br>
=C2=A0 python3-pyjwt: fix CVE-2026-103001<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102274<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102269<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102267<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102268 and CVE-2026-102270<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102271<br>
=C2=A0 python3-pyjwt: fix CVE-2026-101917<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102275<br>
=C2=A0 python3-pyjwt: fix CVE-2026-101918<br>
=C2=A0 wireshark: upgrade 4.6.4 -&gt; 4.6.8<br>
=C2=A0 nginx: Fix CVE-2026-40701<br>
=C2=A0 nginx: fix CVE-2026-42934<br>
=C2=A0 nginx: fix CVE-2026-42946<br>
=C2=A0 nginx: fix CVE-2026-42945<br>
=C2=A0 nginx: fix CVE-2026-9256<br>
=C2=A0 nginx: fix CVE-2026-42055<br>
=C2=A0 nginx: fix CVE-2026-48142<br>
=C2=A0 nginx: fix CVE-2026-42533<br>
=C2=A0 nginx: fix CVE-2026-56434<br>
=C2=A0 nginx: Ignore CVE-2026-40460<br>
=C2=A0 nginx: Ignore CVE-2026-60005<br>
<br>
Jason Schonberg (3):<br>
=C2=A0 c-ares: upgrade 1.34.8 -&gt; 1.34.9<br>
=C2=A0 php: upgrade 8.5.11 -&gt; 8.5.12<br>
=C2=A0 brotli: upgrade 1.2.0 -&gt; 1.2.1<br>
<br>
Khem Raj (4):<br>
=C2=A0 squid: upgrade 7.5 -&gt; 7.6<br>
=C2=A0 srt: Match SRCREV to tag<br>
=C2=A0 pcp: Add readline-native and ncurses-native to pcp-native DEPENDS<br=
>
=C2=A0 frr: Fix native clippy failing to load libatomic.so.1<br>
<br>
Leon Anavi (1):<br>
=C2=A0 python3-brotli: Upgrade 1.2.0 -&gt; 1.2.1<br>
<br>
Markus Volk (1):<br>
=C2=A0 fwupd: create the fwupd-refresh user<br>
<br>
Peter Marko (4):<br>
=C2=A0 libwebsockets: patch CVE-2026-78161<br>
=C2=A0 nss: remove compromised eMudhra certificates<br>
=C2=A0 grpc: update gRPC repo roots<br>
=C2=A0 python3-grpcio: update gRPC repo roots<br>
<br>
Primoz Fiser (1):<br>
=C2=A0 opencv: rewrite build-tree paths in all CPU-dispatch stub files<br>
<br>
Yogita Urade (13):<br>
=C2=A0 redis: fix CVE-2026-23479<br>
=C2=A0 redis: fix CVE-2026-23631<br>
=C2=A0 redis: fix CVE-2026-25243<br>
=C2=A0 redis: fix CVE-2026-66373<br>
=C2=A0 python3-pillow: Fix CVE-2026-54059 CVE-2026-54060 CVE-2026-55379<br>
=C2=A0 python3-pillow: Fix CVE-2026-55380<br>
=C2=A0 python3-pillow: Fix CVE-2026-59197<br>
=C2=A0 python3-pillow: Fix CVE-2026-59198<br>
=C2=A0 python3-pillow: Fix CVE-2026-59199<br>
=C2=A0 python3-pillow: Fix CVE-2026-59200<br>
=C2=A0 python3-pillow: Fix CVE-2026-59203<br>
=C2=A0 python3-pillow: Fix CVE-2026-59205<br>
=C2=A0 python3-pillow: CVE_STATUS for CVE-2026-55798<br>
<br>
=C2=A0.../files/CVE-2026-40706_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 60 +<br>
=C2=A0.../files/CVE-2026-40706_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 34 +<br>
=C2=A0.../files/CVE-2026-42616_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 70 +<br>
=C2=A0.../files/CVE-2026-42616_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 79 +<br>
=C2=A0.../files/CVE-2026-42618_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 53 +<br>
=C2=A0.../files/CVE-2026-42618_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0221 +<br>
=C2=A0.../files/CVE-2026-46569.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 62 +<br>
=C2=A0.../files/CVE-2026-46570.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 42 +<br>
=C2=A0.../files/CVE-2026-46571.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 50 +<br>
=C2=A0.../CVE-2026-46572_CVE-2026-42617_p1.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 66 +<br>
=C2=A0.../CVE-2026-46572_CVE-2026-42617_p2.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0104 +<br>
=C2=A0.../CVE-2026-46572_CVE-2026-42617_p3.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 35 +<br>
=C2=A0.../<a href=3D"http://ntfs-3g-ntfsprogs_2022.10.3.bb" rel=3D"noreferr=
er" target=3D"_blank">ntfs-3g-ntfsprogs_2022.10.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 12 +<br>
=C2=A0.../srt/{<a href=3D"http://srt_1.5.6.bb" rel=3D"noreferrer" target=3D=
"_blank">srt_1.5.6.bb</a> =3D&gt; <a href=3D"http://srt_1.5.7.bb" rel=3D"no=
referrer" target=3D"_blank">srt_1.5.7.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0...{<a href=3D"http://postfix_3.10.13.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.13.bb</a> =3D&gt; <a href=3D"http://postfix_3.10.1=
4.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.14.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...e-reference-to-nonexisting-directory.patch |=C2=A0 =C2=A0 =C2=A05 =
+-<br>
=C2=A0...quid-conf-tests-run-on-target-device.patch |=C2=A0 =C2=A0 12 +-<br=
>
=C2=A0.../files/Set-up-for-cross-compilation.patch=C2=A0 |=C2=A0 =C2=A0 =C2=
=A08 +-<br>
=C2=A0.../files/Skip-AC_RUN_IFELSE-tests.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 =C2=A09 +-<br>
=C2=A0...-serial-tests-config-needed-by-ptest.patch |=C2=A0 =C2=A0 =C2=A05 =
+-<br>
=C2=A0.../squid/{<a href=3D"http://squid_7.5.bb" rel=3D"noreferrer" target=
=3D"_blank">squid_7.5.bb</a> =3D&gt; <a href=3D"http://squid_7.7.bb" rel=3D=
"noreferrer" target=3D"_blank">squid_7.7.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../znc/{<a href=3D"http://znc_1.10.2.bb" rel=3D"noreferrer" target=
=3D"_blank">znc_1.10.2.bb</a> =3D&gt; <a href=3D"http://znc_1.10.3.bb" rel=
=3D"noreferrer" target=3D"_blank">znc_1.10.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-protocols/frr/<a href=3D"http://frr_10.6.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">frr_10.6.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 =C2=A08 +<br>
=C2=A0.../net-snmp/net-snmp/CVE-2026-89147.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0399 +<br>
=C2=A0.../net-snmp/<a href=3D"http://net-snmp_5.9.5.2.bb" rel=3D"noreferrer=
" target=3D"_blank">net-snmp_5.9.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../zeroconf/<a href=3D"http://zeroconf_0.9.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">zeroconf_0.9.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A06 +<br>
=C2=A0...<a href=3D"http://netlink_1.3.1.bb" rel=3D"noreferrer" target=3D"_=
blank">netlink_1.3.1.bb</a> =3D&gt; <a href=3D"http://mdio-netlink_1.3.2.bb=
" rel=3D"noreferrer" target=3D"_blank">mdio-netlink_1.3.2.bb</a>} |=C2=A0 =
=C2=A0 =C2=A00<br>
=C2=A0.../recipes-support/mdio-tools/mdio-tools.inc |=C2=A0 =C2=A0 =C2=A04 =
+-<br>
=C2=A0...<a href=3D"http://dio-tools_1.3.1.bb" rel=3D"noreferrer" target=3D=
"_blank">dio-tools_1.3.1.bb</a> =3D&gt; <a href=3D"http://mdio-tools_1.3.2.=
bb" rel=3D"noreferrer" target=3D"_blank">mdio-tools_1.3.2.bb</a>} |=C2=A0 =
=C2=A0 =C2=A01 +<br>
=C2=A0.../tinyproxy/tinyproxy/CVE-2026-54388.patch=C2=A0 |=C2=A0 =C2=A0 32 =
+<br>
=C2=A0.../tinyproxy/<a href=3D"http://tinyproxy_1.11.3.bb" rel=3D"noreferre=
r" target=3D"_blank">tinyproxy_1.11.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0...{<a href=3D"http://wireshark_4.6.4.bb" rel=3D"noreferrer" target=
=3D"_blank">wireshark_4.6.4.bb</a> =3D&gt; <a href=3D"http://wireshark_4.6.=
8.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_4.6.8.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0meta-oe/recipes-bsp/fwupd/<a href=3D"http://fwupd_2.0.19.bb" rel=3D"n=
oreferrer" target=3D"_blank">fwupd_2.0.19.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A0 =C2=A05 +-<br>
=C2=A0.../libwebsockets/CVE-2026-78161.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 45 +<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.5.8.bb" rel=3D"no=
referrer" target=3D"_blank">libwebsockets_4.5.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../rabbitmq-c/CVE-2026-44235.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 85 +<br>
=C2=A0.../rabbitmq-c/<a href=3D"http://rabbitmq-c_0.15.0.bb" rel=3D"norefer=
rer" target=3D"_blank">rabbitmq-c_0.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://ryptsetup_2.8.7.bb" rel=3D"noreferrer" target=3D=
"_blank">ryptsetup_2.8.7.bb</a> =3D&gt; <a href=3D"http://cryptsetup_2.8.8.=
bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.8.8.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...e-repo-roots-to-chromium-roots-42094.patch | 14387 +++++++++++++++=
+<br>
=C2=A0...curity-Update-gRPC-repo-roots.-43699.patch |=C2=A0 2617 +++<br>
=C2=A0meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.80.0.bb" rel=
=3D"noreferrer" target=3D"_blank">grpc_1.80.0.bb</a>=C2=A0 |=C2=A0 =C2=A0 =
=C2=A02 +<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-73193_p1.patch=C2=A0 |=C2=A0 =C2=A0 51 =
+<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-73193_p2.patch=C2=A0 |=C2=A0 =C2=A0 38 =
+<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-73194_p1.patch=C2=A0 |=C2=A0 =C2=A0 80 =
+<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-73194_p2.patch=C2=A0 |=C2=A0 =C2=A0 37 =
+<br>
=C2=A0.../perl/libdbi-perl/CVE-2026-73194_p3.patch=C2=A0 |=C2=A0 =C2=A0 34 =
+<br>
=C2=A0.../perl/<a href=3D"http://libdbi-perl_1.647.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libdbi-perl_1.647.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A05 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.5.11.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.5.11.bb</a> =3D&gt; <a href=3D"http://php_8.5.12.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.5.12.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://brotli_1.2.0.bb" rel=3D"noreferrer" target=3D"=
_blank">brotli_1.2.0.bb</a> =3D&gt; <a href=3D"http://brotli_1.2.1.bb" rel=
=3D"noreferrer" target=3D"_blank">brotli_1.2.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A04 +-<br>
=C2=A0.../redis/redis-8.0.6/CVE-2026-23479.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 77 +<br>
=C2=A0.../redis/redis-8.0.6/CVE-2026-23631.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0119 +<br>
=C2=A0.../redis/redis-8.0.6/CVE-2026-25243.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0275 +<br>
=C2=A0.../redis/redis-8.0.6/CVE-2026-66373.patch=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 96 +<br>
=C2=A0meta-oe/recipes-extended/redis/<a href=3D"http://redis_8.0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_8.0.6.bb</a> |=C2=A0 =C2=A0 =C2=A04=
 +<br>
=C2=A0.../tmate/files/CVE-2026-4751.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 75 +<br>
=C2=A0meta-oe/recipes-extended/tmate/<a href=3D"http://tmate_2.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tmate_2.4.0.bb</a> |=C2=A0 =C2=A0 =C2=A01=
 +<br>
=C2=A0.../{<a href=3D"http://c-ares_1.34.8.bb" rel=3D"noreferrer" target=3D=
"_blank">c-ares_1.34.8.bb</a> =3D&gt; <a href=3D"http://c-ares_1.34.9.bb" r=
el=3D"noreferrer" target=3D"_blank">c-ares_1.34.9.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libspdm_3.8.2.bb" rel=3D"noreferrer" target=3D=
"_blank">libspdm_3.8.2.bb</a> =3D&gt; <a href=3D"http://libspdm_3.8.3.bb" r=
el=3D"noreferrer" target=3D"_blank">libspdm_3.8.3.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0...ve-eMudhra-emSign-Root-CA-C1-and-emS.patch |=C2=A0 =C2=A0272 +<br>
=C2=A0...ve-eMudhra-emSign-Root-CA-G3-from-NS.patch |=C2=A0 =C2=A0143 +<br>
=C2=A0meta-oe/recipes-support/nss/<a href=3D"http://nss_3.122.bb" rel=3D"no=
referrer" target=3D"_blank">nss_3.122.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 =C2=A02 +<br>
=C2=A0.../recipes-support/opencv/<a href=3D"http://opencv_4.13.0.bb" rel=3D=
"noreferrer" target=3D"_blank">opencv_4.13.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A06 +-<br>
=C2=A0.../recipes-support/pcp/<a href=3D"http://pcp-native_6.3.8.bb" rel=3D=
"noreferrer" target=3D"_blank">pcp-native_6.3.8.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-1.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0249 +<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-2.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0208 +<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-3.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 53 +<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-4.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 40 +<br>
=C2=A0.../udisks/udisks2/CVE-2026-7867-5.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0348 +<br>
=C2=A0.../recipes-support/udisks/<a href=3D"http://udisks2_2.10.2.bb" rel=
=3D"noreferrer" target=3D"_blank">udisks2_2.10.2.bb</a>=C2=A0 |=C2=A0 =C2=
=A0 =C2=A09 +-<br>
=C2=A0...<a href=3D"http://proxy_0.1.7.bb" rel=3D"noreferrer" target=3D"_bl=
ank">proxy_0.1.7.bb</a> =3D&gt; <a href=3D"http://xdg-dbus-proxy_0.1.9.bb" =
rel=3D"noreferrer" target=3D"_blank">xdg-dbus-proxy_0.1.9.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/files/CVE-2026-101917.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0311 +<br>
=C2=A0.../python/files/CVE-2026-101918.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0122 +<br>
=C2=A0.../python/files/CVE-2026-102267.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0223 +<br>
=C2=A0.../CVE-2026-102268_CVE-2026-102270.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0113 +<br>
=C2=A0.../python/files/CVE-2026-102269.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0133 +<br>
=C2=A0.../python/files/CVE-2026-102271.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0136 +<br>
=C2=A0.../python/files/CVE-2026-102274.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 63 +<br>
=C2=A0.../python/files/CVE-2026-102275.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 82 +<br>
=C2=A0.../python/files/CVE-2026-103001.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0128 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-54273_p1.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0773 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-54273_p2.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0177 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-59881.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0103 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-69243.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0307 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-69244.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0159 +<br>
=C2=A0.../python/<a href=3D"http://python3-aiohttp_3.13.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-aiohttp_3.13.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 14 +-<br>
=C2=A0...<a href=3D"http://rotli_1.2.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">rotli_1.2.0.bb</a> =3D&gt; <a href=3D"http://python3-brotli_1.2.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.2.1.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ngo_5.2.17.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_5.2.17.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.18.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_5.2.18.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://jango_6.0.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">jango_6.0.8.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.9.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.9.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-grpcio-tools_1.76.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-grpcio-tools_1.76.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A03 +<br>
=C2=A0.../0001-Update-gRPC-repo-roots.-43699.patch=C2=A0 |=C2=A0 2617 +++<b=
r>
=C2=A0...e-repo-roots-to-chromium-roots-42094.patch | 14324 +++++++++++++++=
<br>
=C2=A0.../python/<a href=3D"http://python3-grpcio_1.78.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-grpcio_1.78.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A06 +<br>
=C2=A0...-54059_CVE-2026-54060_CVE-2026-55379.patch |=C2=A0 =C2=A0168 +<br>
=C2=A0.../python3-pillow/CVE-2026-55380.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 62 +<br>
=C2=A0.../python3-pillow/CVE-2026-59197.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 74 +<br>
=C2=A0.../python3-pillow/CVE-2026-59198.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 57 +<br>
=C2=A0.../python3-pillow/CVE-2026-59199.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 84 +<br>
=C2=A0.../python3-pillow/CVE-2026-59200.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 82 +<br>
=C2=A0.../python3-pillow/CVE-2026-59203.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 45 +<br>
=C2=A0.../python3-pillow/CVE-2026-59205.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 66 +<br>
=C2=A0.../python/<a href=3D"http://python3-pillow_12.2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pillow_12.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A09 +<br>
=C2=A0.../python/<a href=3D"http://python3-pyjwt_2.12.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pyjwt_2.12.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 10 +-<br>
=C2=A0...<a href=3D"http://dbus_0.14.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">dbus_0.14.2.bb</a> =3D&gt; <a href=3D"http://python3-sdbus_0.14.3.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-sdbus_0.14.3.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ata_2026.4.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ata_2026.4.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.5.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-tzdata_2026.5.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://eug_3.1.8.bb" rel=3D"noreferrer" target=3D"_blan=
k">eug_3.1.8.bb</a> =3D&gt; <a href=3D"http://python3-werkzeug_3.1.9.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-werkzeug_3.1.9.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://er-ui_5.32.14.bb" rel=3D"noreferrer" target=3D"_=
blank">er-ui_5.32.14.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.15.bb=
" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32.15.bb</a>} |=C2=A0 =
=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://apache2_2.4.68.bb" rel=3D"noreferrer" target=
=3D"_blank">apache2_2.4.68.bb</a> =3D&gt; <a href=3D"http://apache2_2.4.69.=
bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.69.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../nginx/files/CVE-2026-40701.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 74 +<br>
=C2=A0.../nginx/files/CVE-2026-42533_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0127 +<br>
=C2=A0.../nginx/files/CVE-2026-42533_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0381 +<br>
=C2=A0.../nginx/files/CVE-2026-42533_p3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0704 +<br>
=C2=A0.../nginx/files/CVE-2026-42533_p5.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0254 +<br>
=C2=A0.../nginx/files/CVE-2026-42934.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 80 +<br>
=C2=A0.../nginx/files/CVE-2026-42945.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 47 +<br>
=C2=A0.../nginx/files/CVE-2026-42946_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 47 +<br>
=C2=A0.../nginx/files/CVE-2026-42946_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 92 +<br>
=C2=A0.../nginx/files/CVE-2026-48142.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 42 +<br>
=C2=A0.../nginx/files/CVE-2026-56434.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 71 +<br>
=C2=A0.../nginx/files/CVE-2026-9256.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 77 +<br>
=C2=A0.../nginx/nginx-1.28.3/CVE-2026-42055.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0108 +<br>
=C2=A0.../nginx-1.28.3/CVE-2026-42533_p4.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0587 +<br>
=C2=A0.../nginx/nginx-1.29.7/CVE-2026-42055.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0188 +<br>
=C2=A0.../nginx-1.29.7/CVE-2026-42533_p4.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0723 +<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.28.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.28.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 19 +<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.29.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.29.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 19 +<br>
=C2=A0125 files changed, 44822 insertions(+), 55 deletions(-)<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-40706_p1.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-40706_p2.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-42616_p1.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-42616_p2.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-42618_p1.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-42618_p2.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-46569.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-46570.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-46571.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch<br>
=C2=A0rename meta-multimedia/recipes-support/srt/{<a href=3D"http://srt_1.5=
.6.bb" rel=3D"noreferrer" target=3D"_blank">srt_1.5.6.bb</a> =3D&gt; <a hre=
f=3D"http://srt_1.5.7.bb" rel=3D"noreferrer" target=3D"_blank">srt_1.5.7.bb=
</a>} (95%)<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.10.13.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.13.bb</a=
> =3D&gt; <a href=3D"http://postfix_3.10.14.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.14.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-daemons/squid/{<a href=3D"http://squid=
_7.5.bb" rel=3D"noreferrer" target=3D"_blank">squid_7.5.bb</a> =3D&gt; <a h=
ref=3D"http://squid_7.7.bb" rel=3D"noreferrer" target=3D"_blank">squid_7.7.=
bb</a>} (98%)<br>
=C2=A0rename meta-networking/recipes-irc/znc/{<a href=3D"http://znc_1.10.2.=
bb" rel=3D"noreferrer" target=3D"_blank">znc_1.10.2.bb</a> =3D&gt; <a href=
=3D"http://znc_1.10.3.bb" rel=3D"noreferrer" target=3D"_blank">znc_1.10.3.b=
b</a>} (94%)<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/CVE-2026-89147.patch<br>
=C2=A0rename meta-networking/recipes-support/mdio-tools/{<a href=3D"http://=
mdio-netlink_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">mdio-netlink_1.=
3.1.bb</a> =3D&gt; <a href=3D"http://mdio-netlink_1.3.2.bb" rel=3D"noreferr=
er" target=3D"_blank">mdio-netlink_1.3.2.bb</a>} (100%)<br>
=C2=A0rename meta-networking/recipes-support/mdio-tools/{<a href=3D"http://=
mdio-tools_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">mdio-tools_1.3.1.=
bb</a> =3D&gt; <a href=3D"http://mdio-tools_1.3.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mdio-tools_1.3.2.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/tinyproxy/tinyprox=
y/CVE-2026-54388.patch<br>
=C2=A0rename meta-networking/recipes-support/wireshark/{<a href=3D"http://w=
ireshark_4.6.4.bb" rel=3D"noreferrer" target=3D"_blank">wireshark_4.6.4.bb<=
/a> =3D&gt; <a href=3D"http://wireshark_4.6.8.bb" rel=3D"noreferrer" target=
=3D"_blank">wireshark_4.6.8.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-78161.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c=
/CVE-2026-44235.patch<br>
=C2=A0rename meta-oe/recipes-crypto/cryptsetup/{<a href=3D"http://cryptsetu=
p_2.8.7.bb" rel=3D"noreferrer" target=3D"_blank">cryptsetup_2.8.7.bb</a> =
=3D&gt; <a href=3D"http://cryptsetup_2.8.8.bb" rel=3D"noreferrer" target=3D=
"_blank">cryptsetup_2.8.8.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Security-U=
pdate-repo-roots-to-chromium-roots-42094.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-security-U=
pdate-gRPC-repo-roots.-43699.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-73193_p1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-73193_p2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-73194_p1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-73194_p2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026=
-73194_p3.patch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.5.11.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.5.11.bb</a> =3D&gt; <a href=3D"=
http://php_8.5.12.bb" rel=3D"noreferrer" target=3D"_blank">php_8.5.12.bb</a=
>} (99%)<br>
=C2=A0rename meta-oe/recipes-extended/brotli/{<a href=3D"http://brotli_1.2.=
0.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.2.0.bb</a> =3D&gt; <a h=
ref=3D"http://brotli_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">brotli_=
1.2.1.bb</a>} (79%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-202=
6-23479.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-202=
6-23631.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-202=
6-25243.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-202=
6-66373.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/tmate/files/CVE-2026-4751=
.patch<br>
=C2=A0rename meta-oe/recipes-support/c-ares/{<a href=3D"http://c-ares_1.34.=
8.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.34.8.bb</a> =3D&gt; <a =
href=3D"http://c-ares_1.34.9.bb" rel=3D"noreferrer" target=3D"_blank">c-are=
s_1.34.9.bb</a>} (93%)<br>
=C2=A0rename meta-oe/recipes-support/libspdm/{<a href=3D"http://libspdm_3.8=
.2.bb" rel=3D"noreferrer" target=3D"_blank">libspdm_3.8.2.bb</a> =3D&gt; <a=
 href=3D"http://libspdm_3.8.3.bb" rel=3D"noreferrer" target=3D"_blank">libs=
pdm_3.8.3.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/0008-Bug-2083709-R=
emove-eMudhra-emSign-Root-CA-C1-and-emS.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/0009-Bug-2084101-R=
emove-eMudhra-emSign-Root-CA-G3-from-NS.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-4.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-78=
67-5.patch<br>
=C2=A0rename meta-oe/recipes-support/xdg-dbus-proxy/{<a href=3D"http://xdg-=
dbus-proxy_0.1.7.bb" rel=3D"noreferrer" target=3D"_blank">xdg-dbus-proxy_0.=
1.7.bb</a> =3D&gt; <a href=3D"http://xdg-dbus-proxy_0.1.9.bb" rel=3D"norefe=
rrer" target=3D"_blank">xdg-dbus-proxy_0.1.9.bb</a>} (93%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-101917.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-101918.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-102267.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-102268_CVE-2026-102270.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-102269.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-102271.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-102274.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-102275.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-103001.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54273_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54273_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-59881.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-69243.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-69244.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-brotli_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-brotli_1.2.0=
.bb</a> =3D&gt; <a href=3D"http://python3-brotli_1.2.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-brotli_1.2.1.bb</a>} (84%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.17.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.=
17.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.18.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_5.2.18.bb</a>} (70%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_6.0.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.8=
.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.9.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-django_6.0.9.bb</a>} (79%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-grpcio=
/0001-Update-gRPC-repo-roots.-43699.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-grpcio=
/0001-Update-repo-roots-to-chromium-roots-42094.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-55380.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-59197.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-59198.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-59199.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-59200.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-59203.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-59205.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-sdbus_0.14.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-sdbus_0.14.2=
.bb</a> =3D&gt; <a href=3D"http://python3-sdbus_0.14.3.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-sdbus_0.14.3.bb</a>} (83%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tzdata_2026.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tzdata_2026=
.4.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-tzdata_2026.5.bb</a>} (86%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-werkzeug_3.1.8.bb" rel=3D"noreferrer" target=3D"_blank">python3-werkzeug_3=
.1.8.bb</a> =3D&gt; <a href=3D"http://python3-werkzeug_3.1.9.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-werkzeug_3.1.9.bb</a>} (91%)<br>
=C2=A0rename meta-webserver/recipes-devtools/swagger-ui/{<a href=3D"http://=
swagger-ui_5.32.14.bb" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32=
.14.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.15.bb" rel=3D"noreferr=
er" target=3D"_blank">swagger-ui_5.32.15.bb</a>} (94%)<br>
=C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://apache=
2_2.4.68.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.68.bb</a> =3D=
&gt; <a href=3D"http://apache2_2.4.69.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.69.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
40701.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42533_p1.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42533_p2.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42533_p3.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42533_p5.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42934.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42945.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42946_p1.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
42946_p2.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
48142.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
56434.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-=
9256.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CV=
E-2026-42055.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CV=
E-2026-42533_p4.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CV=
E-2026-42055.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CV=
E-2026-42533_p4.patch<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131643): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131643" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131643</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121990927/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121990927/1997914</a><br>
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

--000000000000483e34065f059a20--
