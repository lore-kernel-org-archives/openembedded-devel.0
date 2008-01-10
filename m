Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JD0Ng-0006x4-92
	for openembedded-devel@openembedded.org; Thu, 10 Jan 2008 17:35:48 +0100
Received: by fg-out-1718.google.com with SMTP id e12so704502fga.0
	for <openembedded-devel@openembedded.org>;
	Thu, 10 Jan 2008 08:35:41 -0800 (PST)
Received: by 10.86.4.2 with SMTP id 2mr1978266fgd.43.1199982941532;
	Thu, 10 Jan 2008 08:35:41 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id 13sm2939746fks.8.2008.01.10.08.35.38
	(version=SSLv3 cipher=OTHER); Thu, 10 Jan 2008 08:35:39 -0800 (PST)
Date: Thu, 10 Jan 2008 18:41:28 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <17210498278.20080110184128@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1199961008.4666.17.camel@localhost.localdomain>
References: <1824361960.20080106235611@gmail.com>
	<47825896.7030301@kernelconcepts.de>
	<1133928457.20080108163429@gmail.com>
	<1199810941.6053.50.camel@localhost.localdomain>
	<456018236.20080110111917@gmail.com>
	<1199961008.4666.17.camel@localhost.localdomain>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 10 Jan 2008 16:35:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Thursday, January 10, 2008, 12:30:08 PM, you wrote:

> Hi,

> The reply below is from Tomas who wrote that patch and who isn't
> subscribed here but is cc'd.

> Richard

  Thanks for the reply, Tomas! To not write too much, I'll answer on
paradigmatic/organizational points only, as technical depends on them
here.

> On Thu, 2008-01-10 at 11:19 +0200, Paul Sokolovsky wrote:
>>   So, what we see is that the design of the dialog is changed,
>> simplifying it to just a file list, parent dir button, and buttons for
>> mounted filesystems 

> This UI was designed for certain purposes; if someone can come with a
> better UI for a small screen, by all means, but any additional element
> added to the dialog is significantly impacting usuability due to the
> visible file list shrinking (and I would be curious to know what is
> missing there).

  That's what I thought too after looking close at it. If I was UI
designer for a consumer, mass-market oriented device, I would come up
with a similar design - light and not distracting a user with many
features. If I were manager for such project, I would approve it for
implementation, and if I were programmer, I would implement it without
making faces ;-).

  But OE is different story.. And it seems that these patches fall
into "not directly mergeable from Poky" category. It would be nice if
we could settle on this, as I really don't want to seem like I sat in
the corner, missed happenings around, and now push my piece out of
stubbornness. This is not first and not last case when Poky's stuff
can't be merged, including cases which I regret much more (e.g.,
formfactor package). It doesn't diminish the fact that there's great
exchange between Poky and OE otherwise.

>> (same icons appeared in Angstrom image).

> If the icons are all the same, it is because the theme does not provide
> icons for the particular media types; not the filechooser fault.

>> There're still "desktop" gaps and dialog sizing (3/4 of screen width,
>> no resize with matchbox).

> The internal gaps of the filechooser were tweaked for a QVGA screen
> (the gaps around the outside of the filechooser and the buttons are
> consistent for all Gtk dialogs and would need to be patched elsewhere).

> Overall, the dialog is as big as Gtk thinks it needs be; in that
> particular screen shot it would benefit from being both wider (and
> perhaps taller), but this is less of an issue on a landscape screen.

