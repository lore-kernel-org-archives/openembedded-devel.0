Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id AAA3475228
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 18:47:48 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id n4-v6so11365091uad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 11:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9iyzVIZ+9IzojdQhM9f3a9/ODcw2wNgWmPEW+DKWonk=;
	b=scaeEAIR0b9faerHF0bXUps8Ds19MenNtv4AZlLitULeVBDSIT8ALy5+DJu1jgKnGk
	Dvx5pijBcE9WlqZQ37Wn0qvITVlc2ClxkfA0R0fKS8Y8sbN4MR0hTHk94zxowGPgSQNi
	20YYMNKjRmjBOd5mkUk7daOK1jyyemKpbTtV2DMuz58GN6J030aCws2KGsBW4biZYEwq
	/b1xqvWqG139M8x9QE4qN/aueME5mUkJrM/1owApPTwDxxQLErfd5XpZlD7JushtmFI+
	ntJWaLoOInSROUCU2fj7pnGFJX53k68BgZ+1amwSrVA1B++D0zSEqRuvhXy1XjC2OfU7
	iWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9iyzVIZ+9IzojdQhM9f3a9/ODcw2wNgWmPEW+DKWonk=;
	b=R0BQE7SuUhkAHVSSG9UOB0bHGVlh5pZJH+/05eGl4QmBFabSglPUv4XQNldQnqr5uX
	iBY1/zyGiZykug8ay1biRsbxv5yJ5FBeWJovEQ05ilCEmi7pHX0sw8xBmaHdPPyKtpW8
	XxGRB1OYShqReXHcTDqDHBV/yklgJ9iY52jJh5MJ8UWH0HcYrLhX7fkKGh+blP9AePCE
	PIliY26iRRSy7mrZ2lAzxadY+nTqxSHOLUfYQrhGhdwfoDkA/hCDcbKFpLPmdq/EknbJ
	YN5MVmCwFwwmjSfXY2+a/egxBfTB7BI1nGbDyVx2IVxPVn/5jPRLyMJgGq8SLXWt/UA3
	jN6g==
X-Gm-Message-State: APt69E3gXnH3saLdOMKlESC/kmZF7MIo3cOfo/aU6+PV01+wDGUY1q3L
	8M+MZ6JeA1zwC2t+OwP5/51yUbjTB46gHK2lt5E=
X-Google-Smtp-Source: ADUXVKKL/l9y8+ik/q4VEgIWyQo51ww7i3fsX6erxuxfT64rqvnOK9/lPcP6Tg5lXpwjyPO+grKGF3RkioCP1E7Vqe4=
X-Received: by 2002:ab0:50f0:: with SMTP id
	d45-v6mr8448384uaa.45.1529347669425; 
	Mon, 18 Jun 2018 11:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<CAPuovELwUxFTuowgPwN_oBJGMNxxY6XK9QNmgYygyJ6yKdQQgg@mail.gmail.com>
	<CAPuovE+dZu=VX3n_rU6zRQjXnu=XnPpZpQOwPHu6qb7BhWDKJw@mail.gmail.com>
	<CAMKF1srMCX6u3TC2Ybi_aj4w7WLDW-AuVVhKptF+kzJz=P=6JQ@mail.gmail.com>
	<c41dc3e4-7ded-f47c-5120-321dd66e9334@windriver.com>
	<CAMKF1soijupp06kVYOurZv428nNmEYo8WpkuP04m_oxV2CnGow@mail.gmail.com>
	<CAPuovEJx-ghUsXH0NFR8Vc1DJL8AyHXJAbL38oqkrtqbQiAOTw@mail.gmail.com>
In-Reply-To: <CAPuovEJx-ghUsXH0NFR8Vc1DJL8AyHXJAbL38oqkrtqbQiAOTw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jun 2018 11:47:33 -0700
Message-ID: <CAMKF1spbkMcboLaBfw0bv_bf_v5_d=qDHB3ag7pCEL1E5Ni3sA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 18:47:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 18, 2018 at 11:09 AM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Mon, Jun 18, 2018 at 1:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Mon, Jun 18, 2018 at 10:54 AM Mark Hatle <mark.hatle@windriver.com> wrote:
> >>
> >> On 6/18/18 12:50 PM, Khem Raj wrote:
> >> > Hi Mark
> >> >
> >> > It seems your distro is not inheriting it globally. Here I have
> >> > INHERIT_DISTRO ?=  "debian devshell sstate license remove-libtool"
> >>
> >> So is remove-libtool a recipe or a distro option?
> >>
> >> I'm asking because doing this half-way is causing a lot of confusion.
> >>
> >> If it's a distro option, then the recipes should work without it being set.  If
> >> it's a recipe option, then the recipes that need it should use it.
> >>
> >> Right now it doesn't seem to be working with these recipes because they don't
> >> package the .la files UNLESS it's enabled.  So the fix is either to package them
> >> (by default) or inherit the remove-libtool.
> >>
> >
> > since we make it as part of meta/conf/distro/defaultsetup.conf
> > its a default policy,  its perfectly fine for a distro to disregard that
> > however, then you fall into a non-default case. I am willing to accept
> > per recipe patches but I would recommend to consider it as a distro
> > feature for your distro.
> >
>
> Andreas,
>
> Can you revert your "various classes recipes: Remove FILES entries for
> dbg/dev packages" then? If this is a distro feature then these recipes
> need to build without the QA issue and without the remove-libtool
> distro feature being set.

This is in default features so I would not recommend revert, distros
not using this feature are in best position to fix it, as I said
before those patches are acceptable.

