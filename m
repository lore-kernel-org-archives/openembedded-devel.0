Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 3803E607A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 21:28:04 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161123212742170_0484
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 21:27:42 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [174.118.92.171] (port=37560 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c9f4q-0005u9-H1 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2016 16:27:36 -0500
Date: Wed, 23 Nov 2016 16:26:30 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <5E80B6DC-66EC-499B-84D0-41A5D4F1A1BC@gmail.com>
Message-ID: <alpine.LFD.2.20.1611231624420.18557@localhost.localdomain>
References: <alpine.LFD.2.20.1611231326510.15876@localhost.localdomain>
	<5E80B6DC-66EC-499B-84D0-41A5D4F1A1BC@gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: Re: mozjs/unhandled signal 11/64k page patch/__powerpc64__ ???
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
X-List-Received-Date: Wed, 23 Nov 2016 21:28:06 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Nov 2016, Khem Raj wrote:

> can you reproduce it on version 24 as well ?

  not sure what you mean ... this is running on a qemuppc image. i
haven't tried running this on fedora 24 itself. what exactly do you
want me to try?

> > On Nov 23, 2016, at 10:34 AM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> >
> >
> >  i know nothing about this issue, i'm asking on behalf of a colleague
> > who has allegedly tracked down a bug in wind river linux, and
> > comparing sources, it *appears* the very same thing would happen in
> > OE.
> >
> >  the symptom running "poweroff" in a qemuppc session;
> >
> > ... snip ...
> > polkitd[680]: unhandled signal 11 at 00000000 nip 0fa69198 lr 0fa69174code 30001
> > ... snip ...
> >
> > further investigation shows the very same thing happening with:
> >
> > # systemctl start httpd
> > polkitd[680]: unhandled signal 11 at 00000000 nip 0fa69198 lr 0fa69174code 30001
> > Error getting authority: Error initializing authority: Error calling
> > StartServiceByName for org.freedesktop.PolicyKit1: Timeout was reached
> > (g-io-error-quark, 24)
> > Failed to start httpd.service: Connection timed out
> > #
> >
> >  to make a long story short, said colleague followed bug reports and
> > ended up here:
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=1289432
> >
> > eventually, he got the problem to go away by tweaking the patch
> > "0005-aarch64-64k-page.patch" for mozjs with the following adjustment:
> >
> > @@ -113,7 +113,7 @@ struct Cell
> > #if defined(SOLARIS) && (defined(__sparc) || defined(__sparcv9))
> > const size_t PageShift = 13;
> > const size_t ArenaShift = PageShift;
> > -#elif defined(__powerpc__)
> > +#elif defined(__powerpc__) || defined(__aarch64__)
> >               ^^^^^^^^^^^ change that to __powerpc64__
> > const size_t PageShift = 16;
> > const size_t ArenaShift = 12;
> > #else
> >
> >  as my colleague reads it, the original patch above is necessary for
> > PPC64, but *breaks* PPC32. i haven't followed the logic, but does any
> > of this make sense? by making that change, the error went away and
> > things work fine.
> >
> >  thoughts?


