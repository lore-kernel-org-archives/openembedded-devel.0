Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C82C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 18:52:21 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.18660.1721847137688411173
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jul 2024 11:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKT786a8;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-260e12aac26so42386fac.0
        for <Openembedded-devel@lists.openembedded.org>; Wed, 24 Jul 2024 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721847137; x=1722451937; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vdasHPtg481Zzl3xfyhZJ83GSiqS/XurUAxwXWMookY=;
        b=bKT786a83VknBAue9dj4wQWf0VfGwMmyG6qfu/BzUq9W8eUJvh4HuRHJvCKBNya73q
         CsEweddqTA2VAjVR6fLNTaJiugdbanLpH2jxLrKyS25r/JDZPRoOVs2ZZJ9vM92eTpxp
         QAC6utcgL0KDelah3O8o2o4+cmuEGSIkDshqqqACHVrOy+P24oTgk1VlmYDFJ/wioqEZ
         redr/4MmQwzgOae/rhBrs4XTk2ndpSsuQ0iu021iQ+FRrZ5WpQx2x9BJUu/yd9DelbrO
         KipP/O/y0dL+DnO5wss+WW0LZVD/pbUW6cR2MMYVkTkSb59ZPrQmlZwPqMgRAcwaEZfM
         eYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721847137; x=1722451937;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdasHPtg481Zzl3xfyhZJ83GSiqS/XurUAxwXWMookY=;
        b=LGtmKpJgJkLDl3xGiZI7o1XJB396rdlVtsKBHrpw/xqsn0OtU/OU9a+caqoUObnjfi
         z1uQU8mPxCuue11OtZCj7yN/12G0bhxXgmz6kFqrp07e7xlGW0voCqTzulXOuu57nv4S
         xBy2TgtQZQi1OOoLnLq6MGyZ2r3Z5aQYNI/sSX/Bd56Ng08UqoPbkhbx3xozkCrXFWJY
         bYuPyTCH7alr9paVK3V7k333aiEhyZOXwWKyKGyIiW3Arac155olC//9WMYXDpTK7mlL
         b96tZfnNx53HuI1iG6Jv+CMDzqGfX1kGc9bgjlcw/0uHZECD0C0Uu1QZTcjnVpdIVzlf
         GzPA==
X-Gm-Message-State: AOJu0Yyb04+qe+lQtFEiibTOs/ljDG7PCbHuh3649lgbln/qHztjCt4g
	0KnNWKE/EX+vQrJb1M+9YvN122aBCL0MplviuRf00Gh0JJ8lklB4hW8Y0W5R6IvYJvrGEfz/FMI
	xupjRSFiuCyV8JcYQi0cR2usv1nPbf/uBeMs=
X-Google-Smtp-Source: AGHT+IHsFYn9fy0TtwgUd0XpMYpgsISVT8G56ABEK20Jwl5rDs1dVLquSDZOg0+fq2RbRNXuEjef/k8s6iGMSW3r8KM=
X-Received: by 2002:a05:6870:9706:b0:261:1ccd:358c with SMTP id
 586e51a60fabf-264a0e079d0mr499313fac.24.1721847136688; Wed, 24 Jul 2024
 11:52:16 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Jul 2024 11:51:52 -0700
Message-ID: <CAMKF1soNow9XQXcspm2w7JAXROmU8OTzxwj1tLNYWRPoyUduNQ@mail.gmail.com>
Subject: Buildpaths QA error list
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jul 2024 18:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111431

Hi all

Recently buildpaths QA warning has been promoted to be a QA error. This
means some warnings in meta-openembedded layers has become build failures
below is the list of failures if any of these recipes is important to
you, please consider fixing it. I will mark the remaining recipes
disabled via SKIP_RECIPE
and they will remain so until someone fixes them. My plan is to clear
world build
as quickly as I can.

Summary: 37 tasks failed:
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/gcab/gcab_1.6.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-gnome/libjcat/libjcat_0.2.1.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.2.3.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.4.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.9.bb:do_package_qa
virtual:native:/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/uim/uim_1.8.9.bb:do_compile
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/keepalived/keepalived_2.2.8.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-crypto/botan/botan_3.5.0.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-support/ndisc6/ndisc6_1.0.8.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/ippool/ippool_1.3.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/ckermit/ckermit_302.bb:do_compile
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/procmail/procmail_3.22.bb:do_configure
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-python/recipes-devtools/python/python3-pyproj_3.6.1.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-graphics/fvwm/fvwm_2.7.0.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/enca/enca_1.19.bb:do_compile
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/perfetto/perfetto.bb:do_compile
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-oe/recipes-support/log4cpp/log4cpp_1.1.4.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-irc/znc/znc_1.8.2.bb:do_package_qa
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb:do_package_qa


Thank you
-Khem

