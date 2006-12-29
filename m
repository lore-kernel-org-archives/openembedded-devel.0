Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H0CvK-0002MC-1W
	for openembedded-devel@openembedded.org; Fri, 29 Dec 2006 09:17:06 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBT8GMLr014664 for <openembedded-devel@openembedded.org>;
	Fri, 29 Dec 2006 09:16:23 +0100
Message-ID: <4594CED7.8070709@dominion.kabel.utwente.nl>
Date: Fri, 29 Dec 2006 09:16:23 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20061229001129.GA5501@hezmatt.org>
	<20061229055140.GB18175@ice.mudshark.org>
In-Reply-To: <20061229055140.GB18175@ice.mudshark.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: What's with the symlinks?
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
X-List-Received-Date: Fri, 29 Dec 2006 08:17:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

jack-oe@mudshark.org schreef:
> On Fri, Dec 29, 2006 at 11:11:29AM +1100, Matthew Palmer wrote:
> 
>> Everywhere I go while assembling my OE build tree, I see admonishments not
>> to use a path that has symlinks in it.  For such a major problem, the only
>> real information on the actual problem is a fairly cryptic entry in the FAQ,
>> about a failure to build libtool-native.
>  
>> Being an intensely curious kind of person, and not enjoying arbitrary
>> limits, I'm very interested to know what the *real* reason behind being so
>> strongly against the much-maligned symlink.  Can anyone enlighten me?
> 
> I ran into this. IIRC if "$PWD" != "`readlink -f $PWD`", then automake-native
> fails to build. 
> 
> This is a feature of the automake build system. 

It is a (wrong) check to see if builddir == sourcedir. With a symlink present, the
configure script thinks your building outside sourcedir and wants to create some files.
But those files are already present, so it fails with a "directory already configured"
message.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFlM7XMkyGM64RGpERAiXVAJ9JQuTl5Ug5JRx47n2428XPGJ+wgQCffMJ/
8ueD7E18HHikc5s2rVJV/YI=
=xndz
-----END PGP SIGNATURE-----


