Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED99C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 23:51:12 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31213.1784937063658398194
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2026 16:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=heNKHbtQ;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664e3ed58bcso1819278d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 16:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784937063; cv=none;
        d=google.com; s=arc-20260327;
        b=hGifnziHIVYxWNLNDL8FfgUt5cOTstNhjibK/66LrVjNTIsEyNYiPozuqa9auyyCz7
         rThtM2V8bEqWJ2Y+IkANvc1UH1CgrLlNuO0lRb0rcVBxMVFBT/dnif9JmFrYoJtr+KOq
         3yRoIcXN8XJrF9bKCv65DWjyhUH1bDAI5TyOPOpHqSDtUmiRg3g9YVXylLl68EdKo6OY
         drlRFC/thaXbbkF3saoWR/NFZP5a7OlAnYRwU2eESRP0PX8+9/udTgKwWGrWfi4Ms9nP
         V65YuzRiMJusvtHwJE+/5ez/U1WtAbKDaErYolRq/kYNP+6EDLpE8OzQzLYygAf2W6jv
         gkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RMCsv/lWXtztG46BS04PnTUtYnWlrnpujH7aQv9GiY4=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=rXtj89Oi3BEA4aajrT/kqClsGfAuvk3TggSp4LfL4IO20QTQTD4cgE47xnuEcACi75
         yDTQtADwZj63G2bYANJm8oprHE7K9JqJpaq2XK63AcbLEWotV33iLXRnJokh93fdolUL
         UHKszLHb+8TpBIYAFl471sTMZjQZD1ZM39uPQAC8JOHcEXwjDcikGEhCDOPqUJZv3IjD
         mv+P43m2SgbioLgMD4BK1i+3ltV5iW6KCq9m6uEq7PSbCndRAmbdTPBjgGnqpGrjJq/J
         ifw7VbogzmwvCTGp2ksAMzr7RBiLvn7ja8Yz/eribfw+AfY7rOibec2ICeo4eca+Rg96
         n/ww==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784937063; x=1785541863; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMCsv/lWXtztG46BS04PnTUtYnWlrnpujH7aQv9GiY4=;
        b=heNKHbtQ2KjbB5h0KeirK/798DIh2WRipahYUPZaKMU+nBXpgRaufC+wWVQl/m0OGX
         ldprmUyeGHma9xgDqCHqbZwaFpqAlYbbRK2Wt+vypYUcKzCJGPUGi/rCSV21wkNNYUci
         yO2BnVZvF8WFSLeMoPtUwZcfc1mDzu+cKycZFD1WAFPb3hnwN3c+ffJNJ7YOgujYPaHj
         Q/eg4mjPw+2IMQOZftiBr+rG78XE32JrLxxOkwQuGkUlTYOqIx9+fSESvOMOFqIReYRh
         RsBJYQXjo3FC4j7JP5J64Xse6xsu5+xua8+N2jFBXw6F1lzG8pBCtO2L5WDjZBzJkv19
         yGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784937063; x=1785541863;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RMCsv/lWXtztG46BS04PnTUtYnWlrnpujH7aQv9GiY4=;
        b=aJ4eJxKlBNtFAxdNB9Wsmtqd7+Wy0JIyx1zWQ40aToZNy5ZPgcae7endD5JrsRQtz3
         Vhb7ti9GanhZjpLVMjooD734YlCJt0YEKyFwgu01iZdK6CbdFbbhkcabuV63IGXFtUP+
         AbJX0hLEVvlGY/FRrN7qnucyewYki81b/I7+tBOJDTCLgKYxd6wSankcuYrRQqu9RTHU
         mHIfcQja4cqGnuO643X8tJvgiH1V9qqDvoI2FOoaNWCfBmZQqTw+X1TQmOCQT72zShX3
         v6Lu2IxZpd3Kk9lwB9HnbAJC4MiW7eRgvcj4jcM6e+zYoUBmHATxicObvh341n68RCLN
         9Flw==
X-Gm-Message-State: AOJu0YzhNQi5IjPRXCbYs0m8jUIzsLy4vnvdBLbYTzn8rGOko48+boeG
	OVvoyWfop/hsMHtc7SbeVEbXOA/K2qM0aB7pE9f8WP57wtRqAV4+/sayTgzZtPsK2IjWz/rkNXA
	73YJRt8oMd8uI08monYJkt+s18X34kW7neA==
X-Gm-Gg: AR+sD13DpJWhNAXwJy3P6NGyLtu11SuwS9CewJPEcUKtQKHeAIUEGSKnvnDvrt+kVDF
	BhZZ9vuy0REbP3FZ8vnunpnJtqI5XM9whfK6WMyF1v8Ut1xl0uoVKlYq8a/ipTLirh7nRNiBYyc
	QJcT8TdG0zJULR/XEkfJn5HhGeGZ5Gjl8UAvfWE5gV/gB+SQpfnglyUFOjsiac30tY1u1yVXoZ4
	B3h5vva8coe/nVngwJvVpe5vC7lMm3VPYKi4sC1+1m+VTMHMwqzbD+aZ7ejFOmP+qYjju6YVlSN
	xBtU5yvTUN8QVjKZphexO/uoxdYD0s7gbtUDd24vTsAJYb5xuyhtpBcuM5maKDF3sCbXqDivaw3
	zk9wEtdhlWKncFnkH9B0RjLnfDeJezcaJKbwPRqlF+ViW1QJ1Mo1BwI3ZbjY1iEFZpQvF1WZVdL
	eDxTwdHxhE/E7rBEyIKw==
