Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB03C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 11:14:46 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.208197.1724066077938879554
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 04:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D60HPzK5;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-530e062217eso5561007e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 04:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724066076; x=1724670876; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pStsKIkx888bMd9M/R3Uu8ydVknDkc4AKBahqIEf6ck=;
        b=D60HPzK5zCUOvrCL6fV38CsLzqOfdsw44Jy6feQRV7teUNV29GshaXTedChP+uyb9P
         EywIc3IfDjMf1jHUIf1I/woo/J76DeRLMZnHOzzdJt7LsvzuvF81nehOLyQ+vkICj0Sj
         TSzgquqvArx/MzQTmG8ccGGaZFnc9r71HibVfIyjFgHlagP++R5HJtsdqpV1wTIuUxN9
         GqnRsmoN1Qhx0o9N9MnOFxafPbYI5oFYykV6ly1K2+eeEPEYaYZizKLPI60AtTK5e2U1
         KVV+VuTGpFmJl+JyexL0lOy8WihGUGwFQy09PDXQB7kjO1RWzwCOvblVMQUvaaKVir1z
         ZMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724066076; x=1724670876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pStsKIkx888bMd9M/R3Uu8ydVknDkc4AKBahqIEf6ck=;
        b=wgZ7Ij/oQeRSbg4ZjYYOBad5OWZRfYvbeZJT6zi2NAtsHrBtt9M7n1Widzf/+7iWJu
         hp32646X7MhBxpfulk4ohwui8VMqGyWhIUoBr7CG0J9bHkIjv9oS4gArAnnp+pt5Ffk4
         yNje+nDH9t15aGlPT75zSRSKNY3/6B7nI6VV+vk3JBy8XR/Os1cxxa2EIpnrLc0b6GlS
         WE/6nAsFd5kbXyjcqRZOWnBYNVH2AxBAUqRA/q5/NSCXoaRKl8FU+Z3SecFUcJCy/Efk
         FF4N/s5hIZU9LAij7YNny6dgxtUAHsYcdb5LEb7Vcp5XmY1PpBHoJqqvtejXv39E9GwS
         Tctg==
X-Gm-Message-State: AOJu0YzmPwbcxgeVgHILl/AbWu8vHo6VCs7Zrr6jmKF/3WmO/8sVgXY3
	CHyXLPHtpwvDm6e6ydYUGopBeNQA0f66EtXVLnWVSEUX8VpAwyjTYJwQkNpLiPKs+kRyVNOpv5D
	xrk3LXv09+4erqgeCF33GW9a4YQJGSHRB
X-Google-Smtp-Source: AGHT+IE8iXM1qLhOs+PPSyGFhT4ksJebLegZyeNJyt7Bmtm8pv6PyNIjtYbcTgCqHO9vD+7geUxLWozC4VMNjlaH2Tc=
X-Received: by 2002:a05:6512:39c8:b0:52f:cd03:a813 with SMTP id
 2adb3069b0e04-5331c6e94bamr7390002e87.54.1724066075303; Mon, 19 Aug 2024
 04:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240808191119.158166-1-alperyasinak1@gmail.com>
In-Reply-To: <20240808191119.158166-1-alperyasinak1@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 Aug 2024 13:14:15 +0200
Message-ID: <CA+chaQcJnco=qYqvhyrVHJ_5O99rJbM8NuqkvvAAWca5Rjx+ow@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] blueman: Fix do_package QA issue
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 11:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111848

Doesn't this just hide the issue that the systemd service file is
installed in wrong directory?

with current master I'm seeing:
ERROR: Didn't find service unit 'blueman-mechanism.service', specified
in SYSTEMD_SERVICE:blueman.

On Thu, Aug 8, 2024 at 9:11=E2=80=AFPM Alper Ak via lists.openembedded.org
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:
>
> ERROR: blueman-2.4.3-r0 do_package: QA Issue: blueman: Files/directories =
were installed but not shipped in any package:
>   /usr/lib/systemd/system
>   /usr/lib/systemd/system/blueman-mechanism.service
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> blueman: 2 installed and not shipped files. [installed-vs-shipped]
> ERROR: blueman-2.4.3-r0 do_package: Fatal QA errors were found, failing t=
ask.
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> index 5aa3b2bd5..df2a226f0 100644
> --- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> @@ -40,6 +40,7 @@ FILES:${PN} +=3D " \
>      ${datadir} \
>      ${systemd_user_unitdir} \
>      ${PYTHON_SITEPACKAGES_DIR} \
> +    ${prefix}${systemd_system_unitdir} \
>  "
>
>  # In code, path to python is a variable that is replaced with path to na=
tive version of it
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111682): https://lists.openembedded.org/g/openembedde=
d-devel/message/111682
> Mute This Topic: https://lists.openembedded.org/mt/107795994/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

