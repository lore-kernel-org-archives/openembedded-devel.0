Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <shanevolpe@gmail.com>) id 1IZX4d-0001He-Nb
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Sep 2007 21:24:59 +0200
Received: by nf-out-0910.google.com with SMTP id h3so970261nfh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Sep 2007 12:20:45 -0700 (PDT)
Received: by 10.78.171.20 with SMTP id t20mr3173146hue.1190575244455;
	Sun, 23 Sep 2007 12:20:44 -0700 (PDT)
Received: by 10.78.162.5 with HTTP; Sun, 23 Sep 2007 12:20:44 -0700 (PDT)
Message-ID: <8c7950360709231220o100ae1d6i2582e20398b04521@mail.gmail.com>
Date: Sun, 23 Sep 2007 15:20:44 -0400
From: shanevolpe@gmail.com
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Adding support for DirectFB across the board
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
X-List-Received-Date: Sun, 23 Sep 2007 19:25:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

All,
I have been adding in support for directFB to as many packages as
possible, however one issue I have ran into several times is what do I
do when there are packages that can be compiled with X11 or directfb
support and then what do you do with packages that may depend on a
package compiled with directfb or X11.  Ok that was pretty confusing,
let me give an example.

I have added cairo-directfb which compiles cairo with directfb instead
of X11.  Next I wanted to add (update) gtk+-directfb to use
cairo-directfb instead of cairo.  That part was easy I just changed
the DEPENDS cairo in gtk+-directfb to cairo-directfb..  The issue came
when I noticed that gtk+ also requires pango which requires cairo so
what do I do here, do I make a new pango called pango-directfb?  It
seems like the better thing would be set up a virtual/cairo and set it
to either cairo or cairo-directfb.  If I go that route how do I set it
up so it does not break everyone's build that does not have
virtual/cairo set, is there a way to default it to something like
cairo?
Regards,
Shane


