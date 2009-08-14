Received: from [67.222.38.21] (helo=outbound-mail-121.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <chow.ming@linuxbj.com>) id 1MbqXy-0004l4-54
	for openembedded-devel@openembedded.org; Fri, 14 Aug 2009 08:45:54 +0200
Received: (qmail 12858 invoked by uid 0); 14 Aug 2009 06:29:17 -0000
Received: from unknown (HELO host285.hostmonster.com) (74.220.215.85)
	by outboundproxy4.bluehost.com with SMTP; 14 Aug 2009 06:29:17 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=default; d=linuxbj.com;
	h=Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Identified-User;
	b=Bcnwko6Q+KM7Bb4V3dDXi9TMATfbsuvDfbbN8p6qUKITDGPqNzN6a9GdfTMRxzjcEEjD9CJn99whVYntbQ/L81EfAc2jALmSjF62s96J63jc+RMFQs8ib6umkeOffNQT;
Received: from [222.131.143.214] (helo=[192.168.200.199])
	by host285.hostmonster.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <chow.ming@linuxbj.com>)
	id 1MbqHs-00062v-QN for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 00:29:17 -0600
Message-ID: <4A850430.6060809@linuxbj.com>
Date: Fri, 14 Aug 2009 14:29:04 +0800
From: =?UTF-8?B?TWluZyBDaG93IOWRqOaYjg==?= <chow.ming@linuxbj.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A84650F.1080902@linuxbj.com>
	<200908140406.00714.holger+oe@freyther.de>
In-Reply-To: <200908140406.00714.holger+oe@freyther.de>
X-Identified-User: {2055:host285.hostmonster.com:linuxbjc:linuxbj.com}
	{sentby:smtp auth 222.131.143.214 authed with
	chow.ming@linuxbj.com}
Subject: Re: patch for compcache recipe
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
X-List-Received-Date: Fri, 14 Aug 2009 06:45:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Holger Hans Peter Freyther wrote:
> On Thursday 13 August 2009 21:10:07 Ming Chow 周明 wrote:
>   
>> Hi,
>>
>> I have tried compcache from code.google.com on beagleboard rev B5 and
>> n800 for a couple of weeks. It seems helping me getting more usable memory.
>> The patch will add compcache stuff which provides both compcache kernel
>> modules and managing tool.
>> Tested with recent oe repo on my boards, more evaluation on various real
>> hardware platforms needed though.
>> BTW not touched checksum.ini for the tarball yet.
>>     
>
> Hi,
>
> the patch looks nice. I have three minor comments. 
>   
thanks for your kind advices.
> Would you please add the checksums.ini entry and send the mail with a Signed-
> off-by: line?
>   
Sure. I added the checksum entry.

BTW. I had experienced some checksum mismatch before. A few packages 
which just work can not pass checksum matching. I guess it may be caused 
by hosting or tarball changing without notice. For I am not very clear 
how the global checksum.ini is maintained. I lazily set 
OE_ALLOW_INSECURE_DOWNLOADS.
> I think sending the last two patches (modules_instal target) and not using gcc 
> directly upstream would make sense? Did you already do that?
>
>   
The modules_install patch is for enable "make modules_install" work when 
use the Kernel kbuild system which make it kernel independent. 
Originally, people have to use a load_modules.sh script instead install 
.kos to lib/modules directory. I think a startup script in /etc/init.d 
and a setting file in /etc is a next step work, after find out some 
optimal settings on certain platform/distro combination.

The rzscontrol is compiled to native binary with hardcoded in stock tar 
ball, change to use ${CCLD} make it work arch independent.
> This one is on naming. The exmap kernel module is called "kernel-module-
> exmap", for the sake of consistency you should consider renaming "compach-
> modules" to "kernel-module-compcache"? And maybe install rzscontrol into the 
> compache package too. The reason is that it is not easy to spot the 
> relationship from compache to the rzscontrol package.
>
> z.
>   
Good point. I am sorry for mis-naming the module package. Agree with you.
And which is better do you think:
mix rzscontrol and kernel modules
or
put modules in kernel-module-compcache
put rzscontrol in kernel-module-compcache-utils (or compcache-utils)
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   



