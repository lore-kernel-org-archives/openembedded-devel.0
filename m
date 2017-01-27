Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB4871C0F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:44:58 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f144so17497719pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 17:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=My+HS0IL2jlMA4WNKJ8w6Ln1T0WwBAgAGEIDgRBGszs=;
	b=j2hW3YecxWPK71P/LaZw1/8Tj+lRveL5triHFsRPIlW9pRxe4WKxnvz9t9bMuFq5PZ
	6XrZgFpk+8zzZBmNDD87E/g9EwxALzqcdeTn81P9P56NsmU5OXGc+0MjNrueZR8ILnrz
	4SV4o5faGEm/odmJGfj0RCDO+a5vZkHXzK7a4hie6vjoHiHxKobQTrd/fDQI1Wiemkvx
	ywoXHKaQjpagvcdGt6sENecmTi2Le7hptiWNNBqL0aN1v/ItDm6hSjFIbg3awJnoag+q
	4G1MU0vVWzAjMAPaWYEoCSHJxlnXtJ9ziUpH69C5CnKGepNICTvbZYD/ILEJzmAL1Uq2
	OZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=My+HS0IL2jlMA4WNKJ8w6Ln1T0WwBAgAGEIDgRBGszs=;
	b=GLkxbA/u/vOFwxE13ytW/M7kJ9zrx4YcLevVjyY9lod7oXHy5eF1OJcUFtlQr/TSso
	zqvAolaeI03xmiT/XMFBm55tUulm2B4vxVQ84uw/1vI6K5LqGWYcCeXEEvc8oGczNWCe
	B/dvlT64zgaZFYRSKADHuHKYALEziAX1PulMc4W/wu8NRaC5tokvFY1QDal8MLf1rMXE
	vHVk4IMSLzeAwMlEgQi8CwEA6LtjC3yFdhKikC54GUOFEAMegwrmT/93lLayG3grnONT
	f0TIxa2LwalZMk0cXm+R1jyU8JcTK7zFCojmWc5M5gj6ksJSD/LS6VHBM4c1ZxFJr7W3
	SkxA==
X-Gm-Message-State: AIkVDXJhuBBDmJV6xwDGmkIOekt6L017k75k0krDPc1GAqbzep3FT/Y2fufKjUepI4Jm1g==
X-Received: by 10.84.200.200 with SMTP id u8mr8402539plh.98.1485481498604;
	Thu, 26 Jan 2017 17:44:58 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:6524:a1c0:a396:fda9])
	by smtp.gmail.com with ESMTPSA id
	o12sm6223087pfg.15.2017.01.26.17.44.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jan 2017 17:44:58 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1484923430-3222-1-git-send-email-ross.burton@intel.com>
	<1484923430-3222-2-git-send-email-ross.burton@intel.com>
	<20170125161855.GG3260@jama>
	<CAJTo0LYG+T4yc1uzDrMW4GirKpdmyU887K4RJWd9pxwULg+qEg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <3d71e0b1-7398-33fe-082b-d1b8f13d4a56@gmail.com>
Date: Thu, 26 Jan 2017 17:44:57 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYG+T4yc1uzDrMW4GirKpdmyU887K4RJWd9pxwULg+qEg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] libxcalibrate: add, from oe-core
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
X-List-Received-Date: Fri, 27 Jan 2017 01:44:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 1/25/17 8:38 AM, Burton, Ross wrote:
> On 25 January 2017 at 16:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> 
>> Why do we need this in meta-oe? Just because xtscal was dumped here as
>> well?
>>
> 
> Yes.  xtscal etc are the only users, so they're in oe-core with nothing
> using them.  They should have moved to meta-oe along with xtscal, but were
> missed.
> 
> The alternative is to delete xtscal from meta-oe and then we can just drop
> these from oe-core as they're not used at all, but that's not my call.
> 

perhaps drop them everywhere and let interested parties come back with
recipes for oe-core. if no one picks them up then we know they are dead
code.

> 
>> Both are broken because of the path to .inc file:
>> Parsing recipes...ERROR: ParseError at
>> /OE/build/oe-core/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/
>> libxcalibrate_git.bb:6:
>> Could not include required file xorg-lib-common.inc
>>
> 
> Damnit, sorry.
> 
> Ross
> 

