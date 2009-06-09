Received: from [75.125.193.18] (helo=alpha.vfshosting.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1MDxir-00079P-6w
	for openembedded-devel@openembedded.org; Tue, 09 Jun 2009 11:34:25 +0200
X-ClientAddr: 127.0.0.1
Received: from sesha.loc (localhost.localdomain [127.0.0.1])
	by alpha.vfshosting.net (8.13.8/8.13.8) with ESMTP id n599Olgm007741
	for <openembedded-devel@openembedded.org>;
	Tue, 9 Jun 2009 11:24:47 +0200
Message-ID: <4A2E2A5D.6050802@gremlin.it>
Date: Tue, 09 Jun 2009 11:24:45 +0200
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <4A185B31.8050003@gremlin.it> <4A2E2230.30700@gmail.com>
In-Reply-To: <4A2E2230.30700@gmail.com>
Subject: Re: trouble with ext2 filesystem
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
X-List-Received-Date: Tue, 09 Jun 2009 09:34:25 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Marco Cavallini wrote:
> Alessandro GARDICH ha scritto:
>   
>> Hi all
>>
>> I notice a problem of the generated filesystem
>>
>> MACHINE = "qemux86"
>> DISTRO = "kaeilos"
>> IMAGE_FSTYPES = "ext2"
>> IMAGE_ROOTFS_SIZE = "102400"
>>
>>
>> building console-image I obtain a .ext2 filesystem with
>> Free blocks:              89357
>> Free inodes:              87
>>
>> notice ... only 87 free inodes !!!
>>
>> after my small and trial patch this is the result
>> Free blocks:              86302
>> Free inodes:              24527
>>
>> maybe 4096 could be too small ... maybe 10k could be good, your choice.
>>
>> At now I modify qemux86.conf cause usually EXTRA_IMAGECMD is in the
>> machine config file, but to add hardware specific parameters (flash size
>>  and erase size). I'm not sure if is the right place. Probably in the
>> distro configuration could be better.
>>
>> thanks in advance
>>
>>
>>     
>
> Thank you for the patch.
>
> Acked-by: Marco Cavallini  <m.cavallini@koansoftware.com>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   
nope ... my mistake ... the patch to ack is the other,
that patch kaeilos.conf and not qemux86.conf


-- 
 /-------------------------------------------------------------\
|           Alessandro Gardich : gremlin@gremlin.it             |
 >-------------------------------------------------------------<
|  I never saw a wild thing sorry for itself.                   |
|  A small bird will drop frozen dead from a bough              |
|  without ever having felt sorry for itself.                   |
 \-------------------------------------------------------------/



