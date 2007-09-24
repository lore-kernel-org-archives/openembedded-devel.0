Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IZvgT-0007xH-IR
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 23:41:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8OLbLFO018972
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 22:37:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18647-10 for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 22:37:17 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l8OLbD9m018964
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 24 Sep 2007 22:37:13 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <44EBF4F5-87CD-45B4-B24F-09BEDB948197@gumstix.com>
References: <46F587F7.4060501@balister.org>
	<44EBF4F5-87CD-45B4-B24F-09BEDB948197@gumstix.com>
Date: Mon, 24 Sep 2007 22:37:12 +0100
Message-Id: <1190669832.19359.76.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: How should OE be used?
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
X-List-Received-Date: Mon, 24 Sep 2007 21:41:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-09-24 at 11:36 -0700, Craig Hughes wrote:
> The one main high-level issue I've had so far with OE is the notion  
> of "machine" vs "distro" vs "image", which doesn't cleanly overlap  
> with the existing concepts we use for gumstix.  For gumstix, a  
> machine is a motherboard (with varying amounts of flash storage) +  
> some combo of daughtercards (not a fixed list of features).  Distro  
> kinds of makes sense.  "image" kind of makes sense too, but has some  
> problems where package selection overlaps with the concepts of  
> "machine" which don't quite make sense in the gumstix situation.  I  
> don't think these problems are insoluble though, and partly they're  
> I'm sure just a matter of my own misunderstanding and lack of deep- 
> sightedness on the situation.  For example, different "flavors" of  
> gumstix verdex have different amounts of flash on them.  I'd like to  
> have one "type this and it'll work" command for gumstix users where  
> they can answer a minimal number of questions like "which  
> motherboard?", "how much flash?", and "which daughtercards?" and then  
> it'll go ahead and figure out which machine/image to build.

I suspect you just need to think more along the way OE works and this
will start to become clearer. If you look at poky's local.conf.sample
file, its aimed to give the user an "edit this single file and choose
between the significant bits of Poky's functionality" experience which
is similar to what you mention above. 

Once you have a single conf file controlling what you need if you really
want you can write a script that generates it in a nice ncurses
interface but I don't think you have to do that.

To breakdown where I'd personally put the lines in your case, I'd have a
machine representing the motherboard (you have two, pxa255 and 270
iirc). That machine.conf file would default to the maximal configuration
of the motherboard i.e. including all drivers. You would then be able to
override the options. You could have "sub-machine" files with some
preset combinations too I guess. So the layout becomes:

gumstix-pxa270.conf:

  GUMSTIX_MACHINE_FEATURES ?= "ethernet screen wifi bluetooth"
  MACHINE_FEATURES = "${GUMSTIX_MACHINE_FEATURES}"

gumstix-pxa270-wifi.conf:

  MACHINE = "gumstix-pxa270"
  GUMSTIX_MACHINE_FEATURES ?= "wifi"
  require conf/machine/gumstix-pxa270.conf

gumstix-pxa270-screen-wifi.conf:

  MACHINE = "gumstix-pxa270"
  GUMSTIX_MACHINE_FEATURES ?= "screen wifi"
  require conf/machine/gumstix-pxa270.conf

and your local.conf.sample would read something like:

  # List the features your machine requires in the list below:
  # Valid features are:
  #    ethernet
  #    screen
  #    bluetooth
  #    wifi
  GUMSTIX_MACHINE_FEATURES = "ethernet screen wifi bluetooth"


You might merge the gumstix-pxa270.conf into OE so OE.dev has the
maximal gumstix support but only have the raft of custom
gumstix-pxa270-*.conf files in your branch.

I'd handle flash size by having different images:

gumstix-image-16mb.bb
gumstix-image-32mb.bb
gumstix-image-64mb.bb

and a task-gumstix which defined task-gumstix-16mb etc.

If you wanted to automate the image selection with a UI, create a
symlink to the right sized flash image .bb file so "bitbake
gumstix-image" worked.

You'd also have a gumstix distro basically subclassing angstrom with
your own tweaks.

The above is all just random ideas although hopefully ones you might
fine useful. My main point is I think OE can do what you need, its just
about using its power to your advantage.

