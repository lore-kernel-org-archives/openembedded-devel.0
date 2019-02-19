Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id BB1D77C8CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 07:01:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id y4so21986850qtc.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 23:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DKHuMEer293FtdJ1C0Dmss07VzLbXfzNxI9YVMoXACc=;
	b=EMNlMDUun39zGGuxANDdy3Y6WXtI0bEpcZEAIepG/g1KSYAoPNB5JEU3SLvAxSZsuB
	JfPdg6IkNzz/mxjksuzFHcX1oerYBt5L9uV/T0qsshhwUCQ+5zZlABGHN2zYQuDnf3oc
	ekRDSijILI2RILZKkFtw6ZZtcagIpFRboCXGuR96AQpTXXXokSap3PJWkYWgD5Ubvj/V
	QaX2Ig/VxXn1qU5L9Ke0EurtgK+TjGqH2EExopkvyjunCp6dMMROVKRpm1ZJye7ZZmmp
	ZuNdXM+vO/E3VZuycWMlN93GZzjtQESNOUogsA2x3K37jQC2tKumziYj2RnkUJ+GL/98
	T50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DKHuMEer293FtdJ1C0Dmss07VzLbXfzNxI9YVMoXACc=;
	b=XI69tdWod6i2gUIw02MZw6x0iqs1pCPdMxlhZLQ6ngW6gQeVL3Bdb7RuUpBMn8QpXX
	FnKqdcmag9X83wMyCCVeDElhBTogNv+uv/MdtJU54M4H4OBm5WN2hdUPlSPiF8kGZqE6
	2FnKjbdc07F9pdNdGvqVOxkqFjnbt0c6LRpMFhyyte5wOCMbZZuxiDJQN2JflvtCMZuf
	QtXSpZDdpjDhAS4WWIBqNN5zKxG8UVmPx9l24SmOjj0TRsepqb1ehy6ZGNiROXQDVNp+
	tPkAfD5qpItYATatXR+trYVIaB85P7P3b09zV33yPtlQwZ4h5VelS6Enk1vL5Z6ijQ7g
	/wxg==
X-Gm-Message-State: AHQUAuaryzrCvzN3hS23hWD1b41beBt8F83MPX3YNXJAd41KeezvE3lo
	4KChH/yMwp2euPVPEbt4u1nsMWhXUfdfG+Krh1I=
X-Google-Smtp-Source: AHgI3IZl43of5uhN5sz2aRIYcZPLEEX9d48W3R18tbwpD5MAlZXbJEKSKkY3XGonEe6z+fmu2y7psomyqe0wkZ02Ihg=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr21454443qte.29.1550559686556; 
	Mon, 18 Feb 2019 23:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
In-Reply-To: <20190218104704.14623-1-zboszor@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Feb 2019 23:01:00 -0800
Message-ID: <CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 0/6 v2] Run dracut from rootfs
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
X-List-Received-Date: Tue, 19 Feb 2019 07:01:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://errors.yoctoproject.org/Errors/Details/228793/

On Mon, Feb 18, 2019 at 2:47 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> This patchset adds the necessary pieces to create the initramfs
> with dracut during do_rootfs.
>
> The 6th patch references a GitHub branch for which a pull request
> was made against dracut. See https://github.com/dracutdevs/dracut/pull/53=
5
>
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>
>

