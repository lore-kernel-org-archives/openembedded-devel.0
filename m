Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OyfMA-00022u-7s
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 08:32:47 +0200
Received: (qmail 15036 invoked by uid 503); 23 Sep 2010 06:56:53 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 23 Sep 2010 06:56:53 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Sep 2010 08:32:27 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 23 Sep 2010 08:32:27 +0200
Message-ID: <4C9AF47A.4060806@eukrea.com>
Date: Thu, 23 Sep 2010 08:32:26 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285194952-1831-1-git-send-email-eric@eukrea.com>	<1285194952-1831-2-git-send-email-eric@eukrea.com>
	<AANLkTimVQEU7wgy5rGjj7bzuACSjRhU8DTp1b92OPVTN@mail.gmail.com>
In-Reply-To: <AANLkTimVQEU7wgy5rGjj7bzuACSjRhU8DTp1b92OPVTN@mail.gmail.com>
X-Ovh-Tracer-Id: 17616674368526724425
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
Subject: Re: [PATCH 2/3] qt4-tools-sdk: bring compatibility with	QTCreator
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
X-List-Received-Date: Thu, 23 Sep 2010 06:32:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 23/09/2010 03:55, Cliff Brake a écrit :
> On Wed, Sep 22, 2010 at 6:35 PM, Eric Bénard<eric@eukrea.com>  wrote:
>> * this links "puts" mkspecs at the place where QTCreator search
>> for it in order to detect a toolchain
>> * thanks to this link QTCreator detects the toolchain generated using
>> meta-toolchain-qte and can cross compile applications without any
>> hack
>
> This is somewhat off-topic, but could you outline the procedure you
> use to create a Qt SDK?

bitbake meta-toolchain-qte

> How does this recipe fit in with meta-toolchain-qte?
>
yes, meta-toolchain-qte -> TOOLCHAIN_HOST_TASK -> 
task-qte-toolchain-host -> RDEPENDS  qt4-tools-sdk

> Also, have you done remote debugging with QtCreator -- just curious
> how well that works.
>
I'm finalizing the doc (translating it in english and removing the hacks 
no morenecessary for libmpfr & libncurses & this mkspecs link once the 
patches are in the tree), I'll post a link once it's online (in the 
coming weeks).

Eric


