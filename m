Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 74C4B6BF37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 17:04:04 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id o49so13742379qta.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zwXrY1sQtckfELXgbZitdFz6qpYzPIY9/CsieNNi5qg=;
	b=IJpoF9LJaCev3R9PD8M15pO3fLVzaN2DiN6Ke5iOASSIkm4sN4AbEYrj2U/0jHmmEw
	at4nHfGVU+JQV+8pacqaxQfIo0yYfxejuwrerbvvODWgJQwvNpWVIcOwdgBCGweMhdMJ
	+FFozsSlEjdqNi2FTWoKvS4keiJplibxC7AHx2h09r8BQ87GB7FFg89UfyW0hCBrtjYu
	P8ZjUuhg5WDMMjMj7y3g1DDtOi9jgLUnCmr+GrkD+GKzbXe34aQ74RCGXTzmnX654QgR
	HO+c3+iIMXIIt4yof7wgb/G2QHtfqEHQvQ5GunO7zi8Uo+5z1hz12o6BuYZ9Bdf9jgu6
	Aq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zwXrY1sQtckfELXgbZitdFz6qpYzPIY9/CsieNNi5qg=;
	b=pk6YjvZDA3HxdZaAwsAfqYTevsBIvXQ8s7v+ge83ZtDrcnnlhG7cJehN7sU+EMyolb
	vwU+AxMjNYaTgKYHrqvqOMnLXTVqdeNPE4JhS/ZvuEjoN9xx8jCUzLgg53wKkkcsGt6j
	WPqqvM2xYVryZ2tfZby1+JX0idWu+M9Frmu7eQaCKYOIHOBramaCed0TJc3WYqVtGzcc
	lFFf5XydBC3CxnDnUpe2jUnI4biVdXqI0CqocY529DAkGFk4G/dUJKIwOtqZr5oHQaoe
	tBC3tZqO2oUXmPbyQSZZvKpD4LG7kS9syQaUEsoBPBwOkVSHQ2dFARdNCmJB8+7Tu0Ay
	etpw==
X-Gm-Message-State: APjAAAWsTHGm58metFmsuSJrTpNPrkeGVrUomBb9Eg4iP/aW2qyG5rpv
	mtTRgjoMPFT3bKumM4YwG7RnKT/pR6/t6PAeNd0=
X-Google-Smtp-Source: APXvYqzMtnjHykftCuHHJq+5hK/IDjiTc2ckYdGbZ5lcMj8mdkIrjDrjk6Z+PRudA/JJ4ghwu9jhA/0rltg+rJ4Vzms=
X-Received: by 2002:ac8:2476:: with SMTP id d51mr318810qtd.378.1572627844940; 
	Fri, 01 Nov 2019 10:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
	<20191029010253.5784-4-schnitzeltony@gmail.com>
	<CAMKF1srqmOG5k8mfAZ04YH0DUUROSLUCVLwMGUrRQ-=Y2yeFsg@mail.gmail.com>
	<CALbNGRQn151mjXniXnS+Edi79VMomdaUiP9-hbzzMo30dAwCog@mail.gmail.com>
In-Reply-To: <CALbNGRQn151mjXniXnS+Edi79VMomdaUiP9-hbzzMo30dAwCog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Nov 2019 10:03:38 -0700
Message-ID: <CAMKF1sq-2rVXqmYeVNTqjaB7DsKFJr9+u095P826_N3E2RhNMw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] ibus: initial add 1.5.21
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
X-List-Received-Date: Fri, 01 Nov 2019 17:04:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2019 at 9:53 AM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Fri, Nov 1, 2019 at 5:34 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Hi Andreas
> >
> > I see this fail on ubuntu 18.04 host
> > https://errors.yoctoproject.org/Errors/Details/275175/
> See what I can do - is it a server 'only' installation?
>

thats right. Its minimal server install + OE prerequisites

> Andreas

