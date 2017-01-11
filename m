Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 03FEE71A31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:42:45 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id dh1so10347951wjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mzRSbGif8wuo8jHkUjxVVQdKmw7Vo66eNjwL/oiO7Kk=;
	b=b7hIPGB22CkQI+GvtM3ptcsBaaDYy5psgL32HjoAnANaDAWTeUJhuAp5vy6id5NuSE
	dgUVjXAr3zUAXxVFNY7BrcbSZKwEhGHAbfc5BWEnZKgwa+tJFh1/TzXRseOoKpZ5Ljo/
	nOhvwoqFQBRoEPiBtFFuQhaavgfqUWrzZTvGdjfvOh2WvTN9EZAdnqIkrR2oK0RAAite
	4tyS+fDi8ivommwAWjkNBg/BQdtRRmHPY4fh5xIAlFTs14fernUWeUtwsxn6l9/xJkYt
	/hD/nO4khApGs0bV65jAg0p71RfvpDyOoZMFUWn1d/xkJWLCu2eVi3AdLV6VTppSgbIf
	FV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mzRSbGif8wuo8jHkUjxVVQdKmw7Vo66eNjwL/oiO7Kk=;
	b=cFEvzbjCoAXx//9zcP/t3qLA4LdMEpmx2nnIFvBF3tzD/BzNsRY6LMloEm6xX11YT+
	s2tMFWb85aq7/HjspYJs2ZpOFYpLZ8ssp36OrBJUOtk1+qQDUjZmYqgTMWkIVLY2ooTs
	DpxpyrJWko8+vMg2aIino4lFD1icoPzViycIUuiIeYxzfXSppzqtj1uhj4rhwZMHwpvT
	utixB52orpu+gMn+g4ldw/Qh9BQHab1xhSfJtk5oafUYf2QXmOiBtw5CKZuOAv5DsD/Z
	gA81YGg6U4+bBEWHvFVMPVUT0iKCFgfxS73NTxT8DhOLeckJFwr38FNwpab4SEO9HKfo
	lGQg==
X-Gm-Message-State: AIkVDXK9DIcFbFhZP9PIcw/PyW/btrqgf73lWeuNAij+h2DYxZB8CRU6FcrvtrvjD9b0YAm5stb+NtzaWKio9w==
X-Received: by 10.194.77.83 with SMTP id q19mr4958912wjw.186.1484138565570;
	Wed, 11 Jan 2017 04:42:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 11 Jan 2017 04:42:45 -0800 (PST)
In-Reply-To: <CALbNGRT-f-yFag_OQhK9Ra_FqEL4PHBGgV7JGtrs5y_REqbETQ@mail.gmail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
	<CALbNGRT2CMU03HQzC3-_J7UXR5U_RzkmHNROHyrC3kG2RZxOjw@mail.gmail.com>
	<CAAPZna2vG6pz3_jC=3PSswpBTb4zAaZZRpF9ooKGE-OSioxLEg@mail.gmail.com>
	<CALbNGRQ96mC8=tCLXpauUoDbz9zpD=cvztkaCiezta03V865Sw@mail.gmail.com>
	<949c3c51-85ac-75b8-9a13-61176d7a43c2@linux.intel.com>
	<CALbNGRT-f-yFag_OQhK9Ra_FqEL4PHBGgV7JGtrs5y_REqbETQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Jan 2017 13:42:45 +0100
Message-ID: <CA+chaQebbXGgSc81--LcB0gif+wc_3JP3On_jWtDpvj40W1=VA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 11 Jan 2017 12:42:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

He could be using more strict PATCHTOOL or the patch got mangled by
patchwork/git-am.

Can you upload your changes to some branch for Fabio to compare with what
he applied from patchwork?

On Wed, Jan 11, 2017 at 1:35 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Wed, Jan 11, 2017 at 1:31 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > On 01/11/2017 02:22 PM, Andreas M=C3=BCller wrote:
> >
> >> As far as I can remember there was an announcement by Alexander
> >> Kanavin to change patching to more restrictive mode so that the full
> >> three lines before/after change must match. Will redo patch creation
> >> based on firefox 45.6..
> >
> >
> > This hasn't yet happened. First we need to fix a ton of oe-core recipes=
,
> and
> > we also need to add the capability for automatic patch rebasing to
> devtool
> > (because this change will break recipes across all layers, and we need =
to
> > make it easy for people to update patches).
> >
> > Alex
> Thanks for this information. Unfortunately this leaves me out of ideas
> why the patch does not apply for Fabio...
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

