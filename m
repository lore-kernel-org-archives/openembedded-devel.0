Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id C2E557FC9D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 17:05:23 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id t26so13751251qtr.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 10:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2jRgJwaTWDDiYZkOqjhBGrIN1Tp+TgmyWg3gpiElYFc=;
	b=MLEZ9vo4c72fcn0LJHvMt/d6xjJZZOUx5XHeWbmivJYzTgC6LieC81yMTt1RiqlBVJ
	eFO2bjSYhw2VKWCWyQJC7AAx86j2oMGueLsCafEYSGL0nPIjvEdzck9aHuUR3YeLnyTG
	LseRDG5Qg3QTHgIA51K6Hu/OSwFj7DwWBHR14yvxU2I3ogGB+2XpOGW5Rh4qkjPMb8Rq
	ZW2YWSwfXrl73Bbay0iEax9NNbSUiHeJgYuNvBmBQEHF9nQZIm3tOyv6nw7EkA6WyQ3H
	4Rws8q5zecQCZAhHJNLXBut8sFwee+XPUTnbVsH7l7N4eBHmDsD6SgZYMTS/ni1MuTBc
	bWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2jRgJwaTWDDiYZkOqjhBGrIN1Tp+TgmyWg3gpiElYFc=;
	b=dLCh7QugyRzgTGxvU3k60ZilytZVmVofCsWHmKZziJNouX4qj2wbfd+Rr01Yfku8hE
	7wg+DdlINQssuVH2HiUs5JULXp7LiFll8iaPKqUjmDfn+HsaZglOYdxsXThOmlHcgGH+
	THwNytD71RPdPEXGcStaw8PTuw181KcFGCGUvsT6lP9mlCIFzZzIxVCTjD4dKtImtZZu
	Vw9XTkUnF4XuzeL1kgNIeIdATnZPXirGIqDL2I1JpoXXYAFiU/FjTgIlnITgNumwsCpr
	Vo9Uolh93zWbx+spA+ipu2Suobnr2RVvwypy54ThkfTdqktChTjI82m+bl+4ScVW7dYY
	MdjA==
X-Gm-Message-State: APjAAAXx3OdA3eCEKRgGbP6UiuwbUDH0Sub1TXpghN2LbcgNrlG3bgZM
	awW0TanOATR3O9QJtRLVJ9y03o9zGJ7c9upjuXk=
X-Google-Smtp-Source: APXvYqxAfBGaXmtSaCy9DrGvwWkxTWxlh4t+bSAkn0NoPGbPkEIUqEGHbab/7L9/hEBbBU3ill6rlxla7zQL/lUqGKc=
X-Received: by 2002:ac8:2ddc:: with SMTP id q28mr353100qta.88.1572627924364;
	Fri, 01 Nov 2019 10:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191031184223.14080-1-Trevor.Gamblin@windriver.com>
	<20191031184223.14080-3-Trevor.Gamblin@windriver.com>
	<84a3f2b5-264d-3f50-1fea-c6b8f6c292b5@gmail.com>
In-Reply-To: <84a3f2b5-264d-3f50-1fea-c6b8f6c292b5@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 10:04:58 -0700
Message-ID: <CAMKF1srBK7CzoBvNW0vbW2iP0cy3KRRnHr1=uSO926xxM=tRGw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python-h2: add recipe
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
X-List-Received-Date: Fri, 01 Nov 2019 17:05:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 1, 2019 at 8:40 AM akuster808 <akuster808@gmail.com> wrote:
>
> are these V2 or just a miss fire?
>

there was no meta-python in the subject line. So there was another set
which was sent
which I have picked

>
>
> On 10/31/19 11:42 AM, Trevor Gamblin wrote:
> > From: Trevor Gamblin <trevor.gamblin@windriver.com>
> >
> > Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> > ---
> >  .../recipes-connectivity/python-h2/python-h2.inc       | 10 ++++++++++
> >  .../recipes-connectivity/python-h2/python-h2_3.1.1.bb  |  3 +++
> >  .../recipes-connectivity/python-h2/python3-h2_3.1.1.bb |  3 +++
> >  3 files changed, 16 insertions(+)
> >  create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2.inc
> >  create mode 100644 meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
> >  create mode 100644 meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> >
> > diff --git a/meta-python/recipes-connectivity/python-h2/python-h2.inc b/meta-python/recipes-connectivity/python-h2/python-h2.inc
> > new file mode 100644
> > index 000000000..42629c261
> > --- /dev/null
> > +++ b/meta-python/recipes-connectivity/python-h2/python-h2.inc
> > @@ -0,0 +1,10 @@
> > +DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
> > +HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
> > +LICENSE = "MIT"
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
> > +
> > +SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
> > +SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
> > +
> > +inherit pypi
> > diff --git a/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
> > new file mode 100644
> > index 000000000..b84129742
> > --- /dev/null
> > +++ b/meta-python/recipes-connectivity/python-h2/python-h2_3.1.1.bb
> > @@ -0,0 +1,3 @@
> > +require python-h2.inc
> > +
> > +inherit setuptools
> > diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> > new file mode 100644
> > index 000000000..7230a27e8
> > --- /dev/null
> > +++ b/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
> > @@ -0,0 +1,3 @@
> > +require python-h2.inc
> > +
> > +inherit setuptools3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

