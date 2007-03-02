Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HN4Mk-0001ua-Ot
	for openembedded-devel@openembedded.org; Fri, 02 Mar 2007 10:47:54 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l229loox005842 for <openembedded-devel@openembedded.org>;
	Fri, 2 Mar 2007 10:47:50 +0100
Message-ID: <45E7F2C4.9030300@dominion.kabel.utwente.nl>
Date: Fri, 02 Mar 2007 10:47:48 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45E77A73.5020800@protium.com>
In-Reply-To: <45E77A73.5020800@protium.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev rootfs_ipk: as per OE, policy:	remove feed management tools
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
X-List-Received-Date: Fri, 02 Mar 2007 09:47:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andy Wilcox schreef:
> Mickey writes:
>> Guys, please don't play games. Since it is a handy feature indeed,
>> can we perhaps agree on making this a seperate bbclass to keep both of
>> you satisfied?
>>   
> Agreed.  Any big behavior change like this should have much more discussion.
> It might be wrong, but sometimes bugs become features.  Get used to it.
> 
> Feed generation is one way I sold OE internally and one reason why
> it is so terribly useful.  If it has to come out for some policy, then 
> perhaps the
> policy should be revisited.

As I said, OE still generates 'feeds' in subdirs of deploy/ipk, in contrary of what people
seem to claim on the mailinglist.

Using deploy/ipk/ as feed will give you the following problems:

1) ipkg doesn't handle upgrades properly if the versions between multiple archtectures
don't match
2) ipkg doesn't handle upgrades proberly when you don't use '-m' (OE does now, but I can
see people 'optimizing' it and removing '-m' to get more speed)
3) if you rebuild a package and forget to regenerate Packages your target will freak out
due to mismatched md5sums
4) Packages.filelist can only be generated from scratch, so the former
deploy/ipk/Packages.filelist was broken

That are the easy things, lets look at other problems:

a) shlib renaming madness. Every now and then something goes wrong with shlib renaming,
e.g. an app starts shipping an extra util and renaming doesn't work anymore. So you end up
with 'jpeg_6b.ipk' instead of 'libjpeg6_6b.ipk'. This means you have to edit your Packages
file to add 'Provides: jpeg' since OE will shlib rename 'RPROVIDES += jpeg' to 'Provides:
libjpeg6'
b) Packaging changes without PR bump. If you just blindly rsync, different users will get
different contents of what appears to be the same package.

We aren't even mentioning stripping 'Source:' fields to make ipkg consume less RAM and
storage.

So, knowing all this, do people still want to pretend that a single deploy/ipk feed has no
problems at all and OE should support it?

On the feed-management tools:

The splitting scripts (to split feeds into gpe/ and opie/ and varous other ways) got
removed and I was told "it's out of scope" by Chris (not to mention the surprise when
'bitbake world' mangles deploy/ipk). package-index.bb, however serves a different purpose
for me: being able to regenerate Packages so I can look at several control files at once,
instead of using dpkg-deb or ar -x to extract single ones. I'll happily remove it Matthias
keeps claiming it's a feed management tool.

Again: the ability to use deploy as a feed is still present, it only moved to subdirectories.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF5/LEMkyGM64RGpERAlvcAJ0cMcDEBXGznkAUTbV+aBA4+HmJrgCgs6J5
iwQP4Ko2H18hcZTB/VnLoN4=
=Zdv6
-----END PGP SIGNATURE-----


