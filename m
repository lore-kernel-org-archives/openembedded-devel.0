Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED5D60125
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:37:48 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e14so330915qto.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RyvVS8sMc63w1wFcWkdpHeWgNN+U1Mw18x0M8pitKnI=;
	b=Nvj0G20lTlTO7KynEwbVnNOVjPZ845aNsvmjkaAieXtpF2QYvm97XYIGDve00gyJJX
	sOcD8HY+dfkruSTX8If/JgTmK0xGJrJdcnwhp1jCxmAUvQceCHaZQ5DxBL7hs4TaW85h
	Pgw2/HuFB3UZ1HCc39k2Nae6qw+wD8r29tXtYzWbVNpJdIWWRfWAMBup+r7m26N/rYVv
	+LXYz7JW6MWyW6Q4LuPcMvjj8cRc+c0j2bl/j4q7l8gW3WoVjfmPbNhOFOu6B7bPaxXU
	Vwk5Vyi+dA8qRAz0WSATcKkrL5gxZ7zmXwFvf/1E5lpnxLnAg43OV8htX+cx/3+gmRE8
	KDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RyvVS8sMc63w1wFcWkdpHeWgNN+U1Mw18x0M8pitKnI=;
	b=QY7kwMeN1skS0YpzE7O9HHtnEaiZG70Ml2eVRFkTChcjnAPMWl0+2NQKBhhoE6843+
	WCjDiTIxR+8OaRxTzlx4CTg0DGe0dWduxI92IUboYvJ9dln9YOsnpIsqRLpsDLrl4NyV
	ey432M4f10ZmOjROZJyp9ec3gs48318BYoHLO/+7UC5V9MVhjd/BVRrONRCIkIHUuEBT
	omVi90MjWhevsAsDx7uUznPjbm7FXeExbFWccnxalBcSalQiOfm3DdJS1tx8dwX9O2JB
	ParcPxTNhIaSCd+9DF0T4VYDZEB1vlLPoCwNUve9LgFYB8eukrt5aBJpoKaUjNWz+rw5
	q2lA==
X-Gm-Message-State: APjAAAWNI90OIe6bZPrBXAjQ/OtwI4aromaLfx9u8Jn9PuBK+RtLr+Yp
	rAkhLxz5aHPq72V2eYItOAfo5Uc6iLITfjFe8hk=
X-Google-Smtp-Source: APXvYqyL1nOyXFCuy+bMKr8tZLn0SZuoE+mJQ6vC00aZ8FvLvpnul1HFzUA50EwnuPJmHOh2uXoxZN6EBbBHHgTjNm8=
X-Received: by 2002:aed:2724:: with SMTP id n33mr1516099qtd.194.1572385068985; 
	Tue, 29 Oct 2019 14:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
	<CAMKF1spGD1djY6F4hMYCTMWyEm=Fdq_ZmMcWFE8rxnhe7xv-mA@mail.gmail.com>
	<CALbNGRR=kGo-Dt1VKn=2AkWQwDXHEKF2M5Hwb5y0uGVfE2yrzg@mail.gmail.com>
In-Reply-To: <CALbNGRR=kGo-Dt1VKn=2AkWQwDXHEKF2M5Hwb5y0uGVfE2yrzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2019 22:37:22 +0100
Message-ID: <CAMKF1soAzh=sMUfuXDh=dWZEboHUO1+sSFk0Q=h_t75WD8Pn7g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v4 1/4] colord: initial add 1.4.4
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
X-List-Received-Date: Tue, 29 Oct 2019 21:37:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it seems its not linking with gobject-2.0 properly, pango had similar
problem which was fixed with
https://gitlab.gnome.org/GNOME/pango/commit/d0cb6be7431d1a3c711bd45bcf05b34=
601604037

On Tue, Oct 29, 2019 at 4:43 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Tue, Oct 29, 2019 at 3:15 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Fails again
> >
> > https://errors.yoctoproject.org/Errors/Details/274899/
> >
> Continuing like this does not make sense any more. Need to set up an
> environment where I can reproduce this error - may last.
>
> Andreas

