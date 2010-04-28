Received: from mail-qy0-f195.google.com ([209.85.221.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O7H7A-0000KI-D4
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 01:56:25 +0200
Received: by qyk33 with SMTP id 33so2598509qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Apr 2010 16:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=3f3hnuhWoEkrVLLPuIjbagY0k9eSsbf9VT4oQdogoyo=;
	b=r2hfTglgepBQ0A2rzghhOOFxZilCvZqc006bpd23kTaIMbdoP0fiYWop4eABl8/Cp7
	fTR1Mw18swF6+MEyGXkjcaQ1QBsn69NmqWYSPV2jiiuP77+yCr0ivEmVMVGROm1is+hr
	w8ZILl3Xbp0wZX01KFjMEfJj4Wa8Rg5xZGj+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=PEbuDAPcdV/00hWNlbH3bRs9Ok0iwabSMydhkd+HhN+kvWnLzCbkFVxW2JAbZAFj75
	4Z48we050ySNCK1EXfCn2i7GOlenxSNAXsFEQMk9C+pkQCMIJOxjrMVMAKoRROhJusIh
	vp4WTndlWOu60RBkJ1hc6+f58EZnqrbKHg7Mk=
Received: by 10.229.248.137 with SMTP id mg9mr10527979qcb.33.1272498762526; 
	Wed, 28 Apr 2010 16:52:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.188.213 with HTTP; Wed, 28 Apr 2010 16:52:21 -0700 (PDT)
In-Reply-To: <1272491340.3865.806.camel@trini-m4400>
References: <4BD5BE2F.7030407@mwester.net>
	<1272491340.3865.806.camel@trini-m4400>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 28 Apr 2010 16:52:21 -0700
X-Google-Sender-Auth: 757d8f3607461ff3
Message-ID: <z2jb6ebd0a51004281652pc34c3e99zb1b54788fd5213d3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.195
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Fix: stage hidden files as well
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
X-List-Received-Date: Wed, 28 Apr 2010 23:56:25 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 28, 2010 at 2:49 PM, Tom Rini <tom_rini@mentor.com> wrote:

> On Mon, 2010-04-26 at 11:24 -0500, Mike Westerhof wrote:
> > The following patch is a proposed patch to fix the problem where hidden
> > files are sometimes missed during staging.  A specific example is that
> > the symbolic link ".config" is not copied to the kernel staging area,
> > which causes madwifi-ng to fail to build.
> >
> > diff --git a/classes/staging.bbclass b/classes/staging.bbclass
> > index 32038a5..cb19cb9 100644
> > --- a/classes/staging.bbclass
> > +++ b/classes/staging.bbclass
> > @@ -35,6 +35,13 @@ sysroot_stage_dir() {
> >         if [ -d "$src" ]; then
> >                 mkdir -p "$dest"
> >                 cp -fpPR "$src"/* "$dest"
> > +               # Get hidden files as well, but carefully
> > +               for i in "$src"/.*
> > +               do
> > +                       if [ "$i" != "$src"/. -a "$i" != "$src"/.. ];
> then
> > +                              cp -fpPR "$i" "$dest"
> > +                       fi
> > +               done
> >         fi
> >  }
> >
> > If anyone has a better way to address the copy operations above, that
> > would be great.
>
> So, I said this on IRC, but more formally, how about just for i in
> "$src"/.??* do as this lets us know we don't have '.' or '..', and if we
> skip out on '.a' or something being installed, that reeks of a bug in
> the program in question that should be fixed anyways (and would
> catch .config and others).


Alternatively, could for i in "$src".[a-zA-Z]*, I doubt we care about
dotfiles starting with a number.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

