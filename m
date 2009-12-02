Received: from fg-out-1718.google.com ([72.14.220.155])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NFiE6-0000aW-Uw
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Dec 2009 06:58:13 +0100
Received: by fg-out-1718.google.com with SMTP id 22so121779fge.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2009 21:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=TFfRM3SCvAmb1tK0lWSMi0Y2CbONzbhuKzkkr70YW/k=;
	b=YZ4iosxY5vFqNOEjvrISn0W7i0oDveA1KHgh0MFbIHqAI3T3tVR8bC8/yqmI2o1oFb
	K7ELwDKd/647lUXLsb50/ld34Q2JkJzpwXTV6Cz+hGD2zQmxaeD+XFMZZm7aBoEUdETd
	Fg8snC9aOFvbDUgzK1myvNhb30aJiXs6CpvGQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=sprHW7zqt1iInEX23TKTOwN/DrssqUwV1J2wKf7oZpPKBZ3NpJdjShCBrRnE7ecT5T
	JoLmpeFmdD1TIPSxNV5iZ1g5O1jYnHldfgTV14aPXzYV7Vy4AJYBVhEROwr+9RKHEGZ7
	FHcrmxKOPTY3hHAfQ6t5GUZshSUyvVIyncNVc=
Received: by 10.103.81.8 with SMTP id i8mr2351825mul.80.1259733397841;
	Tue, 01 Dec 2009 21:56:37 -0800 (PST)
Received: from ?192.168.0.101? ([94.180.45.122])
	by mx.google.com with ESMTPS id y37sm2208708mug.17.2009.12.01.21.56.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Dec 2009 21:56:36 -0800 (PST)
Message-ID: <4B160147.9050303@gmail.com>
Date: Wed, 02 Dec 2009 10:55:19 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20091001)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B0CC1A4.1060401@gmail.com>
	<200911260953.02170.holger+oe@freyther.de>
In-Reply-To: <200911260953.02170.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 72.14.220.155
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
X-List-Received-Date: Wed, 02 Dec 2009 05:58:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Yesterday pulled from dev branch (git describe output is 
pre-nov2009-core-updates-606-g237cbb4) and made meta-toolchain-qte 
rebuild, then tried again to build example -- same error "cannot find 
/usr/lib/libpthread_nonshared.a inside 
/usr/local/minimal/arm/arm-oe-linux-gnueabi"

--
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>



Holger Hans Peter Freyther пишет:
> On Wednesday 25 November 2009 06:33:24 Dmitry Vinokurov wrote:
>   
>> Hello,
>>
>> Example from manual chapter"Creating and Using a Qt Embedded SDK" fails
>>     
>
> When did you build meta-toolchain-qte?
>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>   


