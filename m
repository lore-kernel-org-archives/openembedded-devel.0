Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77D9C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 17:45:35 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.68573.1702662330650869263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Dec 2023 09:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJzN8Wiy;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2038488dedbso106331fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702662330; x=1703267130; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lpu+7oCIKHSDJWCDkgmlQeFXp8xnLQ81s4RcIMk7YO8=;
        b=CJzN8WiyD+d8mO2JCz25cE0QNL/ucMvtaUeaxgbnT+bUo6FXlhS+qUxYXHDlvKnzht
         T9FYfTzN0xmBgzDeWLbtQ4FVXyiX6fHSpc+yofcpKSQH3p/k/mPTOV7N4dV8f2v3Ae0v
         Y6yd5wPbcaX+vmmTTktRXCbuNvshWOMRjB18gM1GVI9oFMTK1UMgeF5e8CctBBkrCy4L
         VyRT/vYrSBF3hlcu8uF2+kI6O/wtt0bXMlqXD1d7kqA9mKo8YXVcrrZCqt/Z+ZamU8dP
         IXAWLsgzgQWf2gv98VgVLlZ9Ig9mLmHocsf9f3gLBsEd2pxf90AWlsyDJabKd123zo1P
         nCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702662330; x=1703267130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lpu+7oCIKHSDJWCDkgmlQeFXp8xnLQ81s4RcIMk7YO8=;
        b=xFCi9AiqmqMSUsG5WyJyMgcnVgXuzTj8ynv3OKlI2WA04Q5vD2HQ1jeAoxAaqAQGiB
         1cC0myWzE1PMqfCETeN13fv14Kig5YGxy8V1xO3LlHVVQMKJigDQcyvZei7Wk1AOwIx/
         6lYDEulEX7dIIlROJHavIQBbuHptoajSfO7wUrjAMhYe7oMSfyzhk9SRWBPTiVp6aW2l
         65fooO+dGkSQhbLYh/1uygw/HBV8KhAkyxeUqeWB2E4ThTXH7K7DFEU22XrsS2gkJDUv
         6jLWONt8FEHNmPII44YuzqhpPr7epmNHr/FYZpyfvXAfBx2g/74b30vF4pHynIAFIzyp
         RPXA==
X-Gm-Message-State: AOJu0YyKC1dK7sy62OS0NfnDDJpkMFkS9zGdDesUfhXIpZCvK5Dd204g
	ADnrGKo1z2CEnli/V8hMSSQlsHt1o8Cn7mP+2Y8=
X-Google-Smtp-Source: AGHT+IEIA4/Gbdgt4+rB13IQhTk3V2sD3DBrparRC1Q9rRdrR7QYGL3dwp39EthpZdyxDqwoQk1Wx6g9YKT7ahdTs6M=
X-Received: by 2002:a05:6871:a50d:b0:1fb:75a:c443 with SMTP id
 wc13-20020a056871a50d00b001fb075ac443mr11192581oab.108.1702662329782; Fri, 15
 Dec 2023 09:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20231215075239.3049865-1-alex@linutronix.de> <20231215075239.3049865-11-alex@linutronix.de>
In-Reply-To: <20231215075239.3049865-11-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Dec 2023 09:45:03 -0800
Message-ID: <CAMKF1sqivMDfi2+FhvxeHz3uz-fB6ErtnWQ4fjC4m_XwVGrJTg@mail.gmail.com>
Subject: Re: [oe] [PATCH 11/20] python3-eventlet: backport a patch to remove
 distutils dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 17:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107529

On Thu, Dec 14, 2023 at 11:53=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...o-host-0-is-not-supported-on-OpenInd.patch | 78 +++++++++++++++++++
>  .../python/python3-eventlet_0.33.3.bb         |  2 +-
>  2 files changed, 79 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-eventlet/=
0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-eventlet/0001-te=
sts-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch b/meta-python/reci=
pes-devtools/python/python3-eventlet/0001-tests-getaddrinfo-host-0-is-not-s=
upported-on-OpenInd.patch
> new file mode 100644
> index 000000000..61a37d94e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-eventlet/0001-tests-get=
addrinfo-host-0-is-not-supported-on-OpenInd.patch
> @@ -0,0 +1,78 @@
> +From ac2f960a50710bb257e87bed4e3c95a746f2a0fe Mon Sep 17 00:00:00 2001
> +From: Sergey Shepelev <temotor@gmail.com>
> +Date: Mon, 27 Mar 2023 22:07:15 +0300
> +Subject: [PATCH] tests: getaddrinfo(host, 0) is not supported on OpenInd=
iana
> + platform
> +
> +https://github.com/eventlet/eventlet/issues/791
> +
> +Upstream-Status: Backport

This status needs link to commit in upstream repo

> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + tests/greendns_test.py | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/tests/greendns_test.py b/tests/greendns_test.py
> +index feab2b6..3802f44 100644
> +--- a/tests/greendns_test.py
> ++++ b/tests/greendns_test.py
> +@@ -613,14 +613,14 @@ class TestGetaddrinfo(tests.LimitedTestCase):
> +     def test_getaddrinfo_only_a_ans(self):
> +         greendns.resolve =3D _make_mock_resolve()
> +         greendns.resolve.add('example.com', '1.2.3.4')
> +-        res =3D greendns.getaddrinfo('example.com', 0)
> ++        res =3D greendns.getaddrinfo('example.com', None)
> +         addr =3D [('1.2.3.4', 0)] * len(res)
> +         assert addr =3D=3D [ai[-1] for ai in res]
> +
> +     def test_getaddrinfo_only_aaaa_ans(self):
> +         greendns.resolve =3D _make_mock_resolve()
> +         greendns.resolve.add('example.com', 'dead:beef::1')
> +-        res =3D greendns.getaddrinfo('example.com', 0)
> ++        res =3D greendns.getaddrinfo('example.com', None)
> +         addr =3D [('dead:beef::1', 0, 0, 0)] * len(res)
> +         assert addr =3D=3D [ai[-1] for ai in res]
> +
> +@@ -637,7 +637,7 @@ class TestGetaddrinfo(tests.LimitedTestCase):
> +         res.raises =3D greendns.dns.exception.Timeout
> +         greendns.resolver._resolver =3D res()
> +
> +-        result =3D greendns.getaddrinfo('example.com', 0, 0)
> ++        result =3D greendns.getaddrinfo('example.com', None, 0)
> +         addr =3D [('1.2.3.4', 0)] * len(result)
> +         assert addr =3D=3D [ai[-1] for ai in result]
> +
> +@@ -654,7 +654,7 @@ class TestGetaddrinfo(tests.LimitedTestCase):
> +         res.raises =3D greendns.dns.exception.DNSException
> +         greendns.resolver._resolver =3D res()
> +
> +-        result =3D greendns.getaddrinfo('example.com', 0, 0)
> ++        result =3D greendns.getaddrinfo('example.com', None, 0)
> +         addr =3D [('1.2.3.4', 0)] * len(result)
> +         assert addr =3D=3D [ai[-1] for ai in result]
> +
> +@@ -667,7 +667,7 @@ class TestGetaddrinfo(tests.LimitedTestCase):
> +         greendns.resolver._resolver =3D res()
> +
> +         with tests.assert_raises(socket.gaierror):
> +-            greendns.getaddrinfo('example.com', 0, 0)
> ++            greendns.getaddrinfo('example.com', None, 0)
> +
> +     def test_getaddrinfo_hosts_only_dns_error(self):
> +         hostsres =3D _make_mock_base_resolver()
> +@@ -678,13 +678,13 @@ class TestGetaddrinfo(tests.LimitedTestCase):
> +         greendns.resolver._resolver =3D res()
> +
> +         with tests.assert_raises(socket.gaierror):
> +-            greendns.getaddrinfo('example.com', 0, 0)
> ++            greendns.getaddrinfo('example.com', None, 0)
> +
> +     def test_canonname(self):
> +         greendns.resolve =3D _make_mock_resolve()
> +         greendns.resolve.add('host.example.com', '1.2.3.4')
> +         greendns.resolve_cname =3D self._make_mock_resolve_cname()
> +-        res =3D greendns.getaddrinfo('host.example.com', 0,
> ++        res =3D greendns.getaddrinfo('host.example.com', None,
> +                                    0, 0, 0, socket.AI_CANONNAME)
> +         assert res[0][3] =3D=3D 'cname.example.com'
> +
> diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.=
bb b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
> index c1256661b..fe4d4f020 100644
> --- a/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
> @@ -4,6 +4,7 @@ SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D56472ad6de4caf50e05332a34b66e=
778"
>
> +SRC_URI +=3D "file://0001-tests-getaddrinfo-host-0-is-not-supported-on-O=
penInd.patch"
>  SRC_URI[sha256sum] =3D "722803e7eadff295347539da363d68ae155b8b26ae6a6344=
74d0a920be73cfda"
>
>  inherit pypi setuptools3
> @@ -11,6 +12,5 @@ inherit pypi setuptools3
>  RDEPENDS:${PN} +=3D " \
>         ${PYTHON_PN}-dnspython \
>         ${PYTHON_PN}-six \
> -       ${PYTHON_PN}-distutils \
>         ${PYTHON_PN}-greenlet \
>  "
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107504): https://lists.openembedded.org/g/openembedde=
d-devel/message/107504
> Mute This Topic: https://lists.openembedded.org/mt/103186667/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

