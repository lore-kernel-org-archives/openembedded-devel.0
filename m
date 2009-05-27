Received: from [76.96.53.8] (helo=mq01.hmc1.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1M9LB5-0003c1-5c
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 17:36:27 +0200
Received: from omta01.westchester.pa.hmc1.comcast.net ([76.96.53.6])
	by mq01.hmc1.comcast.net with comcast
	id wdFw1b01G082Dic08fTgBs; Wed, 27 May 2009 15:27:40 +0000
Received: from [192.168.10.129] ([75.147.191.205])
	by omta01.westchester.pa.hmc1.comcast.net with bizsmtp
	id wfUC1b0014SLwm306fUCEk; Wed, 27 May 2009 15:28:13 +0000
Message-ID: <4A1D5C11.5020905@soundmetrics.com>
Date: Wed, 27 May 2009 08:28:17 -0700
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15
	(Ubuntu-1.1.15+nobinonly-0ubuntu0.8.04.2)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4A1C49B6.5050108@soundmetrics.com>
	<00a001c9deab$21665be0$643313a0$@Willis@Distant-earth.com>
In-Reply-To: <00a001c9deab$21665be0$643313a0$@Willis@Distant-earth.com>
Subject: Re: [PATCH] PowerVR init script
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
X-List-Received-Date: Wed, 27 May 2009 15:36:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

John Willis wrote:
>> Hello,
>> Please review the attached patch which lets the PowerVR init script
>> handle start, stop and restart.
>>     
>
> Hi John,
>
> I could have sworn I pushed this as a patch some time ago but it must have
> got lost.
> This is the PowerVR init script we have been using for some time without
> issue on the Beagle and Pandora.
>
> It supports start/stop/restart/force-reload and modprobes the modules rather
> than the insmod/find combo.
> Other than that it is comparable to your patch.
>
> One other note is that you will need to bump the PR on the libgles-omap3_*
> recipes (esp. 3.00.00.06 as that is the one in common use) so that the new
> script gets baked in.
>
> Regards,
>
> John Willis
>   

Hi John,
Your script works for me if I use insmod instead of modprobe, since it 
seems that the default arago-base-image busybox does not have depmod 
enabled.  Also the devmem2 package was not enabled, but that's easy to fix.

It looks like you submitted a patch 2009-03-06.  Did you get any feedback?

Thanks!
,
John



