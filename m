Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id D9EC374D75
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:01:39 +0000 (UTC)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7071D20881
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1527231700;
	bh=S9DyRTcHAOCJO1dAdaGD9tuAT2agRWFhBW8qSyTdmfI=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=kB1CbMdDp22tQeweE8KSRTCv5BVOz7ZYdKaJ25PYdOV9WMNCNluReXzGlG4TeLB6s
	QiwTSQZI/gX6PNucYd2rbxGhSxLr/PTFR1tu9DklvIZsHP2adx81NhyH6CkLeEI9JJ
	dMiUgKeFa9Kk1bpEPLOG/v5gflAkIP6GYJwnCvoY=
Received: by mail-wm0-f43.google.com with SMTP id n10-v6so11628505wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 00:01:40 -0700 (PDT)
X-Gm-Message-State: ALKqPwfGlMMv3IiqiGEK3mdwnEuXtjRe+7IPVD+tvfH8nGUcNWfGZWIC
	dRjLVvKlkuC5BYR9nNTm/FP0o/MpNAvp7bAGTWs=
X-Google-Smtp-Source: ADUXVKKv8ONH4nDUgk1mXsVwCHfKUl1ojY4Im/nnnrRj5FQSL0K8YtIS0RKjbgeQ/rDCWkXnHqu990FXcU0M2iQ4sEs=
X-Received: by 2002:a1c:d50a:: with SMTP id m10-v6mr838506wmg.72.1527231698977;
	Fri, 25 May 2018 00:01:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:c552:0:0:0:0:0 with HTTP; Fri, 25 May 2018 00:01:38
	-0700 (PDT)
In-Reply-To: <b4b95eef-f72e-9ee4-3fdb-09b5e5ff71c1@gmail.com>
References: <1527152611-13882-1-git-send-email-krzk@kernel.org>
	<b4b95eef-f72e-9ee4-3fdb-09b5e5ff71c1@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 25 May 2018 09:01:38 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdCE2m_PuiZ6U7VTc8D_d5VCWtbm55JQ+WBAKzuPb1srA@mail.gmail.com>
Message-ID: <CAJKOXPdCE2m_PuiZ6U7VTc8D_d5VCWtbm55JQ+WBAKzuPb1srA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][rocko][PATCH v3] civetweb: Add new recipe with git-based version
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
X-List-Received-Date: Fri, 25 May 2018 07:01:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 4:24 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 05/24/2018 02:03 AM, Krzysztof Kozlowski wrote:
>> Add recipe for CivetWeb: easy to use, powerful, C/C++ embeddable web
>> server with optional CGI, SSL and Lua support, under MIT license.
>>
>> CivetWeb provides C and C++ libraries and a standalone server binary.
>>
>> Choose specific post-v1.10 git revision b8148afe8fa4 which has a fixed
>> SSL support (depending on OpenSSL v1.0.2).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Adding new packages to a stable branch is not allowed.  Also I don't see
> it in master.

Thanks, I'll rebase and resend.

Best regards,
Krzysztof

