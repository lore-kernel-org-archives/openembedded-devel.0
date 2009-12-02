Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NFm3O-0002TM-AI
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 11:03:25 +0100
Received: by fxm25 with SMTP id 25so25386fxm.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Dec 2009 02:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=sbmJ8SG6VU4F+qV9xP4LagfmV2P+JSlINGgLnkghYt0=;
	b=YV0z3YHh+6mLHLYlOG4aVUtT4Pp04GYTpGpgNaUDez3Q0IQbndxjfSEHIJkC/mUZiD
	w+5O7fPrH0S2qagzxD4AXDpT1/geo2GSx4SEMN0s4s+Du48pl6ptqiWPaaeBfYzhsPur
	oYr8dJwnTxV0nvPVk/qkoeUh6FcNjHjaWj6SE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=HUovaXIo+L6mrosE6V30F85JE7xQWANXL4rdPXKBtQwcwFlNeJL9/D0jt9CtPrgeHA
	uPL7tKu6TDfZm2YTPAkAm1+FA5h+zHejvXW0Dfm/+7Z+dUs/SVrpp9G4phvveKuNpZ1q
	TU5ZWGlM9w2H4RSFvnFVcsn0g0+gSpSG/h9js=
Received: by 10.103.85.12 with SMTP id n12mr2520588mul.29.1259748106991;
	Wed, 02 Dec 2009 02:01:46 -0800 (PST)
Received: from ?192.168.0.101? ([94.180.45.122])
	by mx.google.com with ESMTPS id e8sm2615595muf.28.2009.12.02.02.01.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Dec 2009 02:01:46 -0800 (PST)
Message-ID: <4B163ABC.6010008@gmail.com>
Date: Wed, 02 Dec 2009 15:00:28 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20091001)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B0CC1A4.1060401@gmail.com>	<200911260953.02170.holger+oe@freyther.de>	<4B160147.9050303@gmail.com>
	<200912020749.50936.holger+oe@freyther.de>
In-Reply-To: <200912020749.50936.holger+oe@freyther.de>
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
X-List-Received-Date: Wed, 02 Dec 2009 10:03:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Wednesday 02 December 2009 06:55:19 Dmitry Vinokurov wrote:
>   
>> Yesterday pulled from dev branch (git describe output is
>> pre-nov2009-core-updates-606-g237cbb4) and made meta-toolchain-qte
>> rebuild, then tried again to build example -- same error "cannot find
>> /usr/lib/libpthread_nonshared.a inside
>> /usr/local/minimal/arm/arm-oe-linux-gnueabi"
>>     
>
> Could you look into the libc-dev package, or in general libc packages to see 
> if this library is present in any package? You could use mc or 
> Packages.filelist to figure that out.
>
>
> z.
>   
Here is search results:
--------
[14:50]raydan@t46x[build]$ find tmp | grep libpthread_nonshared.a
tmp/staging/armv5te-oe-linux-gnueabi/usr/lib/libpthread_nonshared.a
tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/staging-pkg/staging/armv5te-oe-linux-gnueabi/usr/lib/libpthread_nonshared.a
tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/image/usr/lib/libpthread_nonshared.a
tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/package/usr/lib/libpthread_nonshared.a
tmp/work/armv5te-oe-linux-gnueabi/eglibc-2.10-r7.5/build-arm-oe-linux-gnueabi/nptl/libpthread_nonshared.a
--------
[10:43]raydan@t46x[qte-example]$ find /usr/local/minimal/ | grep 
libpthread_nonshared.a
--------

So, libpthread_nonshared.a exist in eglibc for ARM, but not present in 
the QtE SDK.

How do you think, is there better way to solve this issue than just 
copying library into QtE SDK lib dir?

--
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



