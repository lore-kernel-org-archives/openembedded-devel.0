Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1108.1795639527792624060
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 12:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zB19gpnM;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67da62357acso8533636d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 12:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795639527; cv=none;
        d=google.com; s=arc-20260327;
        b=b2hBbMAXXGnpFJ+dfOCpWpyLULxoorsbHTrsBC29RMSMYc9EkN1cOzBybhcbsIOgAO
         Mw/FzElTdytskY5kxlcPbVNcsxA95VIktSc2NlBWPjs4KkzKjh8HsuGoU4d0iToLQWd8
         50in/GbWi+Z6gN08o4U0XCpo+KAkDcZj9CK5gAB7Sd1HGn1+J9zabu9Pb4QcE7jXGYEF
         M5q1VSWVO7J8TgWLvX/slCCnMZhSWdXtJ/uAf48cPbdEl7z3PtRWr9jaC5h9WyOoLqVg
         0P1Msgo5n2IIr1s3NYx5FAa8ztdeYlfQobQ33ifTsZ7ZEPBpCE1T7VHFIWI1G5DGqR2H
         BxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iocAP7AjLaxn2yAepa7omT/qoEmySkVmgy0sn5ngcn4=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=igV8g5XsU11+xznaw0fx1rFSbLMlcyUzoA6H/1M6TJGIhMbTl9BBXc1GVmh+6Onc8r
         BR5dyDCRO4UFVbQgOTohrb1RCLpxqVliuKex6ohM3hzngWTsbrc6q5uMO8tkO9CtrbE9
         lGc6G+ThUe4E7ESVFWN3snZkUl+TWw3LuttSLNw/5A3u/1NhsYiO1e22ErXpngayaK7Z
         qIyr5dqQ2p3uPn+Hcalps/62E905ATVRPmxI8BsTTuX3WGxoDtUJ5spLIqeiFilTUTOy
         SkNChhF5hydUjA5Xyy0bIfm54XKNYXgzBQ1Ru8VQADakqDmVuXkylp7E4rDCbnQeMVTh
         kB8Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795639527; x=1796244327; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iocAP7AjLaxn2yAepa7omT/qoEmySkVmgy0sn5ngcn4=;
        b=zB19gpnMm++x/ZMHNXdjZAexDxJ+46Zhbe3X8CPlULj3elgj67D/iK6DLA5qW+A4TM
         nf3TDUsKdmoj699Tx8E4H+PxWwVFYjOsJwmUq4UBBAXN1m0Mc1Rzy4+S11riKbt6oa4Y
         RexakpmUOxm6vSp5ePVeV+tMLUn/tdSilPJ9c6XNDEzkCRXIOh6xHpEVXH1vkimd0L5I
         Ron9R40qtsFTjP9T+RHd5sLj7E+Qy7hDlMiid94Syg57jbty1EhpAfin45IB1Dc+PBBv
         S2riee8ZwC8gidVZjbT6Nq8nbB5MWkIJhyThLUIkiLd5Y1hcSwHLva0UYaG+LE8GznDl
         QAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639527; x=1796244327;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iocAP7AjLaxn2yAepa7omT/qoEmySkVmgy0sn5ngcn4=;
        b=1t7Y1NglwT88BvOWjIbrEolQqEVFKX+W0l63gk1O4qXXfjGO9ljPb0VxNbRweNNADC
         03zMJrpZgpANwY4ejvrhT+TvEotrJSwFbEAfUNrFDVjk5/bpgOt1m+4Bh8gUFVx0KoQS
         mIdm8SZjMOZyZXeyxBGF5lbR5VBwBlshyR/ri4CXKiu4Ham+4bdC4WPGZIOc27l6W7m6
         LsBvwvre+o+RDKsWS07Tt5a0pBP+AVDq+DbtHw9ENyjBmNNbadwRZWF0DiAsBO98++jc
         0SDGe5olw3AtyapLU0Zg4GoVJCi3lYMKlwKwIKAkud1xyXJqB+6er+V9RZqCXWTLmrgD
         gc5w==
