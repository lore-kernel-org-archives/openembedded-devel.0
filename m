Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DBBC28B2F
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 23:21:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.40387.1742167281933410035
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Mar 2025 16:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ivXGybKw;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43690d4605dso9686065e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 16:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1742167280; x=1742772080; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KiD58UXBpQh7QRHjixnBnlMi2qo30Foq5iSstYSfrNw=;
        b=ivXGybKwgozpLSDFO2EnmBmwW5KTYam1sbcIVCHi/KJxeQ2J6/Dkdw5m7gbD5UWU92
         NhJwrWa80CLz1yDJWKViMLUKWcsw+i4s2u4vhRIXtdnzk0Tvg+9dnqcnQ+XX7FlVT9O1
         D6OaZJq93Tt1BQyrKXCpufDcbpTXBPa4V9rPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742167280; x=1742772080;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KiD58UXBpQh7QRHjixnBnlMi2qo30Foq5iSstYSfrNw=;
        b=FzfEd0O4QtBIKGvSaBs6CgWjCctRoIuaC0ewXdjUdT0QGD9QSr4n85+UpTdOYkAxd8
         /GVHNG1x1DmmikL/ds2MdCjJAlLnalWwXbrrbbMh4zYD+gEPtzFQcOLIVU1fui4gfZ/f
         0gKjR88cksSjp/kmJoJI1oBi+HczEbJPphEjgIuK3OsIGy7gvvikY6hEX5PUDXYL/IhR
         9IXa19DSQekzWphD+R+I7D3bi+xtMnZhZYfKSUFQZ6+HldrKpPPdfTOhCXuHvEuktHyG
         iILUUHdsl5iRwokPuY7YGK5KjtPQKMKBlyze2BQL0/AMINcufRU4FKlHkSjm8WLVNW3n
         uz4w==
X-Gm-Message-State: AOJu0YyDGN4wSvMmJjfsBNNZhcIDNE/DMahdrN+PP60BgfibH27Hl4hi
	1y2KtzJkf5p2mBH9mffsVdnWF5fiuM8xeJ3vYtgdrHLsvEKFKpo5HjS4mGN9SPI=
X-Gm-Gg: ASbGncvn9nVej8ltlMAq9GN0nrT+NEJtutM4aTnIkn2Y2uDChlJXsCpctFVtQ+uE2E4
	tr56iJicEmpuY+0Kz/Pyzvs60n0CxAPFVHQqDfFAwGO6aJtLUpuK8SOoXOp0hRYMQA2g2bZFtpM
	ogBmr0WoYljuj9DL4MRQPN3G+byV4060OY8ukDNLFtr127tAKlpU0deI6v/HYBUvKhhZw9PZ/Bz
	WoUih+RU3rYY2hwIsQzua8NyW3boXIlH/XNsBLrQwGcZIcc+OTVzPj6BG30+2HrFHN4HOimlvlH
	JI4Ea0hyxxEaeXZXm/c0noGQ09NwZcyQ6Uof58tjhK9dayBhOfck2NI+bj2ELYiMR4xu8MDgEv+
	d1gEP6JZPbistP/9YhYmRJuYlq23DG2Dd
X-Google-Smtp-Source: AGHT+IH5uWCi1KT/f9SHQWCIU1ZP3tm5LCg1JMpbQsvpbQTCsNPGQJSkL/eT7aXrTf6ALPRQJfuyJg==
X-Received: by 2002:a05:6000:1aca:b0:390:d6ab:6c49 with SMTP id ffacd0b85a97d-397209627cbmr14025435f8f.35.1742167279963;
        Sun, 16 Mar 2025 16:21:19 -0700 (PDT)
