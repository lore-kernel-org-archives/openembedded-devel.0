Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1M7bp6-0004aK-Q5
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 May 2009 22:58:37 +0200
Received: from [10.50.1.165] (unknown [10.50.1.165])
	by hermes.mvista.com (Postfix) with ESMTP
	id A43771ABE7; Fri, 22 May 2009 13:50:50 -0700 (PDT)
Message-Id: <46AB4A4E-10FB-4BD2-8E6B-D6517A502FE8@mvista.com>
From: Christopher Larson <clarson@mvista.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A170CA9.10402@cbnco.com>
Mime-Version: 1.0 (Apple Message framework v930.3)
Date: Fri, 22 May 2009 13:50:50 -0700
References: <DEB73D04-3490-41E1-8C56-C41822C040D9@mvista.com>
	<4A170CA9.10402@cbnco.com>
X-Mailer: Apple Mail (2.930.3)
Subject: Re: amend-recipes.inc
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
X-List-Received-Date: Fri, 22 May 2009 20:58:37 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Ah, I can tell you why that's happening.  This amend-recipes bit has  
to get to FILESPATH in order to find the amend.inc, and expansion of  
FILESPATH is when the base_set_filespaths are called.  Under normal  
circumstances, it wouldn't be expanded until tasks are executed, I  
think.

I expect for now the best bet is to fix those base_set_filespath  
usages :)  I'll see about fixing some this weekend, if I have the time.

On May 22, 2009, at 1:35 PM, Michael Smith wrote:

> Hi Chris,
>
> This works for me. I can put multiple recipes dirs in my  
> COLLECTIONS, set FILESPATHBASE to reference them all, and create a  
> busybox/amend.inc under any of my COLLECTIONS dirs.
>
> There is something strange going on: when I require amend- 
> recipes.inc in my distro config, and the cache is rebuilt, I see  
> deprecation warnings about base_set_filespath that weren't printing  
> before. If I comment out the require line and let bb rebuild the  
> cache, the warnings go away.
>
> About 45 recipes are using base_set_filespath, including glibc,  
> e2fsprogs-native, and many others. I don't see why the warnings  
> don't show up normally if amend-recipes is not included. It looks to  
> me like they would always print, but they don't.
>
> My FILESPATHBASE is set to:
>
> FILESPATHBASE =. "${@ \
>        ':'.join([os.path.join(recipedir, \
>                        os.path.basename(os.path.dirname( \
>                                                d.getVar('FILE',  
> 1)))) \                for recipedir in d.getVar('COLLECTIONS',  
> 1).split()])}:"
>
> and COLLECTIONS is just a list of a few recipes directories, with oe/ 
> recipes last.
>
> Mike
>
> Christopher Larson wrote:
>> I created a little .inc that can be loaded into a distro .conf.  It  
>> just enables the ability to amend bits to a recipe from its  
>> filespath.  I mentioned this in a previous email wrt managing  
>> overlays.  It's incredibly simple, but I'd like a sanity check :)   
>> It seems to work fine in my local test builds.
>> python () {
>>    import bb
>>    amendfile = bb.which(d.getVar("FILESPATH", 1), "amend.inc")
>>    if amendfile:
>>        bb.parse.handle(amendfile, d, 1)
>> }
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Chris Larson
Software Engineer
MontaVista Software, Inc.
Work: 480-517-5031
Home: 480-963-2636
Email: clarson AT mvista DOT com
Email: clarson AT kergoth DOT com



