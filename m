Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H5S9n-00074N-KY
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jan 2007 20:33:43 +0100
Received: by nf-out-0910.google.com with SMTP id l24so1246904nfc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jan 2007 11:31:40 -0800 (PST)
Received: by 10.48.254.1 with SMTP id b1mr975174nfi.1168630298710;
	Fri, 12 Jan 2007 11:31:38 -0800 (PST)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id k9sm11358259nfc.2007.01.12.11.31.37;
	Fri, 12 Jan 2007 11:31:38 -0800 (PST)
Date: Fri, 12 Jan 2007 21:31:37 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1589219206.20070112213137@gmail.com>
To: "Matt Reimer" <mattjreimer@gmail.com>
In-Reply-To: <f383264b0701121058n43be78dbu15871cb892681801@mail.gmail.com>
References: <20070111203010.GB336@mage.jpl.nasa.gov>
	<45A6A0C2.2080400@dominion.kabel.utwente.nl>
	<20070111214849.GD336@mage.jpl.nasa.gov>
	<f383264b0701121058n43be78dbu15871cb892681801@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, familiar@handhelds.org
Subject: Re: [Familiar] Re: [announce] new tagged version of ipkg
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
X-List-Received-Date: Fri, 12 Jan 2007 19:33:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Matt,

Friday, January 12, 2007, 8:58:34 PM, you wrote:

> On 1/11/07, Erik Hovland <erik@hovland.org> wrote:
>> > Tarball?
>>
>> No tarball at this time. If one is desired it can be facilitated.
>>
>> > ChangeLog?
>>
>> The ipkg/C/ChangeLog has been updated:
>>
>> 2007-01-11 erik ( erik@hovland.org)
>>         * Version update to 0.99.164
>>         * Fixed usage of temporary files to be more secure
>>         * Closed several potential memory/file descriptor leaks
>>         * Cleaned up warnings in several parts of the code
>>         * Added checking to libbb/unzip.c so it did not use tainted data
>>         * Changed code in several places where it is possible to dereference an invalid pointer

> I'd like to see this added to the ChangeLog:

> * Converted from storing metadata in flat files to storing it in an sqlite db

> Of course, a bit of work might be needed to actually make that a true
> statement. ;-)

  I really have an itch for that myself, I just wonder if less steep
start can be made here, like to add separate simple hash-based index for
Packages file, so it was quick to look up package by name. Of course,
if that could help depends on ipkg code, and I didn't yet have chance
to peek at...

> Matt


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



