Received: from [212.27.42.27] (helo=smtp1-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <amine.saya@free.fr>) id 1GGxRF-0004KK-G1
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 14:39:01 +0200
Received: from [82.243.163.8] (cag06-3-82-243-163-8.fbx.proxad.net
	[82.243.163.8])
	by smtp1-g19.free.fr (Postfix) with ESMTP id 8701EB498
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 14:37:15 +0200 (CEST)
Message-ID: <44F04FFC.1030006@free.fr>
Date: Sat, 26 Aug 2006 15:43:24 +0200
From: Mohammed Amine SAYA <amine.saya@free.fr>
User-Agent: Thunderbird 1.5.0.5 (X11/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <44EFAE66.2040102@free.fr>	<74d0deb30608260409g586bf16bk73c652d3256df6c3@mail.gmail.com>
	<44F0447D.8070309@free.fr>
In-Reply-To: <44F0447D.8070309@free.fr>
Subject: Re: busybox-1.2.1 fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Aug 2006 12:39:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Mohammed Amine SAYA wrote:
> | mv: cannot overwrite directory 
> `/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/bin'
> | mv: cannot overwrite directory 
> `/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/sbin'
> | mv: cannot overwrite directory 
> `/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/usr'
>
>   
> Hi Philipp,
> Thank you for your help.
>   
>> Cannot overwrite directory?
>> Sounds like a permission problem.
>> Did you build as root once?
>>   
>>     
> No
>   
>> Try to manually rm -rf
>> /home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image
>>     
> It worked, I removed it the image directory.
> I used to build opie successfully with the old openembedded database 
> (until monotone 0.25) and bitbake 1.3.X.
> I don't know what's happening. I ls -l almost all busybox directories in 
> $HOME/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1 
> and everything
> seems to belong to me with the right mode.
>
>
>
>   
It turns out that this line inside do_install function in 
busybox_1.2.1.bb file is causing the trouble :
mv ${D}${base_bindir} ${D}${base_sbindir} ${D}${prefix} ${D}/busybox/

I replaced "mv" with "cp -a" and it works, does anyone object to that or 
have a better fix ?


Amine.