X-Gm-Message-State: APuU4Z/Zc+M5E444wXkgsdVkGeG+nxHREGS3K2TSUGCiWqT9hBNFbDaV
	0tgSR6AmPRNpROCFlykdtr09Vdav4GxXTeFWfEo+daI0HdEWpxDzBmEexjDXuy4ssXsrYyb1xrQ
	yqzN1aJG0FjR56HfKtdGFgXKJxfox70Q=
X-Gm-Gg: AZFdTZfWw5VuC75mFp0jFr3gJMhcnmI9N2l8u1XGGLihGvkB0kl1NzyY0dnouxe/Fu2
	XRMt43aVbZbUO2jbkvZKHg8MZZy1dDNA1CZfsjHNFHd/8NRzPSRU7crmguPgBhP+FcuEsCykyNG
	tiQ+EJGkxr0GJd/LoEGsI+h4AU2stBdeTjx9weMJVfWryCxeTjOQliTKkdk4/rcW6+kIjaPbK4q
	oPe7wEE9Z4JINuZJlzOuqRLAZPmYLTh3GX65Y98wCV2ShqtQ8QrBlG5BieaoLvgqbf2ivU7weM4
	wdkjzqdFPzmNpCqIgrcqrHcGQLjhdYtLXt3ctLPC4TA+E97N5GVvzAQgtSDQ4dA3i4MaenL80xS
	LaBGJ98nVTZ9cemelau9YlTjuiSIK+QhMI/YrtcabTZUjaDsA2uNqIHoIbZiyL7ev3h9b6CcerF
	J31yBI751s5203SOjeIrqHeD/gxanJ7qZe52ZBQXxdbnjkfGfYv+usH9/MWIxGRZxU4Jr2CMJBF
	u7bYLzIpTrv4DVeUeCS13T7iiVSwbcAgI4MMtrVyAgVzbVy0wXa2Ql1ibZaO0obPW4jfNaakBhg
	dn1I8g9/gsaQPxo9PYK4uETmWgSAyj1jLNe/vS9E03AEvImeakLyU9VECzx126e/
X-Received: by 2002:a05:690e:169f:b0:67d:d725:3de with SMTP id
 956f58d0204a3-67df42c441dmr9933786d50.13.1795639526611; Wed, 25 Nov 2026
 12:45:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1795448297.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1795448297.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Nov 2026 12:45:00 -0800
X-Gm-Features: Aa3M54qVQVys_d30ml68UOSC-lMdpjWYgk74Ab5H8oTTdSKp5FQabFg4E0Q3yzA
Message-ID: <CAMKF1srO6Jf-0OyM0fhtZKS=HaKQA4J=po96rZuwEeod8XuAxA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/33] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000020e13306611fe8dd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 20:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133083

--00000000000020e13306611fe8dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

LGTM and merged. Thanks Anuj

