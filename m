Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id E97B077337
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 22:02:40 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id v77so19181113wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 14:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qXZrogKcNnGD+PQMWwTn8iyn2dpefRi7vM8BKZbptyo=;
	b=VuEVl48LdsIzjZGTBjkuhNfVotSFbUmCOYQroc4v4hMlgyMamE3lAPEuYRJiyNnlXI
	ougpG7w2XYN/Fqxts41o3GbCeosLAqoYExyXKCWBAHENUjriADASJg003HbiBbge1dP4
	rfFoWopr190vuZI/SN2Fa0eQJaKooJ6gJT0NIzNuuZk+al5xLuM6hZAzRWWBVq49Lyk5
	6+DzAi3wi+T3Q4nDS9Kve6ozxgvvV/J9chSxPi5YWYzWAhdfkVZna/v1oZHTeEgQPFYC
	nqN3pUkOhP5fTtXg3NQWpzNpvWXjdTB3uER2tfE4kdHyOsCgzOCpTEUw50zS/U/Pqp0L
	nxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qXZrogKcNnGD+PQMWwTn8iyn2dpefRi7vM8BKZbptyo=;
	b=gqyYytyKVabEszb/b83P6DluvHmN9LcrKWKOmhZRFBwgrtoGxY44KfyFipc5asXpzv
	8FEOdPwMQk5fuatmbXgoTboGXzr0Y+gZepOLsFHizMBNsyEyy48nCfD+bGbX3X8Ihe4H
	X6wPrzYJwP2Bq//2REH4H7Z1n6DBu0aQnTTK4wNAldUfMFMEK69IiX93NQ+Cgfj90Xca
	xaD1MVn4ji/kvXFvDF8tJvHmLodSQcA9rm+1W9ZEhCB1bZgjTOF4Y2N3q4GksdWYfsCj
	/DDkUJ7fW0Tx177GP4hpA0cBIwapxf2tH9CgiM4zvOKHXM+MNaE9Ygz3jKo4zHCLs1bX
	SdYw==
X-Gm-Message-State: AMke39lOPWrkyT0YV7Ker+VrPIxiDLLhApl/BECAftY1mx+AWtqeONzipeorz6UdIJdIr77NAh/UgZVsgHATaA==
X-Received: by 10.28.211.205 with SMTP id k196mr5616494wmg.124.1487368960173; 
	Fri, 17 Feb 2017 14:02:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 17 Feb 2017 14:02:39 -0800 (PST)
In-Reply-To: <CALbNGRTd+UJdyorVKAMi=FBccmjb0YyXPvZpZwVnWfYiurH7YQ@mail.gmail.com>
References: <20170206200039.32123-1-schnitzeltony@googlemail.com>
	<CALbNGRTd+UJdyorVKAMi=FBccmjb0YyXPvZpZwVnWfYiurH7YQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Feb 2017 23:02:39 +0100
Message-ID: <CA+chaQcpaCeBRzOdz9YHafiz4ry5cvKbe+Hf+L1PODDhGaafkg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] libtdb: fix SRC_URI - http has gone
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
X-List-Received-Date: Fri, 17 Feb 2017 22:02:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It's not lost, at least not completely, it waits in master-next for Joe to
merge it, because it's for meta-networking.

Maybe Joe missed it because he scans for [meta-networking] and your patches
are missing that in subject (I've noticed that you also often if not always
don't use [meta-oe] or [meta-xfce] which usually doesn't cause me troubles
to notice your patches, because I sort them all on patchwork, but it's
easier to miss for Joe.

Adding Joe to CC.

On Fri, Feb 17, 2017 at 9:37 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Mon, Feb 6, 2017 at 9:00 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ---
> >  meta-networking/recipes-support/libtdb/libtdb_1.3.12.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> ping - seems this series got lost - shall I resend?
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

