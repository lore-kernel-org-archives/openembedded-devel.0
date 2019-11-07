Return-Path: <prvs=2076570a8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id CC52C7C127
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1573139956; x=1604675956;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=x0en6ecpXsD3vLMRfGLG01I7V0LDt9BFnIgiIqVJ24s=;
	b=GGBgMGdo4pNnrHDHtmMhjP7aX6TgQeQkWBFys2S8TYa5s2AVCAoL5hMm
	ZCqh269ensDyt5G5RMzcOpy8tplOZHaQ5EXfVIT4I3uO2OpogEtMZcXDu
	LkBmxnaJSJI6Ze4MiuO0cmgCe7t2e9xxYiUSLTQoR4BfiKRhzlnVcoQ95
	al8tcSWkmpCajWc0cl1YyT1EYsCo23kJTxgINqkcvG783Yp5H5WF+5Ksm
	uYbVOa6p9zRtVEy/Oh1I5kvNF9WtFLCYPkJdV9E1U26IiJk3XryMWPMtm
	boeJnhdPmuqE0lOf872PqFisrcp5CEWvX9wQvQXn60t1y2muEp4UuXvmO w==;
IronPort-SDR: uolQUcNWYq/5d7J6iOLPAHr5dp0LNUIzdrI1JvNlvEYXepIvOoWEWZWYgamkkZl6OPLrrgwecj
	yS9ZckyTDlQje7GaVutAjHS7c0AnqfSFA/5o4JUiE/fIndm/GBOONRmePnMF9pR9QzKV2/XX2I
	wXnRUA1ZRgpgPwkeCqE67517hS63SAX4elkXrI8F8ERlilz0T+V+ASBC562FacooVgUYmUNJR7
	P6lojMmJbt3ZwyNXdfiUgsNY5uHw1DIjVt6Z55XZyA4RFo6Zz5vp/OChaAlhuNzNcniYnYv8Gy
	blM=
X-IronPort-AV: E=Sophos;i="5.68,278,1569276000"; d="scan'208";a="20757595"
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <b6f2c586-cb29-5015-ec35-ab2c7dcf8d4d@amotus.ca>
	<20190909205704.GA14642@localhost>
	<6454a666-ebbe-ab60-533d-b60ffb927682@skidata.com>
	<CY4PR12MB16534186A02A4649C5D9F17F8B9F0@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CY4PR12MB1653332D03E68DF8C59AB10A8B780@CY4PR12MB1653.namprd12.prod.outlook.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <35cdc1c6-0cbc-1c9c-2905-d8376a729a05@skidata.com>
Date: Thu, 7 Nov 2019 16:19:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CY4PR12MB1653332D03E68DF8C59AB10A8B780@CY4PR12MB1653.namprd12.prod.outlook.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: Support for OpenJDK 9+
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
X-List-Received-Date: Thu, 07 Nov 2019 15:19:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 07/11/2019 15:48, chris.laplante@agilent.com wrote:
>>>>> We recently got a request to add support for Java(OpenJdk) 9+.
>>>>> I came to wonder if there was any limitations preventing the use of
>>>>> Openjdk 9+ on arm?
>>>
>>> None that I'm aware of...
>>
>> I have a somewhat related question. Is there a technical reason that we're still using GNU Classpath? That project looks to be
>> thoroughly abandoned since 2012. As you may have seen last night I submitted some patches to fix some "simple" bugs in BigDecimal.
>> By "simple", I mean the kind of bug that I'd expect to bite many users, as opposed to an esoteric or corner-case bug.
>>
>> If it's just that no one has ever volunteered to move to something newer, then I may be able to help. No commitments yet though.

Hi,
AFAIK there are no technical reasons for Classpath and any help is of 
course greatly appreciated ;-)

regards;Richard.L

> 
> Bump?
> 


