Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RrCsQ-0007rS-4w
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jan 2012 19:19:50 +0100
Received: by vbbff1 with SMTP id ff1so131575vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2012 10:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HPAk1eWZESwqvt/Mh84AMhbVDNHI+AedM62OFdbxmX4=;
	b=uXg7Oe8709N+wLju9Psdxbqim1VH9kZcGRsjmM+EMxPwD2XUrX4rVtI2wr68DUpGEv
	d22+l1QgRsYy/C5qbpT5Sv590qriEZM5Z3JudpzBC2iweMBePUlma6W9LzaU/GsM7fkj
	nYh8xQpQFCMN/AIDzfb+/u3e/uojBXuc0wJN4=
MIME-Version: 1.0
Received: by 10.52.66.166 with SMTP id g6mr5678774vdt.34.1327774319213; Sat,
	28 Jan 2012 10:11:59 -0800 (PST)
Received: by 10.52.67.171 with HTTP; Sat, 28 Jan 2012 10:11:59 -0800 (PST)
In-Reply-To: <2691471.Q2jpB2kn8z@helios>
References: <CACW_hTaJXTrAP4YTTA2CwXFe7sYeY3yEFi8JfNbhiEzZbMttqg@mail.gmail.com>
	<2691471.Q2jpB2kn8z@helios>
Date: Sat, 28 Jan 2012 19:11:59 +0100
Message-ID: <CACW_hTaZqYFkGpV8hFdsTNbsJB6geZGqtdr3bGDssLQV9CwCvw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: get OE git hash tag in executable
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
X-List-Received-Date: Sat, 28 Jan 2012 18:19:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/1/28 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Saturday 28 January 2012 13:42:32 Frans Meulenbroeks wrote:
> > In order to allow backtracking of the sources for a binary build with
> OE, I
> > would like to (automatically) add the hash of the top level commit (and
> > maybe also the branch) of the oe git tree my recipe lives in).
> > E.g. in main.c I would like to have a var say:
> > const char * const buildfrom = "oe branch 2011.03-maintence hash
> > 1234567890"; or something like that.
> >
> > What would be the best way to get that info into my program?
> > (my best guess at the moment is to use a macro and compile with
> > -DOE_IDENT="....." or so and say  char *buildfrom = OE_IDENT; but not
> > really sure what the best way is to fill OE_IDENT and pass it to the
> > recipe.)
>
> Interesting question! Putting the information in a define specified on the
> compiler command line would be one way; another way would be to have the
> recipe write to/append to/subsitute into a header file that you can
> #include in
> the source. You would also probably want to include ${DATE} in the
> recipe's PV
> or use some other mechanism to ensure it gets rebuilt every time you build
> an
> image.
>
> I guess you are still using OE-Classic, but in OE-Core we now have a
> function
> in base.bbclass called get_layers_branch_rev that will return the git
> branch/revision information for all enabled layers. It was split out from
> the
> code in the same bbclass that displays this information when BitBake
> starts,
> so I guess you could just make a copy of it into your recipe for
> OE-Classic.
>
> Cheers,
> Paul
>
>
HI Paul,

Thanks for the feedback.
Indeed I'm still on oe classic; the product in which I am putting this is
close to release so I
cannot switch any more.

Writing into a header file is also something that I considered and that is
also probably quite feasible.
(and maybe even simpler, if it is done in a do_configure step or so,
passing shell varables through bitbake to CFLAGS is not
really trivial; as far as I know I cannot use things like `git log | head
-1` and assign it to a var in the recipe
(it might be possbile with some python, but that is outside my league).

With respect to rebuilding the app. Yeah, didn' t think of that.
It is not too much of a concern, because all our products are build from
scratch on an autobuilder and the
test images and later the release are pulled from that autobuilder, so I
always know that the app info is correct.

Then again, rethinking it, it seems I am making things way too complicated.
Guess the simplest solution is just to do some postprocessing when the
rootfs is created and make a file /etc/buildinfo or so and read that from
the app.
(We only distribute images, not complete apps).

(Actually I do already something like that in the top level makefile that I
have to collect all data for the autobuilder).

Thanks alot for your advice.

Frans

PS: saw the reply from Khem while typing this.
Probably even simpler. add a small makefile rule to the project to create
the version .h file.
I seem to recall u-boot does something similar.
Might need to pass the path from the recipe though, otherwise I'll have to
come up with something like ../../../../../../openembedded.git or so

