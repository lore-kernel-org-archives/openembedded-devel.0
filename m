Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1P2qZv-0002ol-8X
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 21:20:28 +0200
Received: (qmail 31827 invoked by uid 503); 4 Oct 2010 19:45:38 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 4 Oct 2010 19:45:38 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Oct 2010 21:19:46 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 4 Oct 2010 21:19:46 +0200
Message-ID: <4CAA28D1.1010403@eukrea.com>
Date: Mon, 04 Oct 2010 21:19:45 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikO4fHqYzZJ5PDjmWV9Q3a9tBD_Y+rSs0iO6=5m@mail.gmail.com>
In-Reply-To: <AANLkTikO4fHqYzZJ5PDjmWV9Q3a9tBD_Y+rSs0iO6=5m@mail.gmail.com>
X-Ovh-Tracer-Id: 2941413508341738825
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cups issue
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
X-List-Received-Date: Mon, 04 Oct 2010 19:20:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Frans,

Le 04/10/2010 19:17, Frans Meulenbroeks a écrit :
> No idea who is the maintainer of cups, but I found the following issue:
>
> /etc/init.d/cups refers to ps ax but if you have busybox installed
> there are no ax options.
> As busybox has configurable columns it does not seem too good to fix
> cups to be able to handle both procps ps and busybox ps.
> Guess the preferred solution is to add a dependency to procps and get
> the real thing.
>
> However when wanting to make that change I bumped into the following:
>
> We have 6 cups recipes:
>
> cups_1.1.23.bb  cups_1.2.12.bb  cups_1.2.7.bb  cups_1.3.8.bb
> cups_1.4.3.bb  cups_1.4.4.bb
>
> The last three (!) of them have DP = "-1"
> Is there a point in add ing a recipe that has DP = "-1" for a
> prolonged time, then create a new version with DP = -1?
> (btw: and no version is pinned or so).
>
> Guess this recipe needs some love.
>
> (btw cups 1.4.4 solves a number of security issues; guess the best way
> forward is to test 1.4.4, then rm the old insecure stuff).
>
we are using 1.4.4 on armv5te and that works fine. I have a patch 
concerning the ps ax init the init file which does :
if [ /bin/ps -ef /bin/busybox ]; then
    pid=`ps w | awk '{if (match($5, ".*/cupsd$") || $5 == "cupsd") print 
$1}'`
else
    pid=`ps ax | awk '{if (match($5, ".*/cupsd$") || $5 == "cupsd") 
print $1}'`
fi

so it can handle both case fine.
I can push it if this is an acceptable solution.

Eric


