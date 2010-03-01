Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmDOq-0001kl-Ni
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:43:40 +0100
Received: by iwn10 with SMTP id 10so2640187iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 13:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=k7uqqvSoIddP1as9eQvchtn12e+B6BmJgPnWy/IwtcM=;
	b=qHh/aEOgMftYGuquN7G1tefOOsHTT2A4APU62hOm/VwOf6NZnov55gWrf/ASjZCBjW
	k11NIbz5naXRSInhgG3A8+1oR+wZQPKaDQ5gPiHDa57x4Kk0LRs5GSutgiw5RBKX9WsI
	Un7gEmz4Y2tOj+lByhPsZo7H2iZNFPJKXN/co=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BErDmP1/VXrvGfTJov2rYnHrs4J8LARwOLxYxC6kDTUZX1i8IKypN0mhaxaeAQbQ4W
	1su92jCNPJ9Olk6l5LAG1UEk7rYiTwgxicmZj5dJ4IlUsJyPjHvZAV/2Iti1Y5QF1Vf4
	RT0rQ9nmuGLqDa1+I5pteLV3NxzfYWrlz2g7Q=
MIME-Version: 1.0
Received: by 10.231.146.134 with SMTP id h6mr495898ibv.16.1267479645583; Mon, 
	01 Mar 2010 13:40:45 -0800 (PST)
In-Reply-To: <6ec4247d1003011335w5fb01238o4fa7551b96c57406@mail.gmail.com>
References: <ac9c93b11003011327v1ee75303p334cf298ff8516b7@mail.gmail.com>
	<6ec4247d1003011335w5fb01238o4fa7551b96c57406@mail.gmail.com>
Date: Mon, 1 Mar 2010 13:40:45 -0800
Message-ID: <19c1b8a91003011340o15052b15td7d1dcbbb2e2bfe9@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Mon, 01 Mar 2010 21:43:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 1, 2010 at 1:35 PM, Graham Gower <graham.gower@gmail.com> wrote:
> On 2 March 2010 07:57, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
>> 2010/3/1 Denys Dmytriyenko <denis@denix.org>:
>>> On Mon, Mar 01, 2010 at 08:10:31AM +1030, Graham Gower wrote:
>>
>>>> What should offend you more is stuff like this:
>>>>
>>>> [grg@rak gcc]$ pwd
>>>> /home/grg/oe/openembedded/recipes/gcc
>>>> [grg@rak gcc]$ find . -name svn-updates.dpatch -exec ls -l {} \;
>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>> ./gcc-4.4.2/debian/svn-updates.dpatch
>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>> ./gcc-4.4.1/debian/svn-updates.dpatch
>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>> ./gcc-4.3.1/debian/svn-updates.dpatch
>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>> ./gcc-4.3.3/debian/svn-updates.dpatch
>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>> ./gcc-4.3.4/debian/svn-updates.dpatch
>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>> ./gcc-svn/debian/svn-updates.dpatch
>>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>>> ./gcc-4.3.2/debian/svn-updates.dpatch
>>>> [grg@rak gcc]$ grep svn-updates *
>>>> [grg@rak gcc]$
>>>
>>> So, there is 125 MB wasted right there... Thanks for the heads up! :)
>>
>> Checked it and the 4.4.[12] and gcc-svn versions are gone.
>> the gcc-4.3.[1-4] versions are still there but seem unused:
>>
>> frans@linux-suse:~/oe/openembedded/recipes/gcc> grep -r svn-updates.dpatch .
>> frans@linux-suse:~/oe/openembedded/recipes/gcc>
>>
>> Howvever as gcc is quite core, I'd rather verify first that it is ok
>> to remove them
>> (or can someone with more gcc knowledge remove)
>>
>> Frans.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> Perhaps there are other patches in the debian directories that are also unused?
>

yes I did clean few of later releases but not older ones. From cloning
point it does not reduce anything
because the files will be there in repo but I cleaned up later
versions because for adding recipes for newer releases from here on
copying patch directories will save us adding unused new files.

Thanks

-Khem


