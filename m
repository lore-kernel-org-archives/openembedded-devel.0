Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OCz0d-0004GA-Mn
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 19:49:24 +0200
Received: (qmail 17314 invoked by uid 503); 14 May 2010 17:49:28 -0000
Received: from b6.ovh.net (HELO mail624.ha.ovh.net) (213.186.33.56)
	by 27.mail-out.ovh.net with SMTP; 14 May 2010 17:49:27 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 May 2010 17:45:21 -0000
Received: from cug31-2-82-228-86-110.fbx.proxad.net (HELO ?192.168.0.7?)
	(ebenard%eukrea.com@82.228.86.110)
	by ns0.ovh.net with SMTP; 14 May 2010 17:45:20 -0000
Message-ID: <4BED8C2F.1080500@eukrea.com>
Date: Fri, 14 May 2010 19:45:19 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1272921691-6963-1-git-send-email-eric@eukrea.com>	<4BED67FB.1060900@eukrea.com>	<3D406A77-A498-47BB-A8DD-6BEC7E55D5B6@student.utwente.nl>	<4BED85C7.8000909@eukrea.com>
	<hsk1il$v4j$2@dough.gmane.org>
In-Reply-To: <hsk1il$v4j$2@dough.gmane.org>
X-Ovh-Tracer-Id: 10101573965955116361
X-Ovh-Remote: 82.228.86.110 (cug31-2-82-228-86-110.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.30.210
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Fri, 14 May 2010 17:49:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/05/2010 19:34, Koen Kooi a écrit :
> On 14-05-10 19:17, Eric Bénard wrote:
>> Le 14/05/2010 17:52, Koen Kooi a écrit :
>>> Op 14 mei 2010, om 17:10 heeft Eric Bénard het volgende geschreven:
>>>> I was told you are the person to contact about MACHINE_KERNEL_PR so
>>>> may you please have a look to the patch below - also available here :
>>>> http://patchwork.openembedded.org/patch/2012/
>>>>
>>>> Actually, when compiling modules (out of tree), we loose PR if
>>>> MACHINE_KERNEL_PR is not set.
>>>
>>> I don't believe that when MACHINE_KERNEL_PR isn't set people care
>>> about PR.
>>>
>> Does that mean that policy is that MACHINE_KERNEL_PR should be set for
>> every machine ?
>> If yes, maybe this should be added in the doc.
>
> IMO yes, but some people were against it. Either their kernel never
> changes or they don't care about out-of-tree modules breaking on kernel
> changes.
>
so why not setting r0 as a default in bitbake.conf as a compromise ?

Eric


