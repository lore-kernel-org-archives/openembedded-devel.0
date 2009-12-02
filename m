Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NFpAe-0001V5-6s
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 14:23:07 +0100
Received: by fxm25 with SMTP id 25so188282fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Dec 2009 05:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=2Jq1Eby2KlJBy3ePK+JX6o+e6VAAD4BqTlOqyASNkTQ=;
	b=T9rxcLpyYjM7J8Dm+PFAPy1ekZcFZV3dZOHRiu+mbcABEuImmsyHImiNG7lS1GK1oK
	tLTC8LGo5QZ7uje1jgfvhSqAwbxW/0qJuSPdnQvarcC0xA2ESH74zR1sAh5KLsIZ4UVr
	EO/G8JWSLhLTR1VCU5Zbcs/0fli8z8yFNnpoE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=XSxDi/6XcGztp0TwV1ZWWHt8VMYG2/s2pxo3kBxFErPqxQ/x3z7kb+1HIVXd7QaU51
	OnfdWaPAuVt1UU9HODVdP8dB6Ml009ruugX1xunKQzrxI1eDb9iJ9zhmBtw8OKGYqR45
	Jy7wa+OdexY8mzgR2e+fpHuVPX2PF5R1TRmDc=
Received: by 10.103.125.28 with SMTP id c28mr37054mun.64.1259760088664;
	Wed, 02 Dec 2009 05:21:28 -0800 (PST)
Received: from ?192.168.0.101? ([94.180.45.122])
	by mx.google.com with ESMTPS id 25sm3104393mul.20.2009.12.02.05.21.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Dec 2009 05:21:27 -0800 (PST)
Message-ID: <4B166989.5050304@gmail.com>
Date: Wed, 02 Dec 2009 18:20:09 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20091001)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B0CC1A4.1060401@gmail.com>	<200912020749.50936.holger+oe@freyther.de>	<4B163ABC.6010008@gmail.com>
	<200912021401.42124.holger+oe@freyther.de>
In-Reply-To: <200912021401.42124.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Making simple QTE application, cannot find libpthread_nonshared.a
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
X-List-Received-Date: Wed, 02 Dec 2009 13:23:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Wednesday 02 December 2009 11:00:28 Dmitry Vinokurov wrote:
>
>   
>> Here is search results:
>> --------
>> [14:50]raydan@t46x[build]$ find tmp | grep libpthread_nonshared.a
>> tmp/staging/armv5te-oe-linux-gnueabi/usr/lib/libpthread_nonshared.a
>> tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/staging-pkg/staging/armv
>> 5te-oe-linux-gnueabi/usr/lib/libpthread_nonshared.a
>>  tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/image/usr/lib/libpthrea
>> d_nonshared.a
>>  tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/package/usr/lib/libpthr
>> ead_nonshared.a
>>  tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/build-arm-oe-linux-gnue
>> abi/nptl/libpthread_nonshared.a --------
>>     
>
> ah eglibc... so your finding is that this library is not in any glibc-* 
> package? So when building glibc you must get a warning like unpackaged 
> content...   could you take a look at the log?
>
> In high level terms. The library should be in a package (like -dev) and it 
> should be installed. If that is not the case it must be fixed.
>
>
> thanks
> 	z.
Following commands show no output (though log files exist there):
--------
grep -i unpackaged tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/temp/*
grep -i "not shipped" 
tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/temp/*
--------

"When building glibc" -- you meant eglibc? glibc wasn't build at all.

-- 
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



