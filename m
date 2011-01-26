Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PiDsG-0002ud-6n
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 23:30:00 +0100
Received: (qmail invoked by alias); 26 Jan 2011 22:29:09 -0000
Received: from p4FE0FB8B.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.224.251.139]
	by mail.gmx.net (mp071) with SMTP; 26 Jan 2011 23:29:09 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX189HS01WFk9dbIOCGos6opdCEOBNT4FZ3vBFRmkFI
	Xmz1kQQMJi23pB
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 23:27:31 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <201101242322.30470.schnitzeltony@gmx.de>
	<ihlur0$iqp$1@dough.gmane.org>
In-Reply-To: <ihlur0$iqp$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201101262327.31727.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Question regarding gettext 0.18
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
X-List-Received-Date: Wed, 26 Jan 2011 22:30:00 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 25 January 2011 08:41:20 Koen Kooi wrote:
> On 24-01-11 23:22, Andreas Mueller wrote:
> > Dear OE folks,
> >
> > during working on new recipes for clutter 1.4.2 I face the following issue:
> >
> > Compiling fails with the message
> >
> >> Making all in po
> >> make[2]: Entering directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
> >> *** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.17 but the autoconf macros are from gettext version 0.18
> >> make[2]: *** [check-macro-version] Error 1
> >> make[2]: Leaving directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
> >> make[1]: *** [all-recursive] Error 1
> >> make[1]: Leaving directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2'
> >> make: *** [all] Error 2
> >> FATAL: oe_runmake failed
> >> ERROR: Function do_compile failed
> >
> > I checked google & git-log for a hint on that - nothing (yet).
> >
> > It smells as a simple solution - but I am not able to find it. Can somebody please give me a hint how to solve?
> 
> I use this in gstreamer:
> 
> # gstreamer uses AG_GST_GETTEXT which autotools.bbclass doesn't grep for
> do_configure_prepend() {
>     glib-gettextize --force --copy || true
> }
> 

Thanks for  quick & helpful response. But...

I did the same modification for clutter-recipe. With this compiling passes but install fails with

| Making install in po
| make[1]: Entering directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
| if test -r "../@MKINSTALLDIRS@"; then \
| 	  ../@MKINSTALLDIRS@ /home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/image/usr/share; \
| 	else \
| 	  /bin/sh ../mkinstalldirs /home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/image/usr/share; \
| 	fi
| /bin/sh: ../mkinstalldirs: No such file or directory
| make[1]: *** [install-data-yes] Error 127
| make[1]: Leaving directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
| make: *** [install-recursive] Error 1
| FATAL: oe_runmake failed
| ERROR: Function do_install failed

A complete different layout in 'po/Makefile.in.in' lead me to the fact that clutter has changed from glib-gettext to upstream gettext (see 
http://git.clutter-project.org/clutter/commit/?id=98cac30d82299b3739f3801f71b5e2e931eb2e8d). 

So I modified the recipe to

do_configure_prepend() {
	gettextize --force || true

Unfortunately with this configure does not finish because gettextize is so kind to tell me that I have to

| Please run 'aclocal -I build/autotools' to regenerate the aclocal.m4 file.
| You need aclocal from GNU automake 1.9 (or newer) to do this.
| Then run 'autoconf' to regenerate the configure file.
|
| You might also want to copy the convenience header file gettext.h
| from the /home/Superandi/tmp/sysroots/i686-linux/usr/share/gettext directory into your package.
| It is a wrapper around <libintl.h> that implements the configure --disable-nls
| option.
|
| Press Return to acknowledge the previous two paragraphs.

I see the following options to continue (hoping on better results with upstream gettextize...):

- gettextize has a 'secret' parameter preventing interaction (I checked doc / --help / the script itself: nothing) 
- patching or sed-ing gettextize-native: so that 'read dummy < /dev/tty' is removed at the end of gettextize script (preferred)
- something like ti-eula-unpack.inc simulating user interaction

Sorry for spamming but what do you think?

Andreas


