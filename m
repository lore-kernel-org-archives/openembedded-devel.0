Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1Pnbq2-0003cT-M1
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 20:05:58 +0100
Received: by fxm17 with SMTP id 17so1735506fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 11:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=koLzrxjhonoSq3mfjJoO/cuxHxwrmME/6i1bw1x+GSE=;
	b=PkNHSaOu3PofQ8PKvs2ii8BljflCIRiPS4t6gTCgByBHrLPjzQTXCkzPgihYvAGFkz
	KSWRExJ9RXnb57vfaYeTzzq0qRoNGdbiZcHgC4c4evtPrCcCFQ0rYpohlw3CSSxBEtwi
	RHIh8giZmBE4OG6dvvfDKICtnmwJaF0BJXQsg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=Qw+Vg9srzb2obCTtcSbAYVwDblyBPQrS+Zv8Yvo/iXWXp+o2MgGcGphh8G26/rvE7M
	+izZb7D+M9XWWaMXEydzXlV7NSlVQO8vw6qU0ognnNVzHD2zHCgwh6JtJi4+nSHcl3a2
	4bZ2erNx8gvG2EEF08BdPuDLxR7L/s2Xs78Fk=
Received: by 10.223.72.12 with SMTP id k12mr16560435faj.114.1297364693810;
	Thu, 10 Feb 2011 11:04:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.114.73 with HTTP; Thu, 10 Feb 2011 11:04:33 -0800 (PST)
In-Reply-To: <AANLkTikmVwN3h-3vatTGdWr-AmgqQho0ao1UvRjUguPt@mail.gmail.com>
References: <1297187904-19841-1-git-send-email-coolaj86@gmail.com>
	<4D52EEA1.6040503@mentor.com> <iius8b$ke3$1@dough.gmane.org>
	<4D52FC34.9020401@mentor.com>
	<AANLkTikmVwN3h-3vatTGdWr-AmgqQho0ao1UvRjUguPt@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 10 Feb 2011 12:04:33 -0700
Message-ID: <AANLkTi=D_Rqe5qdd4oVobBkcEp_FVWtBKHXASow_krKb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v4] nodejs: updated recipe to v0.2.6
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
X-List-Received-Date: Thu, 10 Feb 2011 19:05:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Oops... hold on.

Forgive me, but it does not compile. I mixed up a hyphen and underscore in
this commit.

I'll resubmit in a few minutes...

AJ ONeal

On Wed, Feb 9, 2011 at 6:37 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Feb 9, 2011 at 12:42 PM, Tom Rini <tom_rini@mentor.com> wrote:
> > On 02/09/2011 01:08 PM, Koen Kooi wrote:
> >>
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA1
> >>
> >> On 09-02-11 20:44, Tom Rini wrote:
> >>>
> >>> On 02/08/2011 10:58 AM, AJ ONeal wrote:
> >>>>
> >>>> * added version number to patches
> >>>> * libev-cross-cc_0.2.6.patch - turns off execution so that
> >>>> cross-compile succeeds
> >>>> * node-cross-cc_0.2.6.patch - enables cross-compiling of v8 for x86,
> >>>> x86_64, arm, and mips
> >>>
> >>> I didn't touch it in patchwork but (and I see these aren't all new
> >>> issues):
> >>>
> >>>> diff --git a/recipes/nodejs/nodejs_0.2.6.bb
> >>>> b/recipes/nodejs/nodejs_0.2.6.bb
> >>>> new file mode 100644
> >>>> index 0000000..560adc6
> >>>> --- /dev/null
> >>>> +++ b/recipes/nodejs/nodejs_0.2.6.bb
> >>>> @@ -0,0 +1,32 @@
> >>>> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> >>>> +HOMEPAGE = "http://nodejs.org"
> >>>> +LICENSE = "MIT"
> >>>> +
> >>>> +DEPENDS = "openssl"
> >>>> +
> >>>> +SRC_URI = " \
> >>>> +  http://nodejs.org/dist/node-v${PV}.tar.gz \
> >>>> +  file://libev-cross-cc-v${PV}.patch \
> >>>> +  file://node-cross-cc-v${PV}.patch \
> >>>> +"
> >>>> +SRC_URI[md5sum] = "b1c50ceb43bee1b221be210b7bc7a216"
> >>>> +SRC_URI[sha256sum] =
> >>>> "e97fe9c81ff4b569ae9a0d46e64a0572a1f171293573a5b5290bcc3996a19701"
> >>>> +
> >>>> +S = "${WORKDIR}/node-v${PV}"
> >>>> +
> >>>> +# v8 errors out if you have set CCACHE
> >>>> +CCACHE = ""
> >>>> +
> >>>> +do_configure () {
> >>>> +  ./configure --prefix=${prefix} --without-snapshot
> >>>> +}
> >>>
> >>> Why isn't this just EXTRA_OECONF = "--without-snapshot" and using the
> >>> default do_configure, compile and install?
> >>
> >> It's one of those python abominations that try to look like autotools :(
> >> And as usual, it has even more bugs than autotools when you try to
> >> crosscompile
> >
> > Retch.  So, unless someone pops up within the next 24h and says why they
> did
> > something in patchwork or otherwise objects, I'll push this.  Thanks!
> >
>
> This patch has addressed the review comments. So please go ahead.
> However this should be versioned for clarity if a patch is resent
>
> > --
> > Tom Rini
> > Mentor Graphics Corporation
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

