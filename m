Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 058F97D419
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 00:14:34 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id p18so856017itm.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 17:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CqUk8DbvPn54iox1mxuR9lny4L3+RDSo/hiCpI+6kno=;
	b=MC8EWCHpsFbPGyuqEGXJUi0eubnK1FQUWmBMsTV21LiXNwM9eGDiDChhGFp93epVM2
	HZcZDD0plYhueZsf5JzGuqSH96okPsbfErYQPhsfQigvSk2EEFbS5sS5XdLks3R2U6oV
	0YzbBcT/T4pldeAr3hrW0qmGT5A9FxuzF0oxQg43YAagumocsvJT1RdA5TzYhdAlRTx8
	6r8QR8kv0faS+iTska62LbUF3ilNS4gQ8IDRvyk+znKPtpKwQNqjyB0nsEkFteYB+Xsr
	SB2HiKbhptt65J63vTOmr5ATaishM6vQt5xPLU/n/qTmhgK2Ipq6LDITGMQzPyK1JFHd
	noQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CqUk8DbvPn54iox1mxuR9lny4L3+RDSo/hiCpI+6kno=;
	b=Y43y/9/UP6WbQiXiMr7aLcGgifrg9omShpdouFAnxGGj4bhHHG3SbM1f2gkfH/goC4
	s3OC4uq8eAAzJWn9gIW1KbfBTV5YVBgBAoDo9uEwlZnEsfDhc4XYYeTzX7klqzvHGjr8
	edRyfDhzMAmgNqm8DXA6xY+OapuqgNd8aoFoF0tyU0F1HlKnlKzaRrOvBgrZcaXMeIOB
	U7t9BL8S8995kVjq1+9D+lvKCIPeyqK5e3UrtirzAhjDkZR5mCK1334AYuTsZInNVdqi
	FmeoatI0f8kjowSU+/LXV/wz/NuF6YrOD1W3e6QRtpq59c8EEfDPIMUuJWwf6BRLUV1+
	Reeg==
X-Gm-Message-State: APjAAAWmXDh3g2rwwQR/M5YDgDLSz4EWcZ/eS7+ibiUt5k/oQtKuDXAO
	lsHjocPElpSO1+BbnyWp77UuWGgL28zdBW9A5oRtELtJyMY=
X-Google-Smtp-Source: APXvYqwaZSQ0j5H8/T++nxzdjOY+V7z4qba7Nq+HFiUfQUBhDzIUH8YwbzwKb53jBlvsOklIBdquTzhziUXyTXSYJy8=
X-Received: by 2002:a24:9d46:: with SMTP id f67mr1119397itd.58.1557274475930; 
	Tue, 07 May 2019 17:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190507214414.19696-1-bunk@stusta.de>
	<CALbNGRTQDPSZTk0z46fh7gEpLeP-pp3SqJsHBCaX_o1g=sxGaQ@mail.gmail.com>
In-Reply-To: <CALbNGRTQDPSZTk0z46fh7gEpLeP-pp3SqJsHBCaX_o1g=sxGaQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 8 May 2019 02:14:24 +0200
Message-ID: <CALbNGRRpeZhsPMf68WOo=66pehm_bgb9L8fXjc1ZhF=p=Fg1Zg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] Remove the obsolete glade3 recipe
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
X-List-Received-Date: Wed, 08 May 2019 00:14:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2019 at 1:06 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> Hi Adrian
>
> On Tue, May 7, 2019 at 11:44 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > After the libbonoboui removal there shouldn't be any reason
> > left for this ancient version instead of the glade recipe
> > in meta-oe that currently builds version 3.22.1.
> NAK - libxfce4ui PACKAGECONFIG gladeui builds components necessary to
> open glade files shipped by GTK2 xfce4-panel-plugins. I need that at
> least until I have ported xfce4-closebutton to GTK3.
>
> So there are use cases.
>
> Cheers
>
FYI: I prepared patches to:

* move glade3 -> meta-xfce
* upgrade glade3 -> 3.8.6 (released August 2017). I remember to have
tried that but failed because they introduced online-help which needs
all the yelp stuff or massive patching. Now I have patches in the
queue to support yelp but this series is not yet done [1]

[1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2019-05


Andreas

