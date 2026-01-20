Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3943CA5FAA
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 16:32:27 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10523.1768926744622810981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 08:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FiCZ8scZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-792768a0cd3so49810497b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 08:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768926744; cv=none;
        d=google.com; s=arc-20240605;
        b=H9+Wl0onkDCW82/yU68sJ7FkZp0bicqeaKoweVZ6JyKcW6boimyUHPJyGgDcrbNzud
         drTjk0zRCYWox2HrHfuaMzoJ7Syhn5pJmSwwenfCpcYSr2qKRJKtOvW9SNYjYUJIZFhj
         htEyGiJsvgE0Yn9r2Mtc51RrWa3eGonyjxOSMf+fcn1/F1orwiCV6fWJGIvPi+eHdRMp
         S7R4VzpBdgpd0PDI5m/qQIfZwgS24446ClKhYfFB4bQx7d6ugyaCqMaQDCjWSpzwN4Fx
         dxqfS50BUQahzGVaU6YX87YbflJY5q5xsguPsImN9IfvDg4CUBOJPF93otK0h3d4JCCS
         dRWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mXGTcl5mwW+5/Qa4dBt0KvW9sNYbOXAVKcTMg68Re9g=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=hShzNpQbtOqYf6k7JpV30/SZ9E5taKY6GEUu95vPiFTDCpKzQnHxycVldyRGMuYnaV
         drXn8qh4zMmPutGu+dRLjxX7sZqoBGJ8kTTC4ZOAcn8ClYxGjFAhF0W++QLzrR7kmixa
         TCV023Pk+YDu6bkk96+AVUKvXKuBOU9CmH6RUQS+MK+h8D+PsVXMMckgFZoB2BV7TEVe
         2kDd6PoYWTcBzupcbtptaqjzg3JwQIdDD+MiqsBx0kt41t3ULSKB6UkpGu0krhM9XAXh
         gtA1NoQWN4KBqdDRKx90yshnDskeAD0HRi7qxV2V041UehYzuufmcjaSTvEvEJTw23ad
         8Y3A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768926744; x=1769531544; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mXGTcl5mwW+5/Qa4dBt0KvW9sNYbOXAVKcTMg68Re9g=;
        b=FiCZ8scZgGDh8if7iHCSIAzFAyR/HI83+Rv2tEUIm7isFv42ux+Byby+jppwtFchYm
         6tITrZZL50KR6bJmZQ1xRmVZXAddc3tC8sQRt0cO6FN2tXIgbCJgLluTqQEi+K2bR4G1
         D9VdWIaTTxUllU/wevTICjs5oc/9S9lzzbdQz6fFQx9fuKkVpfqKjWzbADXNRfwr9dY3
         tBISmZpzJl4ELgQ+XS0eqReJiziC3b4ln+Bcny7m9vOaV2NxiNN5AN6b8C2eCEcg3Jtf
         QSvNXqzfCPKqeDh09hHIFMl8zXQxTiMSQWktOZfwdbihanGoiK7lUPKsLb6Vg3iiYsCn
         zheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768926744; x=1769531544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXGTcl5mwW+5/Qa4dBt0KvW9sNYbOXAVKcTMg68Re9g=;
        b=s7B4j7u1g73DdbIMqQ2cTYv4YWZa6spGMtMOf0kk+TnmyoJHNK/ow4V0wrz3QlhnSE
         J7b1KSaiaUXmE2PqUHdlEO7xzTlQ1Hg+5I9NvnMxs+EJ2EItwyaGgJJW9HY4WQUZ0OnL
         WaOV/+6lQPyKF/8GSoM4TfwHYrWHICaaKk1CiOEXwazI7Ay2a5lPLO3hijjDHuWoRQks
         ikufLThtqppQkGs1jvWLXMbfawjCg2BSXLs/d8aBuoGmNd/7YIEw3y9kPb9aMOkMmx24
         r6+PcYhnN2qmin+3aKv1OXig4IcoRMhB2wqZc7CBW4RDhuXSUA3cJGNwM0e4Zj1GwiNd
         HXUQ==
