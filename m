Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.13515.1601353721557735058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 21:28:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=cfeNsJU5;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from [192.168.0.112] (75-58-59-55.lightspeed.rlghnc.sbcglobal.net [75.58.59.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B42D620774;
	Tue, 29 Sep 2020 04:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601353720;
	bh=X1HJd3Lacymghtp/pZavM2BytyKFaemh2DAXnCyl9P4=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=cfeNsJU51TWJL6WKBEHIb7XUrHyi0LNdFF9kSwBm3LGGJ2melS6qQI9mnZS4rhAUF
	 st8ML2hx32wZqH6zXfP86LuxnjpTZT0NHeolgFvgwOLlQdxV+E6YH+PIsv0UYfsobh
	 MONT944q0wFGmvQgN/3vGMdnh8lKNuZdlE/rCTQI=
Subject: Re: [oe] [meta-oe][PATCH] collectd: make rrdtool and rrdcached optional
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200929033344.120687-1-okaya@kernel.org>
 <CAMKF1spq1W9fKgyVX96nNYY5q2M268Dvs26LqTGy8QYcijq4sA@mail.gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
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
Message-ID: <6f6f7449-ffeb-1b0c-98bd-699bfb94f837@kernel.org>
Date: Tue, 29 Sep 2020 00:28:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spq1W9fKgyVX96nNYY5q2M268Dvs26LqTGy8QYcijq4sA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/28/2020 11:57 PM, Khem Raj wrote:
> On Mon, Sep 28, 2020 at 8:33 PM Sinan Kaya <okaya@kernel.org> wrote:
>> rrdtool plugin pulls x11 library dependencies into the target.
>> It should be only set on need basis.
>>
> I do not see x11 in either collectd dependencies or rrdtools, is that
> an oversight ?
> 

Here is the dependency tree. It gets pulled because of pango.

"rrdtool" -> "/bin/sh"
"rrdtool" -> "ld-linux.so.3"
"rrdtool" -> "ld-linux.so.3(GLIBC_2.4)"
"rrdtool" -> "libc6" [label=">= 2.28"]
"rrdtool" -> "libcairo2" [label=">= 1.14.12"]
"rrdtool" -> "libcairo.so.2"
"rrdtool" -> "libc.so.6"
"rrdtool" -> "libc.so.6(GLIBC_2.11)"
"rrdtool" -> "libc.so.6(GLIBC_2.27)"
"rrdtool" -> "libc.so.6(GLIBC_2.28)"
"rrdtool" -> "libc.so.6(GLIBC_2.4)"
"rrdtool" -> "libc.so.6(GLIBC_2.8)"
"rrdtool" -> "libglib-2.0-0" [label=">= 2.58.0"]
"rrdtool" -> "libglib-2.0.so.0"
"rrdtool" -> "libgobject-2.0.so.0"
"rrdtool" -> "libm.so.6"
"rrdtool" -> "libm.so.6(GLIBC_2.4)"
"rrdtool" -> "libpango-1.0.so.0"
"rrdtool" -> "libpangocairo-1.0.so.0"
"rrdtool" -> "libpng16-16" [label=">= 1.6.36"]
"rrdtool" -> "libpng16.so.16"
"rrdtool" -> "libpng16.so.16(PNG16_0)"
"rrdtool" -> "libpthread.so.0"
"rrdtool" -> "libpthread.so.0(GLIBC_2.4)"
"rrdtool" -> "librrd.so.8"
"rrdtool" -> "libxml2" [label=">= 2.9.8"]
"rrdtool" -> "libxml2.so.2"
"rrdtool" -> "libxml2.so.2(LIBXML2_2.4.30)"
"rrdtool" -> "libxml2.so.2(LIBXML2_2.6.0)"
"rrdtool" -> "libxml2.so.2(LIBXML2_2.6.17)"
"rrdtool" -> "pango" [label=">= 1.42.4"]
"rrdtool" -> "perl"
"rrdtool" -> "rtld(GNU_HASH)"

"pango" -> "/bin/sh"
"pango" -> "ld-linux.so.3"
"pango" -> "ld-linux.so.3(GLIBC_2.4)"
"pango" -> "libc6" [label=">= 2.28"]
"pango" -> "libcairo2" [label=">= 1.14.12"]
"pango" -> "libcairo.so.2"
"pango" -> "libc.so.6"
"pango" -> "libc.so.6(GLIBC_2.4)"
"pango" -> "libc.so.6(GLIBC_2.7)"
"pango" -> "libfontconfig1" [label=">= 2.12.6"]
"pango" -> "libfontconfig.so.1"
"pango" -> "libfreetype6" [label=">= 2.9.1"]
"pango" -> "libfreetype.so.6"
"pango" -> "libfribidi0" [label=">= 1.0.5"]
"pango" -> "libfribidi.so.0"
"pango" -> "libglib-2.0-0" [label=">= 2.58.0"]
"pango" -> "libglib-2.0.so.0"
"pango" -> "libgobject-2.0.so.0"
"pango" -> "libgthread-2.0.so.0"
"pango" -> "libharfbuzz0" [label=">= 1.8.8"]
"pango" -> "libharfbuzz.so.0"
"pango" -> "libm.so.6"
"pango" -> "libm.so.6(GLIBC_2.4)"
"pango" -> "libpango-1.0.so.0"
"pango" -> "libpangocairo-1.0.so.0"
"pango" -> "libpangoft2-1.0.so.0"
"pango" -> "libpangoxft-1.0.so.0"
"pango" -> "libpthread.so.0"
"pango" -> "libpthread.so.0(GLIBC_2.4)"
"pango" -> "libx11-6" [label=">= 1.6.6"]
"pango" -> "libX11.so.6"
"pango" -> "libxft2" [label=">= 2.3.2"]
"pango" -> "libXft.so.2"
"pango" -> "libxrender1" [label=">= 0.9.10"]
"pango" -> "libXrender.so.1"
"pango" -> "rtld(GNU_HASH)"

