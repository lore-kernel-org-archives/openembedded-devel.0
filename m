Return-Path: <ross@burtonini.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0389B60FAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 17:58:14 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id u12so1654568pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=oTJ+HLoWrOfgrMbBipdd3PWQ91FLPh6s6v7uKOxBn1c=;
	b=s96MmAH3FwqaLXVh+TLmjN5hWILaoTN0LLSZiom7eRayGtvRSWQ1/EiG1f6J3/TNeu
	/lS9r/BDAVxo/8y9/BHPrEw5QyI9mpoZ03614qqNMnpKfPCMV+XP0g1uTtSw+Pg/0ojU
	QMsvSoruOSDAZCj3//OKcwvlyRxl4hqYls8mRfZm5mQoIIV+XumBhqayCZmDIUAzN7iY
	je7/vAHm/CBuWHpoHAJ4E/uoyIhh03o3nI9gMgAT4W5ISVzabfLcx5Jqpbrkqn8Jowp6
	7tu/D7Qh9e+XavB6RBNfzpmi5Uea7JxpG78I7nfCm7Z7BT8LFeEZ4XmWsTdDpp/6b7K0
	vfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oTJ+HLoWrOfgrMbBipdd3PWQ91FLPh6s6v7uKOxBn1c=;
	b=gTjBq3FJVBSI6qB6Gj4t/OVh4ZISy0hjvdGNiFPo8PtRtX/YcYgnEcw/mXYhBrJwxI
	oJfLCA64GOiLtJwvVbSLCHwN/6tuqsmbW1A35BCb/PY63Wj8GA/Wbfk3OAdmOruBEZJq
	SWqP2MJsOQRKDWvFXOgYMue0E25ciOqr/tiMSRHxGX0vZgFxA9C5DcvlujcFHECjsk3W
	bmL4NQBvVCFTdIa6EXzGEvTTCULRXIuGPxWwxSYudjQe6xE0tK+odX2monLY6X9np4/H
	JzHTCYIxu3agO3jfpxgWA7z2ZfNAs+H68NTcbS924W7CShWLw8lBaPss8GMvJtoT26Tl
	9YkQ==
X-Gm-Message-State: ANhLgQ1aUK6JnTSgZxEOQNRtohgDKB21ItGADeJ8eX2HUtrxIGbwG3Na
	zV5+zsx9s1Rbk6Huka6CFYltNeoyTI0jnw==
X-Google-Smtp-Source: ADFU+vv9xgts3b7P2Q2dYPjN4GOxEOcPgKyG9Q0OMnAB8YljwOhtYlgXSlXhsQ/gupSg45xCLWvg7Q==
X-Received: by 2002:a63:6a4a:: with SMTP id f71mr4677161pgc.365.1584640695464; 
	Thu, 19 Mar 2020 10:58:15 -0700 (PDT)
Received: from cahanley-mobl.ger.corp.intel.com ([192.55.54.44])
	by smtp.gmail.com with ESMTPSA id
	c11sm3169959pfc.216.2020.03.19.10.58.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Mar 2020 10:58:14 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.21.2003190907590.10468@localhost.localdomain>
	<20200319134213.GA29515@localhost>
	<alpine.LFD.2.21.2003191302490.458222@localhost.localdomain>
	<20200319173223.GC29515@localhost>
From: Ross Burton <ross@burtonini.com>
Message-ID: <ba526e90-ccd7-04e2-5907-026b754a2da0@burtonini.com>
Date: Thu, 19 Mar 2020 17:58:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319173223.GC29515@localhost>
Subject: Re: proper way to report(?) conflicting files being installed?
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
X-List-Received-Date: Thu, 19 Mar 2020 17:58:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/03/2020 17:32, Adrian Bunk wrote:
>>    this does seem backwards ... if both gnome-common and
>> autoconf-archive currently try to install those two m4-related files,
>> doing the above pretty much *assures* an installation conflict,
>> ...
> 
> No, --with-autoconf-archive makes gnome-common not install the
> conflicting files.

I should point out that gnome-common is dead upstream and mostly unused 
now, so if you find a recipe using it do check that it is actually needed.

Ross