>> Looking at the patches, there's filechooser-respect-style.patch,
>> whose name and quick scan suggests that at least gaps might be
>> configurable by theme, but we have what we have and OE's "standard"
>> themes like Clearlooks and GPE Default. Also, I'm not gtk+ styling
>> expert, but for me it looks like it just does different arithmetic
>> with the numbers hardcoded as they were before ;-(.

> The respect-style patch does two things: (a) it removes the set_style()
> virtual function that was preventing styling via theme; (b) it adjust
> some of the geometry to reduce space waste (BTW, this patch is no longer
> present in 2.12.x patch set, the geometry might need to be tweaked a
> bit).

>>   Main patch is filechooser-default.patch, and its size (~200k for
>> gtk+ 2.10, ~400k for 2.12) and content suggests that it was an
>> implementation for older gtk+, or completely different code, so it
>> removes large content of pristine gtk+'s file and replaces it with
>> something else.

> Yep, that was initially a patch for 2.6, ported up to 2.10 (the size of
> the patch is due to the fact that I have removed as much of the dead
> code as possible). For 2.12 I have just replaced the
> gtkfilechooserdefault.c file with the patched one from 2.10, as the
> gtkfilechooserdefault is increasing developing in ways that are not
> really beneficial for the embedded use, and a complete replacement is
> needed.

> (The patches also add functionality, notably the root-folder property
> that makes it possible to specify that the user should not be able to
> descent below certain location in the fs tree.)

  Heh, I tried to follow code to make sure there was no typo there: I
would think it would be more natural to limit user to chroot-like
scheme, to "help" one organize files (make sure one cannot drop files
around the entire system and possibly have troubles to find them later).

  PocketPC/WindowsMobile employs such scheme - limits standard apps to
"My documents" directory and at most to a one subdir level under it.
Fully practical and streamlining for users who treat a device like
"organizer", but limiting for users who'd like to see it as
"a computer in a pocket". (Not arguing anything here, just point that
different vendors make different choices, which are easily understood
within the target purpose, while couldn't make everyone happy).

>> *1) To make Angstrom work well now, and in sustainable manner (that includes
>> applying as little and as short patches as possible, which would do as
>> little as possible changes to the upstream, if the upstream can be made
>> well enough usable with such small changes.

> In this case, this is a false premise; the default gtk filechooser is
> unsuitable for embedded HW, and an ever increasing portion of its code
> is related to features that just cannot be easily used on a small screen
> (most of it really: bookmarks, recent files, the wretched navigation
> bar).

  We go to "opinions-opinions" land here. Few people commented on
screenshot of my patch, and everyone has different suggestions for
improvements. But my patch explicitly skips this route. It treats
GtkFileChooserDefault as what it is - the official upstream widget. It
doesn't care if it's good or bad, it adapts it for environment which
was overlooked during GtkFileChooser design/implementation. In this
regard, it does as minimal changes to look and feel, as possible.
Expressed numerically (if we had quantitative criteria for look&feel
changes), those would be below 10% of changes.

  Now if you want *my* opinion, bookmarks are really useful. I don't
really use them much on desktop, but they should streamline on-spot UI
interaction with handheld device. Just think that your showing mounted
FSs is kind of bookmarks, but hardcoded. Now, upstream bookmarks allow
users to create bookmarks per their likes and needs. Of course, paned
UI for this is not ideal. In a comment to my blog, Stanislav Brabec
wrote he imagines wizard-like UI for that, when user first chooses
bookmark (or root/current dir, apparently), and then shown filelist. I
would think that having dropdown button in the single dialog would be
better.

  As for navigation bar, fully agree. Someone really went out of his
way to create "now, something different" ;-). (And just don't tell me
its rooted in MacOS again).

> IMO, a small patch is not a viable long-term solution. It would be
> ideal if an alternate implementation for GtkFileChooserDefault could be
> pushed into Gtk and could be enabled via a configure option (something
> like --enable-embedded-tweaks), but I gathered that this is unlikely to
> happen.

  Not by me, or rather, not this time. And it's not about
wanna/dont-wanna, it's about good self-consciousness ;-). Being a
volunteer contributor to OE, I don't have resources or even grounds to
come up with upstream-suitable solution. Just to get grounds, I would
need to review existing solutions, communicate with authors of
existing solutions, provide RFCs and designs suitable for all, or
many, of them. I don't have resources for that too. So, giving way to
you, gentlemen ;-).

  Besides, if I'd get on gtk+ upstream, I'd have to start from the
start, with things like http://bugzilla.gnome.org/show_bug.cgi?id=129463 .
But look, people before me tried all methods, including such:
http://bugzilla.gnome.org/show_bug.cgi?id=129463#c40 . Of no avail.
They still ship glorious UI bugs straight into users' face ;-)).

> Tomas




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



