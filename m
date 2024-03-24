Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA731CD11DB
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 15:10:25 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.31084.1711293022130502582
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Mar 2024 08:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LQWOpRDy;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a4f9f94e77so2080682eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 08:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711293021; x=1711897821; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwW32sVQjHWm3QGmaYWNpI7NA3YiGqJ1eBDztsH3W74=;
        b=LQWOpRDybWv64fCfnWvbHVmmHppKpnRRmbKiUUu/L6TCilNl2BXqE5z352aZ9riVQu
         QjFOuQxsXctlj+ihgavfKSryLunRB4Wrtqs5YV37PrksPOgPUSV7TydVGwt0YWihbfsO
         xSSBdDDHE9S4Er2jKB4wEq6VkAFIR0Dyo6WgyAgSb7/mF/i7YOeySTmDB6QfGcAcV/xJ
         G5Yy7bBDtZmvjRe8yZqL9fcO2E4s/yv5fcNrBcJKaixVETgh5kcqzXQU3mh7NQkb4nPn
         2Iq5EtIh7K/qtLQ0w68rAnwNCFYjXlIhg5RPRQA2KUCLVXPiRKIIVRFaEwPqTM5QGoMo
         E7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711293021; x=1711897821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwW32sVQjHWm3QGmaYWNpI7NA3YiGqJ1eBDztsH3W74=;
        b=OjzGHJPRMKIrDI1A9GvLcOGNZih+jrO0KHPcQFc9dEeC0ZkodpjoU1ffuFolrAoS6v
         u9W0RNSxzZ+o1L76SBMZQ/QsL2Tlax7iSGxuP4jr+IXEWcXkqJHinpP/PzMJCrCFNcHJ
         OOTxWLloJjPzXZsRYZ/GYRF5rlEoded5dDdn0y6tK2AxKS2BcSedS2v/RQb+iUZsU/0U
         lRTrxHEdWDcvChPAQMJSXDcxxeUlcalzXUweO2ja20N6BZ7vaPTgkyNdQVGsupxzgBa5
         e3UFO7jTyISGdlRe4ArJm5EcuvehXF+RCupfwyvRYp9BUYFMGg7gddT2rDftZ28qxtJN
         rCGg==
X-Gm-Message-State: AOJu0YyDAh2HGjJf/0WxpIw+XQQjpluHqp3L+uL99GNcqZhajpqozrZx
	c2XtWLn37e5GKJXA3wSNx+hL0aJfYk+/rZYFAOPagJ3zNQ5fZ7FtHM7Aw8Ye20fGgVJ8Z+s3ljw
	JwCAql13tJuFmh5xBFzu9BfHaYQ8=
X-Google-Smtp-Source: AGHT+IFVddR/6iYYiQOdNV/UYKSSL04q2a/xvRicxavDHr+KEWg06YddLtpmAch1IF9M+RGQkLtWv7sAqS9+zUiTmqI=
X-Received: by 2002:a05:6870:a897:b0:229:f022:ef92 with SMTP id
 eb23-20020a056870a89700b00229f022ef92mr3313340oab.10.1711293021178; Sun, 24
 Mar 2024 08:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240324140659.237067-1-chen_heyun@163.com>
In-Reply-To: <20240324140659.237067-1-chen_heyun@163.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Mar 2024 08:09:54 -0700
Message-ID: <CAMKF1soBmYtb8re9WicXuhXJhroNR+m8PcxyYFF7--uQ6LBe2w@mail.gmail.com>
Subject: Re: [oe] [[meta-oe][PATCH]aer-inject:add new recipe]
 [[meta-oe][PATCH]aer-inject:add new recipe]
To: chenheyun <chen_heyun@163.com>
Cc: openembedded-devel@lists.openembedded.org, 819869652@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Mar 2024 15:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109566

On Sun, Mar 24, 2024 at 7:07=E2=80=AFAM chenheyun <chen_heyun@163.com> wrot=
e:
>
> aer-inject allows to inject PCIE AER errors on the software
> level into a running Linux kernel. This is intended for validation of the
> PCIE driver error recovery handler and CIE AER core handler.
>
> References:
> https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
>
> Signed-off-by: chenheyun <chen_heyun@163.com>
> ---
>  .../aer-inject/aer-inject_1.0.bb              | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
>
> diff --git a/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb b/meta=
-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
> new file mode 100644
> index 000000000..4b1b5e093
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/aer-inject/aer-inject_1.0.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Inject PCIE AER errors on the software level into a running=
 Linux kernel."
> +DESCRIPTION =3D "\
> +aer-inject allows to inject PCIE AER errors on the software \
> +level into a running Linux kernel. This is intended for \
> +validation of the PCIE driver error recovery handler and \
> +PCIE AER core handler."
> +HOMEPAGE =3D "https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer=
-inject.git/"
> +SECTION =3D "pcie/misc"
> +LICENSE =3D "GPL-2.0"
> +
> +LIC_FILES_CHKSUM =3D "file://README;beginline=3D25;endline=3D38;md5=3D64=
3c2332ec702691a87ba6ea9499b2d6"
> +
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer=
-inject.git;branch=3Dmaster \

it should need protocol=3Dgit as well

> +"
> +SRCREV =3D "9bd5e2c7886fca72f139cd8402488a2235957d41"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "bison-native"
> +
> +do_install() {
> +    oe_runmake 'DESTDIR=3D${D}' install
> +}
> +FILES:${PN} +=3D "/usr/local/aer-inject"

can we change do_install to install it into /usr and not /usr/local

> +BBCLASSEXTEND =3D "native nativesdk"
> \ No newline at end of file
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109565): https://lists.openembedded.org/g/openembedde=
d-devel/message/109565
> Mute This Topic: https://lists.openembedded.org/mt/105119602/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

