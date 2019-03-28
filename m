Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 163AB7D1A9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 16:56:03 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id m137so7173701ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2019 09:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ob8b3wM9q0YMWWgpCnlpwTDSYS2dEEtlgiCwMbnMOVY=;
	b=pdGab9kWVBgyADe5FGknT16Xsg8v+PjVnEdnONRo12+EqbjSvxGl8SJcjx7E93wqzP
	ID5M5MqNcKfjIgP+aRIdKrlLV6rKa8qic5vSGKOAS4ThUYkQ6h1p2R4o/1fL1KJI8/pN
	bBUQprxB+Zwk1MjHDt/vCm+dn4uJpMtsTtnPhEg6MEMWYFNrDx0xjnheNqqvHyS6rE0M
	x6WffGWhld5Dw2LjhtRE9vm3x7HkGqJKNzff2s7DqFjVz1It48tCH5yAIcGcVpOThzYv
	PE3ten5kjl15ieKqq+VqrEmKQc9wx4aaLv9QCtJo95Dgp3ORxehKkvAC0CHFJyiQr/Xb
	TOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ob8b3wM9q0YMWWgpCnlpwTDSYS2dEEtlgiCwMbnMOVY=;
	b=qpqTvciixrCVR9de+KSj1w19ZjBF6064wk2MT319xLrMDotph0dRp7hgFetkUn7gD+
	4jVvG7TRJqcseoXl7z7mjO1OwKjx9gT8OwbGBEM7UvFTvVAzMMxz2g7yL9eNbHOv0GVD
	/M/OTLeuP+Jb3t41TVAVzBsOqfTSgHAc03kimKUQ+BAOh447+Nt0s7IJsDv7H+GDn0fa
	MA8NX22Tc9AdmiNvm1coF/psjBh+3wON6jwkqUvvaF32yxvjgVPBsPoMDzJM42Bg3wca
	ftFLNzcKH2dYnD4nj00VGOX3tiWvaHp39+6/xLwXQwHKPHZGymSIkrCotGOswxT9X+fA
	bMJg==
X-Gm-Message-State: APjAAAULrD53AewL9mdd8iWHiLRKUAnZLCURipCKOTyxIHEk4O1q2wsx
	/JwmDZWf+Ux6pSg0uOK2hGI8hpwPtWcKSQp+quc=
X-Google-Smtp-Source: APXvYqznU0bz3mK+tek6DShxuUtVl4LslKDa/GyQs5jQ1G1eXD/mHgI5FXDdlJuHaFc+bArUfv+HlERhemPypnsqU0s=
X-Received: by 2002:a24:c8c5:: with SMTP id w188mr903984itf.1.1553792163846;
	Thu, 28 Mar 2019 09:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
	<20190327153509.23928-13-schnitzeltony@gmail.com>
	<CAMKF1sqfj0KOjgL9AT-Jo8EfaKkrON78tB7MZi8A7WshyVtoDA@mail.gmail.com>
In-Reply-To: <CAMKF1sqfj0KOjgL9AT-Jo8EfaKkrON78tB7MZi8A7WshyVtoDA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 28 Mar 2019 17:55:51 +0100
Message-ID: <CALbNGRTCceO3cBtGm+HQvdER=++2BZG0iFzxSod1Q80gxQVJeg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/15] gnome-system-monitor: upgrade 3.26.0 -> 3.32.0
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
X-List-Received-Date: Thu, 28 Mar 2019 16:56:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 5:44 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Mar 27, 2019 at 8:37 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > Be aware that it needs 'polkit' in DISTRO_FEATURES
> >
>
> Fails on systemd-less based distros
> https://errors.yoctoproject.org/Errors/Details/234765/
>
>
Will check and send a follow up

Andreas

