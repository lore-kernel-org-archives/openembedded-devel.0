Return-Path: <andre.draszik@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7E274C1A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 08:23:28 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id p3-v6so17924101itc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 01:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=DPOF8IM6wLFVU59LW1cnkUoCD6g/CoUgWKSJYuXz4II=;
	b=C249BOfG4e5P+zfk8mOKyOh7h7R9A9ZBHIZWBfQkFuOoQlr5PR4xnm0APPiLwnkRAy
	yQq2iZ3egv6jolRWOWdo+lAR+5f81+gZAtho3CIxPqT9uufazh1YvuNkda0wc2XLZ8vQ
	vJhQZ+n7Y4ns6p/TkTwVeBuQYT+P0z7S6u5JFJ5uAngXoCjXncWWCdHspEk3Ob90jOvz
	q36NP/Wo5LHyex4vtaijUwkTBEwP9Xalgdw89KbzI8h0d05FxczqaXft/MzMzZPwSZFJ
	mRhMtuCFcFvus2xNwAlZtDtTLXa+wV+clvhpMcgGqsoEiD9WJ7nxplHXCczvk+QTn3OC
	XUag==
X-Gm-Message-State: ALKqPwfz+8mENGTZ4IiOSsD5tNL9zUDNyMaawmcoMMoCIpcbPo/xILjw
	CA3vVG/jOqypC3CqrsDpcTwdOZzeI6I=
X-Google-Smtp-Source: AB8JxZpgr55TNyuW5H4MViBHNTSxv4WJOHqIPdOjZ6a3IIqg/6cxcbjcE6HrX/0sjrhyWP6oVyQGEw==
X-Received: by 2002:a24:e56:: with SMTP id 83-v6mr13111659ite.16.1526804609677;
	Sun, 20 May 2018 01:23:29 -0700 (PDT)
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com.
	[209.85.223.175]) by smtp.gmail.com with ESMTPSA id
	m31-v6sm6599574iti.30.2018.05.20.01.23.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 01:23:29 -0700 (PDT)
Received: by mail-io0-f175.google.com with SMTP id f21-v6so10982112iob.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 May 2018 01:23:28 -0700 (PDT)
X-Received: by 2002:a6b:998d:: with SMTP id
	b135-v6mr18549892ioe.122.1526804608830; 
	Sun, 20 May 2018 01:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
	<CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
	<CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
	<CAJ86T=Xxw__E-+8Zf0PZnOAe1SeMB2ayMZZu-Gb=19ckh8=TtQ@mail.gmail.com>
	<CAHUNapQ0Ywt2-xtp0==FozFhsPSnbBTEDReckkE1TVaxdtCn3g@mail.gmail.com>
	<3f41b911-4fde-1ed1-76f7-650dab5dbb20@gmail.com>
	<c7fbbf37e1ff4631a0aa3b45c07544a9@XBOX02.axis.com>
	<CAHUNapR44Bg55=N60PC1-qKKMjag4eVD7a_YoO3b-CDrJm5XOg@mail.gmail.com>
In-Reply-To: <CAHUNapR44Bg55=N60PC1-qKKMjag4eVD7a_YoO3b-CDrJm5XOg@mail.gmail.com>
From: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Date: Sun, 20 May 2018 09:23:17 +0100
X-Gmail-Original-Message-ID: <CAKUP++sxkcjj_pnp24f0fx2-V8Dv-qXgri=8SOPcOs-sb-OrKg@mail.gmail.com>
Message-ID: <CAKUP++sxkcjj_pnp24f0fx2-V8Dv-qXgri=8SOPcOs-sb-OrKg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sun, 20 May 2018 08:23:29 -0000
Content-Type: text/plain; charset="UTF-8"

meta-openembedded has oe-stylize.py, which is helpful for arranging things
in the preferred order.

Cheers,
A.

On Sat, 19 May 2018, 20:35 Trevor Woerner, <twoerner@gmail.com> wrote:

> On Sat, May 19, 2018 at 7:59 AM, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
> > If you do, I think you should spin the patches for the clean ups as well.
> > At least I agree with (most) of them, and on a whole they definitely
> > improve the recipes.
> >
> > And I also agree with Andre, that in general it is too much trouble to
> > generate clean up patches in their own, which is why it might be better
> > to allow some clean ups together with actual changes. Otherwise they will
> > not happen, which in the long run deteriorate the overall state of the
> > recipes.
> >
>
> I'm happy to slowly go through the recipes and make formatting changes.
> What is the accepted canonical order of variables and segments in a recipe
> file? Oh, and did we agree on tabs, or spaces?
>
> /me ducks...
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

