Received: from mail-qy0-f178.google.com ([209.85.221.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Np7m5-0004xf-JH
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 23:19:42 +0100
Received: by qyk8 with SMTP id 8so5531791qyk.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Mar 2010 14:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=xOQTxOS0QNHDA4Tg+kWKSSed+Vf9VMP0Uj08Y2vMbBI=;
	b=HqgVOlJ/akJ3cfPiiVAvEW0Y5Nz3tkQUbYU7PjBh5S+6WwwQ6KgZcgrjlSJrKLo5xb
	RC4dIy9ql/gwrSL1gF9I/G9ZarqrMOxcy8FtgNMX3RBwgEIGuBr616k7rJSK4zIRgKtf
	urGIb2AC+pmFjswK2rA1Wyxxistw/AaRhUfeM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=sGOCE8BF3p9Ws87uZHwp/0qeUhomt17u951VbSIvxD6kxaU539y1QKRjry11pifCes
	dafE6WO6oeuuVtqCPD/hSUwcm0sBAiXwJuHG5SQmnFlxw/9CSwzFPXvfPHNYJYBIZjWN
	jDYmL+E0XfwHV3h2g8t6j16lkWnE+3amH0Aao=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.250.68 with SMTP id mn4mr496074qcb.38.1268173000158; Tue, 
	09 Mar 2010 14:16:40 -0800 (PST)
In-Reply-To: <20100309210513.GB19931@denix.org>
References: <1268134848.32439.12.camel@hydra>
	<1268165249.16526.156.camel@trini-m4400> 
	<20100309210513.GB19931@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 9 Mar 2010 15:16:20 -0700
X-Google-Sender-Auth: e264e8c0d8c9578b
Message-ID: <b6ebd0a51003091416w3903818cuaf49560f0119eec@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.178
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Issue with (gcc-cross-|glibc-)initial and packaged staging
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
X-List-Received-Date: Tue, 09 Mar 2010 22:19:42 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 9, 2010 at 2:05 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Tue, Mar 09, 2010 at 01:07:29PM -0700, Tom Rini wrote:
> > On Tue, 2010-03-09 at 11:40 +0000, Thomas Horsten wrote:
> > > I've spotted a rather annoying interim build failure but I'm not sure
> > > how to best tackle the situation.
> > >
> > > For example, gcc-cross-initial and gcc-cross install some of the same
> > > files in staging. Normally this doesn't matter, since gcc-cross
> > > overwrites the earlier ones installed by -initial, but when using
> > > packaged staging and many threads (BBTHREADS=10 for example), it
> > > sometimes happens that the pstaging packages for gcc-cross-initial and
> > > gcc-cross get installed into staging in the wrong order (or at the same
> > > time in two different threads), resulting in all builds after that
> > > failing due to undefined references in the lib files from -initial.
> >
> > So, my guess is that what happens is that when we copy the stamps from
> > the pstage package over to the live stamps directory to check them,
> > another thread comes along and sees they're in and we get out of order.
> > Can you try something like (pastebin'd to avoid patchwork doing
> > something silly):
> > http://pastebin.com/rCijESQ8
> >
> > This is possibly not ideal, but as I comment there, grab the lock for
> > staging before we copy stamps in (and release it if there's problems).
> > But this should fix the problem, yes?  If gcc-cross-initial thread is
> > going and the gcc-cross thread fires, it'll be stuck waiting for
> > gcc-initial to finish up fully.
>
> As I've previously seen and complained on IRC about a similar issue with
> many
> BB threads failing in packaged staging, but for different packages, I would
> like to try this patch as well. BTW, looking into the patch it is funny
> that I
> also tried to fix it by using SYSROOT_LOCK, but I don't think I was doing
> it
> properly. I'll see if Tom's patch fixes it...


Tom's patch looks like a good idea to me, to ensure the area of code where
the stamps don't match the staging contents is protected.  Note that when
the stamp policy is full or whitelist, this issue does not occur, since the
setscene's of dependent recipes are run prior to the setscene of the recipe
which depends upon them.  I could see an argument for that occurring
regardless of the stamp policy, but this'll do.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

