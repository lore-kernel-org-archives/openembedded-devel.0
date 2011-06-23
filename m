Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QZl6B-00059s-Mz for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 16:41:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QZl2W-0001k1-UX for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 16:37:52 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 16:37:52 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 16:37:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 23 Jun 2011 16:37:40 +0200
Message-ID: <itvj3k$1p9$1@dough.gmane.org>
References: <4E03211B.40205@freyther.de>	<1308828119.21613.138.camel@phil-desktop>	<4E032546.6000308@freyther.de>
	<1308839149.21613.165.camel@phil-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1308839149.21613.165.camel@phil-desktop>
X-Enigmail-Version: 1.0.1
Subject: Re: RFC One recipe with two git repository as sources
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
X-List-Received-Date: Thu, 23 Jun 2011 14:41:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-06-11 16:25, Phil Blundell wrote:
> On Thu, 2011-06-23 at 13:36 +0200, Holger Freyther wrote:
>> On 06/23/2011 01:21 PM, Phil Blundell wrote:
>>> On Thu, 2011-06-23 at 13:18 +0200, Holger Freyther wrote:
>>>> -        destdir = os.path.join(destdir, "git/")
>>>> +        destsuffix = ud.parm.get("destsuffix", "git/")
>>>> +        print destsuffix
>>>> +        destdir = os.path.join(destdir, destsuffix)
>>>
>>> I think that "print" might be extraneous, but other than this your patch
>>> looks awesome.  I think this would resolve the problem that I was having
>>> in.
>>
>> great, yeah the print is bogus and the question if and how this applies to
>> fetch/git.py is also unresolved (i had a quick look but have not found the
>> dirname it uses to create the tarball).
> 
> I'm not entirely clear on what's going on with fetch vs fetch2 at all,
> in terms of whether fetch is going away at some point or the two of them
> are meant to be existing in parallel.  Can one of the TSC überhackers
> shed any light on what the intent is there?

Fetch2 is being used in OE-core, fetch is there for "old-style" OE like
.dev and 2011.03-maintenance.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOA0+0MkyGM64RGpERAsmAAJ9D/PrqNupsL/pIF6ClrD39r+RZhQCgpbM+
Rj2c9UxKldqANJJiua4rRNA=
=xv3k
-----END PGP SIGNATURE-----



