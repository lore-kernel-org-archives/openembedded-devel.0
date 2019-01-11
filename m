Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 683797C090
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 19:09:51 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z9so7382432pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=UPW6YG/OnQkpPnboQb90bDPrew0z/o22TUkfrCoDv44=;
	b=MgvfLE7vzPt4vzWK/fLAbEOKAxHxvMb6O+tnAQOmcguA0QgjxR6vJQ/ByA3KH5DyOx
	6SMUdpJqpxZb9/ov303d5xIwhbNknUQzraM4U9McXndk9kx6gGZr7quIule93BkF2UvS
	iKX+8McJfHttKv5yIevpzSaYI4uCfV2rYIY4eaO3Bp2sk5TwZR24ZghwaD9znhvp+w/T
	CdKFMXgm4hnZV/NLfQgBfeHy4Jkbm27uako0DnmSYv1r8H6ZkQe2ywySFBWuJD/JgFd2
	PrUAUn6wciwmwj31KGzfpGK2hO2RbReTFe1ja28FXrs9S5Ti7Xcd7XsVhUWV7XJHIy4B
	lXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=UPW6YG/OnQkpPnboQb90bDPrew0z/o22TUkfrCoDv44=;
	b=bCcXaR+zLnVJ71MdpBdVi+IKcE4ga42+ii5gpKeq6oD8Ze1T7SGL0XRsaJVoe3ytSJ
	SSd8isox5EvKgEr8c1IXirx64tSLrhnG4n35+Fy90rzqH/feglRS66CMxsYc9ABdcyvQ
	lBHuO3ImYlQLNI3yClfgfb/amhCulkNqKpZS+mFmvRjK1EzJzYlDBmMM3MiF3BcGhWxm
	pP3mXrlbiu3eDy+ZkYXxmCpzaewk0iHOKf3elkS3NbdNJLeA1TGqw2phtrtGI5czMbW1
	LSOoCZB1uK0rPw9M4kVOhIBFXpJKMBjB+AAsEVIFqdCtgbz7sntr2Cm4Z06zvV2UkcsP
	rYQg==
X-Gm-Message-State: AJcUukfi6ru9QDaqlo3VRmVhOxlt0Hlfj/K5CuQ3HwNLOIILXcx8zKJh
	2xhM9IDGg9bWaYqnbhmKJ9Cc4AoN
X-Google-Smtp-Source: ALg8bN6AB60bwIJqpl8/O1bAYgrZzMkCH6rki4HjuF3vvrzK09GVd3M+0xE08d+Jtj8cUbuIED9vyw==
X-Received: by 2002:a65:40c5:: with SMTP id u5mr14008530pgp.46.1547233792300; 
	Fri, 11 Jan 2019 11:09:52 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:d000:5af4:72a3:b2fa?
	([2601:202:4180:c33:d000:5af4:72a3:b2fa])
	by smtp.gmail.com with ESMTPSA id
	v184sm109817168pfb.182.2019.01.11.11.09.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 11:09:51 -0800 (PST)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20181228151713.19266-1-schnitzeltony@gmail.com>
	<CALbNGRQSDpsjP8=2wyuo_f9kdK3ekXrA4q8Tp0iqhmB5jjfhrg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bbc1dade-81c0-6c17-f275-c7786e7a725a@gmail.com>
Date: Fri, 11 Jan 2019 11:09:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRQSDpsjP8=2wyuo_f9kdK3ekXrA4q8Tp0iqhmB5jjfhrg@mail.gmail.com>
Subject: Re: [thud][PATCH 0/4] Fixes
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
X-List-Received-Date: Fri, 11 Jan 2019 19:09:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Andreas,

On 1/11/19 3:15 AM, Andreas Müller wrote:
> On Fri, Dec 28, 2018 at 4:17 PM Andreas Müller <schnitzeltony@gmail.com> wrote:
>> Patch 2 is an update but necessary to build gvfs with libmtp in PACKAGECONFIG
>>
>> Andreas Müller (4):
>>   libxklavier: Fix keyboard layout bug for xfce4-settings
>>   libmtp: upgrade 1.1.5 -> 1.1.16 and rework
>>   networkmanager: move udev-rules from /usr/lib -> /lib
>>   openjpeg: fix build for multilib
>>
> Ping?
I have them stagged for some build testing.

thanks,
Armin

