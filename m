Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1InyS8-0001IH-NR
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2007 16:28:56 +0100
Received: by wa-out-1112.google.com with SMTP id l24so1071785waf
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2007 08:28:32 -0700 (PDT)
Received: by 10.115.90.1 with SMTP id s1mr1930111wal.1194013377160;
	Fri, 02 Nov 2007 07:22:57 -0700 (PDT)
Received: by 10.114.254.11 with HTTP; Fri, 2 Nov 2007 07:22:57 -0700 (PDT)
Message-ID: <f96d234e0711020722i2305f16et15f2b5b122c94aea@mail.gmail.com>
Date: Fri, 2 Nov 2007 10:22:57 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <472B0543.5070203@balister.org>
MIME-Version: 1.0
References: <8c7950360711010949u45bb12e7p388b4d5dc4563ef3@mail.gmail.com>
	<f96d234e0711011307y6d07604dg110d5c443ecb0e8f@mail.gmail.com>
	<472B0543.5070203@balister.org>
Subject: Re: Overriding package config files in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Nov 2007 15:28:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/2/07, Philip Balister <philip@balister.org> wrote:
> Cliff Brake wrote:
> > Another approach I've been thinking about is to figure out a way for
> > bitbake to use <files> from a tree outside the main OE tree.  One
> > possibility is for bitbake to pull <files> as well as bb files from a
> > high priority bbcollections tree, even though the bb remains in the
> > main OE tree.  This probably totally breaks the way bitbake works, but
>
> I think that having an overlay set up as a high priority collection does
> work.

I was referring to the case where I only put the files directory in
the overlay -- not the entire recipe directory.  I have not tried this
lately and will do so the next time I get a chance.

> Steve S. uses one for his gumstix project. I like this method
> because I can easily find all the local changes he makes and see if they
> need to move back into .dev.
>
> A local overlay lets you change the version of .dev underneath as
> needed, without moving changes across branches. Combined with sane
> source rev/dates, I believe this gives the people supporting product a
> sane build/support environment.

Agreed.  I use overlays a lot as well and they work great -- I would
just like to avoid having to copy the entire recipe + the files
directory -- for example just to make a small change in
/etc/network/interfaces.  If you copy the entire recipe directory,
diff'ing is easy initially, but several months down the road it is
very difficult to figure out what you changed.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


