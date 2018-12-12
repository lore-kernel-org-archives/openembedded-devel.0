Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id AD2E86C16F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 21:18:55 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w7so8896659pgp.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 13:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=bx7LCx8zIhpOoaYRcApGQqex9go/BGzSv+fKtQOvJcw=;
	b=IW5OvBYAbblo9tLlzbvIYVEcZ2She/82z7/Koge6u7SDiOzG5bUu/eiEvwAzpdpP6i
	F7cpwp62MjeR5pCRGEb4zy//SKBqw9ko5oh9KTG5/kVaRUyi37YirKShK5pkJOnWtpc2
	aHTnr83XCQ2yIl2jUxZohFzoLjxsqC/UgnV6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=bx7LCx8zIhpOoaYRcApGQqex9go/BGzSv+fKtQOvJcw=;
	b=V9NX6J11aBFptK8KkabHam4HoV0XkxdARRjDBuDW+qTc5IPZA48ehPKS1KQC2Z1ihq
	Nhi/l98Uv6iEHZhwNgPQQNvZNeeP3tzsjFdyA3iV2T8H16DqMWlQA23s14okXaXU9jhY
	H5Jsp1DufL+iD9/EXM0hxObUteqX0XmSbCdkwJKFjQePuiDVCDNevkh+MbC7UDKQ4KWm
	7l/WQkI80NZJ1AnEbskSDdL/q6DC6fSaKV7JUFOdMNbvZqghjxluND4y6VAHu3HOnpQA
	4dlyAl0JbUd5UakL4jMDcbn+q2/B0ZaiyvFTEKKVa/yc/eel52++TOTP5pOPIQv2vsaz
	K/ZQ==
X-Gm-Message-State: AA+aEWaVW5D7DvE+jOAi6PmKQ9HjVQ3IMHA1q/Rj6rCPuF6Bw7RoAHPB
	GPFxb89F8cnNsBmsPflWqMMVRlQfBeI=
X-Google-Smtp-Source: AFSGD/WMjTk2nLoJJ57xgSmYnORIXgJj2xTyTRQSLKbgdzIKrmG214mPEJU8P0cmfyGoNiqU98r41A==
X-Received: by 2002:a63:4c6:: with SMTP id 189mr1198572pge.391.1544649536303; 
	Wed, 12 Dec 2018 13:18:56 -0800 (PST)
Received: from ?IPv6:2601:1c0:ca00:bd01::d5ff? ([2601:1c0:ca00:bd01::d5ff])
	by smtp.gmail.com with ESMTPSA id
	v15sm25115316pfn.94.2018.12.12.13.18.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Dec 2018 13:18:55 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <3045fc0b-288e-322f-e4eb-d6ff637abf2f@linuxfoundation.org>
	<CAMKF1sqqSqzXoEYO==L6t_3t6BEHFsUC75Tv9H-2pHdmv-7mtg@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <2d3cdfda-317a-1f8f-3018-411dc7acd7d5@linuxfoundation.org>
Date: Wed, 12 Dec 2018 13:18:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqqSqzXoEYO==L6t_3t6BEHFsUC75Tv9H-2pHdmv-7mtg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Shall we remove bad-checksum files on http://sources.openembedded.org/?
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
X-List-Received-Date: Wed, 12 Dec 2018 21:18:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've removed all of those files and prevented them from being mirrored 
in the future.

Are there any other files we should remove?

On 12/12/18 10:48 AM, Khem Raj wrote:
> Yes they serve no purpose deleting them is in order
>
> I should also check the Jenkins job to ignore them
>
> On Wed, Dec 12, 2018 at 10:32 AM Michael Halstead 
> <mhalstead@linuxfoundation.org <mailto:mhalstead@linuxfoundation.org>> 
> wrote:
>
>     With the current setup files will accumulate on
>     http://sources.openembedded.org/ over time and none will be
>     removed. Are
>     there any patterns that should be removed over time? *bad-checksum*
>     files seem like an obvious choice. Please share concerns or suggust
>     other patterns to remove.
>
>     Thank you,
>
>     -- 
>     Michael Halstead
>     Linux Foundation / SysAdmin
>
-- 
Michael Halstead
Linux Foundation / SysAdmin


