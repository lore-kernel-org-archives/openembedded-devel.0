Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id A0F4C7E506
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 18:36:04 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id 5so26950966qtz.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 10:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s2JPxYQuIzikHKIn7hwLdysGZBMuzD2kU1LY58LtCKs=;
	b=s5F4Z7Rqu0IyZ8amF44kJrgRGgv8pp78ltV/ARAM1mdTf5kw9SHKNOj8lqmJg7CC2b
	D542TWiZkhQBVG2+jJ8/NmK18xXpPF18TXfJ+UfpBgfpbOMvf9vy0ziphSU7i+1M9Wwe
	SR/g90bEDF5e0A3Y97I2e/XilDLrpTMqohk+xAe6PrQmfcRpwJPas0bJE9Fesn7pU2Ct
	N/6LXmWeB0w75qUA2BHPkH/gEsCcG06vgNl1EexhXl3SgzBA6PMcqVsDh5B/S4eYU7eT
	AVBQC2AOqzGAq6tQkF2F8R/uB61VqA8jD+Mw1f43RTKUlxuIDDb9JNphaOY4d23gxwvc
	6k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s2JPxYQuIzikHKIn7hwLdysGZBMuzD2kU1LY58LtCKs=;
	b=iNMHDFlKl43vFhJMtwO+OU1+0VmPuG9CStpeudfcAA7mfVyDEJ4Drz6tqpFdUmTCD1
	r/EXLU+zwEOksE0pI1rSR3pzdwWMKH+YX5FgFks6o+K8ZPSZ5/5KS97FD/85mOE5z4Ki
	kn9NxO9DqcraPx1Ds/3rojWdkmYY0ebOvCbiTEYp1I3nTkWhSK25+ztvjY9ERfSw8s68
	7NmY5ISWHnxlyIWhKArOBeZ9nMCMcFmB5e1uHPWxLprhxuPl6EFfUfNMsym1EqRdUoZ9
	PTzY2zaEl916qUa+OPsx9FbLfU6oUO6cpyUAAOwvyU+iNrG1pmsu0oFrt9sqALkSWa/0
	2yjw==
X-Gm-Message-State: APjAAAUj+d5tH5MTdirmMVC/hArpzeA1oZ/Js8X0/bDlWTeLH9e3vJg5
	1ICoZaR1N9hRlcFvvq2AK16QtCopLu7sVmXEl4Y=
X-Google-Smtp-Source: APXvYqxT5iQvm+fHsMZWPL7aLLFiv3yEzWtNCf2vM1GjtVxBt3uk9lR6YEPeKtaEi1/32v5gKbpd3k2CFaaChnx/w1w=
X-Received: by 2002:ac8:145:: with SMTP id f5mr41786985qtg.194.1577558164232; 
	Sat, 28 Dec 2019 10:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
	<20191227213120.3930-9-schnitzeltony@gmail.com>
	<CAMKF1srAOXoEzu=0i0yyM8dZn3rLt4B1d-_9FRPTTEfexDZDqw@mail.gmail.com>
	<CALbNGRTeSi6X-osFwzjm1y8fj46Bmsmayemdscn8-f=+=-srqQ@mail.gmail.com>
	<CAMKF1srcYxzH3J960mj8ggfQoZOyj=aO=ky9QjSTpNrEW5Asiw@mail.gmail.com>
	<CALbNGRR7mdJT8fbnB5AONcRtPmxVn_v+bw7Jz6S-aKfPsO6D3g@mail.gmail.com>
In-Reply-To: <CALbNGRR7mdJT8fbnB5AONcRtPmxVn_v+bw7Jz6S-aKfPsO6D3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Dec 2019 10:35:37 -0800
Message-ID: <CAMKF1soU+iahbZASB1kxvF1f=8e7FSDfHVP+geeM5fg5TjchjQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 09/23] evolution-data-server: upgrade 3.34.1 -> 3.34.2
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
X-List-Received-Date: Sat, 28 Dec 2019 18:36:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2019 at 3:29 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Sat, Dec 28, 2019 at 4:22 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Dec 27, 2019 at 3:48 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > On Sat, Dec 28, 2019 at 12:19 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > > I think version specific information should be in bb file not inc
> > > we have a native build and it just builds some tools required. Both
> > > native/target share same version which is set in
> > > evolution-data-server.inc. So maybe I missed something but what kind
> > > of change do you suggest?
> > >
> >
> > hmm if it shares with native/nativesdk that might be fine
> > why dont we use bbclassextend for the native version ?
> >
> * Native and target recipes do not share much in common (see
> evolution-data-server.inc): As said: Native recipe just builds few
> necessary tools with a set of dependencies reduced to minimum.
> * Most pieces would require a specific entry
> (DEPENDS/do_configure/do_compile/do_install/RDEPENDS) for native and
> target. Since target recipe is already more complex than most recipes,
> extending to native would confuse more and cause recipe less readable.
> * There is no nativesdk yet. If someone needs it: extending target
> recipe should do.
> * This discussion is unrelated to this patch - right?
>

yes

> Andreas

