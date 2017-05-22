Return-Path: <ticotimo@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id E1AD477E82
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 14:29:30 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id p24so82297698ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 07:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lPnwFOKUeO6irRZYdE3LGyeaQv+OM6leywgc+TulVSc=;
	b=iCcIwkSCUvEGIe/Ft73QKXv3vbLISkzSSJp6Uex2qblcK9fOTIIoCh43EPiHFYJYMu
	hY/Z/hwnBvZiM0DDJnYJSAav8YdA2R1EVi19HOAa5Xd+gfKZ7cdFjDW1H599d/qfYdlB
	bIu30yewUAiIKh3v4p9CqvRUkLKmHSirCdYH2dS5LvgFsgQ8hTm1gpJRGgnFQgVc1Db+
	QyOeE0SGaMCpQh/vbr8RIyHWpRlcLi1XNs/IzzOiq722AqkABkSNYQoGSzQCDRoD1/ak
	Da8Njpr2i66FmF4aDfDGXLCnO091xo7b9OLSBVud6T5ejrb1dUpfEavzybmrzwRSSLqN
	f00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lPnwFOKUeO6irRZYdE3LGyeaQv+OM6leywgc+TulVSc=;
	b=KDAznXm++vR5AXq4qv0gWUjPrZF+hdUJGcsLFlYHFCldOBlpJg2wQsfSzMqfMWiWBu
	QfWLt981Fq+SIvJTr6ZQaXgOgO6XpHTYz61rPsFc1AWecaXADzzsK0EXwBtNJtroNSSP
	i1zb38Bmsn+g9C7XKym+j+X2e3PdF+UhIKSFL2kZL4KAu1feK6GG/s3WSOI8cHwZMfQJ
	YjRvV5fUOW5sf3O51Jehgp9272AtB6A1XaqkAzQrqiuTCC40fwualG8oAfdEh+vCIiOY
	1A1g0KbtBmu9xpLURACtpxoo3CsH1MUkQv5ahwFHs2UVRtowI3o/cYq6Nsf/TvT3iTci
	s3pQ==
X-Gm-Message-State: AODbwcDa1Em9mPbRs3ysysRQuXHG4QPz2DgHxzmT3Q2ezZn+8rdnghTx
	DtJh7L7lwme9HNwMeT2i+uZ86Jx3dQ==
X-Received: by 10.107.55.134 with SMTP id e128mr20795819ioa.55.1495463371763; 
	Mon, 22 May 2017 07:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <6b90bfd5-3dd1-572c-9a63-2f9399737824@ubiant.com>
	<CAHUNapRhwKpbR0nXyre4nV+fPgC6XR3QFNq4DhtfSO0zzRv7=Q@mail.gmail.com>
	<122c5ac1-7191-17f6-0f88-0a9b4fea64ba@ubiant.com>
In-Reply-To: <122c5ac1-7191-17f6-0f88-0a9b4fea64ba@ubiant.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 22 May 2017 14:29:20 +0000
Message-ID: <CANx9H-CbvQnPCuRYXXYxOrJrtg7C-AVDA9COYuFJFAwR5LFqwA@mail.gmail.com>
To: Romain Bazile <romain.bazile@ubiant.com>,
	Trevor Woerner <twoerner@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] rxtx fails to build because of upstream website dead
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
X-List-Received-Date: Mon, 22 May 2017 14:29:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just tried and upstream was available. Maybe it was just down for
maintenance?
On Mon, May 22, 2017 at 12:23 AM Romain Bazile <romain.bazile@ubiant.com>
wrote:

> The source package is about 1.5MB big, so that's not really heavy.
>
>
> But I perfectly understand the rationale behind it, which was my fear.
>
>
> I didn't know about the source mirror. This would make perfect sense,
> since this is the exact thing we in fact are looking for (having the
> sources in the layer is only a fix).
>
> How does that work to get the source mirrored here?
>
> I supposed there would need to be some changes to the recipe too?
>
> Romain Bazile
>
> Le 20/05/2017 =C3=A0 17:21, Trevor Woerner a =C3=A9crit :
> > On Fri, May 19, 2017 at 11:07 AM, Romain Bazile
> > <romain.bazile@ubiant.com> wrote:
> >> Due to the chronic instability of this website, would it make sense to
> >> include the source file directly into the meta-java layer as a zip fil=
e?
> > My guess is the project would not be happy about a large zip file in a
> > git repository. If a patch becomes too big, or if a recipe needs too
> > many patches, the general consensus is to create a repository with the
> > patches and keep the metadata small. On the other hand, exceptions
> > abound.
> >
> >> I don't know about best practices surrounding this, I kindly apologize
> if
> >> it's strictly forbidden! Otherwise, I'm happy to submit a PR including
> the
> >> file and the necessary changes to the recipes (in concerned branches).
> > The yoctoproject maintains a source mirror, the best bet is to ask
> > that the sources be mirrored there. The recipe will probably be
> > expected to stay as-is, and the yocto backup used if/when the primary
> > is down.
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

