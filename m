Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6035CCD1A5
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 03:08:31 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.303.1761102504853425859
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 20:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RzRX5CTZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7847ee5f59dso54917927b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 20:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761102504; x=1761707304; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLp+cvoOUw9tETvd0zRyXk1oy2+/f6oiuNdGutn7K2Y=;
        b=RzRX5CTZnO0kbpxnv2NAK6lQT9WCQBXEBLgryYt1+hEZxuAYEP6vtt9cnNy9LZhQPd
         f4oeh9Zi+wM+n1OV68L1fKXAfT1Y8SwdsQH6oZfwAX+LCdYKzAHGgU5brpfbw7hTE6cS
         Eh+XXfzunAMVJyo57+g05CJKvyw2+E0GggQe8nTKFN6kxB9IPlW60LX3LvcDFFNc8Obs
         rPnt0MJSELhI9fCmEG91iCFutctSKrhVyaa2bVYdK+NBkZ8OC9ORaIAipz95TBaXDSCI
         CJ8Y9PXcf/DgqYyoWaoUhE6ZmSTSBy+Pa3a0rxQimA/de4XaY1AR1+xJRa8XOySbBjN/
         OD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761102504; x=1761707304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLp+cvoOUw9tETvd0zRyXk1oy2+/f6oiuNdGutn7K2Y=;
        b=eha5d93p+y+jEHsYJ/6MV++G8OQdgUniKyM5DVSx6SoMgcpg/0kuwp1O2i5Q9kVWHk
         rYooYP1TLO7gFDXk/xKlSBPcjzLo8Yxq+wjiJXAPfJShd5rEVl6/larx4TO8X+Tw5sAH
         zwL3qjtb+QX7igA19lM4a86XQWGXnJNsxxgkfVN2A4M52dz5yhlmHFFH8cI9zU6OUOaR
         k1GvrR9uG6/6aRVAfyOr5P957mKzsF2vj+ut/bsbnvLvGuOZMugQpJjv+pYixRAqCpKi
         n+/AuWFjCcOpNHB86SiXNIzf0Ns+qyonOUvBnQh0JZhHwbc2XO5Ldzqt3kCGLb3Vi9WM
         XFbA==
X-Forwarded-Encrypted: i=1; AJvYcCWzRJkujcafLj6pRdSuf343A1BYQNsthdr1ewtOw/wQUDcNrIvj4co46ek89IgrIiU4k6yiPApUA2jlWlg+PrkGpmM=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywqjhj8axee2rcx3rKlkMdN94k/ke+F11J7WOYA7w/4EZhmW00u
	QrHzVGIk5/OW5aQJlxxGZ2AWBlwrJmOv7VcHUOgjcQ8AsqQHm8VfpWayBkRCEskYCI5hymWXGxa
	THZrcwcAuCBKT/M3yP4ANvBNiSWM9WLh7tYmm1ds=
X-Gm-Gg: ASbGncvJl1G9Sppt5xSVM9CJXchArkYZg0RmoYNdqmKvIVCF1ij5EXeV1wvAsPo2pWH
	e2LCrAuXTvF4WrgB7hnAv25bNtkEMb3mnK67V0Hghvie2DZPR6xqJ8M6rDO03tD2B11H4k4uGGh
	sKkYfuT0pSItWfGRsRLCX69p56eiPkWK90CfFHs9bDPGgJYncSdxCgOouQ54qi2+OIw1yXcTL5N
	9GcZzEaM9c6lpnE/C9PkPb/YK8rR64BuxuFTz1xpXB6b3rzKPXW07XCimkWmI4yZTOw+5PBM1Zf
	HQtISsyXpXqohKhWbCJXu9POblxbLpF3H3aC8V0RySivxDRX3sqmEmkea+g2gY1T265+1mlhID4
	/Ifc=
X-Google-Smtp-Source: AGHT+IHMqRSeYDU1X9V2rmKQlogukzWle55Sd2MdzDGT+RjIN/8A/twcM/eT2hEdQ+0pZzhFcVmcUlbnaEAaazxQvrs=
X-Received: by 2002:a05:690e:4106:b0:63e:3099:fe3d with SMTP id
 956f58d0204a3-63e30a957f7mr9092207d50.14.1761102503806; Tue, 21 Oct 2025
 20:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <1870AFA4856349AB.25855@lists.openembedded.org>
 <20251022025948.3520973-1-hongxu.jia@windriver.com> <CAMKF1sqpMDSt8J6MuzRGWKAQjZcHMSxqJ3sxqzztYpwkahfTfg@mail.gmail.com>
 <dedb4143-6db4-488b-bd91-07afa291e078@windriver.com>
In-Reply-To: <dedb4143-6db4-488b-bd91-07afa291e078@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Oct 2025 20:07:57 -0700
X-Gm-Features: AS18NWDpjrIozC4kB44BMdayxrryrgMHcRDxC-JBn7wi9jg6dYqBaP5vSAvOhXA
Message-ID: <CAMKF1so7kzbn2zNhjrkaY-7n+ctT86VzBJutvm=vHr6msqEr7w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] poppler: fix racing build issue
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: hongxu.jia@eng.windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 03:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120881

On Tue, Oct 21, 2025 at 8:05=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> On 10/22/25 11:02, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > what changed in v2 and then v3 ? and it does not seem to be rebased on
> > master branch, it helps if the changes between
> > versions are clearly documented and feedback is addressed.
> The upstream defect number differs in comments between v2 and v3
>
> https://gitlab.freedesktop.org/poppler/poppler/-/issues/1550 in v2
>
>
> https://gitlab.freedesktop.org/poppler/poppler/-/issues/1551 in v3
>
> V3 is the actual number

