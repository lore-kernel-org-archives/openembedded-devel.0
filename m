Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LoJrY-0007QP-4o
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 17:57:24 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LoJpV-0000Td-Fs
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 15:55:17 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 15:55:17 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 15:55:17 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 30 Mar 2009 17:55:06 +0200
Message-ID: <gqqq0q$or5$1@ger.gmane.org>
References: <cover.1238025789.git.andrea.adami@gmail.com>	<eaff36cccf868e5b367b402fb61451bf8f681bd8.1238025789.git.andrea.adami@gmail.com>	<gqfc5g$411$1@ger.gmane.org>	<87fxgv44gn.fsf@neumann.lab.ossystems.com.br>	<gqqcmo$63n$1@ger.gmane.org>
	<87wsa72ffd.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090322 Shredder/3.0b3pre
In-Reply-To: <87wsa72ffd.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 1/1] angstrom-2008.1.conf: add PREFERRED_PROVIDER_virtual/psplash -silence warning during parsing
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
X-List-Received-Date: Mon, 30 Mar 2009 15:57:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-03-09 17:33, Otavio Salvador wrote:
> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>
>> On 30-03-09 13:47, Otavio Salvador wrote:
>>> Koen Kooi<k.kooi@student.utwente.nl>   writes:
>>>
>>>> On 26-03-09 01:10, Andrea Adami wrote:
>>>>
>>>>> +#Silence warning during parsing
>>>>> +PREFERRED_PROVIDER_virtual/psplash ?= "psplash-angstrom"
>>>>
>>>> NACK, the 'psplash' package should get deleted and replaced with
>>>> psplash-oe' or something. It was left in place to give people time to
>>>> switch to the new way of installing branded psplash images.
>>>
>>> Hello Koen but I belive those are two different issues.
>>
>>> I added the virtual/psplash package to allow others to properly depends
>>> on an alternative. Currently the only recipe using it is
>>> initramfs-module-psplash but others may come.
>>
>> I don't think virtual/psplash is the way to go, but I don't have a
>> better suggestion.
>
> So what we should do? IMO if there's no better solution we use this
> until we find one.
>
>>> I fully agree that we should drop plain psplash recipe and have
>>> people to use the branded one but I also think angstrom needs to
>>> properly set the preferred version since it will then allow that
>>> its users to use it without much hassle.
>>
>> Unfortunately this will end up with people spreading FUD like "can't
>> change psplash logo in angstrom" just because they see that line in
>> angstrom.conf.
>
> Well, we could add a comment for that in the angstrom.conf file.
>
> Something like:
>
> # This enforces a specific brand to be used, in our case the angstrom
> # one. In case you want to change the logo or something like that we
> # suggest you to create another recipe (e.g: psplash-<brand>) for that
> # and change this line according.
> PREFERRED_VERSION_...

Maybe

# This enforces a specific brand to be used, in our case the angstrom
# one. In case you want to change the logo or something like that we
# suggest you to create another recipe (e.g: psplash-<brand>) for that
# and add that into your image.
# You can also opt to change or override this line, but that isn't
# needed because psplash is using update-alternatives.

regards,

Koen



