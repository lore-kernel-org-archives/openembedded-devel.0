Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HMM5V-0003yK-5D
	for openembedded-devel@openembedded.org; Wed, 28 Feb 2007 11:31:20 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1SAV5ox012661 for <openembedded-devel@openembedded.org>;
	Wed, 28 Feb 2007 11:31:05 +0100
Message-ID: <45E559E9.4040302@dominion.kabel.utwente.nl>
Date: Wed, 28 Feb 2007 11:31:05 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200702281109.25161.ranaldo@unina.it>
	<1172658483.16062.23.camel@localhost.localdomain>
In-Reply-To: <1172658483.16062.23.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: OE and the developing host
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
X-List-Received-Date: Wed, 28 Feb 2007 10:31:28 -0000
X-List-Received-Date: Wed, 28 Feb 2007 10:31:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Wed, 2007-02-28 at 11:09 +0100, Nicola Ranaldo wrote:
>> I use OE on a gentoo box. This morning i updated the system, and the new 
>> linux-headers package removed /usr/include/asm/page.h. So when building my 
>> angstrom image it failed with perl asking to include that file. This problem 
>> was discussed on the gentoo bug and after applying a simple workaround i was 
>> able to emerge perl on the gentoo box and perl native on OE.
>> After a while the oe build stopped on esound, this was caused by a malfunction 
>> of /usr/lib/libosp.so.5 on gentoo, i reemerged it and solved the problem. Now 
>> the armstrong-gpe-image is complete. But this introduced a doubt. OE build 
>> some tools directly, and use other directly from the build host, so it could 
>> be teoretically possible to produce different images on different host. Is 
>> there a way or a plan to avoid it and make OE build host independant 
>> (supposing i was correct)? If not, what's the most used/supported distro by 
>> OE developers?
> 
> *-native packages can touch things on the system, any other packages
> shouldn't and if they were found to be, it would be a bug and should be
> fixed.
> 
> Its never going to be possible to make make OE build everything it needs
> itself since you always need some prerequisites (e.g. a initial
> toolchain).
> 
> Personally, I use OE/Poky on Ubuntu and Slackware. There are others
> using Gentoo and other systems. Ideally it should work on most systems,
> you might see problems with -native packages, you shouldn't see problems
> with non -native ones.

OpenSuSE should work as well, but stay away from Red Hat/Fedora based stuff, since you
can't build a working qemu-native on that.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF5VnpMkyGM64RGpERAv6GAKCNnttrwbzw6UWN0URB+qn0Q8d6SQCggB8s
QBxJdxBCXm9FOkjUjGcQ0Xc=
=opJZ
-----END PGP SIGNATURE-----


