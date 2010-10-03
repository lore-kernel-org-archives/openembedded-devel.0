Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P2J8p-0007Mv-RW for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 09:37:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P2J8a-0006AZ-8A for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 09:37:36 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 09:37:36 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Oct 2010 09:37:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 03 Oct 2010 09:37:28 +0200
Message-ID: <i89bro$g4g$2@dough.gmane.org>
References: <4CA719E0.7050409@freyther.de> <i89b3v$g4g$1@dough.gmane.org>
	<4CA83188.7010203@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <4CA83188.7010203@freyther.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RPATH in many modules
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
X-List-Received-Date: Sun, 03 Oct 2010 07:37:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-10-10 09:32, Holger Freyther wrote:
> On 10/03/2010 03:24 PM, Koen Kooi wrote:
> 
>> Could you fix the patch to say to which (wrong) sysroot it points to?
>>
>> MACHINE=beagleboard bitbake libcdio
>>
>> rpath -> sysroots/x86 or rpath -> sysroots/armv7a or both?
> 
> ERROR: QA Issue with libgettextlib: package libgettextlib contains bad RPATH
> /home/ich/build/arm/xscale/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
> in file
> /home/ich/build/arm/xscale/tmp/work/armv5te-angstrom-linux-gnueabi/gettext-0.18-r3/packages-split/libgettextlib/usr/lib/libgettextlib-0.18.so
> 
> Can you propose a better wording? From the above I try to indicate that
> /home/ich/build/arm/xscale/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
> is the bad RPATH and that it is inside the libgettextlib-0.18.so

"Target libs and apps contain a bad RPATH to the target sysroot e.g.
/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib" ?

>> When we last tried chrpath didn't work in cross mode :(
> 
> hmm... maybe it is something simple... :}

I certainly hope so!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMqDK4MkyGM64RGpERAntvAJ4ra8cYKuiT/QrkcB/5Jb2EHzPkZwCgq1/8
q4Hur7dh657M+0YRlRxSnRo=
=CytO
-----END PGP SIGNATURE-----



