Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OFOu2-000645-Ol
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 11:52:29 +0200
Received: by bwz1 with SMTP id 1so66711bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=H9noMj1YOy0Eyx/XjPLR1gHrZnv838+8Vanl34bTJvc=;
	b=EmLd903mNJbZB0LaSAHbxASdBcjqNtkiZ5tOn0zTqQB6vaOuvfPPWlbb0QzLGb8Pqu
	jPOmWqrIubN1+jdK79M7rdUfDsfFNxse0L6P73FIq8pGto7CIGWwDYzkfWrR7N7IW0fq
	Ow8rBdyz14hZsXYyqhDxJBetP21BSOebYMgWk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fXPsX5nL3On65lCx5Nx3vURIY66KxXgsg8LX00EFE+pOZY/LaxiJ6NVAw4yOT6cXkL
	1tBplemVXee0ArsA2yqDrmLD20xzVoBIjGrGFsEKINMC8O7vEqjB1pGZO3e0UteTOWuv
	NUaQUsEsISnRs5/7O17NzRPoLVBqyxcXv6sZE=
MIME-Version: 1.0
Received: by 10.204.154.84 with SMTP id n20mr24002bkw.151.1274435304974; Fri, 
	21 May 2010 02:48:24 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Fri, 21 May 2010 02:48:24 -0700 (PDT)
In-Reply-To: <AANLkTinAOE1YAoEEqHuOQoIWuXDJ_SZZL4wcWe2D9tri@mail.gmail.com>
References: <AANLkTilUZ3dToBwFw4QzKZkyrDUxT2Y2rO7T3CvYNjQ-@mail.gmail.com>
	<AANLkTinAOE1YAoEEqHuOQoIWuXDJ_SZZL4wcWe2D9tri@mail.gmail.com>
Date: Fri, 21 May 2010 11:48:24 +0200
Message-ID: <AANLkTilad9w4Dh67o_qqPaTHJRTvLBKrI7YbkUNl4A6G@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem with building glibc
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
X-List-Received-Date: Fri, 21 May 2010 09:52:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Many thanks for answers.

I would love to work with angstrom, however I'm using Colibri evaluation
board with Intel=AE PXA270 Processor (this is a students project and I can'=
t
change it). Is it possible to run system built for angstrom on my board or =
I
just miss something?!

Where can I set compile flags?... in recipes/glibc/glibc_2.9.bb



Kind Regards,
Grzegorz


2010/5/21 Michael Lippautz <michael.lippautz@gmail.com>

> 2010/5/20 Grzegorz Toporek <top.grzechu@gmail.com>:
> > Hi all,
> ...
> > I found this but I don't know how to apply it to my problem. I use Ubun=
tu
> > 9.1, gcc 4.41.
> >
> > http://sourceware.org/bugzilla/show_bug.cgi?id=3D5203
>
> If you really want to mess around (which I won't recommend!), then you
> could just do what the bug report suggests. Since -Os will probably be
> the culprit, either change it two -O2, or remove the stated commit.
> The file (io/sys/stat.h) can be found in
> <oe-home>/tmp/work/<arch>-<distro>-*/glibc-*
>
> Again, I would use Angstrom, as it has always been quite stable (for
> me atleast).
>
> Regards,
> Michael
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

