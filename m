Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nk1LM-0001xS-HK
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 21:26:59 +0100
Received: by pwi5 with SMTP id 5so3910773pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 12:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=SdUF8p5pRmgTjGm5E2aeUTv9YKwqTgYIssUynhFnZHU=;
	b=eEz7+7k/JMhOoAEUDUWpX7zyMkOVCP9Qw6hbM7XixD8/pIRJKIiJwHJjJWV/DXcFs4
	mIHpXNsTIUqhxL0pZ3I9IL0royENAT0RMCwT6nH/OQ1rYlb2Z/dNX6XtnloGbCe7iPj9
	4jD8av0vJ8bE0Sa8/TJFGiEvgLg6ct7XdpvH0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=lLgzB5MINVXX00TchJBVHnPxedos1xhuxgRTLhXzDRHlpEwTGMtv5SgdN3yw+G2/M7
	niOJXk9MG2UDDPzzjbsAZgu7SfgB+6c9Ebk7B5hNHqhHmrNu2QuIoA0l+OSAjlIg9Obp
	0BXnhoIptBOX29G3xo28Cqfa3US9sAn7jbHjc=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.6.13 with SMTP id 13mr1605002wff.39.1266956650162; Tue, 23 
	Feb 2010 12:24:10 -0800 (PST)
In-Reply-To: <1266956079.18176.61.camel@trini-m4400>
References: <1266951776.18176.47.camel@trini-m4400>
	<19c1b8a91002231151g6fbe4a1ck97668729e5cc69d6@mail.gmail.com> 
	<1266956079.18176.61.camel@trini-m4400>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Feb 2010 13:23:50 -0700
X-Google-Sender-Auth: cb8e0d1beab06360
Message-ID: <b6ebd0a51002231223x524dbb06o86b5e9c8b5129668@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Fix busybox SUID support
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
X-List-Received-Date: Tue, 23 Feb 2010 20:27:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 23, 2010 at 1:14 PM, Tom Rini <tom_rini@mentor.com> wrote:

> On Tue, 2010-02-23 at 11:51 -0800, Khem Raj wrote:
> > On Tue, Feb 23, 2010 at 11:02 AM, Tom Rini <tom_rini@mentor.com> wrote:
> > > I was about to just push this and I noticed that a number of
> > > distributions (SlugOS, Angstrom, Kaelios, micro) currently set
> > > FEATURE_SUID=y, but it's not actually install SUID.  And since I recall
> > > some way-back-when's of "busybox SUID is dangerous / crap!", I thought
> > > it best to post the patch first and let folks speak up / ask me to drop
> > > FEATURE_SUID=y when I do this.  So, here's the patch:
> > >
> > > diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> > > index 5f52850..b165d0f 100644
> > > --- a/recipes/busybox/busybox.inc
> > > +++ b/recipes/busybox/busybox.inc
> > > @@ -11,7 +11,7 @@ LICENSE = "GPL"
> > >  SECTION = "base"
> > >  PRIORITY = "required"
> > >
> > > -INC_PR = "r24"
> > > +INC_PR = "r25"
> > >
> > >  SRC_URI = "\
> > >   file://busybox-cron \
> > > @@ -96,7 +96,11 @@ do_install () {
> > >        # Install /bin/busybox, and the /bin/sh link so the postinst
> script
> > >        # can run. Let update-alternatives handle the rest.
> > >        install -d ${D}${base_bindir}
> > > -       install -m 0755 ${S}/busybox ${D}${base_bindir}
> > > +       if grep -q "CONFIG_FEATURE_SUID=y" ${WORKDIR}/defconfig; then
> >
> > may be you should grep it in ${S}/.config because thats what defconfig
> > turns into finally
> > and used by busybox build.
>
> I'd be fine doing a follow-up to clean them all up, but today
> busybox.inc does all of its checks to ${WORKDIR}/defconfig.
>
> > > +               install -m 4755 ${S}/busybox ${D}${base_bindir}
> >
> > what does 4755 translate to ? (curiosity)
>
> 4 is suid (2 is sgid, 1 is i forget the name but what you stick on /tmp
> & such).


Sticky :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

