Received: from [129.132.2.219] (helo=smtp.ee.ethz.ch)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <yuecelm@ee.ethz.ch>) id 1GGxcO-0004Nw-6a
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 14:50:32 +0200
Received: from localhost (tranquillity.ee.ethz.ch [129.132.2.222])
	by smtp.ee.ethz.ch (Postfix) with ESMTP id 0439BD933B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 14:48:46 +0200 (MEST)
Received: from smtp.ee.ethz.ch ([129.132.2.217])
	by localhost (tranquillity [129.132.2.222]) (amavisd-new, port 10024)
	with LMTP id 28411-01-5 for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 14:48:45 +0200 (MEST)
Received: from [192.168.1.2] (73.18.79.83.cust.bluewin.ch [83.79.18.73])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.ee.ethz.ch (Postfix) with ESMTP id A92FED9317
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2006 14:48:45 +0200 (MEST)
Message-ID: <44F04329.3060502@ee.ethz.ch>
Date: Sat, 26 Aug 2006 14:48:41 +0200
From: Mustafa Yuecel <yuecelm@ee.ethz.ch>
User-Agent: Thunderbird 1.5.0.5 (X11/20060728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <44EFAE66.2040102@free.fr>	<74d0deb30608260409g586bf16bk73c652d3256df6c3@mail.gmail.com>	<44F0447D.8070309@free.fr>
	<44F04FFC.1030006@free.fr>
In-Reply-To: <44F04FFC.1030006@free.fr>
X-Enigmail-Version: 0.94.0.0
OpenPGP: id=97882B47
X-Virus-Scanned: by amavisd-new at ee.ethz.ch
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
X-List-Received-Date: Sat, 26 Aug 2006 12:50:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mohammed Amine SAYA wrote:
> Mohammed Amine SAYA wrote:
>> | mv: cannot overwrite directory 
>> `/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/bin'
>> | mv: cannot overwrite directory 
>> `/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/sbin'
>> | mv: cannot overwrite directory 
>> `/home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image/busybox/usr'
>>>
>>> Cannot overwrite directory?
>>> Sounds like a permission problem.
>>> Did you build as root once?
>>>   
>> No
>>   
>>> Try to manually rm -rf
>>> /home/users/asaya/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1/image
>>>     
>> It worked, I removed it the image directory.
>> I used to build opie successfully with the old openembedded database 
>> (until monotone 0.25) and bitbake 1.3.X.
>> I don't know what's happening. I ls -l almost all busybox directories in 
>> $HOME/Work/OpenEmbedded/OpenEmbedded-Dev1-mnt028/build/tmp/work/arm-linux/busybox-1.2.1-r1 
>> and everything
>> seems to belong to me with the right mode.
>>   
> It turns out that this line inside do_install function in 
> busybox_1.2.1.bb file is causing the trouble :
> mv ${D}${base_bindir} ${D}${base_sbindir} ${D}${prefix} ${D}/busybox/
> 
> I replaced "mv" with "cp -a" and it works, does anyone object to that or 
> have a better fix ?

I have the same problem. I think that the installation routine of
busybox was slightly changed. The bin, sbin and usr directories already
exists in the busybox directory, so the above mv command will fail...


