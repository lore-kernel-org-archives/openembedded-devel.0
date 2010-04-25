Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O67Rc-0006hx-UK
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 21:24:45 +0200
Received: (qmail 14034 invoked by uid 503); 25 Apr 2010 19:12:07 -0000
Received: from b9.ovh.net (HELO mail638.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 25 Apr 2010 19:12:07 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Apr 2010 19:14:23 -0000
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 25 Apr 2010 19:14:21 -0000
Message-ID: <4BD4948D.5080803@eukrea.com>
Date: Sun, 25 Apr 2010 21:14:21 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1272114888-16964-1-git-send-email-eric@eukrea.com>	<1272114888-16964-2-git-send-email-eric@eukrea.com>	<1272114888-16964-3-git-send-email-eric@eukrea.com>	<1272202763.2387.1.camel@gnutoo-desktop>
	<1272205477.2387.2.camel@gnutoo-desktop>
In-Reply-To: <1272205477.2387.2.camel@gnutoo-desktop>
X-Ovh-Tracer-Id: 10704211889751108937
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	URI_NOVOWEL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/4] mplayer_svn : fix compilation problem
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
X-List-Received-Date: Sun, 25 Apr 2010 19:24:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 25/04/2010 16:24, GNUtoo a écrit :
> On Sun, 2010-04-25 at 15:39 +0200, GNUtoo wrote:
>> On Sat, 2010-04-24 at 15:14 +0200, Eric Benard wrote:
>>> this patch fix the following error (met for a x86 target) :
>> it also fails to load libXss.so.1
> I finally found out the package generating libXss.so.1:
> it's recipes/xorg-lib/libxscrnsaver_1.2.0.bb for me
>
on this target, I'm using mplayer with -vo fbdev2 so I think that's why 
I didn't met this problem !

Eric