Received: from smile.fr (2a01cb000deef0002cff7470e58ff5dc.ipv6.abo.wanadoo.fr. [2a01:cb00:dee:f000:2cff:7470:e58f:f5dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fd6b2acsm90234685e9.0.2025.03.16.16.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 16:21:19 -0700 (PDT)
Date: Mon, 17 Mar 2025 00:21:12 +0100
From: Yoann Congal <yoann.congal@smile.fr>
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org, martin.jansa@gmail.com,
	changqing.li@windriver.com
Subject: Re: [oe] [meta-oe][PATCH] nodejs: upgrade 22.12.0 -> 22.13.1 (build
 failure on Ubuntu 20.04)
Message-ID: <Z9dc6ONKShAo3V3j@smile.fr>
References: <20250123002818.2770480-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123002818.2770480-1-schonm@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Mar 2025 23:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116018

Hello,

Le Wed, Jan 22, 2025 at 07:28:18PM -0500, J. S. via lists.openembedded.org a écrit :
> Changelog for 22.13.0 : https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.13.0
> Changelog for 22.13.1 : https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.13.1
> 
> The 22.13.1 release is a security fix addressing four CVEs.
> 
>     CVE-2025-23083 - src,loader,permission: throw on InternalWorker use when permission model is enabled (High)
>     CVE-2025-23085 - src: fix HTTP2 mem leak on premature close and ERR_PROTO (Medium)
>     CVE-2025-23084 - path: fix path traversal in normalize() on Windows (Medium)
>     CVE-2025-22150 - Use of Insufficiently Random Values in undici fetch() (Medium)
> 
> I introduce a new patch with this recipe 0001-Do-not-use-glob-in-deps.patch to revert https://github.com/nodejs/node/commit/77e2869ca6
> 
> I restored 0001-deps-disable-io_uring-support-in-libuv.patch as suggested here : https://lore.kernel.org/all/20241207140642.181134-1-martin.jansa@gmail.com/
> 
> Signed-off-by: Jason Schonberg <schonm@gmail.com>

nodejs_22.13.1 has now been merged for a long time but it appears that
it fails to build on Ubuntu 20.04:
    g++  -o $TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v22.13.1/out/Release/obj.host/simdutf/deps/simdutf/simdutf.o ../deps/simdutf/simdutf.cpp '-D_GLIBCXX_USE_CXX11_ABI=1' '-DNODE_OPENSSL_CONF_NAME=nodejs_conf' '-DICU_NO_USER_DATA_OVERRIDE' '-D__STDC_FORMAT_MACROS' -I../deps/simdutf  -pthread -Wall -Wextra -Wno-unused-parameter -m64 -O3 -fno-omit-frame-pointer -fno-rtti -fno-exceptions -fno-strict-aliasing -std=gnu++20 -MMD -MF $TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v22.13.1/out/Release/.deps/$TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v22.13.1/out/Release/obj.host/simdutf/deps/simdutf/simdutf.o.d.raw  -isystem$TOPDIR/tmp/work/core2-64-poky-linux/nodejs/22.13.1/recipe-sysroot-native/usr/include -O2 -pipe -c
  g++: error: unrecognized command line option ‘-std=gnu++20’; did you mean ‘-std=gnu++2a’?
  make[1]: *** [deps/simdutf/simdutf.host.mk:80: /home/yocon/Documents/projets/yocto/contribution-yocto/builds/build-qemux86-64/tmp/work/core2-64-poky-linux/nodejs/22.13.1/node-v22.13.1/out/Release/obj.host/simdutf/deps/simdutf/simdutf.o] Error 1
  make: *** [Makefile:135: node] Error 2
  ERROR: oe_runmake failed
  WARNING: ./tmp/work/core2-64-poky-linux/nodejs/22.13.1/temp/run.do_compile:182 exit 1 from 'exit 1'

I interpret this as "nodejs wants to build a native binary using g++ but
with the wrong std=gnu++20 option for the Ubuntu 20.04 g++ (which is 9.4
and only has --std=gnu++2a)"

This has been seen on autobuilder each time the meta-oe reproducibility
test happens on a ubuntu 20.04 worker :
 * https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/36/steps/32/logs/stdio
 * https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/33/steps/32/logs/stdio

I've tried to look around but the nodejs build system does not look
trivial... I've tried to patch the generated Makefiles to use std=gnu++2a
but it broke on a syntax error. So, in the end, I doubt that Ubuntu 20.04
can build this nodejs.

Does anyone has any idea on how to approach this?

Regards,

--
Yoann Congal
Smile ECS


