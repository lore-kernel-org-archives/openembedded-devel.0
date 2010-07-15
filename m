Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OZVMa-0002Da-9W
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 22:49:04 +0200
Received: by bwz10 with SMTP id 10so957442bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 13:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=lMe4RjjTo8gVF8JlGsLFMZ0E88qm5UX+dLhFIIg1R9o=;
	b=A+1+XltYvzowQDqgP5nEwPZoVW5BOI8vOwGIhEuw2dT43PjK0AtZqqDpXIZ92iUwwh
	2Hv3nlg4KzQEjEt61EC9Ucxwmzf3AmkZZZioMYdq0eaq5ybBOjhlaXI692F+Dg9QY4Pr
	Poe8ShyBgJ4oUpVQfKI+18WXA+dEWs81xMqiM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SpD2aE829uN7pQm65mni3ZqiNdpj0EB1PGdwCbsed/UDU3YCSe4xbps2m3ZYsomHEF
	Kmuw8gW6m61d7fwyM4+kmrwdVB+1ZR5OQIIPUalF7QfQIodBsABUmy2sEDmzLtQGyBO7
	otNVlwLCySGmHt6IPVuuEmgXMyxb/hHLhD6rQ=
MIME-Version: 1.0
Received: by 10.204.81.85 with SMTP id w21mr161644bkk.92.1279226936911; Thu, 
	15 Jul 2010 13:48:56 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Thu, 15 Jul 2010 13:48:56 -0700 (PDT)
In-Reply-To: <AANLkTilGJjsqfz2zu4m3m5vQ99jCX44CrtFUSiRTpkE9@mail.gmail.com>
References: <AANLkTimMVcS5I1GcVuqa1eTwZ4YIqb0NaJMqd1nepQYv@mail.gmail.com>
	<AANLkTilGJjsqfz2zu4m3m5vQ99jCX44CrtFUSiRTpkE9@mail.gmail.com>
Date: Thu, 15 Jul 2010 22:48:56 +0200
Message-ID: <AANLkTimVsbb_n5f_znE8kBtWfvADCAj_kDn-vEiIm2vK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC} cleanup glibc
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
X-List-Received-Date: Thu, 15 Jul 2010 20:49:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/1 Khem Raj <raj.khem@gmail.com>

> On Wed, Jun 30, 2010 at 1:02 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > Triggered by a short discussion on irc with woglinde, I would like to
> > suggest the following cleanup actions for glibc.
> >
> > 1. rewrite the recipes so they do not use patches in the dir of
> > another version. Better copy those. That makes clearer who uses what,
> > and avoids problems if a recipe is removed.
> > (btw if people are against having copies, I suggest to put common
> > patches in a dir whose name actually resembles it is for multiple
> > versions e.g. glibc-2.4-2.5 or so)
> > 2. remove some old recipes that are not pinned. Reason for removing
> > them is that it reduces the amount of work needed for step 1
> >
> > currently we have:
> >
> > glibc-initial_2.10.1.bb
> > glibc-initial_2.2.5.bb
> > glibc-initial_2.3.2+cvs20040726.bb
> > glibc-initial_2.3.2.bb
> > glibc-initial_2.3.6.bb
> > glibc-initial_2.4.bb
> > glibc-initial_2.5.bb
> > glibc-initial_2.6.1.bb
> > glibc-initial_2.7.bb
> > glibc-initial_2.9.bb
> > glibc-initial_cvs.bb
> > glibc_2.10.1.bb
> > glibc_2.2.5.bb
> > glibc_2.3.2+cvs20040726.bb
> > glibc_2.3.2.bb
> > glibc_2.3.3+cvs20041128.bb
> > glibc_2.3.3+cvs20050221.bb
> > glibc_2.3.3+cvs20050420.bb
> > glibc_2.3.3.bb
> > glibc_2.3.5+cvs20050627.bb
> > glibc_2.3.6.bb
> > glibc_2.4.bb
> > glibc_2.5.bb
> > glibc_2.6.1.bb
> > glibc_2.7.bb
> > glibc_2.9.bb
> > glibc_cvs.bb
> >
> > suggestion is to remove the following versions because no one uses
> > them: (verified by grepping for them in conf/distro (with -r)
> >
> > glibc-initial_2.3.2+cvs20040726.bb
> > glibc-initial_2.3.6.bb
> > glibc-initial_2.4.bb
> > glibc-initial_2.7.bb
> > glibc_2.3.2+cvs20040726.bb
> > glibc_2.3.3+cvs20041128.bb
> > glibc_2.3.3+cvs20050221.bb
> > glibc_2.3.3+cvs20050420.bb
> > glibc_2.3.6.bb
> > glibc_2.4.bb
> > glibc_2.7.bb
> >
> > I think the following are also obsolete, but I would like to get
> > advise for these
> > glibc-initial_cvs.bb
> > glibc_cvs.bb
>
> yes they could be converted into _git
>
> >
> > What do people think about this?
>
> good plan. I think we should work towards reducing
> the recipes for some packages before they become
> unmanagable
>
> I have submitted patches for 2.5, 2.9 and 2.10.1 to become self-contained
(and not use packages from glibc_2.4).
Furthermore I have submitted a patch to remove the versions mentioned above.

If these are accepted and I hear no objections I will also rework the other
recipes so they are self contained (and remove the files dir)

Enjoy! Frans

