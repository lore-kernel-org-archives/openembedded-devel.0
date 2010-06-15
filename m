Received: from qmta02.westchester.pa.hmc1.comcast.net ([76.96.53.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jfaith@soundmetrics.com>) id 1OOYfd-0004rA-K2
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jun 2010 18:07:26 +0200
Received: from omta02.westchester.pa.hmc1.comcast.net ([76.96.53.7])
	by qmta02.westchester.pa.hmc1.comcast.net with comcast
	id WBDz1e00V09Ku2s09G2ww1; Tue, 15 Jun 2010 16:02:56 +0000
Received: from [192.168.10.133] ([75.147.191.205])
	by omta02.westchester.pa.hmc1.comcast.net with bizsmtp
	id WG2v1e0054SLwm302G2wga; Tue, 15 Jun 2010 16:02:56 +0000
Message-ID: <4C17A3F3.3000705@soundmetrics.com>
Date: Tue, 15 Jun 2010 09:01:55 -0700
From: John Faith <jfaith@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.22) Gecko/20090605 SeaMonkey/1.1.17
	(Ubuntu-1.1.17+nobinonly-0ubuntu1)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <61003.195.148.62.38.1276533099.squirrel@webmail3.nebula.fi>	<1276584950-22168-1-git-send-email-sledz@dresearch.de>
	<4C172F19.30005@dcombus.com>
In-Reply-To: <4C172F19.30005@dcombus.com>
X-SA-Exim-Connect-IP: 76.96.53.9
X-SA-Exim-Mail-From: jfaith@soundmetrics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] busybox-1.11.3/busybox-1.13.2: enable backgrounding for udhcpc
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
X-List-Received-Date: Tue, 15 Jun 2010 16:07:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Henri Bragge wrote:
> Steffen Sledz wrote:
>   
>> * The former default behaviour was to exit with failure if lease is not
>>   immediately obtained. This results in permanent network disconnect if DHCP
>>   server is (accidentally) not available at boot time. :(
>>
>> * Since bb 1.14 this is no longer hardcoded and can be configured.
>>     
>
> Works for me. I'm still not sure if -b should be hardcoded (it could be 
> passed through udhcpc_opts). On the other hand, if someone does not want 
> to leave udhcpc in the background they can just pass -n to it, which 
> seems to override -b. So this fix seems fine.
>
>   
I'd like to have 3 possible network modes: dhcp, zeroconf, or static IP 
and want to switch between them on-the-fly.  It looks like the non-dhcp 
modes can be done using a script or 2 in /etc/udhcpc.d, so it seems 
having udhcpcd running in the background would facilitate this.  Does 
that sound right?

,
John




