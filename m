Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JCug6-0007WL-8a
	for openembedded-devel@openembedded.org; Thu, 10 Jan 2008 11:30:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0AAUFwf022061;
	Thu, 10 Jan 2008 10:30:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21661-08; Thu, 10 Jan 2008 10:30:11 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m0AAU9ot022055
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Thu, 10 Jan 2008 10:30:09 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <456018236.20080110111917@gmail.com>
References: <1824361960.20080106235611@gmail.com>
	<47825896.7030301@kernelconcepts.de>
	<1133928457.20080108163429@gmail.com>
	<1199810941.6053.50.camel@localhost.localdomain>
	<456018236.20080110111917@gmail.com>
Date: Thu, 10 Jan 2008 10:30:08 +0000
Message-Id: <1199961008.4666.17.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org, Tomas Frydrych <tf@o-hand.com>,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [RFC] Smallscreen mod for GtkFileChooser
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
X-List-Received-Date: Thu, 10 Jan 2008 10:30:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

The reply below is from Tomas who wrote that patch and who isn't
subscribed here but is cc'd.

Richard

On Thu, 2008-01-10 at 11:19 +0200, Paul Sokolovsky wrote:
>   So, what we see is that the design of the dialog is changed,
> simplifying it to just a file list, parent dir button, and buttons for
> mounted filesystems 

This UI was designed for certain purposes; if someone can come with a
better UI for a small screen, by all means, but any additional element
added to the dialog is significantly impacting usuability due to the
visible file list shrinking (and I would be curious to know what is
missing there).

> (same icons appeared in Angstrom image).

If the icons are all the same, it is because the theme does not provide
icons for the particular media types; not the filechooser fault.

> There're still "desktop" gaps and dialog sizing (3/4 of screen width,
> no resize with matchbox).

The internal gaps of the filechooser were tweaked for a QVGA screen
(the gaps around the outside of the filechooser and the buttons are
consistent for all Gtk dialogs and would need to be patched elsewhere).

Overall, the dialog is as big as Gtk thinks it needs be; in that
particular screen shot it would benefit from being both wider (and
perhaps taller), but this is less of an issue on a landscape screen.

> Looking at the patches, there's filechooser-respect-style.patch,
> whose name and quick scan suggests that at least gaps might be
> configurable by theme, but we have what we have and OE's "standard"
> themes like Clearlooks and GPE Default. Also, I'm not gtk+ styling
> expert, but for me it looks like it just does different arithmetic
> with the numbers hardcoded as they were before ;-(.

The respect-style patch does two things: (a) it removes the set_style()
virtual function that was preventing styling via theme; (b) it adjust
some of the geometry to reduce space waste (BTW, this patch is no longer
present in 2.12.x patch set, the geometry might need to be tweaked a
bit).

>   Main patch is filechooser-default.patch, and its size (~200k for
> gtk+ 2.10, ~400k for 2.12) and content suggests that it was an
> implementation for older gtk+, or completely different code, so it
> removes large content of pristine gtk+'s file and replaces it with
> something else.

Yep, that was initially a patch for 2.6, ported up to 2.10 (the size of
the patch is due to the fact that I have removed as much of the dead
code as possible). For 2.12 I have just replaced the
gtkfilechooserdefault.c file with the patched one from 2.10, as the
gtkfilechooserdefault is increasing developing in ways that are not
really beneficial for the embedded use, and a complete replacement is
needed.

(The patches also add functionality, notably the root-folder property
that makes it possible to specify that the user should not be able to
descent below certain location in the fs tree.)

> *1) To make Angstrom work well now, and in sustainable manner (that includes
> applying as little and as short patches as possible, which would do as
> little as possible changes to the upstream, if the upstream can be made
> well enough usable with such small changes.

In this case, this is a false premise; the default gtk filechooser is
unsuitable for embedded HW, and an ever increasing portion of its code
is related to features that just cannot be easily used on a small screen
(most of it really: bookmarks, recent files, the wretched navigation
bar). IMO, a small patch is not a viable long-term solution. It would be
ideal if an alternate implementation for GtkFileChooserDefault could be
pushed into Gtk and could be enabled via a configure option (something
like --enable-embedded-tweaks), but I gathered that this is unlikely to
happen.

Tomas




