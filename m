Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id BCDD07E101
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 21:29:11 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id m140so5380793itg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 14:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uMCRIqaBsOi9YIn5l41og+wMZCTQmzgwrn6RJUzDigw=;
	b=Wov1NTSdfiIFFkfqcMVZXQ/sLvmu8FfJjACCZH0dFN2D+1OvRJg/z2j00UQcCk8LaX
	rVZPBFkY3uGvHVO4hichKr4FjnPmsRCUY0xHlAmaMI3M7xcFImlstkyhhZ9MOB5CGTXh
	xo6c1yA0l05LoeQt0CnRFDet5O3SKSw0eTUxF3qGMTq2GWiLjJr3tM+UK7v1co0DJQrS
	Bkne6OEIUG+46f4dvZiC2C+Km4YZQ4iNmhzVvXAAzn+u1WhQQbLM8W0cIeTbitJ53cim
	CX6eAC7iAG+H0iKDBfEbTb3myDa7nCDqm2jcYE3FveJSzWNTMLRoWKUTE4+yXd7Vx7pv
	gK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uMCRIqaBsOi9YIn5l41og+wMZCTQmzgwrn6RJUzDigw=;
	b=LXUEwZS68hel6GjuGaTI3AGL5TAn+7JL8BZ72rjsX/J5qrnh2XxeFD88ZdPMyK0zDD
	vQ12NhoW0Fh/cntBY+E5NJrKK/gPsOfjxZ7PPexsZRD/RSO03ynyFD3/t5ipZTLTG9zX
	lHMRhe+iOSSaYxGTfpIC4ahQeqp9JI1mvzmS9ZcAdeMetl7t53Lygpv7OjMkP4vVAdlf
	bT30WXsT5J6HTqDcEQk/iZSlPDjXgjZOv2+lHu7nbPnFF2KeQbCzmSR5vKwyn+USJgHM
	HSFS3bNlHRZn0bW85WRdRd6HSHfqi5jVUB9yw2wNGu2V8Nwp4OqManf4JvlaF0rbMP+6
	iC6w==
X-Gm-Message-State: APjAAAVcxRn5ITAAaYx6b0JlgRWMvd/K6mCHHrFL0Qj3skwTPs4Sx971
	VQR6plNXegrDt3Hjnn2aCpsTcgxOyPBAGjA+Nxo=
X-Google-Smtp-Source: APXvYqwuhXhi99nHSAWwHZOvlEHQ+Ego3uNikEtBD2A3kNkAzlZ2l4iHWQ55t36AbZRRVg0xPnaNF028pZGYOCs7R54=
X-Received: by 2002:a24:f:: with SMTP id 15mr9995815ita.163.1558560552802;
	Wed, 22 May 2019 14:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <155854019588.26288.10003174813774515795@git.openembedded.org>
	<20190522154956.6750B23534D@git.openembedded.org>
	<CALbNGRS52_LUD8pDuE-cXt5PK8Pqf-TZbFyQdcgGxQanZNx3vg@mail.gmail.com>
	<CAMKF1sqMxN5ic=X8n5yVPct_8DmUCPDCoKxmy9kMVbvYdBQWGg@mail.gmail.com>
In-Reply-To: <CAMKF1sqMxN5ic=X8n5yVPct_8DmUCPDCoKxmy9kMVbvYdBQWGg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 22 May 2019 23:29:01 +0200
Message-ID: <CALbNGRR97eVuCgmrn06eSB6BM3tGHhaNDzMnTtbLAGd+HQMdtQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [meta-openembedded] 02/09: mozjs: Upgrade to version 60.x
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
X-List-Received-Date: Wed, 22 May 2019 21:29:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2019 at 10:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, May 22, 2019 at 12:06 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > On Wed, May 22, 2019 at 5:50 PM <git@git.openembedded.org> wrote:
> > >
> > > This is an automated email from the git hooks/post-receive script.
> > >
> > > khem pushed a commit to branch master-next
> > > in repository meta-openembedded.
> > >
> > > commit 8587370567e7f2f398ae1efa77989b1110d15a77
> > > Author: Khem Raj <raj.khem@gmail.com>
> > > AuthorDate: Tue May 21 23:27:16 2019 -0700
> > >
> > >     mozjs: Upgrade to version 60.x
> > >
> > Haven't found this on mailing list so:
> >
> > I ve done similar here and I saw that
> >
> > * musl patch can go (tested)
> > * polkit needs update - current version requires mozjs 52.x (shall I
> > send the patch I have already?)
> >
>
> Please do. I am currently trying to upgrade polkit to 0.116 which
> should work with
> spidermonkey 60.x so if you have patches please send, I would be happy
> to give them a shot.
>
That might take till weekend: am sitting on 60+ patches not quite
ready for the wild. So I have to rebase (and test).

Ahh  - and after staring python2 crusade accidentally: If you give me
a bit more time I would create a patch to move mozjs build to python3.
Found a patch which is a good base to steel from.

Andreas

