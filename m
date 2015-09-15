Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 790916E630
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 15:03:26 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so14620306igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=0XiPoX8/XIMMF2lqVC5MIYnvdf8yKUfvYfHavg563ss=;
	b=WkIt6et8/M3qvkCK8yF9/Ho+Gn7qFNBoVZugx41jR8bWVKYbxiEzdTN76FZM/8+cWm
	e574rd9N60bFIjy4Sb57Djrlncmi1lfkHrFbeaCc1Odx64MnDCjej6+ZhgkkvJQ/O0bl
	DYMte4oTD8IkaL2R0yCFkNGw2IY13TCBp4/lvVGz34FuDDEdsieROmLGy5kF9HXLFjvs
	8Ov1cYUpD1aH5zcWKKDFEEAglOAJ73VkFkjU87TjYi3bKro0VkraINWqQ6Kd8AnGJYa9
	xR4SE9vHIguaoiAFTXfInDQLbMlBfiWf41Ye3SuvTC5ceNZh0K3f+t1QNEAQ9RjePkUs
	l3Ow==
X-Received: by 10.50.73.137 with SMTP id l9mr6797606igv.85.1442329406401;
	Tue, 15 Sep 2015 08:03:26 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	o189sm8253064ioe.30.2015.09.15.08.03.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 08:03:25 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1442321402-22469-1-git-send-email-clopez@igalia.com>
	<1442321402-22469-2-git-send-email-clopez@igalia.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <55F8333A.9000007@gmail.com>
Date: Tue, 15 Sep 2015 11:03:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1442321402-22469-2-git-send-email-clopez@igalia.com>
Subject: Re: [meta-browser][PATCH 1/3] chromium: Allow to build in Debug mode.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2015 15:03:27 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 09/15/15 08:50, Carlos Alberto Lopez Perez wrote:
>   * Add also a patch that workarounds a build error when building
>     in Debug mode and using GCC. This patch has no effect when
>     building in Release mode because is guarded within ifdef(debug)
>     blocks.
>
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
> ---
>  recipes-browser/chromium/chromium.inc              |  4 ++-
>  .../fix-build-error-with-GCC-in-Debug-mode.patch   | 32 ++++++++++++++++++++++
>  recipes-browser/chromium/chromium_40.0.2214.91.bb  |  1 +
>  3 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-browser/chromium/chromium/chromium-40/fix-build-error-with-GCC-in-Debug-mode.patch

Does the above patch need an upstream-status tag?

