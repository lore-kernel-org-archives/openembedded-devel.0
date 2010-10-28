Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PBOjt-00087x-56
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 11:25:42 +0200
Received: (qmail 16869 invoked by uid 503); 28 Oct 2010 09:04:10 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 28 Oct 2010 09:04:10 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 28 Oct 2010 11:24:58 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 28 Oct 2010 11:24:58 +0200
Message-ID: <4CC94169.2030509@eukrea.com>
Date: Thu, 28 Oct 2010 11:24:57 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: holger+oe@freyther.de
References: <4CC49A20.5080001@eukrea.com>
In-Reply-To: <4CC49A20.5080001@eukrea.com>
X-Ovh-Tracer-Id: 4713579960489782625
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: qt4.7.0 : QA problem : Architecture did not match
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
X-List-Received-Date: Thu, 28 Oct 2010 09:25:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Holger,

Le 24/10/2010 22:42, Eric Bénard a écrit :
> building qt4.7.0 using angstrom 2010.x for and armv5te leads to :
> ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 to 3)
> on
> /work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.0-r25.0/packages-split/qt4-embedded-tools/usr/bin/rcc
>
> ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 to 3)
> on
> /work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.0-r25.0/packages-split/qt4-embedded-tools/usr/bin/moc
>
> ERROR: QA Issue with qt4-embedded-tools: Architecture did not match (40 to 3)
> on
> /work/armv5te-angstrom-linux-gnueabi/qt4-embedded-4.7.0-r25.0/packages-split/qt4-embedded-tools/usr/bin/uic
>
> ERROR: Task 498
> (/home/ebenard/OEUKREA/openembedded/recipes/qt4/qt4-embedded_4.7.0.bb,
> do_package) failed with exit code '1'
> ERROR: '/home/ebenard/OEUKREA/openembedded/recipes/qt4/qt4-embedded_4.7.0.bb'
> failed
>
> The patch below (not cleaned if OK, I'll clean and push it) fix this problem,
> but why these installs were added to the 4.7.0.inc file (they are not present
> in 4.6.* and the recipe builds fine without) ?
>
forget this problem, rebuilding from scratch don't show the issue so this 
problem was certainly coming from my tmp being in a bad state.

Eric


