Received: from [209.85.218.213] (helo=mail-bw0-f213.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <xjqian@gmail.com>) id 1LZZHu-0004Ry-KQ
	for openembedded-devel@openembedded.org; Wed, 18 Feb 2009 00:23:43 +0100
Received: by bwz9 with SMTP id 9so4421338bwz.12
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 15:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:cc:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=SVJECndRSJkexiovAAhIjgtw6Cnjnud/2bS2eJ7GscM=;
	b=jiMLpXad/COOfuBmLDqMs7O6Wi62RMwW/g16iWIWeqCDn/v9Y9aB79/Nn1FgDWKaBC
	l4aF1I3lgfjathq/pLlJJJNdjk+X5lOxjjTpkJqRsmn9WOTKQczk6dsNvZWwmm62cNaZ
	NCdMKPrJ1ExuqVjNqmdy8IBVSUd8JuvMBzMz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=jI3ZrM1FhKjHxqwQ7iec+PR+2xNOaUihltRrqSuQ1NdKbk/9cttoBLo1/Vvf9AYJlm
	+K4uertViN5dJcvBjzmvBSrzyI1xA2cNZtNQIwnYx5sayFHl3GLh/O/qD96q6jl5KT5H
	xdinLzgXdKqtvoW7RiT2bfOHIJ5PcAIcdJ4cc=
Received: by 10.223.113.199 with SMTP id b7mr141644faq.83.1234912892903;
	Tue, 17 Feb 2009 15:21:32 -0800 (PST)
Received: from ?172.31.4.167? (mscitspubwlgw.wustl.edu [128.252.55.250])
	by mx.google.com with ESMTPS id j27sm20036099ugc.12.2009.02.17.15.21.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Feb 2009 15:21:31 -0800 (PST)
Message-ID: <499B4678.4030202@gmail.com>
Date: Tue, 17 Feb 2009 17:21:28 -0600
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <499AD8D6.3000708@balister.org>
	<gnere3$16u$1@ger.gmane.org>	<499B1606.3040406@opensimpad.org>
	<20090217215529.GJ11815@smtp.west.cox.net>
In-Reply-To: <20090217215529.GJ11815@smtp.west.cox.net>
Cc: openembedded-devel@openembedded.org
Subject: Re: Autobuilder bugs versus stable branch being updated
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
X-List-Received-Date: Tue, 17 Feb 2009 23:24:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/17/2009 03:55 PM, Tom Rini wrote:
> On Tue, Feb 17, 2009 at 08:54:46PM +0100, Bernhard Guillon wrote:
>> Rolf Leggewie wrote:
>>> Philip,
>>>
>>> thank you for your comment.
>>>
>>> Philip Balister wrote:
>>>> I think it is a but of stretch to close old autobuilder bugs with the 
>>>> comment the stable branch will not be updated.
>>> That should not be the case (unless of course they were both of type  
>>> .stable and -autobuild).
>>>
>> We should create a new stable branch. The old one drifted too much away  
>> from .dev which makes it hard to backport things from .dev to stable.
> 
> The problem really is a policy one.  The old stable was "angstrom
> snapped for 2007 here".  That's one way to do a stable branch, but not
> what everyone thinks when they read "stable".  How much would it hurt to
> have OE actually do releases, rather than to be, in kernel terms, mostly
> like Andrew's tree (once stuff seems to work for some people, pull it
> in, see what breaks)?

+1 for releases instead of snap short, which was proven not working for 
the users.

> 
> And of course, who would volunteer to actually try and maintain such
> things and get everyone using the various branches that would have to
> entail, correctly?
> 

I can maintain the user space stuffs and communicate/bug core members 
for stuff that I do not understand. In terms of machines, I will keep an 
eye on tosa and spitz. I've been away for a while since the git 
conversion (now half-way through the git manual), but I always try to 
keep up with the mailing lists.

Regards
Gordon


