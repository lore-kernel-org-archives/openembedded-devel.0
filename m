Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1NjvBB-00044o-6Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 14:52:04 +0100
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Tue, 23 Feb 2010 08:49:15 -0500
Message-ID: <4B83DBDD.7020004@tycoelectronics.com>
Date: Tue, 23 Feb 2010 08:45:01 -0500
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.5.1266922802.8892.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Openembedded-devel Digest, Vol 43, Issue 99
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
X-List-Received-Date: Tue, 23 Feb 2010 13:52:04 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

>
>
> The most easy way to turn it off is to not build with GNU HASH style, 
> This can
> be made by not using "--hash-style=SOMETHING" in the LDFLAGS.
>
> The GNU HASH is not a security mechanism but a dynamic linker 
> optimization to
> be able to resolve symbols faster.
>
> It was added later as the feature is not that old. Everything I do 
> build is
> building fine, so in case you see an "awful" lot of breakage it would 
> be nice
> if you could clarify this.
>
I'll post details next time I run into it.     Your solution above 
doesn't fix the problem, as the error the OE build system complaining 
about binaries NOT having the GNU Hash.      There are many packages 
that do not pass the "--hash-style" option from the bitbake configure 
task down to all their makefiles.    I'd have to go back through my 
local copies of recipes that I've patched to see which ones that I've 
had to do "CCFLAGS += ${LDFLAGS}" fix to.   In some cases, I needed to 
put patches in for Makefile.ac files.     Due to the current time crunch 
that I'm in on my current project, I will not have time for several 
weeks to go back through these changes.     It is my  intention to 
submit these patches for inclusion in OE when I have time (if someone 
else hasn't already).

Thank you,
Jay


