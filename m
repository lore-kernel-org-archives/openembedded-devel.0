Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12611.1793078940290226259
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 22:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kkwcec+V;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0a921ee46so30302387b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 22:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793078939; cv=none;
        d=google.com; s=arc-20260327;
        b=YXvAQ7EwylVi8cgPR/2K8HN+Oy9TYbkyFkmN7mwMrOjcbxvvhFxCua0Sv9ExZoOZGq
         7G6jm2M48b8wiRsOh75VHilElBI7Tesof5RxhfImbzI5OFoLQ1fiUWczI+eU4Er+nF1I
         VwbsyG+P+8anLe8TqcDgyXHbng5Pdxa644Oh3rWa9hSCirK7R5PlKXy+i68Blj27pahk
         9lmiUfgcDmf7hPEn4m+xcGlO3cWxRTR+iRHhoSNjIZVfwq73G9HOxo2STJSYgvbIonDU
         BsttvUAZrWR6FVLItaX/mM8mj6jLJlRumlG6QYMUQnfKFcdd8BqzQcqE64XpVrQGUozT
         mpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JE7vdYtfPdp72oHJqyw4Yco6VjJ7kd4ObwdzQph04iA=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=rheiG7i/scc2DCUZPrl2s21E9cA8sTwbNJFBwKVK2d4yThTgmL5i09BPT9GSwwaXMG
         Gp0YkDdZGh3ZS0+yx9smUoLRXMqeSVG8YxrEUbhU0KA3TxRdW4i1BEA7H9TE5WNakQwX
         X0mha5ZWs6b9lWovkDXSguFPFGDRF6/lIsGkMWKByYqNRKOxqk+BNOFdQYDEDPs/9Rmd
         l3J09VHe3n21mQJ+vXvz5/sjO+/5P6O/uvT2yVQJfa4h1jZEGLD49XdPjenVGKT6WE1N
         63mwxbWq+ht4oawL11z+0BbnlQ5DSulW3bKdyRlY2bnymH1thHxzobBWMubERwtviABI
         dCHQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078939; x=1793683739; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JE7vdYtfPdp72oHJqyw4Yco6VjJ7kd4ObwdzQph04iA=;
        b=kkwcec+V4EjHtMlN3izrM/P2r2HqfWZJ9rbgoiEznrR8nQW+EE2a45MIDooGy5vZOF
         Vvzakr81WgntejUHUi+hRRgZQgXKWKDDqwr+B3tFqorqYKaPRyR3X4XltZO6wFU3ySSE
         B8Wnw5BDpwJoJMDnqWUGxGcoSW8TiOKFfgnr2iHg+ltQoSUxSldhl/e1p2+u7zCxW5to
         RLPTu2xSHqHBDZk9Q7DBT3X9mO4YBVB40GUCCbzJYdG6fGb2Wb8Pn+GhHDzmhrwL19/o
         fiFrLp89vyJetJzBUuK5UvPUMDOJtX3SoJ6MxsLzHg+R3P74eWAjof1kAhZI9yr/u1HK
         OlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078939; x=1793683739;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JE7vdYtfPdp72oHJqyw4Yco6VjJ7kd4ObwdzQph04iA=;
        b=Qy5Xx2E0PIbs+e1cL2i2NgNLlcs7MMnFj/wfftANlLxL5hI5CTGXndSXUf5YZiPfbm
         JfxztHI7icvpVxM/iLp/zlfsJv1IwkXgP6P1FyKYW9sclXYz/oVM+eTRDi35OwVM3QbK
         AGpfXDeeFfqM/jLlE6W/6+hkTqQXkZdHstELesgtZTdvoEXGhgZJs0/QTsqeI4EX9Wha
         H8vF2tBcEshBc/TsEBWMZCXcpLOEwy0PTQpgjEJjK2HNIoABwacLqn4RnRC2LEKz2MZ4
         18W1UJf+TiBO5h+ynTrq/X91Qa/O1PgxrpKTskaDHgRMdHCPqZK9qVKOlQgzpARBlYQp
         5d3g==
X-Gm-Message-State: AFq9FYLqAdTNzNQQmcBEcnYqc5i62X1d6Ml9qI+VIM1fLhe5LvaLWcZM
	47V0XQKLcTI4hHUO/5/R2dNZrt1cqOOOd0YwDmXBF8dfo7Gia7JUlz54HbzNUnLGmB90vLj11RU
	8VRQiCaWcFuUnrrKL6lZXyuPUu9auzJM=
