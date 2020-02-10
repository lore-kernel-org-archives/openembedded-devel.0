Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 8B68760926
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:14:52 +0000 (UTC)
Received: from [10.160.98.91] (unknown [167.220.148.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 634C620715;
	Mon, 10 Feb 2020 17:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581354893;
	bh=NRK5MyjJLJz9WRd0VjYmgpmtI72j7jVeEyqyeYfrmMA=;
	h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
	b=EDCAEIq8JQdZoZWCQ9m4OGvoTuWu8OmSaK/0YsJVjwombb860Atf6BjAffqiMkJs7
	MI7nlLYIdVTQzQiP4p0ZqVTBYSmonBG79I0QjmEH6QYEhi771eKbdwSr529K+wNu9T
	YVJq7aWYRCQObIpBeHiwUZpzxtA/9kcLQuVYg0Ic=
From: Sinan Kaya <okaya@kernel.org>
To: Khem Raj <raj.khem@gmail.com>
References: <20200209034641.19378-1-okaya@kernel.org>
	<CAMKF1sorVApNQ69i3QOUiK6yF1gCvubzNvT=VMkjPcFtK+XC+w@mail.gmail.com>
	<CAMKF1sphX1U9MWnhvOhiyKNWy8BJNJtxeJuf9WOYV4qWWrXY7A@mail.gmail.com>
	<ebdd6807-4f9b-f1aa-fcdf-dba5ab71715e@kernel.org>
	<CAMKF1spONv-2fZ676CSPjAHbDwzKAABqBHa0Obj2=0+osj84ZQ@mail.gmail.com>
	<744b282f-eb9c-4831-dcf3-5fcec52958ab@kernel.org>
Autocrypt: addr=okaya@kernel.org; keydata=
	mQENBFrnOrUBCADGOL0kF21B6ogpOkuYvz6bUjO7NU99PKhXx1MfK/AzK+SFgxJF7dMluoF6
	uT47bU7zb7HqACH6itTgSSiJeSoq86jYoq5s4JOyaj0/18Hf3/YBah7AOuwk6LtV3EftQIhw
	9vXqCnBwP/nID6PQ685zl3vH68yzF6FVNwbDagxUz/gMiQh7scHvVCjiqkJ+qu/36JgtTYYw
	8lGWRcto6gr0eTF8Wd8f81wspmUHGsFdN/xPsZPKMw6/on9oOj3AidcR3P9EdLY4qQyjvcNC
	V9cL9b5I/Ud9ghPwW4QkM7uhYqQDyh3SwgEFudc+/RsDuxjVlg9CFnGhS0nPXR89SaQZABEB
	AAG0HVNpbmFuIEtheWEgPG9rYXlhQGtlcm5lbC5vcmc+iQFOBBMBCAA4FiEEYdOlMSE+a7/c
	ckrQvGF4I+4LAFcFAlztcAoCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQvGF4I+4L
	AFfidAf/VKHInxep0Z96iYkIq42432HTZUrxNzG9IWk4HN7c3vTJKv2W+b9pgvBF1SmkyQSy
	8SJ3Zd98CO6FOHA1FigFyZahVsme+T0GsS3/OF1kjrtMktoREr8t0rK0yKpCTYVdlkHadxmR
	Qs5xLzW1RqKlrNigKHI2yhgpMwrpzS+67F1biT41227sqFzW9urEl/jqGJXaB6GV+SRKSHN+
	ubWXgE1NkmfAMeyJPKojNT7ReL6eh3BNB/Xh1vQJew+AE50EP7o36UXghoUktnx6cTkge0ZS
	qgxuhN33cCOU36pWQhPqVSlLTZQJVxuCmlaHbYWvye7bBOhmiuNKhOzb3FcgT7kBDQRa5zq1
	AQgAyRq/7JZKOyB8wRx6fHE0nb31P75kCnL3oE+smKW/sOcIQDV3C7mZKLf472MWB1xdr4Tm
	eXeL/wT0QHapLn5M5wWghC80YvjjdolHnlq9QlYVtvl1ocAC28y43tKJfklhHiwMNDJfdZbw
	9lQ2h+7nccFWASNUu9cqZOABLvJcgLnfdDpnSzOye09VVlKr3NHgRyRZa7me/oFJCxrJlKAl
	2hllRLt0yV08o7i14+qmvxI2EKLX9zJfJ2rGWLTVe3EJBnCsQPDzAUVYSnTtqELu2AGzvDiM
	gatRaosnzhvvEK+kCuXuCuZlRWP7pWSHqFFuYq596RRG5hNGLbmVFZrCxQARAQABiQEfBBgB
	CAAJBQJa5zq1AhsMAAoJELxheCPuCwBX2UYH/2kkMC4mImvoClrmcMsNGijcZHdDlz8NFfCI
	gSb3NHkarnA7uAg8KJuaHUwBMk3kBhv2BGPLcmAknzBIehbZ284W7u3DT9o1Y5g+LDyx8RIi
	e7pnMcC+bE2IJExCVf2p3PB1tDBBdLEYJoyFz/XpdDjZ8aVls/pIyrq+mqo5LuuhWfZzPPec
	9EiM2eXpJw+Rz+vKjSt1YIhg46YbdZrDM2FGrt9ve3YaM5H0lzJgq/JQPKFdbd5MB0X37Qc+
	2m/A9u9SFnOovA42DgXUyC2cSbIJdPWOK9PnzfXqF3sX9Aol2eLUmQuLpThJtq5EHu6FzJ7Y
	L+s0nPaNMKwv/Xhhm6Y=
Message-ID: <c97bd99a-ba3c-bbaa-8423-3d98196a216a@kernel.org>
Date: Mon, 10 Feb 2020 12:14:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <744b282f-eb9c-4831-dcf3-5fcec52958ab@kernel.org>
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Changyi Li <Changyu.Li@microsoft.com>
Subject: Re: [meta-oe][PATCH] abseil-cpp: add recipe for git version
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
X-List-Received-Date: Mon, 10 Feb 2020 17:14:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/10/2020 11:33 AM, Sinan Kaya wrote:
> On 2/9/2020 1:40 PM, Khem Raj wrote:
>> python () {
>>     arch = d.getVar("TARGET_ARCH")
>>
>>     if arch == "aarch64":
>>         tunes = d.getVar("TUNE_FEATURES")
>>         if not tunes:
>>             return
>>         pkgn = d.getVar("PN")
>>         pkgv = d.getVar("PV")
>>         if "crypto" not in tunes:
>>             raise bb.parse.SkipPackage("%s-%s Needs support for crypto
>> on armv8" % (pkgn, pkgv))
>> }
> thanks, I'm adding this now.
> 

Hmm....

I don't see a crypto feature on aarch64. tunes value return just
aarch64.


