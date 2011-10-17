Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RFv9B-0004DK-IT
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 23:55:01 +0200
Received: by qam2 with SMTP id 2so825178qam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 14:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=3T65mWNhfMEPcev5K/qqhEjYTfG1/4OAsJV8e4rYABI=;
	b=a/eE+AcB64xFqPCgo3vvpmH4YShD7Hbwl6Y5O4uOWqo3ltWJVp/MJK0K5rvKFk63Nl
	i8KJjVfbDi6aYMiSvkqw05SOmoW/S54/d2zX0VtaiWDvL6eKPLIBYr8HXfOwKjHiM0gN
	rzslUV5BlyNVwTWqh07SdIV6D5PNGQuxCbwig=
Received: by 10.229.63.65 with SMTP id a1mr4690149qci.174.1318888151653;
	Mon, 17 Oct 2011 14:49:11 -0700 (PDT)
Received: from [172.23.8.192] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id fj8sm23237098qab.9.2011.10.17.14.49.08
	(version=SSLv3 cipher=OTHER); Mon, 17 Oct 2011 14:49:09 -0700 (PDT)
Message-ID: <4E9CA2D1.2000304@gmail.com>
Date: Mon, 17 Oct 2011 14:49:05 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20111015185155.DA982101FE@opal>
	<CAAQYJAvm1mGo6sswMBPx+tgQfZapTqX4E1SXSsZKU25D-u1eDA@mail.gmail.com>
	<CAMKF1sqEQtqCMi+p6yEArDWpiGGS2Du1ca34ROtkFAzdc-X3MA@mail.gmail.com>
	<CACW_hTYw8eSDh6z_Q+v6aK9CoF-9D5Ba0+fp4beuLuA9oi7NAw@mail.gmail.com>
In-Reply-To: <CACW_hTYw8eSDh6z_Q+v6aK9CoF-9D5Ba0+fp4beuLuA9oi7NAw@mail.gmail.com>
Subject: Re: [oe-commits] Khem Raj : binutils-cross: Sync with oe-core
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
X-List-Received-Date: Mon, 17 Oct 2011 21:55:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2011 11:35 PM, Frans Meulenbroeks wrote:
> 2011/10/17 Khem Raj<raj.khem@gmail.com>
>
>> On Sun, Oct 16, 2011 at 2:37 PM, Andrea Adami<andrea.adami@gmail.com>
>> wrote:
>>> On Sat, Oct 15, 2011 at 8:51 PM,<git@git.openembedded.org>  wrote:
>>>
>>>> Module: meta-openembedded.git
>>>> Branch: master
>>>> Commit: 92b02b7209e426a70cc5626e7bdbc82052e01ac5
>>>> URL:
>>>>
>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=92b02b7209e426a70cc5626e7bdbc82052e01ac5
>>>>
>>>> Author: Khem Raj<raj.khem@gmail.com>
>>>> Date:   Sun Oct 16 01:28:32 2011 +0000
>>>>
>>>> binutils-cross: Sync with oe-core
>>>>
>>>> Now we have own copy of binutils-cross in meta-oe
>>>>
>>>
>>> I can't unfortunately find the discussion which supposedly provided a
>> valid
>>> reason for binutils-2.20 in meta-oe while binutils-2.21 is in oe-core.
>>> I'm against that kind of policy for meta-oe, particularly when it's about
>>> toolchain.
>>
>> oe-core is deprecating versions that are still used by consumers of
>> meta-oe (mainly angstrom 2010 release)
>> since its toolchain and it will also benefit derivatives of angstrom.
>> Angstrom could also move these elements
>> into meta-angstrom if we think that its only angstrom specific and no
>> other consumers of oe-core needs them
>> layer maintainers make judgement call which they think should benefit
>> wider community
>>
>> similar but not for binutils here is a relevant thread
>>
>
> I feel if a distro or bsp needs a version of a package that is older than
> the oe-core one, it should be stored in the distro or bsp layer.
> Or is meta-oe also wanting to keep binutils 18.50? In oe classic this is
> used by the nios2 hw (and afaik there is no newer binutils supporting
> nios2)? I'd say if some layer needs older versions it is up to them.
>

This is a bit different when a version is retired from oe-core there 
might be more than one bsp using it therefore it would be more 
beneficial to keep it in a common layer

> What we are lacking here is a policy on purpose/goal of meta-oe and what
> goes in (and what not).

This has been discussed quite a bit when we decided to move to layered 
structure. meta-oe infact is an umbrella of layers and each layer can 
have it own development policies.

>
> Frans
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



