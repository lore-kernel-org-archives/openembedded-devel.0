Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 53F627D2CA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 10:42:24 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id q14so10295029itk.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 03:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uh9jL7Av36v5i5Sadxz6uAv43WkcYUpD6jbpYy5/hH8=;
	b=qgTbzqj6mGndoB924uRnrl8Xp/vg0KDv/Yn10lSO14rkwMELLmOgTQhEDqjbcH4fpa
	wO1z0WLf3HIf3uVUFerXdQB1BmEHB0/hC6dUgMPxkHlVDxjtSRMEdraUvh1am09Bj6zk
	zJWKPMq8jIqkSbATieIUF0/G5UG4waWYkh/jF6gnuRhK9/MSH54BB/BUyo8hip5fn9wK
	CSweJ9yn0NNYqklNmtoppMuAUExXqLAbfoVTMPtN5U/y1wTs0eDjbG2U1RBGxl5tKb/B
	gl3EC9cxsspq0ytGBx3kenLMn0IGhbZQVe0zpfnDMHdHECCyaUTPATy6MDB2mX7a985V
	UDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uh9jL7Av36v5i5Sadxz6uAv43WkcYUpD6jbpYy5/hH8=;
	b=L2p0SYxBgThIK3COTkDvcX2rxvuODAXNYBbTidnTiakTsaJysdaatYvuvFd1cZIf/6
	DdlR1dNDXqnutu+tFRz8erGefKnslwRtp5Foxqa8oIwy1AmDlQWMvWe/R4KuzkEmTBGh
	oseNNRCRxLP8oNleLAEEgz+dq//ur36gMTTQ8Rm8A3SdK61PcrMC8F8ec3SI/KqTMsxG
	ha3EypiSVx2q+vni0nizqsI6OvPxXTmd6SHphWxrBbQNzk4QCcHaUl0lDcI6UXoyxIFH
	Lv0uL8Yi0CQG2LCU187V7MJexIq6wP31u1/kDePHmhf1Je250jDZNVOy/ZKw/LTwwYlv
	Hn3g==
X-Gm-Message-State: APjAAAW09iRYzC1D8ZzMDv8/u7nXGogLo9gspwguXyToNjBEOBfeklsR
	4z3HWkYufktCOX7U/yccYJ420p5CRcEaXxTPQf1RzWQ+qis=
X-Google-Smtp-Source: APXvYqyQNOzYTj9j4eL7KpgOJUI/S2LroceEGdVKIbaNmIQ49G/8WXiAi4ZFaokh5APEVcsP0fg3tl74vkTO34plkuU=
X-Received: by 2002:a24:46cc:: with SMTP id j195mr54534itb.161.1554288145120; 
	Wed, 03 Apr 2019 03:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<20190403085651.GA6467@localhost>
In-Reply-To: <20190403085651.GA6467@localhost>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 3 Apr 2019 12:42:13 +0200
Message-ID: <CAB2nKc9hnDrOTtKjNfk1cupK0yv8xXksEuvURJtS6ve_baOpJQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 10:42:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Then, it would need to rename cppzmq_git.bb into cppzmq_4.3.1.git or can we
just remove +git${SRCPV} part of PV?

In following threads it seems first option should be chosen?
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg12=
0575.html
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg12=
1561.html

Le mer. 3 avr. 2019 =C3=A0 10:56, Adrian Bunk <bunk@stusta.de> a =C3=A9crit=
 :

> On Wed, Apr 03, 2019 at 10:28:42AM +0200, Vincent Prince wrote:
> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> > ---
> >  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > index 9aff59c..2f99417 100644
> > --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> > @@ -4,8 +4,8 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddb174eaf7b55a34a7c89551197f=
66e94"
> >  DEPENDS =3D "zeromq"
> >
> > -SRCREV =3D "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
> > -PV =3D "4.2.3+git${SRCPV}"
> > +SRCREV =3D "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
> > +PV =3D "4.3.1+git${SRCPV}"
> >...
>
> These are the actual releases, PV should not say +git${SRCPV}
> for them.
>
> Not a bug you introduced, but can be fixed now.
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