On Mon, Nov 23, 2026 at 8:25=E2=80=AFAM Anuj Mittal via openembedded-devel
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested on autobuilder and locall=
y.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1996
>
> The following changes since commit
> 2db6aece32c7f8ebf6015b468e1b4e21de072e3b:
>
>   python3-grpcio: update gRPC repo roots (2026-10-26 12:46:49 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to 96c2c78e13ff1b954715ff3c6d26bddd50a02509:
>
>   fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE (2026-11-23 19:47:2=
4
> +0530)
>
> ----------------------------------------------------------------
>
> Adarsh Jagadish Kamini (1):
>   strongswan: fix CVE-2026-78135
>
> Ankur Tyagi (2):
>   tmate: patch CVE-2026-4751
>   ncp: ignore CVE-2025-14577 and CVE-2026-35087
>
> Darsh Kelaiya (2):
>   ntfs-3g-ntfsprogs: fix CVE-2026-56135
>   ntfs-3g-ntfsprogs: mark CVE-2026-56136 as fixed
>
> Devansh Patel (1):
>   python3-ldap: correct python-ldap CVE_PRODUCT mapping
>
> Gyorgy Sarvari (1):
>   net-snmp: fix ptests
>
> Hetvi Thakar (8):
>   python3-pyjwt: fix CVE-2026-102269
>   python3-pyjwt: fix CVE-2026-102267
>   python3-pyjwt: fix CVE-2026-102268 and CVE-2026-102270
>   python3-pyjwt: fix CVE-2026-102271
>   python3-pyjwt: fix CVE-2026-101917
>   python3-pyjwt: fix CVE-2026-102275
>   python3-pyjwt: fix CVE-2026-101918
>   python3-pyjwt: fix CVE-2026-32597 test indentation
>
> Hitendra Prajapati (3):
>   nodejs: Security fix for CVE-2026-111497
>   iscsi-initiator-utils: fix for CVE-2026-44943, CVE-2026-44944
>   strongswan: fix for CVE-2026-78130, CVE-2026-78132
>
> Jason Schonberg (1):
>   brotli: upgrade 1.1.0 -> 1.1.1
>
> Joao Marcos Costa (1):
>   ntpsec: fix CVE-2026-121506
>
> Jo=C3=A3o Marcos Costa (Schneider Electric) (1):
>   meta-webserver: nginx: fix CVE-2026-15176
>
> Khem Raj (3):
>   frr: Fix build with bison rejecting paths in output directives
>   pcp: Add readline-native and ncurses-native to pcp-native DEPENDS
>   fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE
>
> Kris Gavvala (1):
>   python3-pillow: patch CVE-2026-112393
>
> Peter Marko (5):
>   libwebsockets: patch CVE-2026-114550
>   net-snmp: patch CVE-2026-89147
>   nss: patch CVE-2024-11705
>   nss: patch CVE-2024-11706
>   nss: patch CVE-2024-7531
>
> Venkata Gariganti (1):
>   mariadb: upgrade 10.11.18 -> 10.11.19
>
> Yogita Urade (2):
>   python3-pymongo: Fix CVE-2026-88029
>   python3-pymongo: Fix CVE-2026-106435
>
>  ...72_CVE-2026-42617_CVE-2026-56136_p1.patch} |   2 +-
>  ...72_CVE-2026-42617_CVE-2026-56136_p2.patch} |   2 +-
>  ...72_CVE-2026-42617_CVE-2026-56136_p3.patch} |   2 +-
>  .../files/CVE-2026-56135_p1.patch             | 141 +++
>  .../files/CVE-2026-56135_p2.patch             |  37 +
>  .../files/CVE-2026-56135_p3.patch             | 204 +++++
>  .../files/CVE-2026-56135_p4.patch             |  95 ++
>  .../ntfs-3g-ntfsprogs_2022.10.3.bb            |  10 +-
>  .../files/CVE-2026-44943.patch                | 181 ++++
>  .../files/CVE-2026-44944.patch                |  41 +
>  .../iscsi-initiator-utils_2.1.9.bb            |   2 +
>  ...ths-in-bison-output-defines-directiv.patch |  54 ++
>  .../recipes-protocols/frr/frr_9.1.3.bb        |   1 +
>  ...Remove-more-redundant-redeclarations.patch |  26 +
>  ...ggested-by-Aisle-Research-to-prevent.patch |  25 +
>  ...d-Rename-socket-descriptor-arguments.patch | 240 +++++
>  ...dows-Fix-64-bit-compatibility-issues.patch | 619 +++++++++++++
>  ...mp-Move-transport-include-directives.patch |  27 +
>  ...Enable-TCP_NODELAY-on-TCP-sockets-to.patch | 119 +++
>  .../net-snmp/net-snmp/CVE-2026-89147.patch    | 389 ++++++++
>  .../net-snmp/net-snmp_5.9.4.bb                |  13 +-
>  .../recipes-support/ncp/ncp_1.2.4.bb          |   3 +
>  .../ntpsec/ntpsec/CVE-2026-121506.patch       |  52 ++
>  .../recipes-support/ntpsec/ntpsec_1.2.2a.bb   |   1 +
>  .../strongswan/CVE-2026-78130.patch           |  55 ++
>  .../strongswan/CVE-2026-78132.patch           |  77 ++
>  .../strongswan/CVE-2026-78135.patch           |  73 ++
>  .../strongswan/strongswan_5.9.14.bb           |   3 +
>  .../libwebsockets/CVE-2026-114550.patch       |  31 +
>  .../libwebsockets/libwebsockets_4.3.10.bb     |   1 +
>  ...10.11.18.bb =3D> mariadb-native_10.11.19.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |   2 +-
>  ...ariadb_10.11.18.bb =3D> mariadb_10.11.19.bb} |   0
>  .../nodejs/nodejs/CVE-2026-111497.patch       |  71 ++
>  .../recipes-devtools/nodejs/nodejs_20.20.2.bb |   1 +
>  .../{brotli_1.1.0.bb =3D> brotli_1.1.1.bb}      |   4 +-
>  .../tmate/files/CVE-2026-4751.patch           |  75 ++
>  meta-oe/recipes-extended/tmate/tmate_2.4.0.bb |   1 +
>  ...-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch |  43 +
>  meta-oe/recipes-support/fftw/fftw_3.3.10.bb   |   1 +
>  .../nss/nss/CVE-2024-11705.patch              |  43 +
>  .../nss/nss/CVE-2024-11706.patch              |  35 +
>  .../nss/nss/CVE-2024-7531.patch               |  69 ++
>  meta-oe/recipes-support/nss/nss_3.98.bb       |   3 +
>  .../recipes-support/pcp/pcp-native_6.0.5.bb   |   2 +-
>  .../python3-pillow/CVE-2026-112393.patch      | 131 +++
>  .../python/python3-pillow_10.3.0.bb           |   1 +
>  .../python3-pyjwt/CVE-2026-101917.patch       | 311 +++++++
>  .../python3-pyjwt/CVE-2026-101918_p1.patch    | 121 +++
>  .../python3-pyjwt/CVE-2026-101918_p2.patch    | 109 +++
>  .../python3-pyjwt/CVE-2026-102267.patch       | 223 +++++
>  .../CVE-2026-102268_CVE-2026-102270.patch     | 116 +++
>  .../python3-pyjwt/CVE-2026-102269_p1.patch    | 138 +++
>  .../python3-pyjwt/CVE-2026-102269_p2.patch    | 169 ++++
>  .../python3-pyjwt/CVE-2026-102271.patch       | 141 +++
>  .../python3-pyjwt/CVE-2026-102275.patch       |  81 ++
>  .../python/python3-pyjwt/CVE-2026-32597.patch |   2 +-
>  .../python/python3-pyjwt_2.8.0.bb             |   9 +
>  .../CVE-2026-106435-regression.patch          |  79 ++
>  .../python3-pymongo/CVE-2026-106435.patch     | 134 +++
>  .../python3-pymongo/CVE-2026-88029.patch      | 840 ++++++++++++++++++
>  .../python/python3-pymongo_4.6.3.bb           |   5 +
>  .../python/python3-ldap_3.4.5.bb              |   2 +-
>  .../nginx/nginx-1.24.0/CVE-2026-15176.patch   |  52 ++
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |   1 +
>  65 files changed, 5528 insertions(+), 13 deletions(-)
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
> meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-4494=
3.patch
>  create mode 100644
> meta-networking/recipes-daemons/iscsi-initiator-utils/files/CVE-2026-4494=
4.patch
>  create mode 100644
> meta-networking/recipes-protocols/frr/frr/0001-lib-Don-t-use-paths-in-bis=
on-output-defines-directiv.patch
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0001-CHANGES-Remove-m=
ore-redundant-redeclarations.patch
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0002-fix-1098-as-sugg=
ested-by-Aisle-Research-to-prevent.patch
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0003-libsnmp-snmpd-Re=
name-socket-descriptor-arguments.patch
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0004-Windows-Fix-64-b=
it-compatibility-issues.patch
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0005-libsnmp-Move-tra=
nsport-include-directives.patch
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/0006-libsnmp-snmpd-En=
able-TCP_NODELAY-on-TCP-sockets-to.patch
>  create mode 100644
> meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch
>  create mode 100644
> meta-networking/recipes-support/ntpsec/ntpsec/CVE-2026-121506.patch
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patc=
h
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-114550.=
patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.18.bb =3D>
> mariadb-native_10.11.19.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.18.bb =3D>
> mariadb_10.11.19.bb} (100%)
>  create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-111497.patch
>  rename meta-oe/recipes-extended/brotli/{brotli_1.1.0.bb =3D>
> brotli_1.1.1.bb} (80%)
>  create mode 100644
> meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch
>  create mode 100644
> meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-not-use-CLOCK_SGI_CYCLE=
-on-Linux.patch
>  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11705.patch
>  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11706.patch
>  create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-7531.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101917.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p1.patc=
h
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-101918_p2.patc=
h
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102267.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102268_CVE-202=
6-102270.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p1.patc=
h
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102269_p2.patc=
h
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102271.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-102275.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435-regre=
ssion.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-106435.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pymongo/CVE-2026-88029.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-15176.patch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132902):
> https://lists.openembedded.org/g/openembedded-devel/message/132902
> Mute This Topic: https://lists.openembedded.org/mt/122414502/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000020e13306611fe8dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">LGTM and merged. Thanks Anuj</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Nov 23, 2026 at 8:25=E2=80=AFAM Anuj Mittal via openembedded-devel &lt;anuj=
.mittal=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qu=
alcomm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Please merge these changes in scarthgap. T=
ested on autobuilder and locally.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1996" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1996</a><br>
<br>
The following changes since commit 2db6aece32c7f8ebf6015b468e1b4e21de072e3b=
:<br>
<br>
=C2=A0 python3-grpcio: update gRPC repo roots (2026-10-26 12:46:49 +0530)<b=
r>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/scarthgap<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/scarthgap" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/meta-openembedded-contrib/log/?h=3Danujm/scarthgap</a><br>
<br>
for you to fetch changes up to 96c2c78e13ff1b954715ff3c6d26bddd50a02509:<br=
>
<br>
=C2=A0 fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE (2026-11-23 19:4=
7:24 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Adarsh Jagadish Kamini (1):<br>
=C2=A0 strongswan: fix CVE-2026-78135<br>
<br>
Ankur Tyagi (2):<br>
=C2=A0 tmate: patch CVE-2026-4751<br>
=C2=A0 ncp: ignore CVE-2025-14577 and CVE-2026-35087<br>
<br>
Darsh Kelaiya (2):<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-56135<br>
=C2=A0 ntfs-3g-ntfsprogs: mark CVE-2026-56136 as fixed<br>
<br>
Devansh Patel (1):<br>
=C2=A0 python3-ldap: correct python-ldap CVE_PRODUCT mapping<br>
<br>
Gyorgy Sarvari (1):<br>
=C2=A0 net-snmp: fix ptests<br>
<br>
Hetvi Thakar (8):<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102269<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102267<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102268 and CVE-2026-102270<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102271<br>
=C2=A0 python3-pyjwt: fix CVE-2026-101917<br>
=C2=A0 python3-pyjwt: fix CVE-2026-102275<br>
=C2=A0 python3-pyjwt: fix CVE-2026-101918<br>
=C2=A0 python3-pyjwt: fix CVE-2026-32597 test indentation<br>
<br>
Hitendra Prajapati (3):<br>
=C2=A0 nodejs: Security fix for CVE-2026-111497<br>
=C2=A0 iscsi-initiator-utils: fix for CVE-2026-44943, CVE-2026-44944<br>
=C2=A0 strongswan: fix for CVE-2026-78130, CVE-2026-78132<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 brotli: upgrade 1.1.0 -&gt; 1.1.1<br>
<br>
Joao Marcos Costa (1):<br>
=C2=A0 ntpsec: fix CVE-2026-121506<br>
<br>
Jo=C3=A3o Marcos Costa (Schneider Electric) (1):<br>
=C2=A0 meta-webserver: nginx: fix CVE-2026-15176<br>
<br>
Khem Raj (3):<br>
=C2=A0 frr: Fix build with bison rejecting paths in output directives<br>
=C2=A0 pcp: Add readline-native and ncurses-native to pcp-native DEPENDS<br=
>
=C2=A0 fftw: Fix planner hang on musl with CLOCK_SGI_CYCLE<br>
<br>
Kris Gavvala (1):<br>
=C2=A0 python3-pillow: patch CVE-2026-112393<br>
<br>
Peter Marko (5):<br>
=C2=A0 libwebsockets: patch CVE-2026-114550<br>
=C2=A0 net-snmp: patch CVE-2026-89147<br>
=C2=A0 nss: patch CVE-2024-11705<br>
=C2=A0 nss: patch CVE-2024-11706<br>
=C2=A0 nss: patch CVE-2024-7531<br>
<br>
Venkata Gariganti (1):<br>
=C2=A0 mariadb: upgrade 10.11.18 -&gt; 10.11.19<br>
<br>
Yogita Urade (2):<br>
=C2=A0 python3-pymongo: Fix CVE-2026-88029<br>
=C2=A0 python3-pymongo: Fix CVE-2026-106435<br>
<br>
=C2=A0...72_CVE-2026-42617_CVE-2026-56136_p1.patch} |=C2=A0 =C2=A02 +-<br>
=C2=A0...72_CVE-2026-42617_CVE-2026-56136_p2.patch} |=C2=A0 =C2=A02 +-<br>
=C2=A0...72_CVE-2026-42617_CVE-2026-56136_p3.patch} |=C2=A0 =C2=A02 +-<br>
=C2=A0.../files/CVE-2026-56135_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 141 +++<br>
=C2=A0.../files/CVE-2026-56135_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 37 +<br>
=C2=A0.../files/CVE-2026-56135_p3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 204 +++++<br>
=C2=A0.../files/CVE-2026-56135_p4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 95 ++<br>
=C2=A0.../<a href=3D"http://ntfs-3g-ntfsprogs_2022.10.3.bb" rel=3D"noreferr=
er" target=3D"_blank">ntfs-3g-ntfsprogs_2022.10.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +-<br>
=C2=A0.../files/CVE-2026-44943.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 181 ++++<br>
=C2=A0.../files/CVE-2026-44944.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 41 +<br>
=C2=A0.../<a href=3D"http://iscsi-initiator-utils_2.1.9.bb" rel=3D"noreferr=
er" target=3D"_blank">iscsi-initiator-utils_2.1.9.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0...ths-in-bison-output-defines-directiv.patch |=C2=A0 54 ++<br>
=C2=A0.../recipes-protocols/frr/<a href=3D"http://frr_9.1.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">frr_9.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0...Remove-more-redundant-redeclarations.patch |=C2=A0 26 +<br>
=C2=A0...ggested-by-Aisle-Research-to-prevent.patch |=C2=A0 25 +<br>
=C2=A0...d-Rename-socket-descriptor-arguments.patch | 240 +++++<br>
=C2=A0...dows-Fix-64-bit-compatibility-issues.patch | 619 +++++++++++++<br>
=C2=A0...mp-Move-transport-include-directives.patch |=C2=A0 27 +<br>
=C2=A0...Enable-TCP_NODELAY-on-TCP-sockets-to.patch | 119 +++<br>
=C2=A0.../net-snmp/net-snmp/CVE-2026-89147.patch=C2=A0 =C2=A0 | 389 +++++++=
+<br>
=C2=A0.../net-snmp/<a href=3D"http://net-snmp_5.9.4.bb" rel=3D"noreferrer" =
target=3D"_blank">net-snmp_5.9.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +-<br>
=C2=A0.../recipes-support/ncp/<a href=3D"http://ncp_1.2.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">ncp_1.2.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A03 +<br>
=C2=A0.../ntpsec/ntpsec/CVE-2026-121506.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 52 ++<br>
=C2=A0.../recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.2a.bb" rel=3D=
"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0.../strongswan/CVE-2026-78130.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 55 ++<br>
=C2=A0.../strongswan/CVE-2026-78132.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 77 ++<br>
=C2=A0.../strongswan/CVE-2026-78135.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 73 ++<br>
=C2=A0.../strongswan/<a href=3D"http://strongswan_5.9.14.bb" rel=3D"norefer=
rer" target=3D"_blank">strongswan_5.9.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0.../libwebsockets/CVE-2026-114550.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 31 +<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.3.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">libwebsockets_4.3.10.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://10.11.18.bb" rel=3D"noreferrer" target=3D"_blank=
">10.11.18.bb</a> =3D&gt; <a href=3D"http://mariadb-native_10.11.19.bb" rel=
=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.19.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ariadb_10.11.18.bb" rel=3D"noreferrer" target=3D=
"_blank">ariadb_10.11.18.bb</a> =3D&gt; <a href=3D"http://mariadb_10.11.19.=
bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.19.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0.../nodejs/nodejs/CVE-2026-111497.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 71 ++<br>
=C2=A0.../recipes-devtools/nodejs/<a href=3D"http://nodejs_20.20.2.bb" rel=
=3D"noreferrer" target=3D"_blank">nodejs_20.20.2.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A0.../{<a href=3D"http://brotli_1.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">brotli_1.1.0.bb</a> =3D&gt; <a href=3D"http://brotli_1.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">brotli_1.1.1.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A04 +-<br>
=C2=A0.../tmate/files/CVE-2026-4751.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 75 ++<br>
=C2=A0meta-oe/recipes-extended/tmate/<a href=3D"http://tmate_2.4.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tmate_2.4.0.bb</a> |=C2=A0 =C2=A01 +<br>
=C2=A0...-Do-not-use-CLOCK_SGI_CYCLE-on-Linux.patch |=C2=A0 43 +<br>
=C2=A0meta-oe/recipes-support/fftw/<a href=3D"http://fftw_3.3.10.bb" rel=3D=
"noreferrer" target=3D"_blank">fftw_3.3.10.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0.../nss/nss/CVE-2024-11705.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 43 +<br>
=C2=A0.../nss/nss/CVE-2024-11706.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 35 +<br>
=C2=A0.../nss/nss/CVE-2024-7531.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 69 ++<br>
=C2=A0meta-oe/recipes-support/nss/<a href=3D"http://nss_3.98.bb" rel=3D"nor=
eferrer" target=3D"_blank">nss_3.98.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A03 +<br>
=C2=A0.../recipes-support/pcp/<a href=3D"http://pcp-native_6.0.5.bb" rel=3D=
"noreferrer" target=3D"_blank">pcp-native_6.0.5.bb</a>=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python3-pillow/CVE-2026-112393.patch=C2=A0 =C2=A0 =C2=A0 | 131 ++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-pillow_10.3.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pillow_10.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../python3-pyjwt/CVE-2026-101917.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3=
11 +++++++<br>
=C2=A0.../python3-pyjwt/CVE-2026-101918_p1.patch=C2=A0 =C2=A0 | 121 +++<br>
=C2=A0.../python3-pyjwt/CVE-2026-101918_p2.patch=C2=A0 =C2=A0 | 109 +++<br>
=C2=A0.../python3-pyjwt/CVE-2026-102267.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
23 +++++<br>
=C2=A0.../CVE-2026-102268_CVE-2026-102270.patch=C2=A0 =C2=A0 =C2=A0| 116 ++=
+<br>
=C2=A0.../python3-pyjwt/CVE-2026-102269_p1.patch=C2=A0 =C2=A0 | 138 +++<br>
=C2=A0.../python3-pyjwt/CVE-2026-102269_p2.patch=C2=A0 =C2=A0 | 169 ++++<br=
>
=C2=A0.../python3-pyjwt/CVE-2026-102271.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
41 +++<br>
=C2=A0.../python3-pyjwt/CVE-2026-102275.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 81 ++<br>
=C2=A0.../python/python3-pyjwt/CVE-2026-32597.patch |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-pyjwt_2.8.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-pyjwt_2.8.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
=C2=A0.../CVE-2026-106435-regression.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 79 ++<br>
=C2=A0.../python3-pymongo/CVE-2026-106435.patch=C2=A0 =C2=A0 =C2=A0| 134 ++=
+<br>
=C2=A0.../python3-pymongo/CVE-2026-88029.patch=C2=A0 =C2=A0 =C2=A0 | 840 ++=
++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-pymongo_4.6.3.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pymongo_4.6.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0.../python/<a href=3D"http://python3-ldap_3.4.5.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-ldap_3.4.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../nginx/nginx-1.24.0/CVE-2026-15176.patch=C2=A0 =C2=A0|=C2=A0 52 ++=
<br>
=C2=A0.../recipes-httpd/nginx/<a href=3D"http://nginx_1.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">nginx_1.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A065 files changed, 5528 insertions(+), 13 deletions(-)<br>
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
=C2=A0create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-ut=
ils/files/CVE-2026-44943.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-ut=
ils/files/CVE-2026-44944.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/frr/frr/0001-lib=
-Don-t-use-paths-in-bison-output-defines-directiv.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/0001-CHANGES-Remove-more-redundant-redeclarations.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/0002-fix-1098-as-suggested-by-Aisle-Research-to-prevent.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/0003-libsnmp-snmpd-Rename-socket-descriptor-arguments.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/0004-Windows-Fix-64-bit-compatibility-issues.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/0005-libsnmp-Move-transport-include-directives.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/0006-libsnmp-snmpd-Enable-TCP_NODELAY-on-TCP-sockets-to.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snm=
p/CVE-2026-89147.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/CVE-=
2026-121506.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78130.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78132.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78135.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-114550.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_10=
.11.18.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_10.11.18.bb<=
/a> =3D&gt; <a href=3D"http://mariadb-native_10.11.19.bb" rel=3D"noreferrer=
" target=3D"_blank">mariadb-native_10.11.19.bb</a>} (100%)<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_10.11.18.=
bb" rel=3D"noreferrer" target=3D"_blank">mariadb_10.11.18.bb</a> =3D&gt; <a=
 href=3D"http://mariadb_10.11.19.bb" rel=3D"noreferrer" target=3D"_blank">m=
ariadb_10.11.19.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-11=
1497.patch<br>
=C2=A0rename meta-oe/recipes-extended/brotli/{<a href=3D"http://brotli_1.1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">brotli_1.1.0.bb</a> =3D&gt; <a h=
ref=3D"http://brotli_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">brotli_=
1.1.1.bb</a>} (80%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/tmate/files/CVE-2026-4751=
.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/fftw/fftw/0001-cycle.h-Do-=
not-use-CLOCK_SGI_CYCLE-on-Linux.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11705.pat=
ch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-11706.pat=
ch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2024-7531.patc=
h<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-112393.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-101917.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-101918_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-101918_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-102267.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-102268_CVE-2026-102270.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-102269_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-102269_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-102271.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-102275.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pymong=
o/CVE-2026-106435-regression.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pymong=
o/CVE-2026-106435.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pymong=
o/CVE-2026-88029.patch<br>
=C2=A0create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CV=
E-2026-15176.patch<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132902): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132902" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132902</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122414502/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122414502/1997914</a><br>
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

--00000000000020e13306611fe8dd--
