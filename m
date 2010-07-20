Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ob76p-0006SO-9O
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 09:19:23 +0200
Received: by bwz10 with SMTP id 10so2953582bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 00:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=YAXrh88ccKl3UHk7zUIQc8xk+hLD5LEGVUQDWUzGXgo=;
	b=JHQrKMs8gVSSoKId66/azk5omsPyvjSqDO01momzRrfNq+wC0wIdstX3ud0Q1pvAXT
	tE4VrHPz8unfXq84YQ2i+bxvrx8Yl3IfdJF25Jb2xnZUrJohgLeXfT7ikNkslNjhyqyU
	SV0HYM5+UcJmcrVhbOJzl1hKtwX9GKhRgEcBI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TSQhu2papX0RcOMiopFLcJ6pWO/fpKvibgXGCXXVEXGMf0Ji+/y+sJp5eAY+VCnqmb
	zIxlUbl5ZxU22zfk4gkWzFXJGjOmB7tG9EVqCQk4Kpk+jebImzAQuOgi8GkCXHNCewZ0
	oFWdmSZ3ISft5I4IiUcQCfbn9AaMPVhLIlXzk=
MIME-Version: 1.0
Received: by 10.204.25.207 with SMTP id a15mr4576468bkc.83.1279610353376; Tue, 
	20 Jul 2010 00:19:13 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 20 Jul 2010 00:19:13 -0700 (PDT)
In-Reply-To: <20100720071141.GF1512@excalibur.local>
References: <AANLkTimlxdwUxIog99H_Er_QL-tzZ5Ntd9kTyT8BcG-Y@mail.gmail.com>
	<20100720065108.GC1512@excalibur.local>
	<AANLkTikm8U6XCOc_dOqWPDQiQZf-4SYPb1FMT6oQGgil@mail.gmail.com>
	<20100720071141.GF1512@excalibur.local>
Date: Tue, 20 Jul 2010 09:19:13 +0200
Message-ID: <AANLkTin2hMi2BYRNQeohRIPTTs3yU4wHI-YSGObwlv1K@mail.gmail.com>
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
Subject: Re: GPSBABLE -- fixed recipe
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
X-List-Received-Date: Tue, 20 Jul 2010 07:19:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/20 Stefan Schmidt <stefan@datenfreihafen.org>

> Hello.
>
> On Mon, 2010-07-19 at 23:59, J. L.  wrote:
> > On Mon, Jul 19, 2010 at 11:51 PM, Stefan Schmidt
> > <stefan@datenfreihafen.org> wrote:
> > >
> > > This workflow looks like more work in the beginning but it pays off for
> you and
> > > us within the first two patches. :)
> >
> > I am a VERY new beginner in all of this and would love to learn how to
> > do it all properly as I have found a few recipes that I want to build
> > but have issues. I will figure out how to do what your saying properly
> > and send in the patch.
>
> Good to see you are motivated. :)
>
> > Do I need to put my recipe back to the original in OE first before
> > making the patch? If this is way off you can just tell me to search on
> > google. Thanks for taking the time to let me know though I appreciate
> > it.
>
> Normally you would change the recipe directly in the git checkout. That is
> within the folder you have created with git clone ...
>
> You would change the recipe to match the new checksums and the run "git
> diff" to
> see what changes you have in your local repository. If all looks good a
> "git
> commit" would make a local commit of your changes which you then could
> prepare a
> patch from and then it here.
>
> The man pages for the different steps are available with "git help
> $COMMAND" and
> there are some good tutorials out there for git questsions. But the command
> given above should bring you through the first submission.
>
> regards
> Stefan Schmidt
>

As an addendum:
it might be useful to join #oe on freenode irc. If you have issues or
questions there are often people around that can help you.

have fun, Frans

