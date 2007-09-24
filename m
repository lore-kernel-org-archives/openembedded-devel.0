Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <shanevolpe@gmail.com>) id 1IZoBW-0000YA-B7
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 15:41:14 +0200
Received: by ug-out-1314.google.com with SMTP id q7so902194uge
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 06:36:55 -0700 (PDT)
Received: by 10.78.130.6 with SMTP id c6mr1893096hud.1190641014557;
	Mon, 24 Sep 2007 06:36:54 -0700 (PDT)
Received: by 10.78.162.5 with HTTP; Mon, 24 Sep 2007 06:36:54 -0700 (PDT)
Message-ID: <8c7950360709240636r523b582dx89a7706682776117@mail.gmail.com>
Date: Mon, 24 Sep 2007 09:36:54 -0400
From: shanevolpe@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46F79A90.6090709@student.utwente.nl>
MIME-Version: 1.0
References: <8c7950360709231220o100ae1d6i2582e20398b04521@mail.gmail.com>
	<1190628401.6176.39.camel@localhost.localdomain>
	<46F79A90.6090709@student.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: Adding support for DirectFB across the board
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
X-List-Received-Date: Mon, 24 Sep 2007 13:41:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thanks for the feedback.  I have a couple more questions:

First should I go into all the pango packages and also add
RCONFLICTS="pango-directfb".  If I should do that can I just and it to
the pango.inc and override it in pango-directfb with
RCONFLICTS="pango-directfb"

Second, I have a situation were if you build directfb-1.0 and then
build directfb-1.1.0 there will be library files for both of them in
staging.  This is an issue because it seems some packages may use the
1.0 libs and others will use the 1.1 libs causing issues on the target
board which is running 1.1.0.  How should I handle this,  I want to
completely remove directfb-1.0 from the staging area when directfb-1.1
is installed.
Regards,
Shane


On 9/24/07, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Richard Purdie schreef:
> > On Sun, 2007-09-23 at 15:20 -0400, shanevolpe@gmail.com wrote:
> >> I have been adding in support for directFB to as many packages as
> >> possible, however one issue I have ran into several times is what do I
> >> do when there are packages that can be compiled with X11 or directfb
> >> support and then what do you do with packages that may depend on a
> >> package compiled with directfb or X11.  Ok that was pretty confusing,
> >> let me give an example.
> >>
> >> I have added cairo-directfb which compiles cairo with directfb instead
> >> of X11.  Next I wanted to add (update) gtk+-directfb to use
> >> cairo-directfb instead of cairo.  That part was easy I just changed
> >> the DEPENDS cairo in gtk+-directfb to cairo-directfb..  The issue came
> >> when I noticed that gtk+ also requires pango which requires cairo so
> >> what do I do here, do I make a new pango called pango-directfb?  It
> >> seems like the better thing would be set up a virtual/cairo and set it
> >> to either cairo or cairo-directfb.  If I go that route how do I set it
> >> up so it does not break everyone's build that does not have
> >> virtual/cairo set, is there a way to default it to something like
> >> cairo?
> >
> > The thing you need to consider is that pango compiled with a standard
> > cairo is a different package to pango compiled with cairo-directfb.
> >
> > The virtual namespace is used to show things that are equivalent and
> > pango is different to pango-directfb since I couldn't interchange them.
> >
> > You therefore need to create a pango-directfb, ugly as that may be (.inc
> > files can minimise the ugliness though).
>
> Don't forget to add RCONFLICTS statements, since the resulting binary has the same name (IIRC)
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFG95qQMkyGM64RGpERAvWrAKCfPDULCnbztGCa/Op+4r6TFR4i3QCeIAoR
> c6DOEu6KMroHJYKzzbeNZOI=
> =BNa1
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
Registered Linux User: #293401