X-Received: by 2002:a05:690e:1489:b0:665:992:8a85 with SMTP id
 956f58d0204a3-668c7a9b001mr91799d50.23.1784937062543; Fri, 24 Jul 2026
 16:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784858854.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1784858854.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jul 2026 16:50:35 -0700
X-Gm-Features: AUfX_mx21xlXX2Ml4R7einpSK_74nlmvCEM2Y5RcJ-HVJkOPsi6bn1Ta4FfaT2I
Message-ID: <CAMKF1sqsyKBo8FsLQ4sjosTdOKbWX2gjcLy-2TPH6WpN+2SrJA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/55] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008f37710657640b28"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 23:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128444

--0000000000008f37710657640b28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM, Merged now, thanks Anuj

On Thu, Jul 23, 2026 at 7:58=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in wrynose. Tested locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1657
>
> The following changes since commit
> d97b5602d7f64422c94b7311466cda7f6b1962d5:
>
>   libuio: fix FILE descriptor leak (2026-07-07 08:04:43 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to af8b6d6b2f0b11595b0a0d5b82efa3129d52a628:
>
>   sysdig: Use LuaJIT headers to match the linked LuaJIT library
> (2026-07-24 06:15:59 +0530)
>
> ----------------------------------------------------------------
>
> Alejandro Mery (1):
>   ltrace: fix PRIb64 length modifier on LP64 musl
>
> Ankur Tyagi (4):
>   haveged: upgrade 1.9.22 -> 1.9.23
>   postfix: upgrade 3.10.10 -> 3.10.12
>   python3-django: upgrade 6.0.6 -> 6.0.7
>   python3-django: upgrade 5.2.15 -> 5.2.16
>
> Darsh Kelaiya (3):
>   jq: Fix CVE-2026-43895
>   jq: Fix CVE-2026-49839
>   jq: Fix CVE-2026-54679
>
> Deepak Rathore (3):
>   nmap: Fix CVE-2026-58058
>   libidn: Fix CVE-2026-57053
>   mbedtls: set CVE_STATUS for CVE-2025-66442
>
> He Zhe (1):
>   bpftool-native: Fix -Wdiscarded-qualifiers errors for glibc 2.42+
>
> Jason Schonberg (2):
>   c-ares: upgrade 1.34.6 -> 1.34.8
>   php: upgrade 8.5.7 -> 8.5.8
>
> Khem Raj (5):
>   ifuse: upgrade 1.2.0 -> 1.2.1
>   xdebug: upgrade 3.5.1 -> 3.5.3
>   apache2: upgrade 2.4.67 -> 2.4.68
>   samba: upgrade 4.23.5 -> 4.23.8
>   sysdig: Use LuaJIT headers to match the linked LuaJIT library
>
> Leon Anavi (1):
>   python3-tornado: Upgrade 6.5.6 -> 6.5.7
>
> Markus Volk (2):
>   pipewire: update 1.6.6 -> 1.6.7
>   pipewire: update 1.6.7 -> 1.6.8
>
> Peter Marko (11):
>   libwebsockets: set status for CVE-2025-1866
>   libwebsockets: patch CVE-2026-10650
>   7zip: set status for CVE-2026-58052
>   bit7z: set status for CVE-2026-45380 and CVE-2026-45384
>   c-ares: set status for CVE-2025-31498
>   grpc: set status for CVE-2023-33953 and CVE-2024-37168
>   python3-grpcio: set status for CVE-2023-33953 and CVE-2024-37168
>   protobuf: set status for CVE-2024-7254
>   python3-protobuf: set status for CVE-2024-7254
>   tcpdump: set status for CVE-2024-2397
>   libcoap: set status for CVE-2023-51847
>
> Roland Kovacs (2):
>   thrift: fix multiple CVEs
>   radvd: fix CVE-2026-48715
>
> Wang Mingyu (19):
>   imagemagick: upgrade 7.1.2-24 -> 7.1.2-25
>   imagemagick: upgrade 7.1.2-25 -> 7.1.2-26
>   imagemagick: upgrade 7.1.2-26 -> 7.1.2-27
>   python3-tornado: upgrade 6.5.5 -> 6.5.6
>   python3-elementpath: upgrade 5.1.1 -> 5.1.2
>   python3-elementpath: upgrade 5.1.2 -> 5.1.3
>   swagger-ui: upgrade 5.32.6 -> 5.32.7
>   swagger-ui: upgrade 5.32.7 -> 5.32.8
>   libnvme: upgrade 1.16.1 -> 1.16.2
>   python3-sqlalchemy: upgrade 2.0.49 -> 2.0.50
>   python3-sqlalchemy: upgrade 2.0.50 -> 2.0.51
>   python3-socketio: upgrade 5.16.1 -> 5.16.2
>   python3-socketio: upgrade 5.16.2 -> 5.16.3
>   monocypher: upgrade 4.0.2 -> 4.0.3
>   proftpd: upgrade 1.3.9b -> 1.3.9c
>   python3-tzdata: upgrade 2026.2 -> 2026.3
>   memcached: upgrade 1.6.42 -> 1.6.43
>   memcached: upgrade 1.6.43 -> 1.6.45
>   ldns: upgrade 1.9.0 -> 1.9.2
>
> mark.yang (1):
>   python3-h11: set CVE_PRODUCT
>
>  .../ifuse/{ifuse_1.2.0.bb =3D> ifuse_1.2.1.bb}  |    2 +-
>  .../{pipewire_1.6.6.bb =3D> pipewire_1.6.8.bb}  |    2 +-
>  .../mbedtls/mbedtls_3.6.6.bb                  |   17 +
>  .../{samba_4.23.5.bb =3D> samba_4.23.8.bb}      |    2 +-
>  ...{postfix_3.10.10.bb =3D> postfix_3.10.12.bb} |    2 +-
>  .../{proftpd_1.3.9b.bb =3D> proftpd_1.3.9c.bb}  |    2 +-
>  .../radvd/files/CVE-2026-48715.patch          |  213 +++
>  .../radvd/files/CVE-2026-48715_dep.patch      |  106 ++
>  .../recipes-daemons/radvd/radvd_2.20.bb       |    2 +
>  .../libcoap/libcoap_4.3.5b.bb                 |    1 +
>  ...emcached_1.6.42.bb =3D> memcached_1.6.45.bb} |    2 +-
>  .../recipes-support/tcpdump/tcpdump_4.99.6.bb |    2 +
>  .../libwebsockets/CVE-2026-10650.patch        |   46 +
>  .../libwebsockets/libwebsockets_4.5.8.bb      |    7 +-
>  .../thrift/thrift/CVE-2026-43868.patch        | 1381 +++++++++++++++
>  .../thrift/thrift/CVE-2026-43870.patch        |  134 ++
>  .../thrift/thrift_0.22.0.bb                   |    4 +
>  ...onocypher_4.0.2.bb =3D> monocypher_4.0.3.bb} |    2 +-
>  meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb  |    3 +
>  .../jq/jq/CVE-2026-43895.patch                | 1543 +++++++++++++++++
>  .../jq/jq/CVE-2026-49839.patch                |   37 +
>  .../jq/jq/CVE-2026-54679.patch                |   77 +
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |    3 +
>  .../ldns/{ldns_1.9.0.bb =3D> ldns_1.9.2.bb}     |    2 +-
>  ...t-fix-PRIb64-length-modifier-on-musl.patch |   49 +
>  .../recipes-devtools/ltrace/ltrace_0.8.1.bb   |    1 +
>  .../php/{php_8.5.7.bb =3D> php_8.5.8.bb}        |    2 +-
>  .../protobuf/protobuf_6.33.6.bb               |    2 +
>  meta-oe/recipes-extended/7zip/7zip_26.00.bb   |    2 +
>  meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb |    3 +
>  .../{haveged_1.9.22.bb =3D> haveged_1.9.23.bb}  |    2 +-
>  .../libidn/libidn/CVE-2026-57053.patch        |   28 +
>  .../recipes-extended/libidn/libidn_1.43.bb    |    1 +
>  .../recipes-extended/sysdig/sysdig_0.39.0.bb  |   13 +-
>  .../bpftool/bpftool-native_6.16.bb            |    5 +-
>  ...-Fix-Wdiscarded-qualifiers-under-C23.patch |   69 +
>  .../nmap/files/CVE-2026-58058.patch           |   33 +
>  meta-oe/recipes-security/nmap/nmap_7.95.bb    |    1 +
>  .../{c-ares_1.34.6.bb =3D> c-ares_1.34.8.bb}    |    4 +-
>  ...ck_7.1.2-24.bb =3D> imagemagick_7.1.2-27.bb} |    2 +-
>  .../{libnvme_1.16.1.bb =3D> libnvme_1.16.2.bb}  |    4 +-
>  ...ngo_5.2.15.bb =3D> python3-django_5.2.16.bb} |    2 +-
>  ...jango_6.0.6.bb =3D> python3-django_6.0.7.bb} |    2 +-
>  ..._5.1.1.bb =3D> python3-elementpath_5.1.3.bb} |    2 +-
>  .../python/python3-grpcio_1.78.0.bb           |    2 +
>  .../python/python3-h11_0.16.0.bb              |    2 +
>  .../python/python3-protobuf_6.33.6.bb         |    2 +
>  ...o_5.16.1.bb =3D> python3-socketio_5.16.3.bb} |    2 +-
>  ...2.0.49.bb =3D> python3-sqlalchemy_2.0.51.bb} |    2 +-
>  ...nado_6.5.5.bb =3D> python3-tornado_6.5.7.bb} |    2 +-
>  ...ata_2026.2.bb =3D> python3-tzdata_2026.3.bb} |    7 +-
>  ...gger-ui_5.32.6.bb =3D> swagger-ui_5.32.8.bb} |    2 +-
>  .../{apache2_2.4.67.bb =3D> apache2_2.4.68.bb}  |    2 +-
>  .../{xdebug_3.5.1.bb =3D> xdebug_3.5.3.bb}      |    2 +-
>  54 files changed, 3814 insertions(+), 30 deletions(-)
>  rename meta-filesystems/recipes-filesystems/ifuse/{ifuse_1.2.0.bb =3D>
> ifuse_1.2.1.bb} (83%)
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.6.bb =
=3D>
> pipewire_1.6.8.bb} (99%)
>  rename meta-networking/recipes-connectivity/samba/{samba_4.23.5.bb =3D>
> samba_4.23.8.bb} (99%)
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.10.10.bb =3D>
> postfix_3.10.12.bb} (99%)
>  rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.9b.bb =3D>
> proftpd_1.3.9c.bb} (99%)
>  create mode 100644
> meta-networking/recipes-daemons/radvd/files/CVE-2026-48715.patch
>  create mode 100644
> meta-networking/recipes-daemons/radvd/files/CVE-2026-48715_dep.patch
>  rename meta-networking/recipes-support/memcached/{memcached_1.6.42.bb =
=3D>
> memcached_1.6.45.bb} (95%)
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.p=
atch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43868.patch
>  create mode 100644
> meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-43870.patch
>  rename meta-oe/recipes-crypto/monocypher/{monocypher_4.0.2.bb =3D>
> monocypher_4.0.3.bb} (85%)
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch
>  rename meta-oe/recipes-devtools/ldns/{ldns_1.9.0.bb =3D> ldns_1.9.2.bb}
> (89%)
>  create mode 100644
> meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_default-fix-PRIb64-lengt=
h-modifier-on-musl.patch
>  rename meta-oe/recipes-devtools/php/{php_8.5.7.bb =3D> php_8.5.8.bb} (99=
%)
>  rename meta-oe/recipes-extended/haveged/{haveged_1.9.22.bb =3D>
> haveged_1.9.23.bb} (94%)
>  create mode 100644
> meta-oe/recipes-extended/libidn/libidn/CVE-2026-57053.patch
>  create mode 100644
> meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-qualifi=
ers-under-C23.patch
>  create mode 100644
> meta-oe/recipes-security/nmap/files/CVE-2026-58058.patch
>  rename meta-oe/recipes-support/c-ares/{c-ares_1.34.6.bb =3D>
> c-ares_1.34.8.bb} (86%)
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-24.bb =3D>
> imagemagick_7.1.2-27.bb} (99%)
>  rename meta-oe/recipes-support/libnvme/{libnvme_1.16.1.bb =3D>
> libnvme_1.16.2.bb} (93%)
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.15.bb =3D=
>
> python3-django_5.2.16.bb} (61%)
>  rename meta-python/recipes-devtools/python/{python3-django_6.0.6.bb =3D>
> python3-django_6.0.7.bb} (75%)
>  rename meta-python/recipes-devtools/python/{python3-elementpath_5.1.1.bb
> =3D> python3-elementpath_5.1.3.bb} (86%)
>  rename meta-python/recipes-devtools/python/{python3-socketio_5.16.1.bb
> =3D> python3-socketio_5.16.3.bb} (88%)
>  rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.49.bb
> =3D> python3-sqlalchemy_2.0.51.bb} (88%)
>  rename meta-python/recipes-devtools/python/{python3-tornado_6.5.5.bb =3D=
>
> python3-tornado_6.5.7.bb} (93%)
>  rename meta-python/recipes-devtools/python/{python3-tzdata_2026.2.bb =3D=
>
> python3-tzdata_2026.3.bb} (67%)
>  rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.6.bb
> =3D> swagger-ui_5.32.8.bb} (94%)
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.67.bb =3D>
> apache2_2.4.68.bb} (99%)
>  rename meta-webserver/recipes-php/xdebug/{xdebug_3.5.1.bb =3D>
> xdebug_3.5.3.bb} (92%)
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128436):
> https://lists.openembedded.org/g/openembedded-devel/message/128436
> Mute This Topic: https://lists.openembedded.org/mt/120421135/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000008f37710657640b28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM, Merged now, thanks Anuj</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Jul 23, 2026 at 7:58=E2=80=AFPM Anuj Mittal via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mai=
lto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openemb=
edded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Please merge these changes in wrynose. Tested locally and on aut=
obuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1657" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1657</a><br>
<br>
The following changes since commit d97b5602d7f64422c94b7311466cda7f6b1962d5=
:<br>
<br>
=C2=A0 libuio: fix FILE descriptor leak (2026-07-07 08:04:43 +0530)<br>
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
for you to fetch changes up to af8b6d6b2f0b11595b0a0d5b82efa3129d52a628:<br=
>
<br>
=C2=A0 sysdig: Use LuaJIT headers to match the linked LuaJIT library (2026-=
07-24 06:15:59 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Alejandro Mery (1):<br>
=C2=A0 ltrace: fix PRIb64 length modifier on LP64 musl<br>
<br>
Ankur Tyagi (4):<br>
=C2=A0 haveged: upgrade 1.9.22 -&gt; 1.9.23<br>
=C2=A0 postfix: upgrade 3.10.10 -&gt; 3.10.12<br>
=C2=A0 python3-django: upgrade 6.0.6 -&gt; 6.0.7<br>
=C2=A0 python3-django: upgrade 5.2.15 -&gt; 5.2.16<br>
<br>
Darsh Kelaiya (3):<br>
=C2=A0 jq: Fix CVE-2026-43895<br>
=C2=A0 jq: Fix CVE-2026-49839<br>
=C2=A0 jq: Fix CVE-2026-54679<br>
<br>
Deepak Rathore (3):<br>
=C2=A0 nmap: Fix CVE-2026-58058<br>
=C2=A0 libidn: Fix CVE-2026-57053<br>
=C2=A0 mbedtls: set CVE_STATUS for CVE-2025-66442<br>
<br>
He Zhe (1):<br>
=C2=A0 bpftool-native: Fix -Wdiscarded-qualifiers errors for glibc 2.42+<br=
>
<br>
Jason Schonberg (2):<br>
=C2=A0 c-ares: upgrade 1.34.6 -&gt; 1.34.8<br>
=C2=A0 php: upgrade 8.5.7 -&gt; 8.5.8<br>
<br>
Khem Raj (5):<br>
=C2=A0 ifuse: upgrade 1.2.0 -&gt; 1.2.1<br>
=C2=A0 xdebug: upgrade 3.5.1 -&gt; 3.5.3<br>
=C2=A0 apache2: upgrade 2.4.67 -&gt; 2.4.68<br>
=C2=A0 samba: upgrade 4.23.5 -&gt; 4.23.8<br>
=C2=A0 sysdig: Use LuaJIT headers to match the linked LuaJIT library<br>
<br>
Leon Anavi (1):<br>
=C2=A0 python3-tornado: Upgrade 6.5.6 -&gt; 6.5.7<br>
<br>
Markus Volk (2):<br>
=C2=A0 pipewire: update 1.6.6 -&gt; 1.6.7<br>
=C2=A0 pipewire: update 1.6.7 -&gt; 1.6.8<br>
<br>
Peter Marko (11):<br>
=C2=A0 libwebsockets: set status for CVE-2025-1866<br>
=C2=A0 libwebsockets: patch CVE-2026-10650<br>
=C2=A0 7zip: set status for CVE-2026-58052<br>
=C2=A0 bit7z: set status for CVE-2026-45380 and CVE-2026-45384<br>
=C2=A0 c-ares: set status for CVE-2025-31498<br>
=C2=A0 grpc: set status for CVE-2023-33953 and CVE-2024-37168<br>
=C2=A0 python3-grpcio: set status for CVE-2023-33953 and CVE-2024-37168<br>
=C2=A0 protobuf: set status for CVE-2024-7254<br>
=C2=A0 python3-protobuf: set status for CVE-2024-7254<br>
=C2=A0 tcpdump: set status for CVE-2024-2397<br>
=C2=A0 libcoap: set status for CVE-2023-51847<br>
<br>
Roland Kovacs (2):<br>
=C2=A0 thrift: fix multiple CVEs<br>
=C2=A0 radvd: fix CVE-2026-48715<br>
<br>
Wang Mingyu (19):<br>
=C2=A0 imagemagick: upgrade 7.1.2-24 -&gt; 7.1.2-25<br>
=C2=A0 imagemagick: upgrade 7.1.2-25 -&gt; 7.1.2-26<br>
=C2=A0 imagemagick: upgrade 7.1.2-26 -&gt; 7.1.2-27<br>
=C2=A0 python3-tornado: upgrade 6.5.5 -&gt; 6.5.6<br>
=C2=A0 python3-elementpath: upgrade 5.1.1 -&gt; 5.1.2<br>
=C2=A0 python3-elementpath: upgrade 5.1.2 -&gt; 5.1.3<br>
=C2=A0 swagger-ui: upgrade 5.32.6 -&gt; 5.32.7<br>
=C2=A0 swagger-ui: upgrade 5.32.7 -&gt; 5.32.8<br>
=C2=A0 libnvme: upgrade 1.16.1 -&gt; 1.16.2<br>
=C2=A0 python3-sqlalchemy: upgrade 2.0.49 -&gt; 2.0.50<br>
=C2=A0 python3-sqlalchemy: upgrade 2.0.50 -&gt; 2.0.51<br>
=C2=A0 python3-socketio: upgrade 5.16.1 -&gt; 5.16.2<br>
=C2=A0 python3-socketio: upgrade 5.16.2 -&gt; 5.16.3<br>
=C2=A0 monocypher: upgrade 4.0.2 -&gt; 4.0.3<br>
=C2=A0 proftpd: upgrade 1.3.9b -&gt; 1.3.9c<br>
=C2=A0 python3-tzdata: upgrade 2026.2 -&gt; 2026.3<br>
=C2=A0 memcached: upgrade 1.6.42 -&gt; 1.6.43<br>
=C2=A0 memcached: upgrade 1.6.43 -&gt; 1.6.45<br>
=C2=A0 ldns: upgrade 1.9.0 -&gt; 1.9.2<br>
<br>
mark.yang (1):<br>
=C2=A0 python3-h11: set CVE_PRODUCT<br>
<br>
=C2=A0.../ifuse/{<a href=3D"http://ifuse_1.2.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">ifuse_1.2.0.bb</a> =3D&gt; <a href=3D"http://ifuse_1.2.1.bb" r=
el=3D"noreferrer" target=3D"_blank">ifuse_1.2.1.bb</a>}=C2=A0 |=C2=A0 =C2=
=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://pipewire_1.6.6.bb" rel=3D"noreferrer" target=
=3D"_blank">pipewire_1.6.6.bb</a> =3D&gt; <a href=3D"http://pipewire_1.6.8.=
bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.8.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_3.6.6.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mbedtls_3.6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A017 +<br>
=C2=A0.../{<a href=3D"http://samba_4.23.5.bb" rel=3D"noreferrer" target=3D"=
_blank">samba_4.23.5.bb</a> =3D&gt; <a href=3D"http://samba_4.23.8.bb" rel=
=3D"noreferrer" target=3D"_blank">samba_4.23.8.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 2 +-<br>
=C2=A0...{<a href=3D"http://postfix_3.10.10.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.10.bb</a> =3D&gt; <a href=3D"http://postfix_3.10.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.12.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://proftpd_1.3.9b.bb" rel=3D"noreferrer" target=
=3D"_blank">proftpd_1.3.9b.bb</a> =3D&gt; <a href=3D"http://proftpd_1.3.9c.=
bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.9c.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0.../radvd/files/CVE-2026-48715.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 213 +++<br>
=C2=A0.../radvd/files/CVE-2026-48715_dep.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
106 ++<br>
=C2=A0.../recipes-daemons/radvd/<a href=3D"http://radvd_2.20.bb" rel=3D"nor=
eferrer" target=3D"_blank">radvd_2.20.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 2 +<br>
=C2=A0.../libcoap/<a href=3D"http://libcoap_4.3.5b.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libcoap_4.3.5b.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0...<a href=3D"http://emcached_1.6.42.bb" rel=3D"noreferrer" target=3D=
"_blank">emcached_1.6.42.bb</a> =3D&gt; <a href=3D"http://memcached_1.6.45.=
bb" rel=3D"noreferrer" target=3D"_blank">memcached_1.6.45.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../recipes-support/tcpdump/<a href=3D"http://tcpdump_4.99.6.bb" rel=
=3D"noreferrer" target=3D"_blank">tcpdump_4.99.6.bb</a> |=C2=A0 =C2=A0 2 +<=
br>
=C2=A0.../libwebsockets/CVE-2026-10650.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A046 +<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.5.8.bb" rel=3D"no=
referrer" target=3D"_blank">libwebsockets_4.5.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 7 +-<br>
=C2=A0.../thrift/thrift/CVE-2026-43868.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
381 +++++++++++++++<br>
=C2=A0.../thrift/thrift/CVE-2026-43870.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 134 ++<br>
=C2=A0.../thrift/<a href=3D"http://thrift_0.22.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">thrift_0.22.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +<br>
=C2=A0...<a href=3D"http://onocypher_4.0.2.bb" rel=3D"noreferrer" target=3D=
"_blank">onocypher_4.0.2.bb</a> =3D&gt; <a href=3D"http://monocypher_4.0.3.=
bb" rel=3D"noreferrer" target=3D"_blank">monocypher_4.0.3.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.80.0.bb" rel=
=3D"noreferrer" target=3D"_blank">grpc_1.80.0.bb</a>=C2=A0 |=C2=A0 =C2=A0 3=
 +<br>
=C2=A0.../jq/jq/CVE-2026-43895.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1543 +++++++++++++++++<br>
=C2=A0.../jq/jq/CVE-2026-49839.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A037 +<br>
=C2=A0.../jq/jq/CVE-2026-54679.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A077 +<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 3 +<br>
=C2=A0.../ldns/{<a href=3D"http://ldns_1.9.0.bb" rel=3D"noreferrer" target=
=3D"_blank">ldns_1.9.0.bb</a> =3D&gt; <a href=3D"http://ldns_1.9.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ldns_1.9.2.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0...t-fix-PRIb64-length-modifier-on-musl.patch |=C2=A0 =C2=A049 +<br>
=C2=A0.../recipes-devtools/ltrace/<a href=3D"http://ltrace_0.8.1.bb" rel=3D=
"noreferrer" target=3D"_blank">ltrace_0.8.1.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 1 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.5.7.bb" rel=3D"noreferrer" target=3D=
"_blank">php_8.5.7.bb</a> =3D&gt; <a href=3D"http://php_8.5.8.bb" rel=3D"no=
referrer" target=3D"_blank">php_8.5.8.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../protobuf/<a href=3D"http://protobuf_6.33.6.bb" rel=3D"noreferrer"=
 target=3D"_blank">protobuf_6.33.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0meta-oe/recipes-extended/7zip/<a href=3D"http://7zip_26.00.bb" rel=3D=
"noreferrer" target=3D"_blank">7zip_26.00.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A0=
 2 +<br>
=C2=A0meta-oe/recipes-extended/7zip/<a href=3D"http://bit7z_4.0.12.bb" rel=
=3D"noreferrer" target=3D"_blank">bit7z_4.0.12.bb</a> |=C2=A0 =C2=A0 3 +<br=
>
=C2=A0.../{<a href=3D"http://haveged_1.9.22.bb" rel=3D"noreferrer" target=
=3D"_blank">haveged_1.9.22.bb</a> =3D&gt; <a href=3D"http://haveged_1.9.23.=
bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.23.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0.../libidn/libidn/CVE-2026-57053.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A028 +<br>
=C2=A0.../recipes-extended/libidn/<a href=3D"http://libidn_1.43.bb" rel=3D"=
noreferrer" target=3D"_blank">libidn_1.43.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
=C2=A0.../recipes-extended/sysdig/<a href=3D"http://sysdig_0.39.0.bb" rel=
=3D"noreferrer" target=3D"_blank">sysdig_0.39.0.bb</a>=C2=A0 |=C2=A0 =C2=A0=
13 +-<br>
=C2=A0.../bpftool/<a href=3D"http://bpftool-native_6.16.bb" rel=3D"noreferr=
er" target=3D"_blank">bpftool-native_6.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +-<br>
=C2=A0...-Fix-Wdiscarded-qualifiers-under-C23.patch |=C2=A0 =C2=A069 +<br>
=C2=A0.../nmap/files/CVE-2026-58058.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A033 +<br>
=C2=A0meta-oe/recipes-security/nmap/<a href=3D"http://nmap_7.95.bb" rel=3D"=
noreferrer" target=3D"_blank">nmap_7.95.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
1 +<br>
=C2=A0.../{<a href=3D"http://c-ares_1.34.6.bb" rel=3D"noreferrer" target=3D=
"_blank">c-ares_1.34.6.bb</a> =3D&gt; <a href=3D"http://c-ares_1.34.8.bb" r=
el=3D"noreferrer" target=3D"_blank">c-ares_1.34.8.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 4 +-<br>
=C2=A0...<a href=3D"http://ck_7.1.2-24.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ck_7.1.2-24.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-27.bb" =
rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-27.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://libnvme_1.16.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libnvme_1.16.1.bb</a> =3D&gt; <a href=3D"http://libnvme_1.16.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libnvme_1.16.2.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 4 +-<br>
=C2=A0...<a href=3D"http://ngo_5.2.15.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_5.2.15.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.16.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_5.2.16.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://jango_6.0.6.bb" rel=3D"noreferrer" target=3D"_bl=
ank">jango_6.0.6.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.7.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.7.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0..._<a href=3D"http://5.1.1.bb" rel=3D"noreferrer" target=3D"_blank">=
5.1.1.bb</a> =3D&gt; <a href=3D"http://python3-elementpath_5.1.3.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-elementpath_5.1.3.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../python/<a href=3D"http://python3-grpcio_1.78.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-grpcio_1.78.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0.../python/<a href=3D"http://python3-h11_0.16.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-h11_0.16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../python/<a href=3D"http://python3-protobuf_6.33.6.bb" rel=3D"noref=
errer" target=3D"_blank">python3-protobuf_6.33.6.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0...<a href=3D"http://o_5.16.1.bb" rel=3D"noreferrer" target=3D"_blank=
">o_5.16.1.bb</a> =3D&gt; <a href=3D"http://python3-socketio_5.16.3.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-socketio_5.16.3.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://2.0.49.bb" rel=3D"noreferrer" target=3D"_blank">=
2.0.49.bb</a> =3D&gt; <a href=3D"http://python3-sqlalchemy_2.0.51.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-sqlalchemy_2.0.51.bb</a>} |=C2=A0=
 =C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://nado_6.5.5.bb" rel=3D"noreferrer" target=3D"_bla=
nk">nado_6.5.5.bb</a> =3D&gt; <a href=3D"http://python3-tornado_6.5.7.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-tornado_6.5.7.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://ata_2026.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ata_2026.2.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.3.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-tzdata_2026.3.bb</a>} |=C2=A0 =
=C2=A0 7 +-<br>
=C2=A0...<a href=3D"http://gger-ui_5.32.6.bb" rel=3D"noreferrer" target=3D"=
_blank">gger-ui_5.32.6.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.8.b=
b" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32.8.bb</a>} |=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://apache2_2.4.67.bb" rel=3D"noreferrer" target=
=3D"_blank">apache2_2.4.67.bb</a> =3D&gt; <a href=3D"http://apache2_2.4.68.=
bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.68.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0.../{<a href=3D"http://xdebug_3.5.1.bb" rel=3D"noreferrer" target=3D"=
_blank">xdebug_3.5.1.bb</a> =3D&gt; <a href=3D"http://xdebug_3.5.3.bb" rel=
=3D"noreferrer" target=3D"_blank">xdebug_3.5.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 2 +-<br>
=C2=A054 files changed, 3814 insertions(+), 30 deletions(-)<br>
=C2=A0rename meta-filesystems/recipes-filesystems/ifuse/{<a href=3D"http://=
ifuse_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">ifuse_1.2.0.bb</a> =3D=
&gt; <a href=3D"http://ifuse_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>ifuse_1.2.1.bb</a>} (83%)<br>
=C2=A0rename meta-multimedia/recipes-multimedia/pipewire/{<a href=3D"http:/=
/pipewire_1.6.6.bb" rel=3D"noreferrer" target=3D"_blank">pipewire_1.6.6.bb<=
/a> =3D&gt; <a href=3D"http://pipewire_1.6.8.bb" rel=3D"noreferrer" target=
=3D"_blank">pipewire_1.6.8.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-connectivity/samba/{<a href=3D"http://=
samba_4.23.5.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.23.5.bb</a> =
=3D&gt; <a href=3D"http://samba_4.23.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">samba_4.23.8.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.10.10.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.10.bb</a=
> =3D&gt; <a href=3D"http://postfix_3.10.12.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.12.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-daemons/proftpd/{<a href=3D"http://pro=
ftpd_1.3.9b.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.9b.bb</a> =
=3D&gt; <a href=3D"http://proftpd_1.3.9c.bb" rel=3D"noreferrer" target=3D"_=
blank">proftpd_1.3.9c.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-20=
26-48715.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/radvd/files/CVE-20=
26-48715_dep.patch<br>
=C2=A0rename meta-networking/recipes-support/memcached/{<a href=3D"http://m=
emcached_1.6.42.bb" rel=3D"noreferrer" target=3D"_blank">memcached_1.6.42.b=
b</a> =3D&gt; <a href=3D"http://memcached_1.6.45.bb" rel=3D"noreferrer" tar=
get=3D"_blank">memcached_1.6.45.bb</a>} (95%)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-10650.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-43868.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-202=
6-43870.patch<br>
=C2=A0rename meta-oe/recipes-crypto/monocypher/{<a href=3D"http://monocyphe=
r_4.0.2.bb" rel=3D"noreferrer" target=3D"_blank">monocypher_4.0.2.bb</a> =
=3D&gt; <a href=3D"http://monocypher_4.0.3.bb" rel=3D"noreferrer" target=3D=
"_blank">monocypher_4.0.3.bb</a>} (85%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patc=
h<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patc=
h<br>
=C2=A0rename meta-oe/recipes-devtools/ldns/{<a href=3D"http://ldns_1.9.0.bb=
" rel=3D"noreferrer" target=3D"_blank">ldns_1.9.0.bb</a> =3D&gt; <a href=3D=
"http://ldns_1.9.2.bb" rel=3D"noreferrer" target=3D"_blank">ldns_1.9.2.bb</=
a>} (89%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-lens_d=
efault-fix-PRIb64-length-modifier-on-musl.patch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.5.7.bb" =
rel=3D"noreferrer" target=3D"_blank">php_8.5.7.bb</a> =3D&gt; <a href=3D"ht=
tp://php_8.5.8.bb" rel=3D"noreferrer" target=3D"_blank">php_8.5.8.bb</a>} (=
99%)<br>
=C2=A0rename meta-oe/recipes-extended/haveged/{<a href=3D"http://haveged_1.=
9.22.bb" rel=3D"noreferrer" target=3D"_blank">haveged_1.9.22.bb</a> =3D&gt;=
 <a href=3D"http://haveged_1.9.23.bb" rel=3D"noreferrer" target=3D"_blank">=
haveged_1.9.23.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/libidn/libidn/CVE-2026-57=
053.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf=
-Fix-Wdiscarded-qualifiers-under-C23.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-security/nmap/files/CVE-2026-58058=
.patch<br>
=C2=A0rename meta-oe/recipes-support/c-ares/{<a href=3D"http://c-ares_1.34.=
6.bb" rel=3D"noreferrer" target=3D"_blank">c-ares_1.34.6.bb</a> =3D&gt; <a =
href=3D"http://c-ares_1.34.8.bb" rel=3D"noreferrer" target=3D"_blank">c-are=
s_1.34.8.bb</a>} (86%)<br>
=C2=A0rename meta-oe/recipes-support/imagemagick/{<a href=3D"http://imagema=
gick_7.1.2-24.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-24=
.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-27.bb" rel=3D"noreferre=
r" target=3D"_blank">imagemagick_7.1.2-27.bb</a>} (99%)<br>
=C2=A0rename meta-oe/recipes-support/libnvme/{<a href=3D"http://libnvme_1.1=
6.1.bb" rel=3D"noreferrer" target=3D"_blank">libnvme_1.16.1.bb</a> =3D&gt; =
<a href=3D"http://libnvme_1.16.2.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibnvme_1.16.2.bb</a>} (93%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.15.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.=
15.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.16.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_5.2.16.bb</a>} (61%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_6.0.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.6=
.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.7.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-django_6.0.7.bb</a>} (75%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-elementpath_5.1.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-element=
path_5.1.1.bb</a> =3D&gt; <a href=3D"http://python3-elementpath_5.1.3.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-elementpath_5.1.3.bb</a>} (86%)=
<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-socketio_5.16.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-socketio_=
5.16.1.bb</a> =3D&gt; <a href=3D"http://python3-socketio_5.16.3.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-socketio_5.16.3.bb</a>} (88%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-sqlalchemy_2.0.49.bb" rel=3D"noreferrer" target=3D"_blank">python3-sqlalch=
emy_2.0.49.bb</a> =3D&gt; <a href=3D"http://python3-sqlalchemy_2.0.51.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-sqlalchemy_2.0.51.bb</a>} (88%)=
<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tornado_6.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.5=
.5.bb</a> =3D&gt; <a href=3D"http://python3-tornado_6.5.7.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-tornado_6.5.7.bb</a>} (93%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tzdata_2026.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-tzdata_2026=
.2.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-tzdata_2026.3.bb</a>} (67%)<br>
=C2=A0rename meta-webserver/recipes-devtools/swagger-ui/{<a href=3D"http://=
swagger-ui_5.32.6.bb" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32.=
6.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.8.bb" rel=3D"noreferrer"=
 target=3D"_blank">swagger-ui_5.32.8.bb</a>} (94%)<br>
=C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://apache=
2_2.4.67.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.67.bb</a> =3D=
&gt; <a href=3D"http://apache2_2.4.68.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.68.bb</a>} (99%)<br>
=C2=A0rename meta-webserver/recipes-php/xdebug/{<a href=3D"http://xdebug_3.=
5.1.bb" rel=3D"noreferrer" target=3D"_blank">xdebug_3.5.1.bb</a> =3D&gt; <a=
 href=3D"http://xdebug_3.5.3.bb" rel=3D"noreferrer" target=3D"_blank">xdebu=
g_3.5.3.bb</a>} (92%)<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128436): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128436" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128436</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120421135/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120421135/1997914</a><br>
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

--0000000000008f37710657640b28--