X-Gm-Message-State: AOJu0YyEbvsj4bb/2SmyvMzV/CrSayQSKRQnmb6r8B6/npJNMsKo2BpY
	KJZFRD9b1MbU/CqdmjlHDHoDeacH7PCrDX7GcJQad/+K6EZCP4Q2WnvW7gAnKNWGZ9J/oS8ZDUa
	rMKDuP5/J037kUp+sAn7TZBPfd4U4doc=
X-Gm-Gg: AZuq6aI2bSvjOTLkL49yPFq7yoH3ANcVVjf1Taxk83LZhjR2sGLDN2wya/sv37yH4uX
	Y8ifmPUuOHE4b5bE6l+zF6iXHPJgAPU5oudUFDvdOyCKZo1uX34Zze/9ymzdliSih2s7C06hIyA
	l2z5KuJ0VgCYUSm+98eAbe6e3ssxA7AHQ7Fd/c0dy5Nlqse+XyZpoyhx1vBYuKl/aMmO8lPdZgj
	JZl09qgSCktESGgoc2bgpo3msScTvluvIkdgEied0jEGRsaWh4dleABFPMncDL+FE2oP9UoFF1/
	0FayvnCNDuyfSsqDbNtVPydAn5EKKkFRJyl6CbXkwg4RxRC0cRG9aPS/cTIiKPamfBzKk3RS1HS
	D77poB8OIyCmcH++bmHxo3rfiy7fveulC3foXhvFlzZrJQEUWb9cafYaG
X-Received: by 2002:a05:690c:60c2:b0:78e:3dcf:7aca with SMTP id
 00721157ae682-793c66c7f27mr128435677b3.8.1768926743493; Tue, 20 Jan 2026
 08:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20260120070331.5050-1-skandigraun@gmail.com>
In-Reply-To: <20260120070331.5050-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Jan 2026 08:31:57 -0800
X-Gm-Features: AZwV_QjxFRsWkTu_09a1gM6-nYxmKGdCF4yhtwiLfYYcO1wj7K5Yg0iOZo6r0rg
Message-ID: <CAMKF1sq=n3X1L-dUZFt0jX3QWHwbPPZH5tmERgF-SSXFcm71-Q@mail.gmail.com>
Subject: Re: [oe] Kirkstone Pull Request Jan 20th
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002e062a0648d45ad0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 16:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123675

--0000000000002e062a0648d45ad0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks ok to me and is installed for kirkstone now.

