Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OD1Sd-0003lU-Th
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 22:26:20 +0200
Received: (qmail 17421 invoked by uid 503); 14 May 2010 20:20:27 -0000
Received: from b6.ovh.net (HELO mail30.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 14 May 2010 20:20:27 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 May 2010 20:15:43 -0000
Received: from cug31-2-82-228-86-110.fbx.proxad.net (HELO ?192.168.0.7?)
	(ebenard%eukrea.com@82.228.86.110)
	by ns0.ovh.net with SMTP; 14 May 2010 20:15:42 -0000
Message-ID: <4BEDAF6D.5010704@eukrea.com>
Date: Fri, 14 May 2010 22:15:41 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1272921691-6963-1-git-send-email-eric@eukrea.com>	<4BED67FB.1060900@eukrea.com>	<3D406A77-A498-47BB-A8DD-6BEC7E55D5B6@student.utwente.nl>	<4BED85C7.8000909@eukrea.com>
	<hsk1il$v4j$2@dough.gmane.org>	<4BED8C2F.1080500@eukrea.com>
	<1273866959.4465.5.camel@lenovo.internal.reciva.com>
In-Reply-To: <1273866959.4465.5.camel@lenovo.internal.reciva.com>
X-Ovh-Tracer-Id: 12641041205285334345
X-Ovh-Remote: 82.228.86.110 (cug31-2-82-228-86-110.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.65
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
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
X-List-Received-Date: Fri, 14 May 2010 20:26:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/05/2010 21:55, Phil Blundell a écrit :
> On Fri, 2010-05-14 at 19:45 +0200, Eric Bénard wrote:
>> so why not setting r0 as a default in bitbake.conf as a compromise ?
>
> A default MACHINE_KERNEL_PR, you mean?  That would cause PR to suddenly
> go backwards for a whole bunch of machines, which would definitely not
> be a good thing.  See the mailing list archive; there was quite a lot of
> discussion of these kinds of issues at the time that the M_K_PR change
> was originally landed.
>
yes, in this case MACHINE_KERNEL_PR would overide kernel's PR which is 
not what we want.

So actually the fix I propose is needed as while MACHINE_KERNEL_PR is 
not required by policy, module-base.bbclass is broken for machines 
without MACHINE_KERNEL_PR.

Eric


