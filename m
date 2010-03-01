Received: from mail-yw0-f171.google.com ([209.85.211.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NmDPs-0001oZ-3w
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:44:44 +0100
Received: by ywh1 with SMTP id 1so1315638ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 13:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=lpeMX7JKMfC5XGiv1AMGDvN9m6c3cCApRtHClcPXUl8=;
	b=dadJG0iRLdL76j5R+gUgUdMybivq0Q1uWKiFhdVTxBpDHv/2i9PYFNWbnmo3TK3/2w
	851HaWZK8HJt4OPxjc395Xztu147ff73An3UT310xLZ5R6oaIBtF9mYLyIKne4/r6PDu
	my9hfsXYTO/WIt/3ndh0iZyN9e70no6H5FepQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=THpHgkodoMdMi5OoYUjYHjvKP+zznZBUM+NtcXbootAUCp3NBFcQ9G5PuPrRDUegbr
	WK1iaD30U6ZTFFyMFuOYXlI0Lj0hUG+5TmrcPamNEiMRC2FPb7J8ouFOCsXiWvWEP0XQ
	f6jsetjFw+53fdAljfdIMlg+h0DW9CyDdLrvA=
MIME-Version: 1.0
Received: by 10.101.195.29 with SMTP id x29mr7224102anp.93.1267479709552; Mon, 
	01 Mar 2010 13:41:49 -0800 (PST)
In-Reply-To: <6ec4247d1003011335w5fb01238o4fa7551b96c57406@mail.gmail.com>
References: <ac9c93b11003011327v1ee75303p334cf298ff8516b7@mail.gmail.com>
	<6ec4247d1003011335w5fb01238o4fa7551b96c57406@mail.gmail.com>
Date: Mon, 1 Mar 2010 22:41:49 +0100
Message-ID: <ac9c93b11003011341r61a90746y9e111bccea038650@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.171
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
X-List-Received-Date: Mon, 01 Mar 2010 21:44:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/1 Graham Gower <graham.gower@gmail.com>:
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
> -Graham

Some of them definitely are:

I picked a random example:
./gcc-4.3.2/debian/hurd-changes.dpatch

frans@linux-suse:~/oe/openembedded/recipes/gcc> grep -r hurd-changes.dpatch .
frans@linux-suse:~/oe/openembedded/recipes/gcc>

Actually I suspect that almost all files in the debian dirs are deadweight:
frans@linux-suse:~/oe/openembedded/recipes/gcc> grep debian *
gcc-4.3.1.inc:    file://debian/arm-unbreak-eabi-armv4t.dpatch;patch=1 \
gcc-4.3.1.inc:	file://debian/libstdc++-pic.dpatch;patch=1;pnum=0 \
gcc-4.3.1.inc:	file://debian/gcc-ice-hack.dpatch;patch=1;pnum=0 \
gcc-4.3.1.inc:	file://debian/pr30961.dpatch;patch=1;pnum=0 \
gcc-4.3.2.inc:    file://debian/arm-unbreak-eabi-armv4t.dpatch;patch=1 \
gcc-4.3.2.inc:	file://debian/libstdc++-pic.dpatch;patch=1;pnum=0 \
gcc-4.3.2.inc:	file://debian/gcc-ice-hack.dpatch;patch=1;pnum=0 \
gcc-4.3.2.inc:	file://debian/pr30961.dpatch;patch=1;pnum=0 \
gcc-4.3.3.inc:	file://debian/arm-unbreak-eabi-armv4t.dpatch;patch=1 \
gcc-4.3.3.inc:	file://debian/libstdc++-pic.dpatch;patch=1;pnum=0 \
gcc-4.3.3.inc:	file://debian/gcc-ice-hack.dpatch;patch=1;pnum=0 \
gcc-4.3.3.inc:	file://debian/pr30961.dpatch;patch=1;pnum=0 \
gcc-4.3.4.inc:	file://debian/arm-unbreak-eabi-armv4t.dpatch;patch=1 \
gcc-4.3.4.inc:	file://debian/libstdc++-pic.dpatch;patch=1;pnum=0 \
gcc-4.3.4.inc:	file://debian/gcc-ice-hack.dpatch;patch=1;pnum=0 \
gcc-4.3.4.inc:	file://debian/pr30961.dpatch;patch=1;pnum=0 \
frans@linux-suse:~/oe/openembedded/recipes/gcc>

So we use 4 of them.
and e.g. gcc-4.3.4/debian has 85 files in it:
frans@linux-suse:~/oe/openembedded/recipes/gcc> ls gcc-4.3.4/debian | wc
     85      85    1873

Frans


