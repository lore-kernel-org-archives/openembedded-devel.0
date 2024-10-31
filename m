Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00036E6748D
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 22:46:20 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.25132.1730414777235368436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 15:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AFRNbHAk;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fc968b3545so14925671fa.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 15:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730414775; x=1731019575; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzWBDh/5c0FX4Aqtqz8JWCwojvRgfjK/LvI5QpYn5GI=;
        b=AFRNbHAk6EcWi2DUzkI3GGb2PU3yF5uyIB3GD5il10iMSBClpYYSsQsgyqmLdAJ1bT
         FvJmiMLZTOZ1LE3w7ir6Q6KFm2iCEl4kT6rfKua2sWHGprz8SWyzjQw7aDhGb/5lQqjS
         r4Qvkmrmf8SYiM9lO+Wwc+7312Ot/9KJ07OEkjtV7Zd1KggnNAwrTc8X2uWi0dJDIxWn
         U8o6bumskl8X67b08bL91Y2SI2nqy1P5K68jOc/cJ5V1u9RBmBihnATCKDozTBX3ICVR
         gvFjQiOyzOOllDod6dmbB5krbnFj53IuwsvsMfHUccdDMM4xmFyahJllatb+ssJo9SSF
         IlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730414775; x=1731019575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzWBDh/5c0FX4Aqtqz8JWCwojvRgfjK/LvI5QpYn5GI=;
        b=GFUC2y617Zz0kUbN7EJlGA4PDbqdrCZDO3kUe816uukNEW64/b8ml2bpWlqHs8jT10
         Qm+RmWD11oyPT8EnBslFw1YAEHfV+IwZE3iZAl2RPkVz/hWmBrglKmPknPphw8PgVbOG
         XWgC8GN35nu/zBG1EcHgo1X1q9YMHgCYFlue5bQLeCjg8NhXoK0CBYeeHszMCBUaJgPJ
         PM5kXwkLYqD0oZpXqSl0ANR4Js2slVbSZzuNjFRmjX9o5nKvt6eRZaBo4Y8117Ie2kg5
         155TZurZMy+IPEMImQNPYeJlqwJzzhUHKjc9zwM10PXuun7WJnOCWOEuKGE3GUA2/2fg
         WnmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcDnpVcvh0D5+XxABjLUjhIgzMz0rEEShT5mv+ARWLK0Hj03v6PZFLSbrA7DcXf5Kf8+Cs6OPweUYRzM69F8jEfhs=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzO0F6TEy9DzgvK827UjneyUwItKdjy4iwg4VtNpOmta0ge6x/s
	0m32E3MU20kI2uiUZnkuJ3elTWyUU+P0mzts/k4/xywU7lq7Ky0JBnqsN6LkVFrjvOGr/zc+2m2
	ktz+mInWtNb8x3GDr1VAgXfyVNVI=
X-Google-Smtp-Source: AGHT+IH+KYvHoUxfnPzf5Ozyycj1aHKPCJ7+DQPFFHsVRQ3GK3FRJSi9GILOYlg8PpylftEfKZHhyLuwlV2nE7o9DaA=
X-Received: by 2002:a05:651c:b2b:b0:2fb:5740:9f9a with SMTP id
 38308e7fff4ca-2fdecbf1286mr27415431fa.29.1730414775007; Thu, 31 Oct 2024
 15:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20241020150843.1068181-1-raj.khem@gmail.com> <CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
 <JOE8MS.4DEF6FX7L6873@t-online.de> <18039C488E2C1344.6352@lists.openembedded.org>
In-Reply-To: <18039C488E2C1344.6352@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 31 Oct 2024 23:45:59 +0100
Message-ID: <CA+chaQevEQ2=G0Z0QG5FvZ4pSh0F7p-vOG69g1m95vQYPk364A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] snapper: add recipe
To: martin.jansa@gmail.com
Cc: Markus Volk <f_l_k@t-online.de>, raj.khem@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 22:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113377