Feedback on v1 is not yet addressed
https://lists.openembedded.org/g/openembedded-devel/message/120839?p=3D%2C%=
2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C%2Cpoppler%2C20%2C2%2C0%2C115870675

Have you even tested this patch on the master branch ?

>
>
> //Hongxu
>
> > On Tue, Oct 21, 2025 at 7:59=E2=80=AFPM hongxu via lists.openembedded.o=
rg
> > <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
> >> There is a racing issue in world build while multilib enabled:
> >>
> >> ...log.do_install...
> >> CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
> >>    file INSTALL cannot find
> >>    "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/=
ca/pdfsig.gmo":
> >>    No such file or directory.
> >> Call Stack (most recent call first):
> >>    utils/po/cmake_install.cmake:47 (include)
> >>    utils/cmake_install.cmake:243 (include)
> >>    cmake_install.cmake:229 (include)
> >> ...log.do_install...
> >>
> >> The issue has reported to upstream [1] and upstream tried to fix it [2=
],
> >> but the issue still existed. The catalan translation of pdfsig is not
> >> vital for poppler. So revert upstream commit "pdfsig: Catalan translat=
ion"
> >> to workaround
> >>
> >> [1] https://gitlab.freedesktop.org/poppler/poppler/-/issues/1551
> >> [2] https://gitlab.freedesktop.org/poppler/poppler/-/commit/053acd5d2b=
310c696993dc97072d1f2b3b1dd7ac
> >>
> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> ---
> >>   .../0001-workaround-build-racing.patch        | 43 +++++++++++++++++=
++
> >>   .../poppler/poppler_25.08.0.bb                |  1 +
> >>   2 files changed, 44 insertions(+)
> >>   create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-work=
around-build-racing.patch
> >>
> >> diff --git a/meta-oe/recipes-support/poppler/poppler/0001-workaround-b=
uild-racing.patch b/meta-oe/recipes-support/poppler/poppler/0001-workaround=
-build-racing.patch
> >> new file mode 100644
> >> index 0000000000..fdf4f7ff70
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/poppler/poppler/0001-workaround-build-ra=
cing.patch
> >> @@ -0,0 +1,43 @@
> >> +From 83ad73024c69d41fda302f39acf50c381684890e Mon Sep 17 00:00:00 200=
1
> >> +From: Hongxu Jia <hongxu.jia@windriver.com>
> >> +Date: Tue, 21 Oct 2025 02:39:36 -0700
> >> +Subject: [PATCH] workaround build racing
> >> +
> >> +There is a racing issue in world build while multilib enabled:
> >> +
> >> +...log.do_install...
> >> +CMake Error at utils/po/ca/cmake_install.cmake:46 (file):
> >> +  file INSTALL cannot find
> >> +  "TOPDIR/tmp/work/core2-32-wrs-linux/poppler/25.08.0/build/utils/po/=
ca/pdfsig.gmo":
> >> +  No such file or directory.
> >> +Call Stack (most recent call first):
> >> +  utils/po/cmake_install.cmake:47 (include)
> >> +  utils/cmake_install.cmake:243 (include)
> >> +  cmake_install.cmake:229 (include)
> >> +...log.do_install...
> >> +
> >> +Revert "pdfsig: Catalan translation" to workaround
> >> +
> >> +This reverts commit 99f5416d9bfb6a34bbc5cbcb368e258b98fd3f08.
> >> +
> >> +Upstream-Status: Inappropriate [Yocto specific]
> >> +
> >> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> >> +---
> >> + utils/po/ca/CMakeLists.txt | 4 ----
> >> + 1 file changed, 4 deletions(-)
> >> + delete mode 100644 utils/po/ca/CMakeLists.txt
> >> +
> >> +diff --git a/utils/po/ca/CMakeLists.txt b/utils/po/ca/CMakeLists.txt
> >> +deleted file mode 100644
> >> +index 3225131c..00000000
> >> +--- a/utils/po/ca/CMakeLists.txt
> >> ++++ /dev/null
> >> +@@ -1,4 +0,0 @@
> >> +-get_filename_component(_lang ${CMAKE_CURRENT_SOURCE_DIR} NAME)
> >> +-gettext_process_po_files(${_lang} ALL INSTALL_DESTINATION ${CMAKE_IN=
STALL_LOCALEDIR} PO_FILES
> >> +-  pdfsig.po
> >> +-)
> >> +--
> >> +2.49.0
> >> +
> >> diff --git a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb b/meta=
-oe/recipes-support/poppler/poppler_25.08.0.bb
> >> index 45f94b0ae7..3b0b4b0e99 100644
> >> --- a/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
> >> +++ b/meta-oe/recipes-support/poppler/poppler_25.08.0.bb
> >> @@ -7,6 +7,7 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.tar.=
xz \
> >>              file://0001-Do-not-overwrite-all-our-build-flags.patch \
> >>              file://basename-include.patch \
> >>              file://0001-cmake-Do-not-use-isystem.patch \
> >> +           file://0001-workaround-build-racing.patch \
> >>              "
> >>   SRC_URI[sha256sum] =3D "425ed4d4515a093bdcdbbaac6876f20617451edc710d=
f6a4fd6c45dd67eb418d"
> >>
> >> --
> >> 2.34.1
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#120878): https://lists.openembedded.org/g/openembe=
dded-devel/message/120878
> >> Mute This Topic: https://lists.openembedded.org/mt/115886629/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