On Mon, Jan 19, 2026 at 11:03=E2=80=AFPM Gyorgy Sarvari via lists.openembed=
ded.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> This PR intentionally concentrates exclusively on the python3-django
> recipes.
>
> There are some (non-django) patches on the ML for Kirkstone since the las=
t
> PR
> that are not included here. Those patches are not forgotten, but this
> particular
> PR's goal is to fix these specific recipes that regressed in this branch
> over time.
>
> Beside the regular ptest-enabled recipes, the below ptest artifacts
> include test
> results from all 3 python3-django recipes, without Selenium tests. The
> recipes
> themselves in the meta-oe layer are however not enabled for ptest, becaus=
e
> the tests have
> dependencies which are not available in meta-oe. The used bbappends are
> available
> in the meta-oe-test layer (along with the dependencies), if anyone would
> like to
> replicate the results.
>
> As previously mentioned in the ML, there is one failing test for
> python3-django_2.2.28 recipe.
> This particular recipe is executed in a custom testimage that is expected
> to fail,
> all other ptests are running in images which are expected to succeed.
>
> World build arm:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/210995990=
67
> World build aarch64:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/210997221=
70
> World build x86:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/211012939=
18
> World build x86-64:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/211082693=
03
> Yocto Project Compability Check:
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/211126867=
33
> Ptest results (logs attached to Github actions run):
> https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/211436533=
80
>
> Please let me know if you have any questions or comments.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The following changes since commit
> 7d4507f226bd2af939d4482fb14a809867ece939:
>
>   libsodium: patch CVE-2025-69277 (2026-01-12 13:48:02 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded-contrib
> stable/kirkstone-nut
>
> for you to fetch changes up to 8f5f5cf4b335a09313c48394c62bfb614868fc1e:
>
>   python3-django: (4.2.27) add back setuptools3 support (2026-01-19
> 15:24:39 +0100)
>
> ----------------------------------------------------------------
> Gyorgy Sarvari (12):
>       python3-django: fix intendation error in CVE patch
>       python3-django: fix regression from CVE-2024-24680 patch
>       python3-django: implement group method for FakeMatch
>       python3-django: handle non-existing import from CVE patch
>       python3-django: fix hostname length validation in URLvalidator
>       python3-django: (v2.2.28) fix ipv6 validation
>       python3-django: (v2.2.28) fix tests
>       python3-django: (v3.2.25) fix ipv6 validation
>       python3-django: (v3.2.25) fix tests
>       python3-django: fix CVE-2023-36053 patch
>       python3-django: upgrade 4.2.26 -> 4.2.27
>       python3-django: (4.2.27) add back setuptools3 support
>
> Haixiao Yan (2):
>       python3-django: Fix undefined _lazy_re_compile
>       python3-django: Fix missing JSONField in django.db.models
>
>  .../0001-Fix-tag_strip-tests.patch                 |  37 +++++
>  ...-Fixed-URLValidator-crash-in-some-edge-ca.patch |  56 +++++++
>  ...utils.tests.HTMLEqualTests.test_parsing_e.patch |  32 ++++
>  .../0001-add-back-setuptools-support.patch         | 179
> +++++++++++++++++++++
>  .../0001-Fix-patch-for-CVE-2023-36053.patch        |  43 +++++
>  .../python3-django/0001-Fix-tag_strip-tests.patch  |  37 +++++
>  ...-Fixed-URLValidator-hostname-length-valid.patch |  30 ++++
>  ...-Fixed-URLValidator-crash-in-some-edge-ca.patch |  57 +++++++
>  ...ed-35172-Fixed-intcomma-for-string-floats.patch |  30 ++++
>  ...ctdb.tests.InspectDBTestCase.test_custom_.patch |  45 ++++++
>  ...utils.tests.HTMLEqualTests.test_parsing_e.patch |  32 ++++
>  ...TestResultTest.test_pickle_errors_detecti.patch |  59 +++++++
>  .../python/python3-django/0001-fix-ipv6-test.patch |  34 ++++
>  ...-fix-quote-type-in-expected-error-message.patch |  31 ++++
>  ...0001-implement-group-method-for-FakeMatch.patch |  42 +++++
>  .../python/python3-django/CVE-2024-41991.patch     |  18 +--
>  .../Fix-missing-JSONField-in-django.db.mo.patch    |  77 +++++++++
>  .../Fix-undefined-_lazy_re_compile.patch           |  49 ++++++
>  .../python/python3-django_2.2.28.bb                |  15 +-
>  .../python/python3-django_3.2.25.bb                |   3 +
>  ...3-django_4.2.26.bb =3D> python3-django_4.2.27.bb} |   9 +-
>  21 files changed, 901 insertions(+), 14 deletions(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fix-tag_st=
rip-tests.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-3336=
7-Fixed-URLValidator-crash-in-some-edge-ca.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-3.2.25/0001-Fixed-test=
_utils.tests.HTMLEqualTests.test_parsing_e.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django-4.2.27/0001-add-back-s=
etuptools-support.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Fix-patch-for-CVE=
-2023-36053.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Fix-tag_strip-tes=
ts.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Fixed-32298-Fixed=
-URLValidator-hostname-length-valid.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Fixed-33367-Fixed=
-URLValidator-crash-in-some-edge-ca.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Fixed-35172-Fixed=
-intcomma-for-string-floats.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Fixed-inspectdb.t=
ests.InspectDBTestCase.test_custom_.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Fixed-test_utils.=
tests.HTMLEqualTests.test_parsing_e.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Made-RemoteTestRe=
sultTest.test_pickle_errors_detecti.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-fix-ipv6-test.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-fix-quote-type-in=
-expected-error-message.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-implement-group-m=
ethod-for-FakeMatch.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/Fix-missing-JSONField-=
in-django.db.mo.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re=
_compile.patch
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.26.bb =3D=
>
> python3-django_4.2.27.bb} (52%)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123660):
> https://lists.openembedded.org/g/openembedded-devel/message/123660
> Mute This Topic: https://lists.openembedded.org/mt/117359921/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002e062a0648d45ad0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This looks ok to me and is installed for kirkstone now.</d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Jan 19, 2026 at 11:03=E2=80=AFPM Gyorgy Sarvari =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">This PR intentionally concentrates exclusively on =
the python3-django recipes.<br>
<br>
There are some (non-django) patches on the ML for Kirkstone since the last =
PR<br>
that are not included here. Those patches are not forgotten, but this parti=
cular<br>
PR&#39;s goal is to fix these specific recipes that regressed in this branc=
h over time.<br>
<br>
Beside the regular ptest-enabled recipes, the below ptest artifacts include=
 test<br>
