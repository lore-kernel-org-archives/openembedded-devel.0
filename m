Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1ObwMZ-0001XC-I4
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 16:03:19 +0200
Received: by ywe9 with SMTP id 9so1036873ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=MplwLWX0Zs61KxhdFS9dWqMGa0PlvBBhR3cv5R2UzwM=;
	b=hniI4jDGT0rcXYSoFQ4kKPbe6kL/L6X8JL12Y4BtmhffvpbSOWK2vBw6fThntHSVAh
	9hPb2XA1LR9VoYsfilqfeKuOq44R1ibULEYS6S3+nDUSLwIIg8M3IJysts2n+3T4pTLo
	GGywK49Zqa3nNlQZnskjJ5lzjVOSZThVvNmqA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=aAGE4GgzeguyaPjhncQvg/WaOVwpOjsZrX2myT+IKTr8XZKB/Bte3Fn0tIaL3zTQxQ
	sJLa3MZV7luzYLQ4gsXLIJ7LJSj4TJNlxC22V0FoMztGvHPZQcSczgvA60LQ4TJ4QCvz
	YnoC5xDQa3fhQNAYz5EM6bHsP6Q8F7avjYeLI=
Received: by 10.224.104.153 with SMTP id p25mr1303400qao.98.1279807366851; 
	Thu, 22 Jul 2010 07:02:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.212.11 with HTTP; Thu, 22 Jul 2010 07:02:26 -0700 (PDT)
In-Reply-To: <1279787277.22581.1723.camel@rex>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com> 
	<1279787277.22581.1723.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 22 Jul 2010 07:02:26 -0700
X-Google-Sender-Auth: 1V8QYFswt8deKDZzT6vu_6hzfUw
Message-ID: <AANLkTint4kG2YG64KWLiVvgikkoE0jw1U0BmNsz36txU@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages 	into native sysroot
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
X-List-Received-Date: Thu, 22 Jul 2010 14:03:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 22, 2010 at 1:27 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Wed, 2010-07-21 at 11:04 -0700, Khem Raj wrote:
> > The following 4 patches are based on  Jushua's work in poky to get rid of
> > cross dir and install the toolchain in  native sysroot.
> >
> > I have done native-sdk-builds for uclibc and eglibc. It could build the
> images
> > and the images booted fine in qemu on mips and arm.
> >
> > I would  appreciate if someone could lend a hand in testing these patches
> >
> > And as we have changed tmpdir layout with this patch I have also bumped
> ABI
> > which means tmp has to be nuked before you try these patches.
> >
> > Please review/ack/nack
>
> Thanks for looking at this, its something I've wanted to get to for a
> while but haven't managed so far. Consider this an ack from me!


Ack from me too, test builds work fine, this is a lovely change we've been
wanting to see for a while now, nicely done pulling it over from the poky
bits.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