> Not a problem for us; we have nothing "proprietary".  Every line of  
> code we write is "open".  There will always be content which isn't  
> technically "proprietary" but which makes no sense outside of a  
> gumstix (like say, our fbcon splash logo or something, or some of our  
> default config files) which would fall in this category though probably.

Have a look at linux-rp.inc which inserts the OH logo onto the kernel if
DISTRO == "poky", even though Poky isn't in OE itself. I'm in favour of
things like that since it allows easier sharing of the files, doesn't
hurt anyone and makes people aware of the way others use the .bb file so
they take care when updating it.

> >  * How do software developers use OE to write/debug code?
> 
> Right now actually, this part's pretty painful.  Figuring out a nice  
> way to have the .bb patch-applicator interact nicely with quilt  
> series files instead of having to copy/paste/sed~^~file://~;~ 
> $~;patch=1~ is a real PITA.  I had a similar issue with buildroot  
> which I basically fixed on the packages I care about by replacing  
> their patch-applicator script with a call to quilt to apply my series  
> files instead.  Then doing actual development is just a matter of  
> cd'ing to the build directory, making changes using quilt, and then  
> the build scripts are automagically updated via the magic of quilt.   
> I haven't yet taken a look at what'd be involved in doing that within  
> OE, but if anyone's tried, or looked at it, or has any pointers on  
> where to start looking, lmk.

All work directories in OE are under control of quilt and patches are
applied using it. You can cd to the build directory and play with quilt,
I do that all the time. The nasty bit is it can't use series files and
the scripts don't autoupdate (although we do have a patch resolver
shell).

It should be relatively straightforward to extend in various ways
although its obviously going to need discussion. See
classes/patch.bbclass.

> In the gumstix case, I'm thinking that the best way of dealing with  
> this is to basically buffer .dev with org.gumstix.oe and  
> org.gumstix.dev -- our  users will "not necessarily know" that  
> they're using OE.  Our support wiki etc will mention that OE is under  
> the hood, but it'll try and divert all support stuff to us first, not  
> to openembedded.org; the danger here is that OE doesn't know what's  
> going on with a big chunk of its (indirect) users, and pressure gets  
> applied to effectively fork (this is what's basically happened with  
> buildroot for us).  On the other hand, you guys really don't want  
> 7,000 gumstix users (some of whom have @aol.com email addresses and  
> stuff) to start spamming the OE dev lists and bugtracker.

I think the important thing is for the OE devs to remain in close
contact with you and/or the people dealing with the 7,000 users. We
don't have the capacity to deal with them directly but we can and will
make an effort to deal with you on their behalf if you see what I mean.

Some things may require a "fork" but only hopefully in isolated areas of
code rather than the whole project. I've yet to find a need to really do
that with poky...

> >  * How does OE scale to large numbers of users?
> 
> Well, I think there are going to be 2 questions here actually: How  
> does OE scale, and how well does monotone scale.  I'm not sure  
> monotone's ever had a project as large as OE with as many users pull/ 
> sync'ing as it might face with the OE+gumstix combination of size +  
> developer base.  Evidence so far shows that monotone might have some  
> serious issues.  The concurrency-of-access one is the most  
> noticeable, given how slow monotone repo ops are.  If one person is  
> pull'ing and it takes 5 minutes to do so, and locks the DB so nobody  
> else can pull at the same time, that's really really not going to  
> work.  From my subversion logs for the gumstix buildroot, we get as  
> many as 400-600 "svn update"/"svn checkout" operations per day, most  
> of which are during office hours in the US.  The most-hit hours  
> actually have over 100 in a single hour.  The most-hit minutes  
> frequently get dozens and sometimes (rarely) even hundreds.  If those  
> ops become mutually locked-out and take 5-10 minutes each now, it's  
> going to seriously piss off quite a few of our customers/users.  Some  
> of that traffic appears to be messed-up scripts trying to pull the  
> whole repo lots of times in a single minute, but we actually deal  
> with that not too badly today.  Getting DoS'd by those badly written  
> scripts would be not good.

I worry about monotone scaling too :-(.

Cheers,

Richard





