Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B068CCEFC3A
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 18:27:53 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.3085.1728412069274666111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 11:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dsxo0C5C;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-28827cdff05so329283fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 11:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728412068; x=1729016868; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8BeAs4+qoLcBlyQjX09Bvb9UplPCM0lZXuvsdgZGq8=;
        b=dsxo0C5COQXn6gNoi4jA42M8sx49OxdNh6BO77Y+s0sOX7bqXAAkvKc22YwHTyPxpk
         Qo/DMKS8RSYZscCezcTuP3ppaNbukVCSF4ABn5a4bgXlqZH22lh7/oB7DT2vH7JshEDd
         I7hfyozxw/BKb7LgXpxEKfrJyGb3bJz8y9AgP2pQvOwK1v3k7ndRiSKZHzNjurOf95Xm
         N+fz3RqimrcFBL0uL4tKVYE/AlodCmwTN27/iqonKzR+132zi+lykgzzdQ+834Rcssl4
         JrIVabdZUOzZxHT4f6XmrRAvbZOu8dxiyA3yN+ue+jg5QgbAAxZY/vOxiYowCR9plTXQ
         n4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412068; x=1729016868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8BeAs4+qoLcBlyQjX09Bvb9UplPCM0lZXuvsdgZGq8=;
        b=tg864Zj5Ee8eoypTDe3R57lxrKCvFMRpEj4tFeYOSnAc3ubRVtda+auYTi2f4gt68x
         I77cenrxpmIJCTT+pBnssHqElZvNBAhBQw7vDDsraMzs3BvcxSj7iKAM19gX6x9Y0r2m
         dTPMcHYgnD03VFh8nPAEh20gOzJRgw70swCWOL3HRhxc+n92Z2J0MZx27WFN3H9F2kJ9
         ezfhpvYfvc7CaMznl5k1SYhcvGYLvZblIbtGex1s+WGs4Oac27OX7I+yKRH+/KvD4keD
         92lgv/WAhLv4sBu+EsMscCRoEnbewvH0gJMKYmTBhYQlFpi5ls+OvYBkvxMTeenWd/cc
         0EXg==
X-Gm-Message-State: AOJu0Ywub9vi3jFxyUagf/pGfj1Vqd7ultRClzsGGvmg3y+RSWI/4gdx
	/JiHh49CwbHhZFhpZeTZKLpgfMuamPRTC83WdiT38ej7dW/3bxrs25TtQnzdC/Kt1LcSrq9JSrY
	9EG2GmJaO9cRtthj0+m+QHkUFog0=
X-Google-Smtp-Source: AGHT+IE/IGlGAwYcd3C5PLrzBVrF3GQe3mnTJyUa1VvqCGEmgDrItFYp81IfgLXG/nWeEvGBeX+AKTCGBK4DULg6kps=
X-Received: by 2002:a05:6871:3328:b0:278:c6bf:fd34 with SMTP id
 586e51a60fabf-287c1e16a60mr10850166fac.27.1728412068391; Tue, 08 Oct 2024
 11:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <f2cafd9b-09a9-447b-b09f-3b223d99dfde@gmail.com>
In-Reply-To: <f2cafd9b-09a9-447b-b09f-3b223d99dfde@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Oct 2024 11:27:22 -0700
Message-ID: <CAMKF1spqHqu6Y0jQfZFQ1t3x3nWxBD-9kCW9_xepr4EbGS0tfg@mail.gmail.com>
Subject: Re: scarthgap merge request: Oct 8th
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 18:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112719

merged now thanks Armin.

