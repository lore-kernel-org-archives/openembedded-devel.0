Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MWeAf-00043T-8A
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Jul 2009 00:32:21 +0200
Received: by qw-out-1920.google.com with SMTP id 4so928188qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2009 15:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=eXmj7w7KT/d0R0TjEqHuXzf2rqa+8Ux2ZFQoznlUfxs=;
	b=ECb5W6u30XgMYHxyp64D47glixvH/NTZYQ2NdJZImPkV8wAWBTRSEm71RopAtLucTe
	PAocSjZizarhWKpjXL8VlpMSMNM5DDDE/sla1R5B5/7R2eyb3PcWUw8VUsPsxWYO/GLH
	mD3UDa+LHGZMUyV22Z0T9bdOdtXAcJtJg4ge0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=Zwl7U6GvQtz299c3k8wbHXxqapwk7cRJVucECCnURBS3KyLnagMQdI8b3Z8BbSESoh
	pqMCUrl7VJ7zvIJsZ4ywXthLXCljwBwMrwcn65VwH2HhodXwdoZUJBBkJpBYTCNCRgJv
	c4HzzFuMQLwRBS4UaVoVwYvayDxAOehcNCNaM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.220.95.5 with SMTP id b5mr2304541vcn.22.1248992238125; Thu, 30 
	Jul 2009 15:17:18 -0700 (PDT)
In-Reply-To: <1248989671.3629.1358.camel@conroy-linux>
References: <1248989671.3629.1358.camel@conroy-linux>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 30 Jul 2009 15:16:58 -0700
X-Google-Sender-Auth: 0f6906d65b1302a6
Message-ID: <b6ebd0a50907301516i2ba54f1cif687e5b76f675862@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Packaged-staging and RPATH with native/cross/sdk
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
X-List-Received-Date: Thu, 30 Jul 2009 22:32:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I've been using a $ORIGIN rpath in my builds, and it's definitely a
step in the right direction.  Iirc there are a few quirks with things
like perl modules and such, but you can work around those.

There are a lot of relocation issues with stuff we stage that need to
be fixed one by one to use those particular staging packages with tmp
in a different location, though.  Sadly, few upstream packages are
really relocatable.  Some of it can be worked around by exporting env
vars.. for example, you can point 'file' at its data with an env var,
and you can override nearly all the paths used in autoconf/automake
via env vars (the autotools branch i started work on does that).

On Thu, Jul 30, 2009 at 2:34 PM, Chris
Conroy<Chris.Conroy@hillcrestlabs.com> wrote:
> I'm trying to use packaged-staging to set up a sane prebuilt toolchain
> environment to share with other developers. I view packaged-staging as a
> promising route of creating a "Stage 3" version of OE (to use some
> Gentoo parlance). While building the toolchain isn't all that painful,
> even on a decent system it can add 1-2 hours to the build process, and
> every individual developer needs to redo the toolchain and base
> libraries for every feature branch. This is all needlessly wasted time
> since they're all ultimately building the same things if on the same
> arch.
>
> Packaged-staging seems to give me everything we need in order to
> accomplish this except for the way RPATH is handled. This is a known
> issue which is worked around in packaged-staging with the following
> snippet:
>
> =C2=A0 =C2=A0# These classes encode staging paths into the binary data so=
 can
> only be
> =C2=A0 =C2=A0# reused if the path doesn't change/
> =C2=A0 =C2=A0if bb.data.inherits_class('native', d) or
> bb.data.inherits_class('cross', d) or bb.data.inherits_class('sdk', d):
> =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D bb.data.getVar('PSTAGE_PKGPATH', d, 1=
)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D path + bb.data.getVar('TMPDIR', d, 1)=
.replace('/', '-')
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('PSTAGE_PKGPATH', path, d)
>
>
> I'm currently toying with changing the references to rpath in
> bitbake.conf to use $ORIGIN rather than an absolute path, but perhaps
> some of you have better ideas. (I have a feeling this is going to run
> into some nasty edge cases).
>
> (The other, less elegant idea I am toying with is: modify the
> packaged-staging install to hotfix the binary data to point at the new
> install location, but this seems uglier and possibly harder to
> implement)
>
> If this special case is taken away, then distributions can much more
> easily share a prebuilt toolchain and set of system libraries for
> potential developers or with a team. It also gives us some other nice
> properties (e.g. you want to relocate your OE directory because your
> disk is filling up, but you don't want to have to do a full rebuild)
>
>
> Thoughts, suggestions, reasons this won't ever possibly work?
>
> --Chris Conroy
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


