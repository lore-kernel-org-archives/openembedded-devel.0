Received: from [66.249.82.226] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dfarning@gmail.com>) id 1IuLVg-0003Lc-EL
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 06:18:56 +0100
Received: by wx-out-0506.google.com with SMTP id h27so222561wxd
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2007 21:16:49 -0800 (PST)
Received: by 10.90.83.14 with SMTP id g14mr8056901agb.1195534221897;
	Mon, 19 Nov 2007 20:50:21 -0800 (PST)
Received: from lenovo ( [69.29.228.242])
	by mx.google.com with ESMTPS id e1sm6248491nzd.2007.11.19.20.50.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2007 20:50:21 -0800 (PST)
Received: by lenovo (sSMTP sendmail emulation); Mon, 19 Nov 2007 22:50:17 -0600
Date: Mon, 19 Nov 2007 22:50:17 -0600
From: David Farning <dfarning@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <20071120045017.GA6258@lenovo>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: A follow up to Getting Started-Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 05:18:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Some thoughts on the complexity of Bitebake and OpenEmbedded.

1.  My Makefile is not meant as a build tool. It is a getting started tool.
Reading the existing documentation it appears that the learning curve for
BitBake and OpenEmbedded is pretty steep.  The idea for the Makefile is to
help a new user to get a _working_ system up and running as quickly as
possiable.

While a developer needs to be able to use monotone to effectivly create
an Open Embedded based distribution.  They should not need
to worry about monotone version mismatches during setup.

The learning process should be in the same order as the development process.
A new developer should not need to even think about the CMS util they start to
wonder about how to submitting a patch.

2.  The default local.conf setup is to establish a _working_  system for the
new user.  The setup process will extend all the way to having a working qemu
image to test.

This is important for three reasons:
a.  Many things have to go correctly for 
a build to work.  I have been testing OE for several weeks and have not yet had
a image build work corectly on the first try.  A file has been unavailable or
a package has broken somewhere.  Establishing a default installation that
allways works will help the new developer focus on learning important concepts
in an orderly fashion.  It is pretty dificult to debug a build script until you
have learned the basics of the system.

b. Quality can be improve by having a reference implementation that all ways
work.

c. The getting started documention walks the user through the setup and build
process step by step.  So the new user gets a feel for the big picture before
getting lost in the details.


3.  BitBake _should_ be as easy as possible to use.  As I understand it, the
end user of OpenEmbedded is the distribution developer who is building a working
distribution to ship with an embedded device.  BitBake should be as easy as
possiable for them to learn and use.

The _bar_ should not be only people smart enough to figure out bitbake should
be allowed to use it.  Instead, the bar should be good distributions built from
OpenEmbbeded should become popular and the bad ones die from disuse.

Python provides a good example of this.  A kindergartner can write 'hello
world' in python--that doesn't mean I have to use their program.  On the other
hand good programmers can quickly write good code in python--which people use.


Thanks
David Farning