X-Gm-Gg: AYBFou2783LKqz50BW6jts8viswhc1JzaimloEKENBMuPUU9a2op85RvTqWPw9id/M0
	lxdLjsU9WYvYSUoSICSLrOYtgMb28kixGL32yztVJbag+E+gWvV9zRC2hnZ/5jN0Bfl7+iJR/oU
	OZKSd0DlG31cyqm7kmHHVR8Kv2e0y7nvZiTXMYccd5frP6sAwthWluvuWGjquLHlZO3C6JHUyPU
	uWSv3XN9Jr4g6Bs7GzkP0vUAejfxPYuCUoK21DDgArvJtN4nlkylAbNXTsFLzSNTtUzhvGfAskO
	edta4+Hf2XX80YRQXETKk0Rk+gwpq9LmrG54yNb543P5EIyftdXGm6LyXrr6KpQxjmP8KV21kMG
	F18WTI+7y1AYqyCCbEbQ4PRcxu714O1jlFf/A2Wh9fqmcEgIweDlHyDf5l6I0o2vXoqIG/XQInP
	J0MIubKK6PtacGtr12U62/H1aVKO36B1PVEPoVpI1EdbWMpuQp3eWIZwlCry32U+Zz3qiQ/hVkJ
	+NqI1NuDBdv7gM1hCk6zIEwhbXoXAWMd8ol1ubT3HgMy+GJZNJT22za3WU8AqldiWT7IDRrH8I+
	vECExDpEUhtqKoqKzff+6vPoRQzxurYICpiSh17INkAaZo7abxWnsKad3qL7pYXdZEMunlq3UM/
	hRZ4eb7iRYUPGeLxaNpfJ+xGWJg7p+S0uSpeHV7CQvOI=
X-Received: by 2002:a05:690c:e3cc:b0:89a:63da:fa8f with SMTP id
 00721157ae682-8b166c3be27mr63390927b3.74.1793078939118; Mon, 26 Oct 2026
 22:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1793075119.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1793075119.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Oct 2026 22:28:32 -0700
X-Gm-Features: AclHuK9JiGRHe7XO5XZRChpZKw2H1FxhFf15ETwGEjqzxcgXj6F_YnSRFaCJsUA
Message-ID: <CAMKF1so-gZx1QfdCtL=pNqD6=WZa9i3gH9UAsSz86ZiMTOPhjA@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/45] Scarthgap pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000387009065ecbb9ff"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 05:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131456

--000000000000387009065ecbb9ff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged now, thanks Anuj

