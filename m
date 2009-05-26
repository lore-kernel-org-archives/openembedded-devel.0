Received: from [76.96.53.8] (helo=mq01.hmc1.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john@soundmetrics.com>) id 1M94k7-0001VM-1u
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 00:03:32 +0200
Received: from omta01.westchester.pa.hmc1.comcast.net ([76.96.53.6])
	by mq01.hmc1.comcast.net with comcast
	id wCkS1b00E082Dic08MuouD; Tue, 26 May 2009 21:54:48 +0000
Received: from [192.168.10.129] ([75.147.191.205])
	by omta01.westchester.pa.hmc1.comcast.net with bizsmtp
	id wMvL1b0014SLwm306MvLFR; Tue, 26 May 2009 21:55:21 +0000
Message-ID: <4A1C6548.7070802@soundmetrics.com>
Date: Tue, 26 May 2009 14:55:20 -0700
From: John Faith <john@soundmetrics.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.21) Gecko/20090303 SeaMonkey/1.1.15
	(Ubuntu-1.1.15+nobinonly-0ubuntu0.8.04.2)
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4A1C49B6.5050108@soundmetrics.com> <gvhm2b$f2m$1@ger.gmane.org>
In-Reply-To: <gvhm2b$f2m$1@ger.gmane.org>
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
X-List-Received-Date: Tue, 26 May 2009 22:03:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 26-05-09 21:57, John Faith wrote:
>   
>> Hello,
>> Please review the attached patch which lets the PowerVR init script
>> handle start, stop and restart.
>>     
>
> Why did you replace the modprobe with insmod? insmod is waaaaaay more
> fragile than modprobe.
>
> regards,
>
> Koen
>
>   
Using the insmod the same way as done for pvrsrvkm.ko worked in my 
environment, but I guess that's not the right general solution even 
though it also uses 'find'.  I wonder why insmod is in the script to 
begin with, assuming depmod was run.

,
John




