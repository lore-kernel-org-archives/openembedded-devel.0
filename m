Return-Path: <sledz@dresearch-fe.de>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 13C7B77035
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 09:01:39 +0000 (UTC)
Received: by lfbn126 with SMTP id n126so5873786lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe_de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=9RicdyFUhDzLxETi0XZ3sM0/KNY1YHeBWrt91MKKLso=;
	b=vdp34Wpx6lCaEWnlyDsp9OktaoeZoZRKCqGhYIkIszc7HlSqkIQzNyVn91JQYqo5Kg
	0FbpjIoKD7qY9NWnylHHnFDGR4d8iryYd633NqagnMlQC433BZh8kvvAhExYDP/qXox8
	Q6FPg1cD08nHiZGkQQE6EPYlWseQPqoZ96Zx2EZGkbZd5EEvq1h4g/pnnZVDtKPYBXdU
	CxgN5wiJ6MoDGhxvvIvujsPOZSLjlOZVSSOqi3o5dB6oKHMwFrs6iz65bO9XQftucjsN
	TmbVcqUZdZjfKT/xIJ0A6fyO4zX3x/MF8Y0M9QmHg0ABcoywqGGBvWOgQJg+Tv3+RUoO
	Db0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=9RicdyFUhDzLxETi0XZ3sM0/KNY1YHeBWrt91MKKLso=;
	b=OOsvzfdzTuQUFdbfHLYUOGWXwi8QoIiVk47lbBUS7MeVaWurt1mdAXJ+mWK4jJSlnY
	kV8L5Vs9pUQPOwOxOZyLiHB07nnk90m3a/bv8AjhqqOvRD7pWyoxmSIVKgsUPsvFsCbh
	dhfbnfF9kbXcpTSPV8E05aNa9U7VX5HxGv0WN0E4FBDM7ZSfU/vjPxYL19PVPtnobe7i
	BIOclKt2SivL8ULgwAAYYBOrL+7qt0fx+P0KjxfIsmStwlz7MKS2CYGvasr40VwSSiW3
	eDwuvIV/3GvdYbvxDILn0HfxhE4838Ou4Gn5vnv3k+exKgtIgdsIREzFKHBe4SCOU4D7
	MN6Q==
X-Gm-Message-State: ALoCoQkeIcI3leg3iPxON1DVdHiCGCrVNgGx0TlQIEsrFcVQgsN07L0crVvFtggRkll68tqzoGwu
X-Received: by 10.25.165.84 with SMTP id o81mr5192988lfe.80.1445504498669;
	Thu, 22 Oct 2015 02:01:38 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	m17sm1883832lfb.16.2015.10.22.02.01.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Oct 2015 02:01:37 -0700 (PDT)
To: Richard Leitner <richard.leitner@skidata.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Koen Kooi <koen@dominion.thruhere.net>
References: <56279AAF.4050704@dresearch-fe.de> <5628952C.8080706@skidata.com>
	<5628A3BE.3010403@dresearch-fe.de> <5628A439.1030200@skidata.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <5628A5F0.2060009@dresearch-fe.de>
Date: Thu, 22 Oct 2015 11:01:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5628A439.1030200@skidata.com>
Cc: Benjamin Reikowski <reikowski@dresearch-fe.de>
Subject: Re: cups-filters
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2015 09:01:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 22.10.2015 10:54, Richard Leitner wrote:
> On 10/22/2015 10:52 AM, Steffen Sledz wrote:
>> On 22.10.2015 09:50, Richard Leitner wrote:
>>> On 10/21/2015 04:01 PM, Steffen Sledz wrote:
>>>> Does anybody know about a recipe providing cups-filters?
>>>>
>>>> http://layers.openembedded.org was not really helpful here.
>>>
>>> I have one which works for my purposes but it is not really tested...
>>> It is based on something I found somewhere on the web (I don't remember
>>> the source).
>>
>> Any plans to make this part of an official layer?
>>
> Currently I have no time for creating and testing a clean patch for it.
> But if anybody has time and motivation, feel free to do it ;-)

I could try to prepare one.

@layer-maintainers: What would be the right layer for this? openembedded-core or meta-oe?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

