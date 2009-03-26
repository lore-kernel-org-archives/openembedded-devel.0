Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1Lmq4S-0004jH-4Y
	for openembedded-devel@openembedded.org; Thu, 26 Mar 2009 14:56:36 +0100
Received: (qmail 14678 invoked by uid 107); 26 Mar 2009 13:54:51 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 26 Mar 2009 14:54:51 +0100
Message-ID: <49CB892B.2020705@epfl.ch>
Date: Thu, 26 Mar 2009 14:54:51 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: A few questions for better platform support
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
X-List-Received-Date: Thu, 26 Mar 2009 13:56:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

There is a quite small support for our board mx31moboard
(http://mobots.epfl.ch/mx31moboard.html) already in OE. I have lately
been working on a better Linux kernel support for it, and things are now
getting in pretty good shape.

I now would like to spend some time on tuning our distribution for our
robots based on OE and Angstrom and I have a few questions about them.
Maybe most of them have been answered in the list already, but I have
had some issues following the list lately (mostly due to my military
last 5 weeks).

- I had filled up bugs on the bugzilla for new features
(http://bugs.openembedded.net/show_bug.cgi?id=4960,
http://bugs.openembedded.net/show_bug.cgi?id=4961,
http://bugs.openembedded.net/show_bug.cgi?id=4971,
http://bugs.openembedded.net/show_bug.cgi?id=4972). I have read that the
preferred way to submit patches is the mailing-list. Should I repost the
(maybe updated) recipes to the mailing-list and close the corresponding
bugs ? I think that the answers to the questions below may trigger new
discussions so I will repost the updated recipes for further discussions
later.

- Rootfs location: We have a pretty small flash on our system (32 MB).
But whe have and SD card reader. I would have these two possibilities:
1) Have a minimal image that fits in the flash with the kernel, but the
rest would go to the SD card (and all packages installed afterwards
too). This would allow the system to boot without a SD card.
2) Have the whole filesystem on a SD card (then, an SD card would be
needed for the system to boot).
Is it possible to have two different image types that would allow me to
build systems for these two possibilities.

- Package installation location: As stated above, since we have a small
flash filesystem, I would like all the additional packages that would be
installed get installed to a location that physically correspond to a SD
card. How can we configure opkg so that the packages are installed into
a certain location ?

- Add additional feeds location: By default, with angstrom, the feed
source on the angstrom-distribution.org web server in configured. Most
of our robots wont have internet access, they will however have access
to a server where all the packages are going to be built and I would
like to add this server as the main repository. How can the system
configured in that way ?

- Best way to build and distribute SDK: I had proposed in the above
patches recipes to build an approrpiate SDK for our system. I would like
to distribute this SDK to all the people who are going to develop on our
robots. I would like to keep it as simple as possible for them, so if
they don't have to use OE themselves is much better. I have seen that
things have been changing a bit lately about the SDK (canadian SDK, what
is it exactly ?). What is the best way (best current example) so that I
can build an easily distributable sdk ? Is it possible that we produce
.deb files ?

Thank you for your input

Val

-- 
Valentin Longchamp, PhD Student, EPFL-STI-LSRO1
valentin.longchamp@epfl.ch, Phone: +41216937827
http://people.epfl.ch/valentin.longchamp
MEA3485, Station 9, CH-1015 Lausanne