results from all 3 python3-django recipes, without Selenium tests. The reci=
pes<br>
themselves in the meta-oe layer are however not enabled for ptest, because =
the tests have<br>
dependencies which are not available in meta-oe. The used bbappends are ava=
ilable<br>
in the meta-oe-test layer (along with the dependencies), if anyone would li=
ke to<br>
replicate the results.<br>
<br>
As previously mentioned in the ML, there is one failing test for python3-dj=
ango_2.2.28 recipe.<br>
This particular recipe is executed in a custom testimage that is expected t=
o fail, <br>
all other ptests are running in images which are expected to succeed.<br>
<br>
World build arm: <a href=3D"https://github.com/OldManYellsAtCloud/meta-oe-t=
est/actions/runs/21099599067" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21099599067</a><br>
World build aarch64: <a href=3D"https://github.com/OldManYellsAtCloud/meta-=
oe-test/actions/runs/21099722170" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21099722170</a>=
<br>
World build x86: <a href=3D"https://github.com/OldManYellsAtCloud/meta-oe-t=
est/actions/runs/21101293918" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21101293918</a><br>
World build x86-64: <a href=3D"https://github.com/OldManYellsAtCloud/meta-o=
e-test/actions/runs/21108269303" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21108269303</a><=
br>
Yocto Project Compability Check: <a href=3D"https://github.com/OldManYellsA=
tCloud/meta-oe-test/actions/runs/21112686733" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/OldManYellsAtCloud/meta-oe-test/actions/runs/211=
12686733</a><br>
Ptest results (logs attached to Github actions run): <a href=3D"https://git=
hub.com/OldManYellsAtCloud/meta-oe-test/actions/runs/21143653380" rel=3D"no=
referrer" target=3D"_blank">https://github.com/OldManYellsAtCloud/meta-oe-t=
est/actions/runs/21143653380</a><br>
<br>
Please let me know if you have any questions or comments.<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
The following changes since commit 7d4507f226bd2af939d4482fb14a809867ece939=
:<br>
<br>
=C2=A0 libsodium: patch CVE-2025-69277 (2026-01-12 13:48:02 +0100)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/meta-openembedded-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/meta-openembe=
dded-contrib</a> stable/kirkstone-nut<br>
<br>
for you to fetch changes up to 8f5f5cf4b335a09313c48394c62bfb614868fc1e:<br=
>
<br>
=C2=A0 python3-django: (4.2.27) add back setuptools3 support (2026-01-19 15=
:24:39 +0100)<br>
<br>
----------------------------------------------------------------<br>
Gyorgy Sarvari (12):<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix intendation error in CVE patch<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix regression from CVE-2024-24680 pat=
ch<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: implement group method for FakeMatch<b=
r>
=C2=A0 =C2=A0 =C2=A0 python3-django: handle non-existing import from CVE pa=
tch<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix hostname length validation in URLv=
alidator<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: (v2.2.28) fix ipv6 validation<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: (v2.2.28) fix tests<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: (v3.2.25) fix ipv6 validation<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: (v3.2.25) fix tests<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: fix CVE-2023-36053 patch<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: upgrade 4.2.26 -&gt; 4.2.27<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: (4.2.27) add back setuptools3 support<=
br>
<br>
Haixiao Yan (2):<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: Fix undefined _lazy_re_compile<br>
=C2=A0 =C2=A0 =C2=A0 python3-django: Fix missing JSONField in django.db.mod=
els<br>
<br>
=C2=A0.../0001-Fix-tag_strip-tests.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 37 +++++<br>
=C2=A0...-Fixed-URLValidator-crash-in-some-edge-ca.patch |=C2=A0 56 +++++++=
<br>
=C2=A0...utils.tests.HTMLEqualTests.test_parsing_e.patch |=C2=A0 32 ++++<br=
>
=C2=A0.../0001-add-back-setuptools-support.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 179 +++++++++++++++++++++<br>
=C2=A0.../0001-Fix-patch-for-CVE-2023-36053.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 43 +++++<br>
=C2=A0.../python3-django/0001-Fix-tag_strip-tests.patch=C2=A0 |=C2=A0 37 ++=
+++<br>
=C2=A0...-Fixed-URLValidator-hostname-length-valid.patch |=C2=A0 30 ++++<br=
>
=C2=A0...-Fixed-URLValidator-crash-in-some-edge-ca.patch |=C2=A0 57 +++++++=
<br>
=C2=A0...ed-35172-Fixed-intcomma-for-string-floats.patch |=C2=A0 30 ++++<br=
>
=C2=A0...ctdb.tests.InspectDBTestCase.test_custom_.patch |=C2=A0 45 ++++++<=
br>
=C2=A0...utils.tests.HTMLEqualTests.test_parsing_e.patch |=C2=A0 32 ++++<br=
>
=C2=A0...TestResultTest.test_pickle_errors_detecti.patch |=C2=A0 59 +++++++=
<br>
=C2=A0.../python/python3-django/0001-fix-ipv6-test.patch |=C2=A0 34 ++++<br=
>
=C2=A0...-fix-quote-type-in-expected-error-message.patch |=C2=A0 31 ++++<br=
>
=C2=A0...0001-implement-group-method-for-FakeMatch.patch |=C2=A0 42 +++++<b=
r>
=C2=A0.../python/python3-django/CVE-2024-41991.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 18 +--<br>
=C2=A0.../Fix-missing-JSONField-in-django.db.mo.patch=C2=A0 =C2=A0 |=C2=A0 =
77 +++++++++<br>
=C2=A0.../Fix-undefined-_lazy_re_compile.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 49 ++++++<br>
=C2=A0.../python/<a href=3D"http://python3-django_2.2.28.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_2.2.28.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 15 +-<br>
=C2=A0.../python/<a href=3D"http://python3-django_3.2.25.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-django_3.2.25.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0...<a href=3D"http://3-django_4.2.26.bb" rel=3D"noreferrer" target=3D=
"_blank">3-django_4.2.26.bb</a> =3D&gt; <a href=3D"http://python3-django_4.=
2.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_4.2.27.bb</a>}=
 |=C2=A0 =C2=A09 +-<br>
=C2=A021 files changed, 901 insertions(+), 14 deletions(-)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/0001-Fix-tag_strip-tests.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-3.2.25/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
-4.2.27/0001-add-back-setuptools-support.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Fix-patch-for-CVE-2023-36053.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Fix-tag_strip-tests.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Fixed-32298-Fixed-URLValidator-hostname-length-valid.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Fixed-33367-Fixed-URLValidator-crash-in-some-edge-ca.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Fixed-35172-Fixed-intcomma-for-string-floats.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Fixed-inspectdb.tests.InspectDBTestCase.test_custom_.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Fixed-test_utils.tests.HTMLEqualTests.test_parsing_e.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Made-RemoteTestResultTest.test_pickle_errors_detecti.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-fix-ipv6-test.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-fix-quote-type-in-expected-error-message.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-implement-group-method-for-FakeMatch.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/Fix-missing-JSONField-in-django.db.mo.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/Fix-undefined-_lazy_re_compile.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_4.2.26.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_4.2.=
26.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.27.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_4.2.27.bb</a>} (52%)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123660): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123660" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123660</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117359921/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117359921/1997914</a><br>
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

--0000000000002e062a0648d45ad0--

