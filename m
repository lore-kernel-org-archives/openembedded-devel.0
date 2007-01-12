Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H5Sya-0000XB-6L
	for openembedded-devel@openembedded.org; Fri, 12 Jan 2007 21:26:12 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0CKO4Lr014148 for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2007 21:24:04 +0100
Message-ID: <45A7EE5C.2050800@dominion.kabel.utwente.nl>
Date: Fri, 12 Jan 2007 21:23:56 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20070111203010.GB336@mage.jpl.nasa.gov>	<45A6A0C2.2080400@dominion.kabel.utwente.nl>	<20070111214849.GD336@mage.jpl.nasa.gov>
	<f383264b0701121058n43be78dbu15871cb892681801@mail.gmail.com>
In-Reply-To: <f383264b0701121058n43be78dbu15871cb892681801@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [announce] new tagged version of ipkg
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
X-List-Received-Date: Fri, 12 Jan 2007 20:26:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Matt Reimer schreef:
> On 1/11/07, Erik Hovland <erik@hovland.org> wrote:
>>> Tarball?
>> No tarball at this time. If one is desired it can be facilitated.
>>
>>> ChangeLog?
>> The ipkg/C/ChangeLog has been updated:
>>
>> 2007-01-11 erik ( erik@hovland.org)
>>         * Version update to 0.99.164
>>         * Fixed usage of temporary files to be more secure
>>         * Closed several potential memory/file descriptor leaks
>>         * Cleaned up warnings in several parts of the code
>>         * Added checking to libbb/unzip.c so it did not use tainted data
>>         * Changed code in several places where it is possible to dereference an invalid pointer
> 
> I'd like to see this added to the ChangeLog:
> 
> * Converted from storing metadata in flat files to storing it in an sqlite db
> 
> Of course, a bit of work might be needed to actually make that a true
> statement. ;-)

Marcin and I already have that information in a sqlite3 database for the feedbrowser we
wrote. All it needs it a wrapper that read the information and spawns 'ipkg install
http://foo/bar.ipk'

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFp+5cMkyGM64RGpERAqBoAJ0RD6+IbqU7HT11aMvm6lcGsEVFpQCeJIug
mUZPTqKS5OzOtQ1+EJFtXX8=
=Lbl6
-----END PGP SIGNATURE-----


