Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Opeiu-0002Xf-OU
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 12:02:49 +0200
Received: (qmail 14655 invoked by uid 503); 29 Aug 2010 10:23:40 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 29 Aug 2010 10:23:40 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Aug 2010 12:02:19 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 29 Aug 2010 12:02:19 +0200
Message-ID: <4C7A302A.5060606@eukrea.com>
Date: Sun, 29 Aug 2010 12:02:18 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.8) Gecko/20100802 Thunderbird/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C79C7C4.1050304@mwester.net>
In-Reply-To: <4C79C7C4.1050304@mwester.net>
X-Ovh-Tracer-Id: 3470867937900342601
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
Subject: Re: ncurses 5.7 doesn't build libtermcap anymore?
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
X-List-Received-Date: Sun, 29 Aug 2010 10:02:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mike,

Le 29/08/2010 04:36, Mike Westerhof a écrit :
> I've been working on some recent problems that popped up in the SlugOS
> feeds; one that appeared recently is that asterisk no longer builds;
> configure complains about -ltermcap, and investigation shows that
> indeed, libtermcap is missing.  It seems that the new ncurses recipe
> (5.7) no longer builds it for some reason.

it's because 5.7's configure is using --with-ticlib which is 
incompatible with --enable-termcap.
On ubuntu, it seems they simply do the following links :
usr/lib/libncurses.so usr/lib/libtermcap.so
usr/lib/libncurses.a  usr/lib/libtermcap.a

>  I think the same problem is
> the root cause for the failure of js to build as well.
>
> So I guess the first question is if this is intentional or not?  If it
> is, then I guess I'll modify the asterisk recipe to remove the
> dependency and submit that patch.  Otherwise, well, I guess I could
> attempt to debug and fix the ncurses recipe, but it looks a bit, um,
> "non-trivial" so any advice would be appreciated.
>
> Or should I just pin ncurses to the old 5.4 version that worked?
>
5.7 is also broken for sdk build, I'm currently trying to fix this, I've 
add the link and tested asterisk's build, patch is coming.

Eric