On Mon, Oct 26, 2026 at 9:37=E2=80=AFPM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in scarthgap. Tested locally and on autbuilder=
:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1901
>
> The following changes since commit
> 0f00f8b9a21950640da8c5707343e5540133f86e:
>
>   vboxguestdrivers: fix vboxvideo build on kernels lacking
> drm_fb_helper_alloc_info (2026-09-29 16:10:23 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/sca=
rthgap
>
> for you to fetch changes up to 2db6aece32c7f8ebf6015b468e1b4e21de072e3b:
>
>   python3-grpcio: update gRPC repo roots (2026-10-26 12:46:49 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (1):
>   apache2: upgrade 2.4.68 -> 2.4.69
>
> Darsh Kelaiya (20):
>   python3-aiohttp: fix CVE-2026-34519
>   python3-aiohttp: fix CVE-2026-34516
>   python3-aiohttp: fix CVE-2026-34517
>   python3-aiohttp: fix CVE-2026-34520
>   python3-aiohttp: fix CVE-2026-34525
>   python3-aiohttp: fix CVE-2026-47265
>   python3-aiohttp: fix CVE-2026-50269
>   python3-aiohttp: fix CVE-2026-54274
>   python3-aiohttp: fix CVE-2026-54275
>   python3-aiohttp: fix CVE-2026-54277
>   python3-aiohttp: fix CVE-2026-54278
>   python3-aiohttp: fix CVE-2026-54279
>   python3-aiohttp: fix CVE-2026-54273
>   ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617
>   ntfs-3g-ntfsprogs: fix CVE-2026-46571
>   ntfs-3g-ntfsprogs: fix CVE-2026-46570
>   ntfs-3g-ntfsprogs: fix CVE-2026-46569
>   ntfs-3g-ntfsprogs: fix CVE-2026-42618
>   ntfs-3g-ntfsprogs: fix CVE-2026-42616
>   ntfs-3g-ntfsprogs: fix CVE-2026-40706
>
> Jason Schonberg (1):
>   php: upgrade 8.2.34 -> 8.2.35
>
> Jo=C3=A3o Marcos Costa (Schneider Electric) (2):
>   ntp: add CVE-2016-1548 to CVE_STATUS_NTP
>   ntpsec: add CVE_STATUS for CVE-2016-1548
>
> Mehmet Fide (1):
>   spidev-test: clean the build dir before configure
>
> Peter Marko (15):
>   c-ares: patch CVE-2026-69186
>   c-ares: patch CVE-2026-69184
>   cjson: patch CVE-2026-87933
>   syslog-ng: patch CVE-2026-39879
>   libwebsockets: patch CVE-2026-78161
>   squid: patch CVE-2026-33526
>   squid: patch CVE-2026-33515
>   squid: patch CVE-2026-32748
>   squid: patch CVE-2026-47729
>   squid: patch CVE-2026-50012
>   squid: patch CVE-2026-61642
>   squid: patch CVE-2026-104786
>   nss: remove compromised eMudhra certificates
>   grpc: update gRPC repo roots
>   python3-grpcio: update gRPC repo roots
>
> Rohini Sangam (3):
>   nodejs: Security fix for CVE-2026-48617
>   nodejs: Security fix for CVE-2026-48619
>   nodejs: Security fix for CVE-2026-48937
>
> Yogita Urade (2):
>   hdf5: Fix CVE-2026-17573
>   hdf5: Fix CVE-2026-17574
>
>  .../files/CVE-2026-40706_p1.patch             |    60 +
>  .../files/CVE-2026-40706_p2.patch             |    34 +
>  .../files/CVE-2026-42616.patch                |    70 +
>  .../files/CVE-2026-42618_p1.patch             |    53 +
>  .../files/CVE-2026-42618_p2.patch             |   216 +
>  .../files/CVE-2026-46569.patch                |    62 +
>  .../files/CVE-2026-46570.patch                |    42 +
>  .../files/CVE-2026-46571.patch                |    50 +
>  .../CVE-2026-46572_CVE-2026-42617_p1.patch    |    66 +
>  .../CVE-2026-46572_CVE-2026-42617_p2.patch    |   104 +
>  .../CVE-2026-46572_CVE-2026-42617_p3.patch    |    35 +
>  .../ntfs-3g-ntfsprogs_2022.10.3.bb            |    11 +
>  .../squid/files/CVE-2026-104786.patch         |   131 +
>  .../squid/files/CVE-2026-32748.patch          |   182 +
>  .../squid/files/CVE-2026-33515.patch          |   199 +
>  .../squid/files/CVE-2026-33526.patch          |    35 +
>  .../squid/files/CVE-2026-47729.patch          |    51 +
>  .../squid/files/CVE-2026-50012-01.patch       |    34 +
>  .../squid/files/CVE-2026-50012-02.patch       |    31 +
>  .../squid/files/CVE-2026-61642.patch          |    43 +
>  .../recipes-daemons/squid/squid_6.14.bb       |     8 +
>  .../recipes-support/ntp/ntp_4.2.8p17.bb       |     1 +
>  .../recipes-support/ntpsec/ntpsec_1.2.2a.bb   |     2 +
>  .../libwebsockets/CVE-2026-78161.patch        |    45 +
>  .../libwebsockets/libwebsockets_4.3.10.bb     |     1 +
>  .../cjson/cjson/CVE-2026-87933.patch          |   108 +
>  .../recipes-devtools/cjson/cjson_1.7.19.bb    |     1 +
>  ...e-repo-roots-to-chromium-roots-42094.patch | 14348 ++++++++++++++++
>  ...curity-Update-gRPC-repo-roots.-43699.patch |  2617 +++
>  meta-oe/recipes-devtools/grpc/grpc_1.60.1.bb  |     2 +
>  .../nodejs/nodejs/CVE-2026-48617.patch        |   118 +
>  .../nodejs/nodejs/CVE-2026-48619.patch        |   253 +
>  .../nodejs/nodejs/CVE-2026-48937.patch        |   349 +
>  .../recipes-devtools/nodejs/nodejs_20.20.2.bb |     3 +
>  .../php/{php_8.2.34.bb =3D> php_8.2.35.bb}      |     2 +-
>  .../recipes-kernel/spidev-test/spidev-test.bb |     1 +
>  .../c-ares/c-ares/CVE-2026-69184.patch        |   295 +
>  .../c-ares/c-ares/CVE-2026-69186.patch        |   159 +
>  .../recipes-support/c-ares/c-ares_1.27.0.bb   |     5 +-
>  .../hdf5/files/CVE-2026-17573.patch           |    49 +
>  .../hdf5/files/CVE-2026-17574.patch           |    62 +
>  meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |     2 +
>  ...ve-eMudhra-emSign-Root-CA-C1-and-emS.patch |   272 +
>  ...ve-eMudhra-emSign-Root-CA-G3-from-NS.patch |   143 +
>  meta-oe/recipes-support/nss/nss_3.98.bb       |     2 +
>  .../syslog-ng/files/CVE-2026-39879-01.patch   |    65 +
>  .../syslog-ng/files/CVE-2026-39879-02.patch   |   571 +
>  .../syslog-ng/files/CVE-2026-39879-03.patch   |   758 +
>  .../syslog-ng/files/CVE-2026-39879-04.patch   |   176 +
>  .../syslog-ng/syslog-ng_4.6.0.bb              |     4 +
>  .../python3-aiohttp/CVE-2026-34516.patch      |   356 +
>  .../python3-aiohttp/CVE-2026-34517.patch      |    65 +
>  .../python3-aiohttp/CVE-2026-34519.patch      |   638 +
>  .../python3-aiohttp/CVE-2026-34520.patch      |   121 +
>  .../python3-aiohttp/CVE-2026-34525_p1.patch   |   128 +
>  .../python3-aiohttp/CVE-2026-34525_p2.patch   |   331 +
>  .../python3-aiohttp/CVE-2026-47265.patch      |    61 +
>  .../python3-aiohttp/CVE-2026-50269.patch      |   166 +
>  .../python3-aiohttp/CVE-2026-54273_p1.patch   |   798 +
>  .../python3-aiohttp/CVE-2026-54273_p2.patch   |   181 +
>  .../python3-aiohttp/CVE-2026-54274.patch      |   195 +
>  .../python3-aiohttp/CVE-2026-54275.patch      |   124 +
>  .../python3-aiohttp/CVE-2026-54277.patch      |    96 +
>  .../python3-aiohttp/CVE-2026-54278.patch      |   209 +
>  .../python3-aiohttp/CVE-2026-54279.patch      |   317 +
>  .../python/python3-aiohttp_3.9.5.bb           |    15 +
>  .../0001-Update-gRPC-repo-roots.-43699.patch  |  2617 +++
>  ...e-repo-roots-to-chromium-roots-42094.patch | 14324 +++++++++++++++
>  .../python/python3-grpcio_1.62.2.bb           |     6 +
>  .../{apache2_2.4.68.bb =3D> apache2_2.4.69.bb}  |     2 +-
>  70 files changed, 42678 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-407=
06_p1.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-407=
06_p2.patch
>  create mode 100644
> meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-426=
16.patch
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
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2026-104786.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2026-32748.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2026-33515.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2026-33526.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2026-47729.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2026-50012-01.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2026-50012-02.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2026-61642.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-78161.p=
atch
>  create mode 100644
> meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch
>  create mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-Security-Update-repo-roots-to-chr=
omium-roots-42094.patch
>  create mode 100644
> meta-oe/recipes-devtools/grpc/grpc/0001-security-Update-gRPC-repo-roots.-=
43699.patch
>  create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48617.patch
>  create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48619.patch
>  create mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48937.patch
>  rename meta-oe/recipes-devtools/php/{php_8.2.34.bb =3D> php_8.2.35.bb}
> (99%)
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69184.patch
>  create mode 100644
> meta-oe/recipes-support/c-ares/c-ares/CVE-2026-69186.patch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.pat=
ch
>  create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.pat=
ch
>  create mode 100644
> meta-oe/recipes-support/nss/nss/0008-Bug-2083709-Remove-eMudhra-emSign-Ro=
ot-CA-C1-and-emS.patch
>  create mode 100644
> meta-oe/recipes-support/nss/nss/0009-Bug-2084101-Remove-eMudhra-emSign-Ro=
ot-CA-G3-from-NS.patch
>  create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-01.patch
>  create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-02.patch
>  create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-03.patch
>  create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-04.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34516.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34517.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34519.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34520.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p1.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34525_p2.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p1.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/0001-Update-gRPC-repo-=
roots.-43699.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-grpcio/0001-Update-repo-roots=
-to-chromium-roots-42094.patch
>  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb =3D>
> apache2_2.4.69.bb} (99%)
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131455):
> https://lists.openembedded.org/g/openembedded-devel/message/131455
> Mute This Topic: https://lists.openembedded.org/mt/121955317/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000387009065ecbb9ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged now, thanks Anuj</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 2=
6, 2026 at 9:37=E2=80=AFPM Anuj Mittal via <a href=3D"http://lists.openembe=
dded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:os=
s.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Please merge these changes in scarthgap. Tested locally and on autbuilde=
r:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1901" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1901</a><br>
<br>
The following changes since commit 0f00f8b9a21950640da8c5707343e5540133f86e=
:<br>
<br>
=C2=A0 vboxguestdrivers: fix vboxvideo build on kernels lacking drm_fb_help=
er_alloc_info (2026-09-29 16:10:23 +0530)<br>
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
for you to fetch changes up to 2db6aece32c7f8ebf6015b468e1b4e21de072e3b:<br=
>
<br>
=C2=A0 python3-grpcio: update gRPC repo roots (2026-10-26 12:46:49 +0530)<b=
r>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (1):<br>
=C2=A0 apache2: upgrade 2.4.68 -&gt; 2.4.69<br>
<br>
Darsh Kelaiya (20):<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34519<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34516<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34517<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34520<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34525<br>
=C2=A0 python3-aiohttp: fix CVE-2026-47265<br>
=C2=A0 python3-aiohttp: fix CVE-2026-50269<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54274<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54275<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54277<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54278<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54279<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54273<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-46571<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-46570<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-46569<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-42618<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-42616<br>
=C2=A0 ntfs-3g-ntfsprogs: fix CVE-2026-40706<br>
<br>
Jason Schonberg (1):<br>
=C2=A0 php: upgrade 8.2.34 -&gt; 8.2.35<br>
<br>
Jo=C3=A3o Marcos Costa (Schneider Electric) (2):<br>
=C2=A0 ntp: add CVE-2016-1548 to CVE_STATUS_NTP<br>
=C2=A0 ntpsec: add CVE_STATUS for CVE-2016-1548<br>
<br>
Mehmet Fide (1):<br>
=C2=A0 spidev-test: clean the build dir before configure<br>
<br>
Peter Marko (15):<br>
=C2=A0 c-ares: patch CVE-2026-69186<br>
=C2=A0 c-ares: patch CVE-2026-69184<br>
=C2=A0 cjson: patch CVE-2026-87933<br>
=C2=A0 syslog-ng: patch CVE-2026-39879<br>
=C2=A0 libwebsockets: patch CVE-2026-78161<br>
=C2=A0 squid: patch CVE-2026-33526<br>
=C2=A0 squid: patch CVE-2026-33515<br>
=C2=A0 squid: patch CVE-2026-32748<br>
=C2=A0 squid: patch CVE-2026-47729<br>
=C2=A0 squid: patch CVE-2026-50012<br>
=C2=A0 squid: patch CVE-2026-61642<br>
=C2=A0 squid: patch CVE-2026-104786<br>
=C2=A0 nss: remove compromised eMudhra certificates<br>
=C2=A0 grpc: update gRPC repo roots<br>
=C2=A0 python3-grpcio: update gRPC repo roots<br>
<br>
Rohini Sangam (3):<br>
=C2=A0 nodejs: Security fix for CVE-2026-48617<br>
=C2=A0 nodejs: Security fix for CVE-2026-48619<br>
=C2=A0 nodejs: Security fix for CVE-2026-48937<br>
<br>
Yogita Urade (2):<br>
=C2=A0 hdf5: Fix CVE-2026-17573<br>
=C2=A0 hdf5: Fix CVE-2026-17574<br>
<br>
=C2=A0.../files/CVE-2026-40706_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 60 +<br>
=C2=A0.../files/CVE-2026-40706_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 34 +<br>
=C2=A0.../files/CVE-2026-42616.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 70 +<br>
=C2=A0.../files/CVE-2026-42618_p1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 53 +<br>
=C2=A0.../files/CVE-2026-42618_p2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0216 +<br>
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
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 11 +<br>
=C2=A0.../squid/files/CVE-2026-104786.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0131 +<br>
=C2=A0.../squid/files/CVE-2026-32748.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0182 +<br>
=C2=A0.../squid/files/CVE-2026-33515.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0199 +<br>
=C2=A0.../squid/files/CVE-2026-33526.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 35 +<br>
=C2=A0.../squid/files/CVE-2026-47729.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 51 +<br>
=C2=A0.../squid/files/CVE-2026-50012-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 34 +<br>
=C2=A0.../squid/files/CVE-2026-50012-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 31 +<br>
=C2=A0.../squid/files/CVE-2026-61642.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 43 +<br>
=C2=A0.../recipes-daemons/squid/<a href=3D"http://squid_6.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">squid_6.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 =C2=A08 +<br>
=C2=A0.../recipes-support/ntp/<a href=3D"http://ntp_4.2.8p17.bb" rel=3D"nor=
eferrer" target=3D"_blank">ntp_4.2.8p17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.2a.bb" rel=3D=
"noreferrer" target=3D"_blank">ntpsec_1.2.2a.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A02 +<br>
=C2=A0.../libwebsockets/CVE-2026-78161.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 45 +<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.3.10.bb" rel=3D"n=
oreferrer" target=3D"_blank">libwebsockets_4.3.10.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 =C2=A01 +<br>
=C2=A0.../cjson/cjson/CVE-2026-87933.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0108 +<br>
=C2=A0.../recipes-devtools/cjson/<a href=3D"http://cjson_1.7.19.bb" rel=3D"=
noreferrer" target=3D"_blank">cjson_1.7.19.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 =C2=A01 +<br>
=C2=A0...e-repo-roots-to-chromium-roots-42094.patch | 14348 +++++++++++++++=
+<br>
=C2=A0...curity-Update-gRPC-repo-roots.-43699.patch |=C2=A0 2617 +++<br>
=C2=A0meta-oe/recipes-devtools/grpc/<a href=3D"http://grpc_1.60.1.bb" rel=
=3D"noreferrer" target=3D"_blank">grpc_1.60.1.bb</a>=C2=A0 |=C2=A0 =C2=A0 =
=C2=A02 +<br>
=C2=A0.../nodejs/nodejs/CVE-2026-48617.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0118 +<br>
=C2=A0.../nodejs/nodejs/CVE-2026-48619.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0253 +<br>
=C2=A0.../nodejs/nodejs/CVE-2026-48937.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0349 +<br>
=C2=A0.../recipes-devtools/nodejs/<a href=3D"http://nodejs_20.20.2.bb" rel=
=3D"noreferrer" target=3D"_blank">nodejs_20.20.2.bb</a> |=C2=A0 =C2=A0 =C2=
=A03 +<br>
=C2=A0.../php/{<a href=3D"http://php_8.2.34.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.2.34.bb</a> =3D&gt; <a href=3D"http://php_8.2.35.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.2.35.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A02 +-<br>
=C2=A0.../recipes-kernel/spidev-test/<a href=3D"http://spidev-test.bb" rel=
=3D"noreferrer" target=3D"_blank">spidev-test.bb</a> |=C2=A0 =C2=A0 =C2=A01=
 +<br>
=C2=A0.../c-ares/c-ares/CVE-2026-69184.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0295 +<br>
=C2=A0.../c-ares/c-ares/CVE-2026-69186.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0159 +<br>
=C2=A0.../recipes-support/c-ares/<a href=3D"http://c-ares_1.27.0.bb" rel=3D=
"noreferrer" target=3D"_blank">c-ares_1.27.0.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A05 +-<br>
=C2=A0.../hdf5/files/CVE-2026-17573.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 49 +<br>
=C2=A0.../hdf5/files/CVE-2026-17574.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 62 +<br>
=C2=A0meta-oe/recipes-support/hdf5/<a href=3D"http://hdf5_1.14.4-3.bb" rel=
=3D"noreferrer" target=3D"_blank">hdf5_1.14.4-3.bb</a> |=C2=A0 =C2=A0 =C2=
=A02 +<br>
=C2=A0...ve-eMudhra-emSign-Root-CA-C1-and-emS.patch |=C2=A0 =C2=A0272 +<br>
=C2=A0...ve-eMudhra-emSign-Root-CA-G3-from-NS.patch |=C2=A0 =C2=A0143 +<br>
=C2=A0meta-oe/recipes-support/nss/<a href=3D"http://nss_3.98.bb" rel=3D"nor=
eferrer" target=3D"_blank">nss_3.98.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 =C2=A02 +<br>
=C2=A0.../syslog-ng/files/CVE-2026-39879-01.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 65 +<br>
=C2=A0.../syslog-ng/files/CVE-2026-39879-02.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0571 +<br>
=C2=A0.../syslog-ng/files/CVE-2026-39879-03.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0758 +<br>
=C2=A0.../syslog-ng/files/CVE-2026-39879-04.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0176 +<br>
=C2=A0.../syslog-ng/<a href=3D"http://syslog-ng_4.6.0.bb" rel=3D"noreferrer=
" target=3D"_blank">syslog-ng_4.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A04 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-34516.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0356 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-34517.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 65 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-34519.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0638 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-34520.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0121 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-34525_p1.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0128 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-34525_p2.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0331 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-47265.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 61 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-50269.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0166 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-54273_p1.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0798 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-54273_p2.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A0181 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-54274.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0195 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-54275.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0124 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-54277.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 96 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-54278.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0209 +<br>
=C2=A0.../python3-aiohttp/CVE-2026-54279.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0317 +<br>
=C2=A0.../python/<a href=3D"http://python3-aiohttp_3.9.5.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-aiohttp_3.9.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 15 +<br>
=C2=A0.../0001-Update-gRPC-repo-roots.-43699.patch=C2=A0 |=C2=A0 2617 +++<b=
r>
=C2=A0...e-repo-roots-to-chromium-roots-42094.patch | 14324 +++++++++++++++=
<br>
=C2=A0.../python/<a href=3D"http://python3-grpcio_1.62.2.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-grpcio_1.62.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A06 +<br>
=C2=A0.../{<a href=3D"http://apache2_2.4.68.bb" rel=3D"noreferrer" target=
=3D"_blank">apache2_2.4.68.bb</a> =3D&gt; <a href=3D"http://apache2_2.4.69.=
bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.69.bb</a>}=C2=A0 |=C2=
=A0 =C2=A0 =C2=A02 +-<br>
=C2=A070 files changed, 42678 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-40706_p1.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-40706_p2.patch<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsp=
rogs/files/CVE-2026-42616.patch<br>
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
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
26-104786.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
26-32748.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
26-33515.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
26-33526.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
26-47729.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
26-50012-01.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
26-50012-02.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/squid/files/CVE-20=
26-61642.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-78161.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2026-8793=
3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Security-U=
pdate-repo-roots-to-chromium-roots-42094.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-security-U=
pdate-gRPC-repo-roots.-43699.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48=
617.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48=
619.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2026-48=
937.patch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.2.34.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.2.34.bb</a> =3D&gt; <a href=3D"=
http://php_8.2.35.bb" rel=3D"noreferrer" target=3D"_blank">php_8.2.35.bb</a=
>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2026-691=
84.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/c-ares/c-ares/CVE-2026-691=
86.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17573.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-17574.=
patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/0008-Bug-2083709-R=
emove-eMudhra-emSign-Root-CA-C1-and-emS.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/nss/nss/0009-Bug-2084101-R=
emove-eMudhra-emSign-Root-CA-G3-from-NS.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3=
9879-01.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3=
9879-02.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3=
9879-03.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3=
9879-04.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34516.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34517.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34519.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34520.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34525_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34525_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-47265.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-50269.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54273_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54273_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54274.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54275.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54277.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54278.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54279.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-grpcio=
/0001-Update-gRPC-repo-roots.-43699.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-grpcio=
/0001-Update-repo-roots-to-chromium-roots-42094.patch<br>
=C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"http://apache=
2_2.4.68.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.68.bb</a> =3D=
&gt; <a href=3D"http://apache2_2.4.69.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.69.bb</a>} (99%)<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131455): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131455" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131455</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121955317/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121955317/1997914</a><br>
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

--000000000000387009065ecbb9ff--
