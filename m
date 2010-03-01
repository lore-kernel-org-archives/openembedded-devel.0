Received: from mail-yx0-f203.google.com ([209.85.210.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NmDSf-00020o-0j
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:47:37 +0100
Received: by yxe41 with SMTP id 41so1230412yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=/vCEhrgFSwqWoqAxWce06Omk3b1X1N0o1wFOykwIHmc=;
	b=o2qTZ//nPEzikWth20eEW4mzrXP1igltsqaugZxSRTGNTUh5uOCZ5va9CHpGxjM4FF
	lKhe9vHToBMZvUjVwKM2AT38UJ2rZgvGFoEpzy046dXUPiZJt5CMwRB08h8b4JW9CaXF
	R89gjQCpOlj4mzCaVBCkPYpbNTHKRsnZespoo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xl1PMGC68RNfSqAdE1U69E8W6GCuhFXWDDNDtvAT49sa30a+O0FGOkyygTKFktO1DN
	Ui85QY3Wczt5w7yBbFKLMZrswAQP99el64iFQB58LsJlgk20kI0DLLGAOCF4yWmkfyUg
	xd0ae/9ZgrrK60H3sAMl+3tazokFuQgk9hO4Y=
MIME-Version: 1.0
Received: by 10.101.90.7 with SMTP id s7mr7176124anl.176.1267479881216; Mon, 
	01 Mar 2010 13:44:41 -0800 (PST)
In-Reply-To: <19c1b8a91003011340o15052b15td7d1dcbbb2e2bfe9@mail.gmail.com>
References: <ac9c93b11003011327v1ee75303p334cf298ff8516b7@mail.gmail.com>
	<6ec4247d1003011335w5fb01238o4fa7551b96c57406@mail.gmail.com>
	<19c1b8a91003011340o15052b15td7d1dcbbb2e2bfe9@mail.gmail.com>
Date: Mon, 1 Mar 2010 22:44:41 +0100
Message-ID: <ac9c93b11003011344r5a7cce08t6e5d8f6884ca0c5f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.203
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] remove unused svn-updates.dpatch files
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
X-List-Received-Date: Mon, 01 Mar 2010 21:47:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/1 Khem Raj <raj.khem@gmail.com>:
> On Mon, Mar 1, 2010 at 1:35 PM, Graham Gower <graham.gower@gmail.com> wrote:
>> On 2 March 2010 07:57, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>>> 2010/3/1 Denys Dmytriyenko <denis@denix.org>:
>>>> On Mon, Mar 01, 2010 at 08:10:31AM +1030, Graham Gower wrote:
>>>
>>>>> What should offend you more is stuff like this:
>>>>>
>>>>> [grg@rak gcc]$ pwd
>>>>> /home/grg/oe/openembedded/recipes/gcc
>>>>> [grg@rak gcc]$ find . -name svn-updates.dpatch -exec ls -l {} \;
>>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>>> ./gcc-4.4.2/debian/svn-updates.dpatch
>>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>>> ./gcc-4.4.1/debian/svn-updates.dpatch
>>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>>> ./gcc-4.3.1/debian/svn-updates.dpatch
>>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>>> ./gcc-4.3.3/debian/svn-updates.dpatch
>>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>>> ./gcc-4.3.4/debian/svn-updates.dpatch
>>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>>> ./gcc-svn/debian/svn-updates.dpatch
>>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>>> ./gcc-4.3.2/debian/svn-updates.dpatch
>>>>> [grg@rak gcc]$ grep svn-updates *
>>>>> [grg@rak gcc]$
>>>>
>>>> So, there is 125 MB wasted right there... Thanks for the heads up! :)
>>>
>>> Checked it and the 4.4.[12] and gcc-svn versions are gone.
>>> the gcc-4.3.[1-4] versions are still there but seem unused:
>>>
>>> frans@linux-suse:~/oe/openembedded/recipes/gcc> grep -r svn-updates.dpatch .
>>> frans@linux-suse:~/oe/openembedded/recipes/gcc>
>>>
>>> Howvever as gcc is quite core, I'd rather verify first that it is ok
>>> to remove them
>>> (or can someone with more gcc knowledge remove)
>>>
>>> Frans.
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> Perhaps there are other patches in the debian directories that are also unused?
>>
>
> yes I did clean few of later releases but not older ones. From cloning
> point it does not reduce anything
> because the files will be there in repo but I cleaned up later
> versions because for adding recipes for newer releases from here on
> copying patch directories will save us adding unused new files.
>
> Thanks
>
Are you in favor of cleaning up 4.3.* too?
Although it does not help from cloning point it does not clutter the
dir and distract people from the real patches.
FM


