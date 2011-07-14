Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QhNum-0007sX-Fh
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 17:33:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6EFTNkp014264
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 08:29:23 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 14 Jul 2011 08:29:22 -0700
Message-ID: <4E1F0B52.2060905@windriver.com>
Date: Thu, 14 Jul 2011 10:29:22 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4E1DD44D.8020307@matrix-vision.de> <4E1E45FB.201@windriver.com>
	<4E1EEDB8.3090106@matrix-vision.de>
In-Reply-To: <4E1EEDB8.3090106@matrix-vision.de>
Subject: Re: angstrom: glibc: Using config files in /etc/ld.so.conf.d/
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
X-List-Received-Date: Thu, 14 Jul 2011 15:33:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/14/11 8:23 AM, Howard D. Gray wrote:
> Mark,
> 
> On 14/07/11 03:27, Mark Hatle wrote:
>> On 7/13/11 12:22 PM, Howard D. Gray wrote:
>>> Hi,
>>>
>>> IMHO it would be useful if packages could install their own *.conf files
>>> in  /etc/ld.so.conf.d/ ...
> 
>>
>> I agree this is a good idea, however...
>>
>> If the apps you are creating require ld.so.conf, and thus ldconfig in order to
>> execute..  then most likely the app in question has a bug..  (I say most likely,
>> because that is not always true.)
>>
>> For the systems I work with, my rule of thumb is that everything that goes into
>> a system directory should never need ldconfig to run...  If it does, it means
>> there is a broken soname somewhere in the system.
>>
>> For items that are outside of the standard set of directories, they should have
>> rpaths embedded (based on the target filesystem) that tell the components how
>> and where to find their non-standard located components.
> 
>> (chrpath can do this in many cases..)
> 
> OK. For our applications I think we should be able to use rpath when
> building as you suggest or possibly tweak the rpath tag with chrpath
> during installation. I have only very limited control over the build
> process for the libraries used by this app - in particular the directory
> hierarchy - which is why I preferred to install them somewhere
> non-standard.
> 
>> Sometimes when using third party binaries that is not possible of course..
>> However, creating a simple shell wrapper that adds the necessary paths to
>> LD_LIBRARY_PATH is a good solution.
> 
> This is a solution we have used before but it caused confusion for
> normal Linux users with a PC. However, on an embedded board it could be
> the simplest option.
> 
>> But, if all else fails, ld.so.conf should work.
>>
>> IMHO all of the alternatives are better approaches because they ensure the apps
>> and system components work as intended, and don't rely on the crutch of the
>> dynamic loader cache to be able to find the intended items.  Speed wise, if the
>> items are in the standard directories there is no performance penalty (thats
>> I've been able to determine) to -not- have an ld.so.cache on the system.. for
>> items outside of the standard directories, the penalty is so minor -- and only
>> occurs on app startup that it still doesn't make sense to me to have an
>> ld.so.cache...  (it simply takes a lot of disk space, and requires an ldconfig
>> operation to occur.)
>>
>> Long story short, I don't mind the suggestion.. but I will look for alternatives
>> to someone putting in a .conf file over allowing the .conf file any day.
> 
> Just adding the "include" line to ld.so.conf only opens up the
> possibility for other apps to maintain their own *.conf files without
> having to worry about other paths in ld.so.conf. It doesn't mean that
> *.conf files *have* to be used or that ld.so.cache will be required on a
> system without such *.conf files. Of course, it might be considered to
> be encouraging "bad practices".

I agree completely.  I'm willing to ack the addition of the dynamic conf files
to the ld.so.conf file setting.  It would definitely help people working on
their own projects to resolve the issues.

I just don't want to advocate people using this in items checked into oe-core or
meta-oe.  I really feel that the system needs to work (as those layers present
it) without having to run ldconfig.  (Note, any other layers, distributions or
end users are free to use ldconfig if it makes their lives easier.)

--Mark

> In our case I should be able to use one of the other ways you suggest
> and I'll try to do it like that first.
> 
> Thanks a lot for taking the time to explain.
> 



