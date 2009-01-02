Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LIoqA-0002vO-I2
	for openembedded-devel@openembedded.org; Fri, 02 Jan 2009 19:33:46 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>)
	id 1LIokc-0005LZ-LH; Fri, 02 Jan 2009 12:28:02 -0600
Message-ID: <495E5CB9.9050600@dls.net>
Date: Fri, 02 Jan 2009 12:28:09 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org, opkg-devel@googlegroups.com
References: <1230617755.15416.11.camel@linux-yrgm.site>
	<565965130812300016v5dd07382j232434c91017dac4@mail.gmail.com>
In-Reply-To: <565965130812300016v5dd07382j232434c91017dac4@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IG9wa2cvb3BrZy1uYXRpdmVfc3ZuLmJiOiAi77u/c3ZuIGNvIC1yIDE5NCBodHRwOi8vc3ZuLm9wZW5tb2tvLm9yZy90cnVuay9zcmMvdGFyZ2V0Ly9vcGtnQDE5NCIgZmFpbHMh?=
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
X-List-Received-Date: Fri, 02 Jan 2009 18:33:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Tick Chen wrote:
> hi Ulf,
>   Would you like to check your opkg.inc
> It should point to svn://opkg.googlecode.com/svn;module=trunk;proto=http

This change has caused quite a bit of disruption -- and at this moment,
opkg is broken and there is no way to find a working version.

The last "stable" version (as specified in the sane srcrevs file) was
4838.  I had tested (successfully) with 4870.

If all the history was moved along in the move to the new upstream repo
at googlecode, there is no tagging or even a README that would map any
of the old (significant) version numbers to the new ones.

The result is that I have no choice but to revert to the old repository
and the known-good version numbers there in order to get opkg working
correctly again -- even though it may very well be that the same sources
are in the new repo, and that (if someone had provided tags or some
mapping file) selecting a SRCREV would suffice to work around this
instability. :(

If someone can provide a mapping of either of the two SRCREVs listed
above (4838 or 4870) to the new repo, then we can avoid having to revert
that last opkg commit.

Mike (mwester)


BTW, the bug right now is displayed in the example below -- the code
erroneously attempts to update the status file twice.  This has been
reported.

root@machine:~# opkg install tzdata
Installing tzdata (2007k-r3.01) to root...
Downloading
http://xyz.thing.com/feeds/myfeed/tzdata_2007k-r3.01_armv5teb.ipk
Configuring tzdata
file_move: ERROR: failed to rename //usr/lib/opkg/status.tmp to
//usr/lib/opkg/status: No such file or directory
root@machine:~#



