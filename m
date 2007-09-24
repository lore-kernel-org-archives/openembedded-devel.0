Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lpotter@trolltech.com>) id 1IZtqA-0005pK-Lu
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Sep 2007 21:43:36 +0200
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP
	id 3FF587422C; Mon, 24 Sep 2007 21:39:14 +0200 (CEST)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP
	id CDA557418A; Mon, 24 Sep 2007 21:39:13 +0200 (CEST)
Received: from [172.18.1.4] (unknown [172.18.1.4])
	by mail.trolltech.com.au (Postfix) with ESMTP id 980CB37BA38;
	Tue, 25 Sep 2007 05:39:11 +1000 (EST)
Message-ID: <46F8125E.5060200@trolltech.com>
Date: Tue, 25 Sep 2007 05:39:10 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.2) Gecko/20070221 SeaMonkey/1.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <46F587F7.4060501@balister.org> <46F80688.2020702@trolltech.com>
	<70B54FE7-41C6-4C21-AB2D-073399350E5A@gumstix.com>
In-Reply-To: <70B54FE7-41C6-4C21-AB2D-073399350E5A@gumstix.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: How should OE be used?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2007 19:43:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Craig Hughes wrote:
> On Sep 24, 2007, at 11:48 AM, Lorn Potter wrote:
> 
>> I have always thought that oe needed an easier way to choose packages,
>> like buildroot.
>>
>> Some gui that can edit all the conf's and task's, and image.bb's
>> painlessly and easily would make a tom of difference.
>> The learning curve for oe is too high.
>>
>> Take buildroot, for example. A person can download it, run make
>> menuconfig, set up the system, arch, and select packages, all in  
>> one go.
>> You do not need to know that you should have to either edit or create
>> your own tasks, or image .bb's, much less the syntax for those files.
> 
> You're kind of comparing apples to tangerines though.  

not really,.

> In buildroot,  
> yes, for packages which already exist (and work properly -- there's  
> much dead wood in buildroot) you can select them to be compiled using  
> a menuconfig/xconfig thing.  But in OE, you could just download and  
> install the .ipkg instead, which is a lot cleaner.  

Not necessarily. Where's the ipkg for a custom device that hasn't been 
built yet?


> Buildroot is  
> missing 90% of the packages which are in OE, and for those, in  

Most people are not going to want to build 90% of the packages in oe, 
especially for embedded/small devices.
We have a custom build script for the greenphone that builds the 
toolchain, uses those libs/binutils for the system, then 
downloads/builds 24 packages. at _most_.


> buildroot, you'd have to write your own package/*.mk, as well as  
> figure out what patches you need to implement to get the package to  
> cross-compile, etc.  And you definitely need to learn the ins and  
> outs of how buildroot does things internally to implement one of  
> those *.mk files correctly.

Makefile format is more widely known than the format and syntax used in OE.

> 
> But your basic premise of select-packages-to-go-into-image using some  
> kind of UI thing does make sense.  I just don't think it's as bad in  
> OE as you think, nor as good in buildroot ;)


-- 
Lorn 'ljp' Potter
Software Engineer, Systems Group, MES, Trolltech