On Thu, Oct 31, 2024 at 7:15=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Yes, systemd_system_unitdir helps with the systemd files, but the other f=
iles:
>   /usr/lib/snapper/systemd-helper
>   /usr/lib/snapper/installation-helper
>   /usr/lib/snapper/plugins
>
> don't use systemd_system_unitdir and as the path to them is hardcoded
> in the source, I guess we should either hardcode the path in FILES as
> well (so that they are still packaged and found in runtime even if
> someone changes libdir value) or change both the code and the
> packaging to respect libdir (which might be too much to ask after
> looking at the Makefile.am).
>
> I have a .patch file to change Makefile.am to allow passing PREFIX,
> LIBDIR, DATADIR, SYSTEMDDIR values, but then I've noticed plugins and
> helpers and stopped there (as I changing that as well to respect
> passed LIBDIR) should be at least partially tested in runtime which I
> wasn't planning to. Sending PR with just Makefile.am changes and
> asking the developers to "finish it" also probably won't help much, so
> I've just sent previous e-mail and added SKIP_RECIPE in our DISTRO
> with multilib. I can share the draft PR if someone finds that useful.

Added libdir configuration for those paths and here is slightly updated ver=
sion:
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/snapp=
er
completely not tested in runtime, I've only checked that lib32-snapper
builds without installed-vs-shipped and the most files look in
expected locations (but I guess /usr/lib32/security/pam_snapper.so
should be moved to nonarch libdir, so it would need separate configure
param from currently used libdir).

Not sure if this was worth it :).

lib32-snapper/0.11.2 $ find image/usr/lib*
image/usr/lib
image/usr/lib/systemd
image/usr/lib/systemd/system
image/usr/lib/systemd/system/snapper-boot.timer
image/usr/lib/systemd/system/snapperd.service
image/usr/lib/systemd/system/snapper-boot.service
image/usr/lib/systemd/system/snapper-timeline.timer
image/usr/lib/systemd/system/snapper-cleanup.service
image/usr/lib/systemd/system/snapper-cleanup.timer
image/usr/lib/systemd/system/snapper-timeline.service
image/usr/lib32
image/usr/lib32/libsnapper.so
image/usr/lib32/libsnapper.so.7
image/usr/lib32/snapper
image/usr/lib32/snapper/systemd-helper
image/usr/lib32/snapper/plugins
image/usr/lib32/snapper/testsuite
image/usr/lib32/snapper/testsuite/owner1
image/usr/lib32/snapper/testsuite/CAUTION
image/usr/lib32/snapper/testsuite/permissions2
image/usr/lib32/snapper/testsuite/xattrs3
image/usr/lib32/snapper/testsuite/error4
image/usr/lib32/snapper/testsuite/xattrs4
image/usr/lib32/snapper/testsuite/setup-and-run-all
image/usr/lib32/snapper/testsuite/ug-tests
image/usr/lib32/snapper/testsuite/ascii-file
image/usr/lib32/snapper/testsuite/xattrs1
image/usr/lib32/snapper/testsuite/xattrs2
image/usr/lib32/snapper/testsuite/directory1
image/usr/lib32/snapper/testsuite/owner3
image/usr/lib32/snapper/testsuite/permissions3
image/usr/lib32/snapper/testsuite/test-btrfsutils
image/usr/lib32/snapper/testsuite/error1
image/usr/lib32/snapper/testsuite/permissions1
image/usr/lib32/snapper/testsuite/missing-directory1
image/usr/lib32/snapper/testsuite/simple1
image/usr/lib32/snapper/testsuite/owner2
image/usr/lib32/snapper/testsuite/error2
image/usr/lib32/snapper/testsuite/run-all
image/usr/lib32/snapper/installation-helper
image/usr/lib32/pam_snapper
image/usr/lib32/pam_snapper/pam_snapper_useradd.sh
image/usr/lib32/pam_snapper/pam_snapper_pamconfig.sh
image/usr/lib32/pam_snapper/pam_snapper_homeconvert.sh
image/usr/lib32/pam_snapper/pam_snapper_userdel.sh
image/usr/lib32/security
image/usr/lib32/security/pam_snapper.so
image/usr/lib32/libsnapper.so.7.4.3

