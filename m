Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HNZoF-0003u6-2A
	for openembedded-devel@openembedded.org; Sat, 03 Mar 2007 20:22:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l23JMMEh002370
	for <openembedded-devel@openembedded.org>; Sat, 3 Mar 2007 19:22:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01823-04 for <openembedded-devel@openembedded.org>;
	Sat,  3 Mar 2007 19:22:19 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l23JMIWB002360
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sat, 3 Mar 2007 19:22:18 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45E7F2C4.9030300@dominion.kabel.utwente.nl>
References: <45E77A73.5020800@protium.com>
	<45E7F2C4.9030300@dominion.kabel.utwente.nl>
Date: Sat, 03 Mar 2007 19:22:18 +0000
Message-Id: <1172949738.5942.57.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Sat, 03 Mar 2007 19:22:23 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-03-02 at 10:47 +0100, Koen Kooi wrote:
> As I said, OE still generates 'feeds' in subdirs of deploy/ipk, in contrary of what people
> seem to claim on the mailinglist.

What people are claiming in that the format of deploy/ipk changes from a
single to multiple feeds. This is a behaviour change and people relied
on the old behaviour.

> Using deploy/ipk/ as feed will give you the following problems:
> 
> 1) ipkg doesn't handle upgrades properly if the versions between multiple archtectures
> don't match

An ipkg bug which should be filed somewhere...

> 2) ipkg doesn't handle upgrades proberly when you don't use '-m' (OE does now, but I can
> see people 'optimizing' it and removing '-m' to get more speed)

What does the -m option to ipkg do?

> 3) if you rebuild a package and forget to regenerate Packages your target will freak out
> due to mismatched md5sums

That is a usage problem and one that is easily fixed...

> 4) Packages.filelist can only be generated from scratch, so the former
> deploy/ipk/Packages.filelist was broken

What uses that file?

> That are the easy things, lets look at other problems:
> 
> a) shlib renaming madness. Every now and then something goes wrong with shlib renaming,
> e.g. an app starts shipping an extra util and renaming doesn't work anymore. So you end up
> with 'jpeg_6b.ipk' instead of 'libjpeg6_6b.ipk'. This means you have to edit your Packages
> file to add 'Provides: jpeg' since OE will shlib rename 'RPROVIDES += jpeg' to 'Provides:
> libjpeg6'

This is a problem although it mainly affects long standing distro feeds
rather than people using tmp/deploy as a feed which will probably be
unaffected by such a problem.

> b) Packaging changes without PR bump. If you just blindly rsync, different users will get
> different contents of what appears to be the same package.

Again this is a usage problem. I think people using the feeds directly
will be intelligent enough to be able to deal with this. 

> We aren't even mentioning stripping 'Source:' fields to make ipkg consume less RAM and
> storage.

We could probably improve the OE image feed handling to address that.

> So, knowing all this, do people still want to pretend that a single deploy/ipk feed has no
> problems at all and OE should support it?

Nobody is pretending it has no problems, there are some. People are
saying they're prepared to live with those problems as they need the
feature more.

> On the feed-management tools:
> 
> The splitting scripts (to split feeds into gpe/ and opie/ and varous other ways) got
> removed and I was told "it's out of scope" by Chris (not to mention the surprise when
> 'bitbake world' mangles deploy/ipk).

That kind of feed splitting is out of scope. It would belong in contrib.

>  package-index.bb, however serves a different purpose for me: being able to regenerate 
> Packages so I can look at several control files at once,
> instead of using dpkg-deb or ar -x to extract single ones. I'll happily remove it Matthias
> keeps claiming it's a feed management tool.

IMO, it should stay, it is a useful tool.

> Again: the ability to use deploy as a feed is still present, it only moved to subdirectories.

Which changed a behaviour people were relying on.

My view on this is currently that:

* Being able to use tmp/deploy/ipk as a feed is a useful feature
* we should continue to allow that (as developer use only, not for
building real feeds off)

Since a number of people want the older single feed behaviour, I think
we should have some way of allowing that. I understand why people want
the split feed behaviour too and we should allow people to select that
too. Which should be default I don't really care about.

Cheers,

Richard




