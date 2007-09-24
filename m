Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IZlrG-0002M1-7b
	for openembedded-devel@openembedded.org; Mon, 24 Sep 2007 13:12:10 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l8OB7mxW020680 for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2007 13:07:49 +0200
Message-ID: <46F79A90.6090709@student.utwente.nl>
Date: Mon, 24 Sep 2007 13:08:00 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <8c7950360709231220o100ae1d6i2582e20398b04521@mail.gmail.com>
	<1190628401.6176.39.camel@localhost.localdomain>
In-Reply-To: <1190628401.6176.39.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Mon, 24 Sep 2007 11:12:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Sun, 2007-09-23 at 15:20 -0400, shanevolpe@gmail.com wrote:
>> I have been adding in support for directFB to as many packages as
>> possible, however one issue I have ran into several times is what do I
>> do when there are packages that can be compiled with X11 or directfb
>> support and then what do you do with packages that may depend on a
>> package compiled with directfb or X11.  Ok that was pretty confusing,
>> let me give an example.
>>
>> I have added cairo-directfb which compiles cairo with directfb instead
>> of X11.  Next I wanted to add (update) gtk+-directfb to use
>> cairo-directfb instead of cairo.  That part was easy I just changed
>> the DEPENDS cairo in gtk+-directfb to cairo-directfb..  The issue came
>> when I noticed that gtk+ also requires pango which requires cairo so
>> what do I do here, do I make a new pango called pango-directfb?  It
>> seems like the better thing would be set up a virtual/cairo and set it
>> to either cairo or cairo-directfb.  If I go that route how do I set it
>> up so it does not break everyone's build that does not have
>> virtual/cairo set, is there a way to default it to something like
>> cairo?
> 
> The thing you need to consider is that pango compiled with a standard
> cairo is a different package to pango compiled with cairo-directfb.
> 
> The virtual namespace is used to show things that are equivalent and
> pango is different to pango-directfb since I couldn't interchange them.
> 
> You therefore need to create a pango-directfb, ugly as that may be (.inc
> files can minimise the ugliness though).

Don't forget to add RCONFLICTS statements, since the resulting binary has the same name (IIRC)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG95qQMkyGM64RGpERAvWrAKCfPDULCnbztGCa/Op+4r6TFR4i3QCeIAoR
c6DOEu6KMroHJYKzzbeNZOI=
=BNa1
-----END PGP SIGNATURE-----


