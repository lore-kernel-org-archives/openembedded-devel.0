Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by mx.groups.io with SMTP id smtpd.web09.10170.1607441636729093265
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:33:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@phytec.de header.s=a1 header.b=IxUxwv1N;
 spf=pass (domain: phytec.de, ip: 195.145.39.210, mailfrom: r.karszniewicz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1607441633; x=1610033633;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LCVrOo9w8EP0uNRSw/TDL1aCK0I7IOJUHIwTwOZW0+Q=;
	b=IxUxwv1NzZMnQsql5vjjBGmNOn+6HSlVd1zc0bPwCrn2OnaOm+AASt8Do6D5JIDD
	XxwAo0LKEzrxCXxKLsnA9NpuWnqpdM8IPj2Sw60baD0R0Z8+pbdyTaCzL211HuuW
	9aSB401dYqgOBKKlEKaQsotQOEYPOM9r4pxMLEt4/Tw=;
X-AuditID: c39127d2-981ff70000006435-1d-5fcf9ce14442
Received: from Florix.phytec.de (florix.phytec.de [172.16.0.118])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id E7.B2.25653.1EC9FCF5; Tue,  8 Dec 2020 16:33:53 +0100 (CET)
Received: from [172.16.22.107] (172.16.0.116) by Florix.phytec.de
 (172.16.0.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Tue, 8 Dec 2020
 16:33:53 +0100
Subject: Re: [oe] [meta-oe][PATCH] firmwared: add recipe
To: Ross Burton <ross@burtonini.com>
CC: <openembedded-devel@lists.openembedded.org>
References: <1607101539-25986-1-git-send-email-r.karszniewicz@phytec.de>
 <CAAnfSTvw9KrUNTRZYSF7tBztw+7FR2WRU_CJEWASOH0KoN-Qtw@mail.gmail.com>
From: "Robert Karszniewicz" <r.karszniewicz@phytec.de>
Message-ID: <e158ef54-c4c2-c29a-d906-3d4a4b710bd4@phytec.de>
Date: Tue, 8 Dec 2020 16:33:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTvw9KrUNTRZYSF7tBztw+7FR2WRU_CJEWASOH0KoN-Qtw@mail.gmail.com>
Return-Path: r.karszniewicz@phytec.de
X-Originating-IP: [172.16.0.116]
X-ClientProxiedBy: Florix.phytec.de (172.16.0.118) To Florix.phytec.de
 (172.16.0.118)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWyRoChTPfhnPPxBmtfmFhcPLyU2eIoiwOT
	x+b3oR7nNq5gDGCK4rJJSc3JLEst0rdL4MpY0H6VsWAOV0XXyhssDYyzOLoYOTkkBEwkDiw8
	x9TFyMUhJLCMSeJH5zJ2COc+o8S29tUsIFXCAhYS55a+Zuti5OAQEVCROHiSFyTMLKAvsa/j
	ASNEfT+jxNUlE8Hq2YCm7m6+xQxi8wrYSLR9X8IOYrMA9b58MQEsLioQIdHa1wlVIyhxcuYT
	FpD5nAKBEjN2ZkPMt5CYOf88I4QtLnHryXwmCFteYvvbOWCtQgKqEqfbXjNBPKMgMff3RGYI
	O1xi3u9Z7BMYhWch2TALydhZSMbOQjJ2ASPLKkah3Mzk7NSizGy9gozKktRkvZTUTYzAUD88
	Uf3SDsa+OR6HGJk4GA8xSnAwK4nwqkmdjRfiTUmsrEotyo8vKs1JLT7EKM3BoiTOu4G3JExI
	ID2xJDU7NbUgtQgmy8TBKdXA2FN+9aK0w8klTtpb2Bc8burNvrjDX1NCeF2YSmtWZM31kyvv
	XPIwXWG04YHMzzrHbUe/sPbZRhx0OjJrgtQKS7cSwb8J0zad+7vyu5R1xGSm+/4lX/Y/q/7+
	Vfu4VmNepI7Vx9i4Lztft05peVEz6Z/Fw9Uz7szVe/vgrNa7v1c1TN6sKamddUWJpTgj0VCL
	uag4EQA6Yx+6YwIAAA==
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/7/20 11:49 AM, Ross Burton wrote:
> Last touched four years ago.  Isn't this what udev does?  If this is
> for people who don't want udev, I suggest you make that clear in the
> summary.

It's not a matter of whether they want to, but they can't. At least from 
what I
can see, udev has removed support for loading firmware six years ago.
Am I missing something?

See this paragraph in kernel documentation
Documentation/driver-api/firmware/fallback-mechanisms.rst:

   Different implementations have been supported in userspace to take 
advantage of
   this fallback mechanism. When firmware loading was only possible 
using the
   sysfs mechanism the userspace component "hotplug" provided the 
functionality of
   monitoring for kobject events. Historically this was superseded be 
systemd's
   udev, however firmware loading support was removed from udev as of 
systemd
   commit be2ea723b1d0 ("udev: remove userspace firmware loading support")
   as of v217 on August, 2014. This means most Linux distributions today are
   not using or taking advantage of the firmware fallback mechanism provided
   by kobject uevents. This is specially exacerbated due to the fact 
that most
   distributions today disable CONFIG_FW_LOADER_USER_HELPER_FALLBACK.

Regards,
Robert
