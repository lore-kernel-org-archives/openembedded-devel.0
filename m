Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.26554.1629736287440645334
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Aug 2021 09:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=O2xielHa;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D9476101C;
	Mon, 23 Aug 2021 16:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629736286;
	bh=W75IButKaUraOaJHEGvLfX5da6pH7fGJH8ExQvwn/+A=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=O2xielHaXaJPSHxt7Ai8JtBNV399Bds4NNWUhDilupEg5pagF3EllEdFbiYWQDx2K
	 /s1L/Mi7HRzZIUoK0HXtELOlS3gAeM8VyXIj5pesHRmr/4te0l69hsXCkyv27hCK5B
	 V708jfb2naWMgBjZnNh/Z5v673KHPUvdAeDs2OOjrGq2Csoe1hwZPID49z4pApoiDB
	 cKbSmMEM3zDYwA1apIr0SKUdACtiuu1uFfDrqDPlL3zRRjqyu+sxlCLBz+fthfO5SF
	 2xyvtOM25Lrnv8L9kCZtGhCNOi4uLyrtMwrW+F2lIC19xv6pBcy89c1nmAfMj0izve
	 Tw/kQO/XjR6LA==
Subject: Re: [oe] [meta-oe][PATCH] c-ares: remove custom patches
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210823151311.27764-1-okaya@kernel.org>
 <bd3585f3-9028-4f40-4177-6f4b45ff1027@gmail.com>
From: "Sinan Kaya" <okaya@kernel.org>
Message-ID: <de13dbbb-9131-8ee4-dd05-4b3ca6bcdf3c@kernel.org>
Date: Mon, 23 Aug 2021 19:31:25 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bd3585f3-9028-4f40-4177-6f4b45ff1027@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/23/2021 7:07 PM, Khem Raj wrote:
>> delete mode 100644
>> meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
>>
> 
> Its always good to drop some patches we are carrying, however, if you
> could describe the reason why they should be removed, would give a good
> idea if they are good to remove or not.

Current patch is breaking the library dependencies added by cmake
especially when you are static linking (context is mingw for me).

Applications need the ws2_32 library to be linked and with the existing
patch this is not getting passed to the users.

Using the stock CMakeLists.txt, stuff mostly works (minus some patches
that I'm upstreaming now).

