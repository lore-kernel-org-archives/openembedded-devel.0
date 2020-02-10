Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 9366B60C78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 16:31:32 +0000 (UTC)
Received: from [10.92.140.44] (unknown [167.220.149.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4042E20733;
	Mon, 10 Feb 2020 16:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581352293;
	bh=+K8bB+12lsu/UKNguPJcvF393KYqA/5d9Vq3jOGJSMg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=KlOlvETXz8pHROW2FGFG2fO/FPuyaB6+lHo498vztVTCvn9tlXw7mDWFoGyP+Jn2R
	12m8BLRdoFesdWgwdnkMwGh5RGp7w0NfcCTOU0ALCWuTDA0M8aSOTmvu8uJMFMGtCQ
	X4UmF+9J3Bq5HdOs1od6TYVGrA8XJ/NKVh3FOBas=
To: Khem Raj <raj.khem@gmail.com>
References: <20200209034641.19378-1-okaya@kernel.org>
	<CAMKF1sorVApNQ69i3QOUiK6yF1gCvubzNvT=VMkjPcFtK+XC+w@mail.gmail.com>
From: Sinan Kaya <okaya@kernel.org>
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
Message-ID: <784d11f6-ae33-dc1e-da43-6a71824ec0a6@kernel.org>
Date: Mon, 10 Feb 2020 11:31:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sorVApNQ69i3QOUiK6yF1gCvubzNvT=VMkjPcFtK+XC+w@mail.gmail.com>
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
X-List-Received-Date: Mon, 10 Feb 2020 16:31:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/9/2020 2:53 AM, Khem Raj wrote:
>> +SUMMARY = "Abseil is a cpp library like STL"
>> +DESCRIPTION = "It's got containers, algorithms, useful stuff!"
> maybe we can be more specific about it from
> https://github.com/abseil/abseil-cpp/blob/master/README.md
> 
>> +HOMEPAGE = ""
> perhaps https://abseil.io/ instead of leaving it empty is better.
> 
done

>> +SECTION = "libs"
>> +LICENSE = "Apache-2"
> The current value is not wrong but Apache-2.0 would be better to match SPDX
> 
done

>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
>> +
>> +SRCREV = "aa844899c937bde5d2b24f276b59997e5b668bde"
>> +BRANCH = "lts_2019_08_08"
>> +SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}         \
>> +           file://0001-Remove-maes-option-from-cross-compilation.patch \
>> +          "
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', '
>> -march=armv8-a+crypto', '', d)}"
>> +TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'x64', ' -maes -msse4.1', '', d)}"
>> +
>> +CXXFLAGS_append_class-nativesdk = " -Wl,--no-as-needed -fPIC"
>> +CXXFLAGS_append_class-native = " -Wl,--no-as-needed -fPIC"
> perhaps use ASNEEDED_<override> = ""

done

> 
>> +CXXFLAGS_append_class-target = " -fPIC"
>> +
>> +inherit cmake
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> +ALLOW_EMPTY_${PN} = "1"
> why do we need this ?

Library generates an empty $PN package and I had problems linking the
library to the new grpc version without producing the empty ${PN}.
This library is requires by the newer grpc versions.

