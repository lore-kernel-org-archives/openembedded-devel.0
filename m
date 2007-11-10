Received: from [208.65.21.12] (helo=cpanel10.myrtlenet.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IqqGg-0007BT-UA
	for openembedded-devel@openembedded.org; Sat, 10 Nov 2007 14:20:59 +0100
Received: from 82-171-189-134.dsl.ip.tiscali.nl ([82.171.189.134]:15684
	helo=[192.168.1.24])
	by cpanel10.myrtlenet.com with esmtpa (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>)
	id 1Iqq2l-0002zU-3D; Sat, 10 Nov 2007 08:06:35 -0500
Message-ID: <4735AC67.6070307@gmail.com>
Date: Sat, 10 Nov 2007 14:04:39 +0100
From: Leon Woestenberg <leon.woestenberg@gmail.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <8c7950360711010949u45bb12e7p388b4d5dc4563ef3@mail.gmail.com>	<f96d234e0711011307y6d07604dg110d5c443ecb0e8f@mail.gmail.com>	<472B0543.5070203@balister.org>	<f96d234e0711020722i2305f16et15f2b5b122c94aea@mail.gmail.com>
	<472B5140.6060002@student.utwente.nl>
In-Reply-To: <472B5140.6060002@student.utwente.nl>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.myrtlenet.com
X-AntiAbuse: Original Domain - openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - gmail.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: Overriding package config files in OE
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
X-List-Received-Date: Sat, 10 Nov 2007 13:20:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,


Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Cliff Brake schreef:
>   
>> On 11/2/07, Philip Balister <philip@balister.org> wrote:
>>     
>>> Cliff Brake wrote:
>>>       
>>>> Another approach I've been thinking about is to figure out a way for
>>>> bitbake to use <files> from a tree outside the main OE tree.  One
>>>> possibility is for bitbake to pull <files> as well as bb files from a
>>>> high priority bbcollections tree, even though the bb remains in the
>>>> main OE tree.  This probably totally breaks the way bitbake works, but
>>>>         
>>> I think that having an overlay set up as a high priority collection does
>>> work.
>>>       
>> I was referring to the case where I only put the files directory in
>> the overlay -- not the entire recipe directory.  I have not tried this
>> lately and will do so the next time I get a chance.
>>
>>     
Only copying files, and not the recipes, to an overlay, does not work.

It would be quite nice, but I understand the complexities if every FILE 
has to be
search for in all the collections.

The current behaviour is, as I understand:

If no PREFERED_VERSION, select highest version of a package, else 
PREFERED_VERSION.
Iterate through collections by priority, select the collection that 
provides the "package-version".
Use that collection as the base directory for accessing FILES.

> You could also do it the openmoko way by defining extra overrides and
> using those in FILESPATH.
>   
Thanks, will look into this as well,

Regards,

Leon Woestenberg.


