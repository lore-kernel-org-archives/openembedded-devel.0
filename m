Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 315107F2F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 13:48:13 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z23so64250709ote.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2019 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VGgLMiAhYlmxYLZx9kVuZDLqFY2zvlIDf9DeOoRv0/4=;
	b=KSR6uzSkxL4Hm31AZXzjGwisHm7wFa5I5LqoOScAaZzOYweJeU4oyAy/wK9y9xyIWe
	5FyazNX0dlZbMsauVctFWIErtGwqQFvu2QbxexPej5qchiyIOXKf7DDVm/WCnxDvQ+Nb
	Rbs4IedShvbhn/GxuG4XnJS4Mw8i5gmvJHJojpaoYDyBZs41UC5jI1G87urxFft8UrdF
	CRRMtp9QWooN9NOo3FnArNk6mjEV7DaY8DOySk5xqKoYt7R6EwnRvTfhxW9MxrNsKhWM
	rE2/hTbRnt5JMBVH75OgvUpMSKlfl0o9Wnoy7JKxWHl64V1NWprNBca9AEd7Z2L+54TK
	2uiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VGgLMiAhYlmxYLZx9kVuZDLqFY2zvlIDf9DeOoRv0/4=;
	b=I9kHtUNbTpPkjXL7DQd4HyIYd9w0RVzVzd8CRokQoXMs0tZRgGbvsksPDcRMOVr7Ce
	zhoxjQKE6KtAtjIPBGN/6KoCKpvNMajx3lfF965FJjM39YJwo2mHlBGvHzsk8FZsmmiN
	FhsxE0IF66ndc8JibuCfVVKuk+ffuVNvoPsEr1wekkgL0lj1WnT0WpFJ1IUJ+O526gTq
	msQUzXwdr0XL3j4MBd97kBEvNDE6QZe5T67k1HmmD2+UFAZuPXSrooP0DA5OpvCEvP8E
	iMwwcPU8eJeBXO4qE70R7APafyEovYkk2bf/RQvljJa+Sd5eLK3T8qFbrvQ/LhcVXi4m
	wLeQ==
X-Gm-Message-State: APjAAAXbZDb3BH9soFuebbZxdk4XjlwSm2pSwi023a0SMrz7iAlZ8Nsu
	jHe8w8RunSAZTOhUAhCXnciBv7HCJowITeadWc8=
X-Google-Smtp-Source: APXvYqw4viaY1CjybOV5ToO41v++vvs/XMMPpIjfqHJbQo7BgsJQ1LJjQcnK2klZMi2XVeD7kZ28AiDVUos/sZwaN1Q=
X-Received: by 2002:a6b:6505:: with SMTP id z5mr3623544iob.295.1565099294932; 
	Tue, 06 Aug 2019 06:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <1564038304-372775-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4NafYpQLV2VgTgb4BajL=-KH1gQLU2_rk3ur7b3aqOjSA@mail.gmail.com>
	<CAMKF1sqi9aRud1UQQCFsOakEQ1qKbfRhBSKFeEbwPxQChh45_A@mail.gmail.com>
	<5D3ABBD8.2050107@windriver.com>
	<0263423f4903ea25247352460c6a906b@agner.ch>
In-Reply-To: <0263423f4903ea25247352460c6a906b@agner.ch>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 6 Aug 2019 14:48:03 +0100
Message-ID: <CAO5Uq5R=bCUcr83yvZwd54Ya61wmxsO9rZ2zztRXfz2VyzQyhg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	liu.ming50@gmail.com
Subject: Re: [meta-filesystems][PATCH] ostree: import from meta-overc
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
X-List-Received-Date: Tue, 06 Aug 2019 13:48:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2019 at 2:26 PM Stefan Agner <stefan@agner.ch> wrote:
>
> On 2019-07-26 10:37, Yu, Mingli wrote:
> > On 2019=E5=B9=B407=E6=9C=8825=E6=97=A5 21:58, Khem Raj wrote:
> >> On Thu, Jul 25, 2019 at 6:42 AM Bruce Ashfield <bruce.ashfield@gmail.c=
om> wrote:
> >>>
> >>> On Thu, Jul 25, 2019 at 3:05 AM <mingli.yu@windriver.com> wrote:
> >>>>
> >>>> From: Mingli Yu <Mingli.Yu@windriver.com>
> >>>
> >>> This doesn't make any sense to "import from meta-overc". meta-overc,
> >>> was never the authoritative upstream for ostree. That layer has to
> >>> carry a specific version to meet the requirements of some of the
> >>> container libraries, etc, that it requires.
> >>>
> >>> You need to have a look at the latest ostree, the various layers that
> >>> are currently maintaining it, and pick the right version if you want
> >>> to consolidate things here. I'm very doubtful that the right choice i=
s
> >>> the one from meta-overc.
> >>
> >> Yes agreed and this version fails on musl e.g.
> >
> > Make sense, please ignore this patch.
>
> What layers are you considering?
>
> We use OSTree integration of meta-updater and would welcome having a
> common upstream implementation which works for everyone:
>
> https://github.com/advancedtelematic/meta-updater
>

My current one is here:

https://github.com/akiernan/meta-ostree-core/tree/master/recipes-ostree/ost=
ree

Which started off in life from the Intel IoT refkit.

And the sidebranch folks have one here:

https://github.com/sidebranch/meta-ostree/tree/sumo/recipes-ostree/ostree

Getting just a common ostree recipe in meta-oe(?) would be good.

--
Alex Kiernan

