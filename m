Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PDOCX-0006wH-Ir
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 22:15:35 +0100
Received: (qmail 17922 invoked by uid 503); 2 Nov 2010 21:44:10 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 2 Nov 2010 21:44:10 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Nov 2010 23:14:40 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 2 Nov 2010 23:14:39 +0200
Message-ID: <4CD07F3E.7040703@eukrea.com>
Date: Tue, 02 Nov 2010 22:14:38 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i9p1d0$7q4$1@dough.gmane.org>	<AANLkTimRY+gDbK9jZvUEuxMAu3PvQ8pnfb3oXjAXeU0B@mail.gmail.com>
	<iaptb1$bpb$1@dough.gmane.org>
In-Reply-To: <iaptb1$bpb$1@dough.gmane.org>
X-Ovh-Tracer-Id: 9169047367188589897
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
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Tue, 02 Nov 2010 21:15:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 02/11/2010 21:46, Koen Kooi a écrit :
> I do fear that pulling things into seperate layers too much will make it
> harder to propagate fixes...
>
yes, in your example, the fines in conf/machine/include are common to all omap 
boards (and even all cortexa8 for tune-cortexa8.inc) and thus when fixing one 
BSP you have to think to fix the others (and to communicate the fix to other 
BSP maintainers).
The same apply for most of the .inc in recipes-bsp/*/.

Do you think the following setup is possible ?

- ARM overlay (containing all generic files for ARM achitecture : 
conf/machines/include for example)

- OMAP3 overlay (containing all generic files for OMAP3 SOC : 
conf/machines/include/omap* + recipes/linux u-boot x-load base files for omap3 
architecture,

- specific board overlay (conf/machine/themachine.conf + board specific 
additions in recipes/linux u-boot & x-load (with patches based on top of the 
OMAP3 overlay).

Eric


