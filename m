Received: from [212.27.42.35] (helo=smtp5-g19.free.fr)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <amine.saya@free.fr>) id 1GGwfw-0007qS-AT
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 13:50:08 +0200
Received: from [82.243.163.8] (cag06-3-82-243-163-8.fbx.proxad.net
	[82.243.163.8])
	by smtp5-g19.free.fr (Postfix) with ESMTP id 889B727424
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 13:48:22 +0200 (CEST)
Message-ID: <44F0447D.8070309@free.fr>
Date: Sat, 26 Aug 2006 14:54:21 +0200
From: Mohammed Amine SAYA <amine.saya@free.fr>
User-Agent: Thunderbird 1.5.0.5 (X11/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <44EFAE66.2040102@free.fr>
	<74d0deb30608260409g586bf16bk73c652d3256df6c3@mail.gmail.com>
In-Reply-To: <74d0deb30608260409g586bf16bk73c652d3256df6c3@mail.gmail.com>
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
X-List-Received-Date: Sat, 26 Aug 2006 11:50:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:
> On 8/26/06, Mohammed Amine SAYA <amine.saya@free.fr> wrote:
>   
>> Hi all,
>> I am trying to build an opie image but busybox fails.
>> I got this :
>>     
> [...]
>   
>> |
>> /home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/usr/share/udhcpc:
>>
>> | default.script
>>     
| mv: cannot overwrite directory 
`/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/bin'
| mv: cannot overwrite directory 
`/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/sbin'
| mv: cannot overwrite directory 
`/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/usr'

>> | mv: cannot overwrite directory
>>     
>
>   
Hi Philipp,
Thank you for your help.
> Cannot overwrite directory?
> Sounds like a permission problem.
> Did you build as root once?
>   
No
> Try to manually rm -rf
> /home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image
It worked, I removed it the image directory.
I used to build opie successfully with the old openembedded database 
(until monotone 0.25) and bitbake 1.3.X.
I don't know what's happening. I ls -l almost all busybox directories in 
$HOME/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1 
and everything
seems to belong to me with the right mode.


Still not working.

Amine.




