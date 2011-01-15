Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PeEya-000471-W2
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Jan 2011 23:52:05 +0100
Received: by pwi8 with SMTP id 8so638536pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jan 2011 14:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ATbuOd16lxrdD2A22I3ZHAFxe6abxdGmTY+fGo6kREQ=;
	b=giH4Zg9fTuLfuEidpsXuj21GpXi1eQvq1JRbyeyUEgw9rdlTzZJ0VISo0tB7+dxG78
	TMaEIrcSKkMbPqTseZoCpqAvqIy2dzgRGECTPZi2EH1HKp8pyeIGZXUjuIjrkuQHphJR
	+D7XF6OBW4OTs1Lc8Fa6Ud0ZTf9Tsinkhs3/w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=KMBWtwvhmK7cOWTB89yZRkjufZIqWwkZLWR3kbvlPbrauyngxK2h+695iTzLC6/ae4
	B8+fJ/LzhmwS5/6PW8WzRdhx6hWIyp0/GE+BUWEyjiS7id4xAgXvv1Gj073CMuAOOk9O
	WB0nHfDtLNqDAhiBm0SyvtirJvBQ5J7TH1dS0=
Received: by 10.142.125.1 with SMTP id x1mr1999810wfc.377.1295131887340;
	Sat, 15 Jan 2011 14:51:27 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w14sm3920942wfd.6.2011.01.15.14.51.25
	(version=SSLv3 cipher=RC4-MD5); Sat, 15 Jan 2011 14:51:26 -0800 (PST)
Message-ID: <4D3224E7.1090403@gmail.com>
Date: Sat, 15 Jan 2011 14:51:19 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294996238.3578.1.camel@mattotaupa>	<igq6d1$36s$1@dough.gmane.org>	<igq7l2$a8s$1@dough.gmane.org>	<AANLkTineRKBLdhFHm-p2K1qK49vXe0tp6N1c3XeSUVbS@mail.gmail.com>	<igqg4k$lv7$1@dough.gmane.org>
	<AANLkTi=nQgfcQ0LE3Pvz2DqJwt5ABaJqmkxvsR+Bg6O7@mail.gmail.com>
In-Reply-To: <AANLkTi=nQgfcQ0LE3Pvz2DqJwt5ABaJqmkxvsR+Bg6O7@mail.gmail.com>
Subject: Re: [PATCH] python.inc: add `--disable-ipv6` to `EXTRA_OECONF`
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
X-List-Received-Date: Sat, 15 Jan 2011 22:52:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/2011 2:12 PM, Khem Raj wrote:
> On Fri, Jan 14, 2011 at 1:44 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 14-01-11 21:16, Khem Raj wrote:
>>> On Fri, Jan 14, 2011 at 11:20 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>>> On 14-01-11 19:58, Koen Kooi wrote:
>>>>>> On 14-01-11 10:10, Paul Menzel wrote:
>>>>>>>  From b2e249702a0f6b5e36a4b095f5a4c495aa5ec14f Mon Sep 17 00:00:00 2001
>>>>>>> From: Paul Menzel<paulepanter@users.sourceforge.net>
>>>>>>> Date: Fri, 14 Jan 2011 09:48:08 +0100
>>>>>>> Subject: [PATCH] python.inc: add `--disable-ipv6` to `EXTRA_OECONF`
>>>>>>
>>>>>>> Since commit d729d14d [1] task `configure` for `python_2.6.5` and `python_2.7.1` fails with the following error message when compiling with `angstrom_2008.1` for `MACHINE = "beagleboard"`.
>>>>>>
>>>>>>>       checking for major... yes
>>>>>>>       checking for getaddrinfo... yes
>>>>>>>       checking getaddrinfo bug... buggy
>>>>>>>       Fatal: You must get working getaddrinfo() function.
>>>>>>>                    or you can specify "--disable-ipv6".
>>>>>>>       ERROR: Function do_configure failed
>>>>>>
>>>>>>> Disable IPv6 for now in Python unconditionally until a better solution is found.
>>>>>>
>>>>>> I don't think disabling ipv6 is the way to go, I'm comparing the eglibc
>>>>>> before and after d729d14d to see if that reveals a clue. If it doesn't,
>>>>>> let's put in your patch for the time being.
>>>
>>> .... and the difference is that options-group.config is empty before d72
>>> and fully populated after it. OPTION_EGLIBC_ADVANCED_INET6 is set to Y
>>> in both cases it seems.
>>>
>>>> I was expecting it to converge to this. Do u see that libraries
>>>> libc.so before and after have different content too ?
>>>> Could be that the option config mechanism is getting it wrong somehow
>>>> may be I should only populate options-group.config
>>>> with disabled features
>>
>> Populating it only with disabled features would match the old behaviour
>> and should make python build again. I doesn't give us the root cause,
>> but at least it would build :)
>
> yeah it would be a bug in option config if it could not deal with an
> option being set to 'y' twice
>
>>

OK it has nothing to do with eglibc change. Infact its due to

commit a88aca1d7dfa3a08957dd49cb61bac850f197106
Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date:   Wed Jan 12 20:34:55 2011 +0100

     autotools.bbclass: pass distro_imposed_configure_flags



This makes --enable-ipv6 passed to configure of all recipes
which use autotools. Now in configure there is a runtime test
to determine buggygetaddrinfo and as we are cross compiling this test 
goes wrong and if ipv6 is enabled then its reported as fatal

if test "$ipv6" = "yes"; then
echo 'Fatal: You must get working getaddrinfo() function.'
echo '       or you can specify "--disable-ipv6"'.


One solution we have is that we cache this variable

I will post a patch in this direction soon.

Thanks
-Khem


