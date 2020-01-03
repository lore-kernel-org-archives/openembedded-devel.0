Return-Path: <prvs=2645a3569=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id EF7B77F8C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 22:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1578089158; x=1609625158;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=16zjOYjypD4DsT1P4dnvF96HjP0MKhQ9UEc1Kdz+SFo=;
	b=lA5Kut1356Mev/QLYfhD6/WMpikDNtYwtdj9Jk08G/rUalFRH8ObK4rG
	yI3xGrZ2YXg60vmzi6EfP8OcwPfo/YoUIcSNMzokWANwJ/TE9wDL2AU8D
	mmeMGOJ0aL16Py+4/Yv+AP8KP5aUK5GWXQa9NjDnaIHtCoA1D8biPZ+g8
	XeNO2H1fUV0aVQXWTK5czBbtfKYqTSaMuVMc0yNccT0IT+Igx3123+P2/
	sghKkzc6WEaxhDOkrgT9brET9nvzCSdECbfVguoDVwlF6T49xFHEAhm9L
	NlVq7jVmgbHKj80EHmfcezIaug6kxHeXTXwOLuwbREtcv93FwXufsw7sh A==;
IronPort-SDR: 4D4q7hzlKtXCEy3Fs8K5We5Wg0uNtuVGiiWsP+9CVaDmPWfCN51tVs8fiICB8Jv44nlrfW/sPQ
	Rsuhx3b0nQdygQDdUYIKpyhv2cClf/ip65Ra39nY+jfL658GRuPwTrNSr6oEY6/0exxCAv58gX
	CXKkgA1t5ZlmYM13SwuA0TPkZge4U/Zupo0gKvBUGTowYG8P/sJx9XK3lZLiVFR7rHE8IckWXe
	/S4oy9bg4igQ3a9Hsurm5uBDWj8w4NHxm7Fxx9zCsUNZBE5SWiLuAcsj/KpcHbhzrA9sil83hl
	aaA=
X-IronPort-AV: E=Sophos;i="5.69,392,1571695200"; 
   d="scan'208";a="2477884"
To: Darcy Watkins <dwatkins@sierrawireless.com>
References: <MWHPR02MB2463ECAC0C98AF970B2EC44FB2230@MWHPR02MB2463.namprd02.prod.outlook.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <5ed37d27-0669-d6d0-7841-f0e3762ae4f6@skidata.com>
Date: Fri, 3 Jan 2020 23:05:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <MWHPR02MB2463ECAC0C98AF970B2EC44FB2230@MWHPR02MB2463.namprd02.prod.outlook.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: yocto@lists.yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [yocto] meta-java / openjdk-8-native spontaneously broken in warrior on CentOS7
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
X-List-Received-Date: Fri, 03 Jan 2020 22:05:57 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Darcy,


On 1/3/20 9:43 PM, Darcy Watkins wrote:
> Happy New Year
> 
> Hi,
> 
> My warrior build with meta-java spontaneously broke over the holidays…

I've backported 2 patches from master to warrior on Dec 27:
http://lists.openembedded.org/pipermail/openembedded-devel/2019-December/203803.html

In there "commit d5a8ec9e269d1f04a6cf78867ebf74a297f33258" added 
"-Wno-error=stringop-overflow" to BUILD and TARGET CFLAGS.


...

> 
> After inspecting the config.log, it appears that 
> “-Wno-error=stringop-overflow” was among the BUILD_CFLAGS.  The old GCC 
> 4.8.5 provided by CentOS did not like this.  My workaround was:
> 
> local.conf:
> 
>     BUILD_CFLAGS_remove = “-Wno-error=stringop-overflow”
> 
> I still haven’t a clue why this only shows up now when the commit that 
> changed openjdk-8-release-172b11-common.inc is dated June 25, 2019 
> “openjdk-8: disable stringop-overflow compiler errors”.
> 

As you correctly mentioned GCC 4.8.5 doesn't support that flag.
AFAIK GCC 7 introduced it.

I will first revert that patch on warrior and send a fixed one (which 
respects the compiler version) later on.

Thank you for that catch and your email to the ml!

regards;rl

