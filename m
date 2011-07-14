Received: from mail2.matrix-vision.com ([85.214.244.251])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <howard.gray@matrix-vision.de>) id 1QhLwX-0004ag-AX
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 15:27:05 +0200
Received: from mail2.matrix-vision.com (localhost [127.0.0.1])
	by mail2.matrix-vision.com (Postfix) with ESMTP id 839203F646
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:23:05 +0200 (CEST)
Received: from erinome (g2.matrix-vision.com [80.152.136.245])
	by mail2.matrix-vision.com (Postfix) with ESMTPA id 2ED183F613
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:23:05 +0200 (CEST)
Received: from erinome (localhost [127.0.0.1])
	by erinome (Postfix) with ESMTP id B73196F8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:23:04 +0200 (CEST)
Received: by erinome (Postfix, from userid 108)
	id A879C6F9C; Thu, 14 Jul 2011 15:23:04 +0200 (CEST)
Received: from [192.168.65.9] (desmond.intern.matrix-vision.de [192.168.65.9])
	by erinome (Postfix) with ESMTPA id 94AD36F8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2011 15:23:04 +0200 (CEST)
Message-ID: <4E1EEDB8.3090106@matrix-vision.de>
Date: Thu, 14 Jul 2011 15:23:04 +0200
From: "Howard D. Gray" <howard.gray@matrix-vision.de>
Organization: MATRIX VISION GmbH
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101029 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E1DD44D.8020307@matrix-vision.de> <4E1E45FB.201@windriver.com>
In-Reply-To: <4E1E45FB.201@windriver.com>
X-Enigmail-Version: 1.1.1
X-MV-Disclaimer: true (erinome)
X-AV-Checked: ClamAV using ClamSMTP (erinome)
X-AV-Checked: ClamAV using ClamSMTP (mail2)
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
X-List-Received-Date: Thu, 14 Jul 2011 13:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mark,

On 14/07/11 03:27, Mark Hatle wrote:
> On 7/13/11 12:22 PM, Howard D. Gray wrote:
>> Hi,
>>
>> IMHO it would be useful if packages could install their own *.conf files
>> in  /etc/ld.so.conf.d/ ...

> 
> I agree this is a good idea, however...
> 
> If the apps you are creating require ld.so.conf, and thus ldconfig in order to
> execute..  then most likely the app in question has a bug..  (I say most likely,
> because that is not always true.)
> 
> For the systems I work with, my rule of thumb is that everything that goes into
> a system directory should never need ldconfig to run...  If it does, it means
> there is a broken soname somewhere in the system.
> 
> For items that are outside of the standard set of directories, they should have
> rpaths embedded (based on the target filesystem) that tell the components how
> and where to find their non-standard located components.

> (chrpath can do this in many cases..)

OK. For our applications I think we should be able to use rpath when
building as you suggest or possibly tweak the rpath tag with chrpath
during installation. I have only very limited control over the build
process for the libraries used by this app - in particular the directory
hierarchy - which is why I preferred to install them somewhere
non-standard.

> Sometimes when using third party binaries that is not possible of course..
> However, creating a simple shell wrapper that adds the necessary paths to
> LD_LIBRARY_PATH is a good solution.

This is a solution we have used before but it caused confusion for
normal Linux users with a PC. However, on an embedded board it could be
the simplest option.

> But, if all else fails, ld.so.conf should work.
> 
> IMHO all of the alternatives are better approaches because they ensure the apps
> and system components work as intended, and don't rely on the crutch of the
> dynamic loader cache to be able to find the intended items.  Speed wise, if the
> items are in the standard directories there is no performance penalty (thats
> I've been able to determine) to -not- have an ld.so.cache on the system.. for
> items outside of the standard directories, the penalty is so minor -- and only
> occurs on app startup that it still doesn't make sense to me to have an
> ld.so.cache...  (it simply takes a lot of disk space, and requires an ldconfig
> operation to occur.)
> 
> Long story short, I don't mind the suggestion.. but I will look for alternatives
> to someone putting in a .conf file over allowing the .conf file any day.

Just adding the "include" line to ld.so.conf only opens up the
possibility for other apps to maintain their own *.conf files without
having to worry about other paths in ld.so.conf. It doesn't mean that
*.conf files *have* to be used or that ld.so.cache will be required on a
system without such *.conf files. Of course, it might be considered to
be encouraging "bad practices".

In our case I should be able to use one of the other ways you suggest
and I'll try to do it like that first.

Thanks a lot for taking the time to explain.

-- 
Howard


MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner, Erhard Meier


