Received: from [81.255.54.16] (helo=mx.laposte.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <c.romain@laposte.net>) id 1Hfbkj-0005gV-TH
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Apr 2007 15:05:17 +0200
Received: from smtp.laposte.net (10.150.9.43) by mx.laposte.net (7.2.060.1)
	id 45FFE62E00F52A78 for openembedded-devel@lists.openembedded.org;
	Sun, 22 Apr 2007 15:05:17 +0200
Received: from smtpin.laposte.net (10.150.9.74) by smtp.laposte.net (7.3.118.6)
	id 46067A8703010788 for openembedded-devel@lists.openembedded.org;
	Sun, 22 Apr 2007 15:05:17 +0200
Received: from [192.168.2.2] (86.221.111.243) by smtpin.laposte.net
	(7.2.060.1) (authenticated as c.romain)
	id 4616B85D00142607 for openembedded-devel@lists.openembedded.org;
	Sun, 22 Apr 2007 15:05:17 +0200
Message-ID: <462B4FB2.5090107@laposte.net>
Date: Sun, 22 Apr 2007 14:06:10 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Thunderbird 2.0.0.0 (X11/20070420)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <462B14AF.50903@gmail.com> <462B3637.7080604@laposte.net>
In-Reply-To: <462B3637.7080604@laposte.net>
Subject: Re: linux-libc-headers build problem for tosa
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 22 Apr 2007 13:05:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

cyril Romain wrote:
> Junqian Gordon Xu wrote:
>   
>> I'm testing my OE build system after upgrading my host to Debian Lenny 
>> (testing). host gcc version: gcc (GCC) 4.1.2 20061115 (prerelease) 
>> (Debian 4.1.1-21),  But I can't pass the stage of building 
>> linux-libc-headers-2.6.xx in either Angstrom or OZ-3.5.5 distro.
>>
>> My local.conf is minimally modified with machine=tosa and qemu-native 
>> assumed.
>>
>> Angstrom bug report: http://bugs.openembedded.org/show_bug.cgi?id=2128
>> OZ-3.5.5 bug report: http://bugs.openembedded.org/show_bug.cgi?id=2132
>>
>>   
>>     
> You need to install scanelf. It is indeed required by the Quality 
> Assurance tests performed in OE.
>   
To overcome the issue, I installed pax-utils in my host Linux system. 
But I admit now that it was not really necessary:
In fact OE already provides the pax-utils-native package, automatically 
built by OE if insane.bbclass is included (angstrom actually includes 
insane.bbclass).
Maybe is there a missing dependency that would force bitbake to build 
pax-utils-native prior to any task that require scanelf (?)

Any thought from bitbake/oe hackers ?

  cyril


