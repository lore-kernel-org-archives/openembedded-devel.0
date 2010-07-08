Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OXB5M-0006VU-RM
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 12:45:37 +0200
Received: by fxm12 with SMTP id 12so1010050fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 03:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=y33NyUNp4zGhlAq/FAvvQt9XgwSBXnxVIhCA3azMx68=;
	b=o5aatdIyDHaZTSiEUxMqj7Cw1ehrO0oqAzSXj92zTS3JNVWPZiWS3jp1Mz5n1rlh0q
	AWy7fswOZXzw5Wl+4DjP9ku/AxzjrB9tBPBnIXhD+VzpGBGWQw8K8pAMDlKbP26dDqG4
	mUMYIB54dHrAhDl8BT2EL57uGFiH3RKF2C42U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=e+suW6cUpzJtSS4jaeXHB9r78ipenB6iOE/FztXKZe+EJ0Be0fQmNw29ygSfXVEcb2
	5w8dCpQIvh07ORkBSc+YxtvvKssGmTQ69bJhd/0DgCgr63FTuhV+04XrXVeW+JRVb2yv
	LOwOLGB4dykpxP39/bYbqaGAwkGk/djdgM9Ts=
Received: by 10.86.63.11 with SMTP id l11mr2074901fga.45.1278621904860;
	Thu, 08 Jul 2010 13:45:04 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id 8sm144413fau.4.2010.07.08.13.45.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 08 Jul 2010 13:45:03 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OWxxl-0007r7-QF; Thu, 08 Jul 2010 22:44:53 +0200
Date: Thu, 8 Jul 2010 22:44:53 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20100708204453.GD23169@mx.loc>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com>
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com>
	<20100708202835.GC23169@mx.loc>
	<AANLkTilRuu8FqF_Bz93wjjdm4047LJFe5N2Egs70Adlj@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilRuu8FqF_Bz93wjjdm4047LJFe5N2Egs70Adlj@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 10:45:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 08, 2010 at 01:31:51PM -0700, Khem Raj wrote:
>On Thu, Jul 8, 2010 at 1:28 PM, Bernhard Reutner-Fischer
><rep.dot.nop@gmail.com> wrote:
>> On Thu, Jul 08, 2010 at 12:02:51PM -0700, Khem Raj wrote:
>>>On Tue, Jul 6, 2010 at 12:32 PM, Bernhard Reutner-Fischer
>>><rep.dot.nop@gmail.com> wrote:
>>
>>>> +       uclibc_cfg('bx',        machine_features,'USE_BX', cnf, rem)
>>>
>>>
>>>
>>>I would have a feature called 'nobx' because most of the machines
>>>we support actively in OE has BX. With current state this needs to
>>>be added to MACHINE features for almost all arm machines. We can instead
>>>have nobx and keep USE_BX enabled and only disable it if nobx appears
>>>in machine_features.
>>
>> I'd much prefer to stick bx into some generic arm include instead.
>> What do you think?
>
>I have added attached patch and turned bx into nobx and now all seems to be
>ok

This is conceptionally backwards but i won't complain if this helps in
finally getting the improved infrastructure in.

Separate issues, but what about the other parts below?
thanks,
>>
>>>                     Otherwise I have tested the patches myself
>>>and they seems to work well.
>>>
>>>I will push them once we have the bx turned into nobx
>>>
>>>I think you do not have a function to disable already enabled feature.
>>
>> the 'rem' below translates into sed /SOMETHING/d
>> Can you elaborate?
>> Except you mean DISTRO_FEATURES="ipv4"
>> and one of the gazillion distro-specific config snippets contain
>> CONFIG_IPV6=y
>> and that is not disabled.. About all those distro hunks have to go
>> anyway for they are redundant.
>>
>>>> +       return "\n".join(cnf), "\n".join(rem)
>>>> +# X, Y = ${@features_to_uclibc_settings(d)}
>>>> +# unfortunately doesn't seem to work with bitbake, workaround:
>>
>> you said you saw an ICE with current uclibc master. Which arch and which
>> versions of the toolchain did you use?
>> FYI, i tested qemuarm, qemumips, qemuppc, qemux86 and (my local)
>> qemux86_64 with
>> PREFERRED_BINUTILS = "2.20.1" ¹)
>> PREFERRED_GCC_VERSION = "4.5" ²) ³)
>>
>> and all of built fine for me.
>>
>> ¹) micro.conf incorrectly picks 2.19.51 per default, should be bumped
>> ²) micro.conf should also default to 4.5
>> ³) It would be great if we could settle on one scheme for
>>   binutils/gcc/libc version shorthands:
>>   PREFERRED_BINUTILS_VERSION _or_ PREFERRED_GCC, i'd go for
>>   PREFERRED_foo_VERSION, uniformly.
>>




