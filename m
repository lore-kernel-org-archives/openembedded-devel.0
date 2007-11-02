Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1InzSZ-0006B8-6x
	for openembedded-devel@openembedded.org; Fri, 02 Nov 2007 17:33:27 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lA2GWsUo027366 for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Nov 2007 17:32:55 +0100
Message-ID: <472B5140.6060002@student.utwente.nl>
Date: Fri, 02 Nov 2007 17:33:04 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <8c7950360711010949u45bb12e7p388b4d5dc4563ef3@mail.gmail.com>	<f96d234e0711011307y6d07604dg110d5c443ecb0e8f@mail.gmail.com>	<472B0543.5070203@balister.org>
	<f96d234e0711020722i2305f16et15f2b5b122c94aea@mail.gmail.com>
In-Reply-To: <f96d234e0711020722i2305f16et15f2b5b122c94aea@mail.gmail.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Fri, 02 Nov 2007 16:33:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Cliff Brake schreef:
> On 11/2/07, Philip Balister <philip@balister.org> wrote:
>> Cliff Brake wrote:
>>> Another approach I've been thinking about is to figure out a way for
>>> bitbake to use <files> from a tree outside the main OE tree.  One
>>> possibility is for bitbake to pull <files> as well as bb files from a
>>> high priority bbcollections tree, even though the bb remains in the
>>> main OE tree.  This probably totally breaks the way bitbake works, but
>> I think that having an overlay set up as a high priority collection does
>> work.
> 
> I was referring to the case where I only put the files directory in
> the overlay -- not the entire recipe directory.  I have not tried this
> lately and will do so the next time I get a chance.
> 
>> Steve S. uses one for his gumstix project. I like this method
>> because I can easily find all the local changes he makes and see if they
>> need to move back into .dev.
>>
>> A local overlay lets you change the version of .dev underneath as
>> needed, without moving changes across branches. Combined with sane
>> source rev/dates, I believe this gives the people supporting product a
>> sane build/support environment.
> 
> Agreed.  I use overlays a lot as well and they work great -- I would
> just like to avoid having to copy the entire recipe + the files
> directory -- for example just to make a small change in
> /etc/network/interfaces.  If you copy the entire recipe directory,
> diff'ing is easy initially, but several months down the road it is
> very difficult to figure out what you changed.

You could also do it the openmoko way by defining extra overrides and
using those in FILESPATH.


regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHK1FAMkyGM64RGpERAuFpAJ44e/KObKpHYwvmXrLyqNy4o+9VDgCfRUQk
syve1LMsa+yXbjUdrE4NfsQ=
=eU2C
-----END PGP SIGNATURE-----


