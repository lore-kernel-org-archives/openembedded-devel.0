Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RFgsp-0003Yr-Kj
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 08:41:12 +0200
Received: by vcbf1 with SMTP id f1so2413321vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2011 23:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=KFR5/GiqXr9GthNp0rHvQ1QVn0+fpfN3Mpht4b8vnk4=;
	b=ayGye9b/LTmSRpK4LL05R+miJllUGD/S9zl9IfKmGIMB6yQj8igHkOzbpjNgcQxTqV
	FZi5+6JwlGWqFEvf7BoaeIFPjl6OSxnaGDbOxkv63nrfVWsCPE8HHo3d7IlvvNOjtA7e
	eN5nwuEXslP2cVHza/1hFkRq+WeIKTv+PtZlM=
MIME-Version: 1.0
Received: by 10.52.6.132 with SMTP id b4mr18801078vda.39.1318833322564; Sun,
	16 Oct 2011 23:35:22 -0700 (PDT)
Received: by 10.52.186.162 with HTTP; Sun, 16 Oct 2011 23:35:22 -0700 (PDT)
In-Reply-To: <CAMKF1sqEQtqCMi+p6yEArDWpiGGS2Du1ca34ROtkFAzdc-X3MA@mail.gmail.com>
References: <20111015185155.DA982101FE@opal>
	<CAAQYJAvm1mGo6sswMBPx+tgQfZapTqX4E1SXSsZKU25D-u1eDA@mail.gmail.com>
	<CAMKF1sqEQtqCMi+p6yEArDWpiGGS2Du1ca34ROtkFAzdc-X3MA@mail.gmail.com>
Date: Mon, 17 Oct 2011 08:35:22 +0200
Message-ID: <CACW_hTYw8eSDh6z_Q+v6aK9CoF-9D5Ba0+fp4beuLuA9oi7NAw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-commits] Khem Raj : binutils-cross: Sync with oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Oct 2011 06:41:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/10/17 Khem Raj <raj.khem@gmail.com>

> On Sun, Oct 16, 2011 at 2:37 PM, Andrea Adami <andrea.adami@gmail.com>
> wrote:
> > On Sat, Oct 15, 2011 at 8:51 PM, <git@git.openembedded.org> wrote:
> >
> >> Module: meta-openembedded.git
> >> Branch: master
> >> Commit: 92b02b7209e426a70cc5626e7bdbc82052e01ac5
> >> URL:
> >>
> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=92b02b7209e426a70cc5626e7bdbc82052e01ac5
> >>
> >> Author: Khem Raj <raj.khem@gmail.com>
> >> Date:   Sun Oct 16 01:28:32 2011 +0000
> >>
> >> binutils-cross: Sync with oe-core
> >>
> >> Now we have own copy of binutils-cross in meta-oe
> >>
> >
> > I can't unfortunately find the discussion which supposedly provided a
> valid
> > reason for binutils-2.20 in meta-oe while binutils-2.21 is in oe-core.
> > I'm against that kind of policy for meta-oe, particularly when it's about
> > toolchain.
>
> oe-core is deprecating versions that are still used by consumers of
> meta-oe (mainly angstrom 2010 release)
> since its toolchain and it will also benefit derivatives of angstrom.
> Angstrom could also move these elements
> into meta-angstrom if we think that its only angstrom specific and no
> other consumers of oe-core needs them
> layer maintainers make judgement call which they think should benefit
> wider community
>
> similar but not for binutils here is a relevant thread
>

I feel if a distro or bsp needs a version of a package that is older than
the oe-core one, it should be stored in the distro or bsp layer.
Or is meta-oe also wanting to keep binutils 18.50? In oe classic this is
used by the nios2 hw (and afaik there is no newer binutils supporting
nios2)? I'd say if some layer needs older versions it is up to them.

What we are lacking here is a policy on purpose/goal of meta-oe and what
goes in (and what not).

Frans

