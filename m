Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1Otirj-00059L-V2
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 17:16:44 +0200
Received: (qmail 4969 invoked by uid 503); 9 Sep 2010 15:27:31 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 9 Sep 2010 15:27:31 -0000
Received: (qmail 21823 invoked by uid 503); 9 Sep 2010 15:00:02 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 9 Sep 2010 15:00:02 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Sep 2010 17:16:02 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 9 Sep 2010 17:16:00 +0200
Message-ID: <4C88FA2F.1030206@eukrea.com>
Date: Thu, 09 Sep 2010 17:15:59 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100825 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1284034317-9428-1-git-send-email-eric@eukrea.com>
	<i6atdj$5b0$1@dough.gmane.org>
In-Reply-To: <i6atdj$5b0$1@dough.gmane.org>
X-Ovh-Tracer-Id: 18027909310095732041
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] fix bitbake ERRORS for machine not having	virtual/egl
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
X-List-Received-Date: Thu, 09 Sep 2010 15:16:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Koen,

Le 09/09/2010 17:10, Koen Kooi a écrit :
On 09-09-10 14:11, Eric Bénard wrote:
>> * This patch creates a egl.inc which contains the compatible machines for
>> recipes depending on virtual/egl and thus will workaround this error.
>
> The intent is good, but I have to NAK this for the time being.
>
> Could you change that to use:
>
> COMPATIBLE_MACHINE = "omap3"?
>
in egl.inc ?
Should this also be changed in powervr-drivers/libgles-omap.inc ?

Then, how do you handle omap3 machines which don't have GLES engine (ex 
OMAP3503) ?

Thanks,
Eric


