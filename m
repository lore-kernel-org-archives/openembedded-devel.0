Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 600EC60846
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 15:34:33 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r14so2583414lfm.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 07:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3kfGaCfGjpd074rLK4J/I+jbOS5bDFw0bNedL7soZtM=;
	b=evkYIBIec7z0F1PDs7soGDY7QR8X+4LarQz6Pj2y70sM+tFNA0RTXYwb/TAwmQl+SU
	cAQy3f/91yyVKM0k9Uz6boaDFkIotBGldG+4wih3kKzPiRPxdcnR1tpjKDdRJklfCW4f
	0lFxxpbE0Wckt/1HcQK33gs7t44q+Eri9/+eGpTc8rZMJfcSFBwPMjcxLWPLUVPIkwzq
	x+7nVFCTuV0Fv764nL6FQ8dJJ3pcuZinCoknBaQPpIg0j7IknDwv9TYs/8951FXpRByc
	RX0F8QRan8HC81jWCK6d3a/xvOp82oR5+O8CZipL0U5+uv7YHBcKW1/ydwfmBpk7kfoo
	4VHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3kfGaCfGjpd074rLK4J/I+jbOS5bDFw0bNedL7soZtM=;
	b=mavN02BMzVCR1bag8zkOHJwQ19AXIfZ2T6qu6X76o77tY799Otk9c1ao9Zu/o+mbys
	E72Nxud0WiWk6l3PUYnxhoyEfEX6eBevFTIkrg73lNvM1V77HwzyX1W3gitCCsruti1j
	BzN4X+H0O0918ZHyZQPwhy+5LEFoOQ7CM3oK6FahvGcKPCetL5DC2FSIyZkZ/m3lHeZb
	IQnBonwGe/qHDtgZtj15oXrZuy1sldVacED1lycBZAkn/dEuaqEI2/XKEKaWKOl+PYio
	80Z6HqF2EGX8GvpKWiUYeyldO+9zxsACSoDJoxNBEHGMv9gVLHMAYcsgTzwayqtSMzHT
	pReQ==
X-Gm-Message-State: APjAAAVccQ4bQE62uc2rX/tbrlaSt9pfWqocxm+PtvCIIdPNUbKMNjr3
	ufMbfoI0Mg/7ZwPyoERqgnE2g+7O
X-Google-Smtp-Source: APXvYqw1dLRRxoacnPM4HLdGP8TneItY27O3L5gWLiF8J0N/PFSC25x18e3iuyjN8LeNNwW8cMTakA==
X-Received: by 2002:a2e:99c5:: with SMTP id l5mr389602ljj.88.1580325149039;
	Wed, 29 Jan 2020 11:12:29 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	h19sm1472383ljl.57.2020.01.29.11.12.26
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 29 Jan 2020 11:12:27 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
	<c43cf573-d876-8a4a-d978-fc4b2303e747@gmail.com>
	<20200127145758.GA603314@pcleri>
	<6c208020-0b53-4701-1173-6e59c0f2b5c2@gmail.com>
	<0dad623b-f095-3170-26c9-5a554b509469@gmail.com>
	<0a54c1f8-5c2c-9d2f-1e1e-757b32eaa0c5@gmail.com>
Message-ID: <f3bbb282-37a2-c273-328b-4e4a5bca8c61@gmail.com>
Date: Wed, 29 Jan 2020 20:12:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0a54c1f8-5c2c-9d2f-1e1e-757b32eaa0c5@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 0/4] openjdk-8: update to jdk8u242ga
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2020 09:28:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/28/20 1:01 PM, Jacob Kroon wrote:
> On 1/28/20 6:43 AM, Jacob Kroon wrote:
>> On 1/27/20 5:05 PM, Jacob Kroon wrote:
>>> On 1/27/20 3:57 PM, Richard Leitner wrote:
>>>> On Mon, Jan 27, 2020 at 03:10:04PM +0100, Jacob Kroon wrote:
>>>>> On 1/27/20 12:24 PM, Richard Leitner wrote:
>>>>>> This series updates Openjdk 8 to the latest "ga" release 242.
>>>>>>
>>>>>> Successful testing has been done on a fedora-31 build host for
>>>>>> qemuarm64, qemux86-64, qemuarm32 and armv7a.
>>>>>>
>>>>>
>>>>> <cut>
>>>>>
>>>>> I don't know if it is related to my setup, but "bitbake openjre-8" 
>>>>> insists
>>>>> on rebuilding itself every time I run it, and I don't see any 
>>>>> sstate cache
>>>>> being generated for it.
>>>>
>>>> I just tried to reproduce it, but neither for armv7a nor for aarch64
>>>> openjre-8 is rebuiled on the latest poky/oe-core master when nothing 
>>>> was
>>>> changed in meta-java.
>>>>
>>>> So in your case it also rebuilds if you call "bitbake openjre-8"
>>>> directly one-after-another without any change to the layers?
>>>>
>>>
>>> Yes, precisely.
>>>
>>> But.. I think you can ignore this. I suspect I have confused 
>>> bitbake's hashequiv database by pruning old cache-files using the 
>>> sstate-cache-management.sh script.
>>>
>>> Joshua, do you know if that script is supported when using hashequiv ?
>>>
>>> Gonna try and remove cache/ aswell, and see if that helps.
>>>
>>
>> I just retried on a clean build, I wiped everything, and openjre-8 
>> still insists on rebuilding on the second run. I don't know whats 
>> going on here..
> 
> Looks like it is caused by me using rm_work.bbclass, it seems to wipe 
> something that causes the rebuilds.

Actually it looks like openjre-8 and openjdk-8-native cannot rebuild 
from sstate cache, even with rm_work disabled.

