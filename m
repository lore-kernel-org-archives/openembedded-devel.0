Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NTCco-0001fR-GV
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 12:03:29 +0100
Received: by fxm4 with SMTP id 4so15998104fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 03:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=XBofcFv2slB2kIdOqzKFl9CX+ZkD+pmT+dJuZvzPQAA=;
	b=N8ilfah75NwLth1XGVoeLktjnTtTIk4JNL+bvSdFZWvdsHAPL8c/b+a+5/qEttQyKd
	8D9GFxWFbC5dgSHiGWXibQqpYzATw33qZSzkXR7K1doLjxsitDSkrAn6IKk+iFuw1dsG
	ZAUTtSYDsjxRp6Jy1hE1ETroZ0q8cSLdw6hLY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=HMMB56xx4M/mRBgsS898nca+jZ52WzUSxvrPoLWD9VJMU1FwaP7rbaOHgInHkG3p+/
	dIFNSY6TAvEFpGKRxFIiJjKTM9dOZIWMV7zMjsfagwRwG0MD8UZkjeEbM53KTydasCgF
	0hR0RR9S2olB7TnpSoBTQwl0eVm1a8LylVmOo=
Received: by 10.87.45.13 with SMTP id x13mr12629960fgj.70.1262948479916;
	Fri, 08 Jan 2010 03:01:19 -0800 (PST)
Received: from ?192.168.0.100? ([92.255.152.210])
	by mx.google.com with ESMTPS id e11sm48556847fga.9.2010.01.08.03.01.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Jan 2010 03:01:19 -0800 (PST)
Message-ID: <4B47107B.3010609@gmail.com>
Date: Fri, 08 Jan 2010 16:01:15 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8pre) Gecko/20100104 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B46E623.9030005@gmail.com>
	<op.u57fiqskmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u57fiqskmn1qzu@guohr-laptop-ubuntu>
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to extract OE cross toolchain?
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
X-List-Received-Date: Fri, 08 Jan 2010 11:03:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks, it was exactly what I want.

On 08.01.2010 13:07 Guo Hongruan wrote:
> bitbake meta-toolchain
>
> You can export toolchain and header files, libraries for application 
> development.
>
> Hope it is what you want.
>
> 在 Fri, 08 Jan 2010 16:00:35 +0800，Dmitry Vinokurov 
> <d.vinokuroff@gmail.com> 写道:
>
>> Hello,
>>
>> I've got an OE building host and some development hosts with same 
>> hardware platform and same GNU/Linux distribution. I wonder, is it 
>> possible to extract cross toolchain, builded on OE host, to deb 
>> package for example?
>>
>> Thanks.
>>
>
>
-- 
Best Regards,
Dmitry Vinokurov
<d.vinokuroff@gmail.com>



