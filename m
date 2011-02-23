Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PsFYa-0004kD-Vf
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 15:19:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id CDB6D314DFE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 15:17:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8behMnfGzEgy
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 15:17:46 +0100 (CET)
Received: from [172.22.22.61] (ip-94-79-168-47.unitymediagroup.de
	[94.79.168.47])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id EE0E6314DFC5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 15:17:45 +0100 (CET)
Message-ID: <4D651709.3070909@opendreambox.org>
Date: Wed, 23 Feb 2011 15:17:45 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110208 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimy_TtONvPFjaGCUV0qxaM7qF0ENBx7A6wzRnPZ@mail.gmail.com>	<4D63F7F9.7000804@eukrea.com>
	<4D63FF5C.30400@opendreambox.org>
	<20110222201107.GB3970@localhost.jama.net>
In-Reply-To: <20110222201107.GB3970@localhost.jama.net>
Subject: Re: Weird behaviour with PPP
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
X-List-Received-Date: Wed, 23 Feb 2011 14:19:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Martin,

On 02/22/2011 09:11 PM, Martin Jansa wrote:
> On Tue, Feb 22, 2011 at 07:24:28PM +0100, Andreas Oberritter wrote:
>> Hi,
>>
>> On 02/22/2011 06:52 PM, Eric Benard wrote:
>>> On 22/02/2011 18:22, Mickael Chazaux wrote:
>>>> I have a hard time figuring out why bitbake seems to mix versions of
>>>> ppp... Any ideas?
>>>>
>>> strange, which distro, git tag, bitbake version are you using ?
>>>
>>> Both bitbake ppp-2.4.5 & bitbake -b
>>> openembedded/recipes/ppp/ppp_2.4.5.bb work fine here (angstrom 2008.1,
>>> armv5 target, bitbake 1.12.0).
>>
>> I don't think this has anything to do with ppp. I faced the same issue
>> with a local recipe, of which an older version had been built before.
>> When packaging, the old version was used. A new workdir was created for
>> the old version during this step and the resulting packages were empty.
>> No recipe existed for this old version at that time, i.e. PR had already
>> been increased to 1.0, but 0.0 was used by bitbake.
>>
>> In the end, I deleted bitbake's cache and all files matching the
>> package's name to get rid of the annoying problem. I think there were
>> pstage packages of the old version lying around.
> 
> This wrong behavior is quite common ie after changing PACKAGE_ARCH, see:
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg04280.html

In that thread, if I understood correctly, Richard suggested that
packaged staging could solve the problem. But that doesn't seem to be
the case. Do you know why?

Regards,
Andreas



