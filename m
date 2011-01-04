Received: from p3plsmtpa01-07.prod.phx3.secureserver.net ([72.167.82.87])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1PZymz-0005s2-Ot
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 05:46:30 +0100
Received: (qmail 18599 invoked from network); 4 Jan 2011 04:39:27 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-07.prod.phx3.secureserver.net (72.167.82.87) with ESMTP;
	04 Jan 2011 04:39:27 -0000
Message-ID: <4D22A477.5010205@mwester.net>
Date: Mon, 03 Jan 2011 22:39:19 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D20968B.4030004@mwester.net>
	<ifqdd0$7cl$1@dough.gmane.org>	<4D212058.5050001@mwester.net>
	<ifrv28$ko7$1@dough.gmane.org>
In-Reply-To: <ifrv28$ko7$1@dough.gmane.org>
Subject: Re: [PATCH] e2fsprogs.inc - break shared libs into separate packages
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
X-List-Received-Date: Tue, 04 Jan 2011 04:46:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 1/3/2011 1:49 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 03-01-11 02:03, Mike Westerhof wrote:
>> On 1/2/2011 11:41 AM, Koen Kooi wrote:
>> On 02-01-11 16:15, Mike Westerhof wrote:
>>>>> Break the two shared libraries (libe2p and libext2fs) out of the general e2fsprogs
>>>>> package and into their own packages.  This avoids pulling in unwanted executables
>>>>> when a distro only desires the basic tools (such as e2fsck and/or mke2fs).
>>>>>
>>>>> Signed-off-by: Mike Westerhof <mike@mwester.net>
>>
>> Recipes with e2fsprogs in DEPENDS will need a PR bump as well, since
>> they might link to these libs as well. This will result in missing
>> libraries when using package feeds.
>>
>>> Ok, I can do that.  But I'm not sure I understand why this is the case.
>>>  OE detects the dependencies on the shared libs, and automagically adds
>>> the necessary dependencies to the opkg control file.  Hence, if opkg on
>>> a device updates "e2fsprogs", it will see that the new version of
>>> "e2fsprogs" depends on the two new libraries, and it should pull those
>>> in from the feeds as well.
>>
>>> Perhaps a use-case that will fail will help me understand, and
>>> consequently, help me put together a more-correct patch.
> 
> Say you have built gparted which (r)depends on e2fsprogs and links to
> libe2p. After this patch the "old" gparted in the feeds will only pull
> in e2fsprogs and not libe2p.
> If the e2fsprogs package rdepends on libe2p and friends this isn't a
> problem, but if it doesn't you'll get spurious libs. This has happened a
> number of times in the past and I'd like to avoid it happening in the
> future :)

Got it.  So here's the pertinent line from the control file in the
e2fsck ipk:

"Depends: util-linux-ng, e2fsprogs-badblocks, libext2fs2, libcom-err2,
libe2p2, libuuid1, libc6, libgcc1, libss2, libblkid1"

Both new library packages (libext2fs2 and libe2p2) are present and will
be pulled in by opkg, so no other packages will require PR bumps.

> regards,
> 
> Koen

-Mike (mwester)


