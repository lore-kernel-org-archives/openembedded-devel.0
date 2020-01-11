Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1B0017FFE9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jan 2020 05:40:04 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j5so4067833qtq.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2020 21:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0yzt7ws5Sg8Wxw37j5I3yHyjMQOJgZAVLefpS82bjZ0=;
	b=cUr8lF17apkJ7GudQnTJkApvXgacPt0lpjNLiWbghyTVnnutzz9+2/lc3+Jx+vVDRi
	lePh0Cqge1MS+Hv4qdmJUDt+0eSvpqk+wxW7ftuLkvXMOwZyhC2GalMwrLx8XLwmUKRT
	NgbiVLmH1p3YJDHsNrauTLujXc6gfcT5VBOXYyrnva4iazbTnlhJhSngGI1xpLma11Cc
	CA7wKA9WfzoxPaatoiQECdf09xpNJN/USSwMC1DTVaAGgQwxeWEul6qT18HK7MsvyDdu
	NI7zJtig4loKCWzaByBHcchSoHJNlnNeVBQpqEekQFwuzqjWIRDFz06Mw1u3ZbRCMKb+
	pprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0yzt7ws5Sg8Wxw37j5I3yHyjMQOJgZAVLefpS82bjZ0=;
	b=XxuM82uB6w4h/XQ6+PRH4tbgzyVDAIMGzh0kMqwLs8W9qTLnE5pHso0QwnlkCXBior
	Sg6Rt6U0aOjUGEp1BDabGYbI8wxbesz+WCzlIpZKU17XWpuGImt6u7tTMnlplKTOgMCO
	RnEUfZAkXi04dJJyR4smy57iYD6v/kblg/KlESQTQ4Pb2Cn5Wu0ZkdFFFSIL9/C0cxZJ
	xir7q9i/y0n3wn8JlgZUHcFc8lUmDTdi9lO28ewxff3Y38mS0q0/qvFOl1NT2BUspUKV
	+tz4bzPM4Tdrc6fD8ZIAhgmQ8ANf3xGEEFKmDpjyp8G7yyFLi3GLs6lP17OaKpjQ/mVt
	UrAA==
X-Gm-Message-State: APjAAAXs/zGhkMYevZMgMgnmvSYxk+tDi0c3CWFi3ZHz6MRJWGaNwrnq
	0HKF1+lNTQcYWXSd8YjHeLBqEZcOroagE5iGVJU=
X-Google-Smtp-Source: APXvYqwkWe2ZQCN+YeQnHv3cJBc/zDk8SyrCOpPNYlMj56paZ0XoKqw2lafwTPDJ1omLCoxKqJ5Zcs6Tx+5O5MEjP20=
X-Received: by 2002:ac8:5257:: with SMTP id y23mr1806657qtn.88.1578721205146; 
	Fri, 10 Jan 2020 21:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20200110100454.20554-1-costamagnagianfranco@yahoo.it>
	<38a434af9cccb7b724f1a4f2f97bf9425e695786.camel@intel.com>
	<CAMKF1sqkXhJvs_ajfA606_9BX8=_jFLu8t+GSxR1smO5eCy+nA@mail.gmail.com>
In-Reply-To: <CAMKF1sqkXhJvs_ajfA606_9BX8=_jFLu8t+GSxR1smO5eCy+nA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Jan 2020 21:39:39 -0800
Message-ID: <CAMKF1sqVthwUzzDNPyOr+pxCzLB+mMJRdY9Qe3O2mE8TvBkfzQ@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "locutusofborg@debian.org" <locutusofborg@debian.org>,
	"costamagna.gianfranco@gmail.com" <costamagna.gianfranco@gmail.com>,
	"costamagnagianfranco@yahoo.it" <costamagnagianfranco@yahoo.it>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] websocketpp: also install examples in a new -examples subpackage
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
X-List-Received-Date: Sat, 11 Jan 2020 05:40:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 10, 2020 at 9:38 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Jan 10, 2020 at 6:20 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:
> >
> > On Fri, 2020-01-10 at 11:04 +0100, Gianfranco Costamagna wrote:
> > > +do_install_append() {
> > > +     install -d ${D}${docdir}/${PN}
> > > +     cp -R ${S}/examples ${D}${docdir}/${PN}
> >
> > I think these should be BPN instead of PN so this works with multilib.
>
> right. Since I have merged this patch, perhaps a new patch addressing
> this would be good.

I never mind, this patch was replaced with v2 eventually so its addressed.