On Tue, Oct 8, 2024 at 10:36=E2=80=AFAM akuster808 <akuster808@gmail.com> w=
rote:
>
> The following changes since commit ce456f692384f56f03328d3466a36f05146314=
f2:
>
>    tgt: fix CVE-2024-45751 (2024-09-22 10:06:37 -0400)
>
> are available in the Git repository at:
>
>    git://git.openembedded.org/meta-openembedded scarthgap-next
>
> for you to fetch changes up to 72018ca1b1a471226917e8246e8bbf9a374ccf97:
>
>    rocksdb: Add an option to set static library (2024-10-06 07:29:13 -040=
0)
>
> ----------------------------------------------------------------
> Armin Kuster (1):
>        Revert "mariadb: fix runtime failure on riscv"
>
> Dmitry Baryshkov (1):
>        android-tools: Create flag file /etc/usb-debugging-enabled
>
> Khem Raj (1):
>        mariadb: Upgrade to 10.11.9 release
>
> Michael Olbrich (1):
>        nftables: avoid python dependencies when building without python
>
> Nikhil R (2):
>        nftables: Conditionally add ${PN}-python as RDEPENDS for ptest
>        rocksdb: Add an option to set static library
>
> Peter Marko (2):
>        hostapd: Patch CVE-2024-3596
>        hostapd: Patch security advisory 2024-2
>
> Raghuvarya S (2):
>        android-tools-adbd.service: Update ConditionPathExists to /etc
>        android-toold-adbd: Fix inconsistency between selinux configuratio=
ns
>
> Trevor Woerner (1):
>        apache2: use update-alternatives for httpd
>
> Yi Zhao (1):
>        libldb: upgrade 2.8.0 -> 2.8.1
>
> Yogesh Tyagi (1):
>        tbb-native: Fix build with gcc-13
>
>   meta-networking/recipes-filter/nftables/nftables_1.0.9.bb       | 9 +-
>   .../recipes-support/libldb/{libldb_2.8.0.bb =3D> libldb_2.8.1.bb} |   2=
 +-
>   .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
>   .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 +-
>   ...1-SAE-Check-for-invalid-Rejected-Groups-element-length.patch | 52
> +++++++++
>   ...3-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch | 38
> +++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch | 82
> ++++++++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch | 165
> +++++++++++++++++++++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch | 62
> ++++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch | 52
> +++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch | 51
> +++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch | 46
> ++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch | 105
> +++++++++++++++++
>   .../recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch | 47
> ++++++++
>   meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb            | 10 ++
>   .../{mariadb-native_10.11.7.bb =3D> mariadb-native_10.11.9.bb} |   0
>   meta-oe/recipes-dbs/mysql/mariadb.inc                           | 5 +-
>   .../mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch   | 170
> ----------------------------
>   .../mariadb/0001-RISC-V-use-RDTIME-instead-of-RDCYCLE.patch     | 66
> -----------
>   .../mariadb/0001-Remove-the-compile_time_assert-lines.patch     | 43
> -------
>   .../mysql/{mariadb_10.11.7.bb =3D> mariadb_10.11.9.bb} |   0
>   .../recipes-dbs/rocksdb/files/static_library_as_option.patch    | 71
> ++++++++++++
>   meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb                    | 2 +
>   .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
>   .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb   | 2 +-
>   .../tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch | 57
> ++++++++++
>   meta-oe/recipes-support/tbb/tbb_2021.11.0.bb                    | 1 +
>   meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb          | 3 +
>   28 files changed, 856 insertions(+), 291 deletions(-)
>   rename meta-networking/recipes-support/libldb/{libldb_2.8.0.bb =3D>
> libldb_2.8.1.bb} (97%)
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/0001-SAE-Check-for-invalid-R=
ejected-Groups-element-length.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/0003-SAE-Reject-invalid-Reje=
cted-Groups-element-in-the-pa.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_00.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_01.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_02.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_04.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_05.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_06.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_07.patch
>   create mode 100644
> meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2024-3596_08.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.7.bb =3D>
> mariadb-native_10.11.9.bb} (100%)
>   delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-=
2.12.patch
>   delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-RISC-V-use-RDTIME-instead-of-RDCYC=
LE.patch
>   delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lin=
es.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.7.bb =3D>
> mariadb_10.11.9.bb} (100%)
>   create mode 100644
> meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
>   create mode 100644
> meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-=
1192.patch
>

