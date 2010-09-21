Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Oy91j-00010K-L9
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 22:01:20 +0200
Received: (qmail 3577 invoked by uid 503); 21 Sep 2010 20:25:30 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 21 Sep 2010 20:25:30 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Sep 2010 22:01:15 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 21 Sep 2010 22:01:15 +0200
Message-ID: <4C990F0B.7080407@eukrea.com>
Date: Tue, 21 Sep 2010 22:01:15 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285077403-21171-1-git-send-email-eric@eukrea.com>	<1285077403-21171-2-git-send-email-eric@eukrea.com>	<1285077403-21171-3-git-send-email-eric@eukrea.com>	<1285077403-21171-4-git-send-email-eric@eukrea.com>	<1285077403-21171-5-git-send-email-eric@eukrea.com>	<4C98ED51.8040707@freyther.de>	<4C98EE40.50205@eukrea.com>
	<4C98F356.3060502@freyther.de>
In-Reply-To: <4C98F356.3060502@freyther.de>
X-Ovh-Tracer-Id: 1083960137183243593
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/7] gdb-cross-sdk: add RDEPENDS
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
X-List-Received-Date: Tue, 21 Sep 2010 20:01:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/09/2010 20:03, Holger Freyther a écrit :
> On 09/22/2010 01:41 AM, Eric Bénard wrote:
>
>> actually this seems to fail.
>
> When building, do you see complains that gcc uses a library but has no known
> package providing that library? E.g. like the messages we saw on the libstdc++
> issue a couple of days/weeks ago.
>
yes :
NOTE: Couldn't find shared library provider for libz.so.1
NOTE: Couldn't find shared library provider for libnsl.so.1
NOTE: Couldn't find shared library provider for libc.so.6
NOTE: Couldn't find shared library provider for libncurses.so.5
NOTE: Couldn't find shared library provider for libtinfo.so.5
NOTE: Couldn't find shared library provider for libz.so.1
NOTE: Couldn't find shared library provider for libm.so.6
NOTE: Couldn't find shared library provider for libpython2.6.so.1.0
NOTE: Couldn't find shared library provider for libexpat.so.1
NOTE: Couldn't find shared library provider for libc.so.6
NOTE: Couldn't find shared library provider for libncurses.so.5
NOTE: Couldn't find shared library provider for libtinfo.so.5
NOTE: Couldn't find shared library provider for libz.so.1
NOTE: Couldn't find shared library provider for libm.so.6
NOTE: Couldn't find shared library provider for libpython2.6.so.1.0
NOTE: Couldn't find shared library provider for libexpat.so.1
NOTE: Couldn't find shared library provider for libc.so.6

>>>
>>>>
>>>>    DEPENDS = "ncurses-sdk zlib-sdk flex-native"
>>>> +RDEPENDS = "ncurses-sdk zlib-sdk"
>>>> \ No newline at end of file
>>>
>>> this will also install the -dev packages?
>>>
>> I don't understand, do you need the -dev packages for gdb-cross is the SDK ?
>
> no, I just wondered what will be installed by the above package name. I think
> RP/Chris can shed some light into this.
>
in the sdk, it installs ncurses-sdk and zlib-sdk.

Eric


