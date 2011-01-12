Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PcvNQ-00067s-Mn
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:44:16 +0100
Received: by pxi17 with SMTP id 17so37457pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 23:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=RqR7b2lhxyLAp4iozA8mNcHAMM/bIancH60CjwPShvc=;
	b=xKvkDFpW9WZi/wqytnOcK59jLwic1SuWkB0NRuFozYHrKfej9WIQwdpujBs3NmRO8c
	3XH6CtKFp8q6WIsCzrwK9SFbu1TR5TusRm2pJcojZEJ6kb0JSIdASeoctY/zzatuXzzi
	sAGJ3iPAn1NVALlP62yONFcvS+M7yvvei7orY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=CFg+z7FMAkxB947RCzexFi04OuAtD/IMKz0XvwbVGOnlLVACoG8YFzX5VfNJobNTHd
	eIovvQ0CAc9+lbfAHnHHd/zF2ISAVTgM/AghCl2MCZqT6LB31a5pbXWrQgBal6HSIO5+
	tvo7utqS2/k8cFms0NphiFP99yxmMdFnHlscI=
Received: by 10.142.133.21 with SMTP id g21mr635713wfd.163.1294818224582;
	Tue, 11 Jan 2011 23:43:44 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q13sm468555wfc.5.2011.01.11.23.43.43
	(version=SSLv3 cipher=RC4-MD5); Tue, 11 Jan 2011 23:43:43 -0800 (PST)
Message-ID: <4D2D5BAC.1060409@gmail.com>
Date: Tue, 11 Jan 2011 23:43:40 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-5-git-send-email-rep.dot.nop@gmail.com>
	<20110111194701.GD6584@mx.loc>
In-Reply-To: <20110111194701.GD6584@mx.loc>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 05/12] uclibc: shared-flat: put crtreloc.o into -dev package
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
X-List-Received-Date: Wed, 12 Jan 2011 07:44:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/2011 11:47 AM, Bernhard Reutner-Fischer wrote:
> [khem, thanks alot for pushing the already ACKed hunks, i would have
> only pushed them now.. |-) ]
>
> khem, i know that flat is NIH in OE ATM but i consider this preparatory
> work. I still feed my bfin with my own setup but that hunk is
> potentially a step in the right direction -- towards OE. So..
>
> ping?

I have already applied this patch. Check patchwork and or repo

> cheers,
>
> On Mon, Jan 03, 2011 at 09:01:59PM +0100, Bernhard Reutner-Fischer wrote:
>> Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
>> ---
>> recipes/uclibc/uclibc.inc |    3 ++-
>> 1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
>> index 09f5af7..1c7dfc3 100644
>> --- a/recipes/uclibc/uclibc.inc
>> +++ b/recipes/uclibc/uclibc.inc
>> @@ -52,6 +52,7 @@ FILES_uclibc-dev_append = "\
>>          ${libdir}/lib*.so \
>>          ${libdir}/*_nonshared.a \
>>          ${libdir}/[S]*crt[1in].o \
>> +        ${libdir}/crtreloc*.o \
>>          ${libdir}/lib*.a \
>>          ${includedir}/*.h ${includedir}/*/*.h \
>>         "
>> @@ -60,7 +61,7 @@ FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
>> FILES_uclibc-gconv = "${libdir}/gconv"
>> FILES_uclibc-thread-db = "/lib/libthread_db*"
>> RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
>> -# uclibc does not really has libsegfault but then using the one from glibc is also not
>> +# uclibc does not really have libsegfault but then using the one from glibc is also not
>> # going to work. So we pretend that we have it to make bitbake not pull other recipes
>> # to satisfy this dependency for the images/tasks
>> RPROVIDES_${PN} += "libsegfault"
>> --
>> 1.7.2.3
>>



