Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 85FB877C20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 14:07:14 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id j90so9367956lfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SYRmmO0ljggYBWgAn2jBMgyx/cSdP2svmXogIwZQKxM=;
	b=hk5bkcA0mJTB0fPzt/LeQxjZtpwpYMl/UMSEUXsQJpxHts3Fy+68MvM6c1CIFSJ2lc
	qYVT91rTVxPApTvIwJ6la6lC0uc/f0KZ95J8bxIqkqbImX/UpelXp6e8aapD+dDlOhE8
	cAr86x4XRNOr4qw/HvLlIelj8BHr71xXrj324OpyfG6VEnMGGBVL0l5veO703Vjh4o50
	UCYfeGEraoNaxDtuj2BqDvt7NZjKbjNXnt5/fNOcY1KwiX9n1yczS+TzAaQTYo5ru6PD
	kWRDZyl6+KXLSKRCpdNGB5Zj2z2Ge2MYdwmZgBPNj0t2EB+LxW+GLNeBrprpbPTs+DPw
	i+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SYRmmO0ljggYBWgAn2jBMgyx/cSdP2svmXogIwZQKxM=;
	b=K8y/zXqopX/Hb6YWO8jasWjze9v5GpPVthHVuXKCFkWaevyGcJ/g4MMJiYgIVTGopl
	INTmXyifqJ/v0LsbOxltGj49GbpbLUjC48cKvlIQJI5n/6ToReYxpBxRUlKxkbnTUQR/
	utWFcXQuxe92mLEZFf1KYmmKBWrUoXclMa4cqCAuPc/TizTIptmw2Ubp78foU6QxClnG
	tUQZEdqZb6YYR1ZCEFUruSzamIWqx4kkT1eZjaJ1bZNdAjiSJRzeqvRskYCYmQ7EXWa3
	5gBjsC+hpCGZ9UDQNpgjO2Z9RPL6i7qGCiGQZz107OB9sW8+9iksAtBot4e8g6tmkKDA
	x6/g==
X-Gm-Message-State: AFeK/H0PyELRGLQvRstue74bxidJ1fqLzBsEuiyjkjBJn76UKfRb6h/qdk8KhWYst9kuUkzv9E/35xyG7AfNIA==
X-Received: by 10.28.71.87 with SMTP id u84mr1594959wma.101.1490796435146;
	Wed, 29 Mar 2017 07:07:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 29 Mar 2017 07:06:44 -0700 (PDT)
In-Reply-To: <20170329110515.GC3298@jama>
References: <20170307071349.16444-1-raj.khem@gmail.com>
	<20170307071349.16444-4-raj.khem@gmail.com>
	<20170329110515.GC3298@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Mar 2017 07:06:44 -0700
Message-ID: <CAMKF1sqMeBHPwBdv3CxsDcLEXTiw-stRdJLq0qV+U0sV+fTVsQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 04/14] gpm: Update to use git src uri
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Mar 2017 14:07:15 -0000
Content-Type: text/plain; charset=UTF-8

>> +do_install_append () {
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>> +        install -d ${D}${systemd_system_unitdir}
>> +        sed 's:@bindir@:${bindir}:' < ${WORKDIR}/gpm.service.in >${D}${systemd_system_unitdir}/gpm.service
>
> Did you forgot to add gpm.service.in in SRC_URI?

I sent a V2 for this patch with another series i sent later. So you can drop it.
see

https://patchwork.openembedded.org/patch/138243/

