Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OCyaD-00047Y-D3
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 19:21:59 +0200
Received: (qmail 3071 invoked by uid 503); 14 May 2010 17:22:09 -0000
Received: from b6.ovh.net (HELO mail624.ha.ovh.net) (213.186.33.56)
	by 27.mail-out.ovh.net with SMTP; 14 May 2010 17:22:08 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 May 2010 17:18:01 -0000
Received: from cug31-2-82-228-86-110.fbx.proxad.net (HELO ?192.168.0.7?)
	(ebenard%eukrea.com@82.228.86.110)
	by ns0.ovh.net with SMTP; 14 May 2010 17:18:00 -0000
Message-ID: <4BED85C7.8000909@eukrea.com>
Date: Fri, 14 May 2010 19:17:59 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: k.kooi@student.utwente.nl
References: <1272921691-6963-1-git-send-email-eric@eukrea.com>	<4BED67FB.1060900@eukrea.com>
	<3D406A77-A498-47BB-A8DD-6BEC7E55D5B6@student.utwente.nl>
In-Reply-To: <3D406A77-A498-47BB-A8DD-6BEC7E55D5B6@student.utwente.nl>
X-Ovh-Tracer-Id: 9639955004377837013
X-Ovh-Remote: 82.228.86.110 (cug31-2-82-228-86-110.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.30.210
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][PATCH] module-base.bbclass: keep PR if MACHINE_KERNEL_PR is not set
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
X-List-Received-Date: Fri, 14 May 2010 17:21:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/05/2010 17:52, Koen Kooi a écrit :
> Op 14 mei 2010, om 17:10 heeft Eric Bénard het volgende geschreven:
>> I was told you are the person to contact about MACHINE_KERNEL_PR so may you please have a look to the patch below - also available here : http://patchwork.openembedded.org/patch/2012/
>>
>> Actually, when compiling modules (out of tree), we loose PR if MACHINE_KERNEL_PR is not set.
>
> I don't believe that when MACHINE_KERNEL_PR isn't set people care about PR.
>
Does that mean that policy is that MACHINE_KERNEL_PR should be set for 
every machine ?
If yes, maybe this should be added in the doc.

Actually only 7 files (4 machines + 3 include) in conf/machine have this 
set and conf/bitbake set it to "" as a default so what aboutdoing ?= 
"r0" in bitbake.conf in order to have a default value as for PR ?

Eric


