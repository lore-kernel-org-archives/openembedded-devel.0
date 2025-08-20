Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B01FCA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:04:19 +0000 (UTC)
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
 by mx.groups.io with SMTP id smtpd.web10.14780.1755677055532476217
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=bwcnzzlo;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.57, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6C01A183770;
	Wed, 20 Aug 2025 08:04:14 +0000 (UTC)
Received: from uk-fast-smtpout8.hostinger.io (100-96-19-78.trex-nlb.outbound.svc.cluster.local [100.96.19.78])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 84D881833C4;
	Wed, 20 Aug 2025 08:04:13 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1755677053; a=rsa-sha256;
	cv=none;
	b=4Los4zkmP52hVuAI0UgR0vp0DzfiRyLxNaErN9dG15FdIKs3LoI5oYzmM0m3BTiE4XIpQ4
	YHcc+c3+g8aeXeUquz/+t2CXEpVHRm5FmWJ4+3A9Km0gPNNT0SFEq9Q00FndIYcdDgXzzc
	kwphmE2sG3/49n3YU8OoKrhb5NtTWVcZZosfoJDtrtC0HvkjT8SuA857IldQomcepomlDG
	IuWXaXy8O3Q9uBUrIpjI/WgKgGnNdC+jt0fnYTq1MFzOLs9NNKWpeRNRwCtIZPWczC54TR
	hJpoFPuOQBmqXBT4QCunXzvM2kT3SEy+GEt6hLypkzFbylyR29/qaC7wF+TM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1755677053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=xwWO+NZ06k6zMdhuysOma3X8o7KHjSqVr1Xq6RP+35M=;
	b=Vnr5CmiCEzzZf3Ckul4FmxlbQYVkuUth/pyzgX6ov9yaoJQqOGv0IMwqnrJ6FPgFYOoeoF
	0HeKXyB2MEr23WR2Pg/6w8I9kimxByoSbXgdthhES6XYW4t1gd1UrXk7qJekGIJQO5cU62
	t369HvB1Ozt3Q3ULgq34k18wRxuO+Z4A9hSU5QZhFah5pVsy6d19Les61oTsCcvQweODdj
	b7SCgpJXk+h6ErhNiGapmSowuSK/x9N6N/dcskt3zNqxXxvMCC6G/w60IRcPbxDAjSIe8U
	zyASp7WywhDXPTWMuxjnaFwbdp/oQTdDdChC/1P8fBo0eW5Q67udT2T88ewT/g==
ARC-Authentication-Results: i=1;
	rspamd-db96f7987-kh78w;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Stupid-Grain: 65300d067ee8ad30_1755677054190_2026385037
X-MC-Loop-Signature: 1755677054190:1687931534
X-MC-Ingress-Time: 1755677054190
Received: from uk-fast-smtpout8.hostinger.io (uk-fast-smtpout8.hostinger.io
 [31.220.23.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.19.78 (trex/7.1.3);
	Wed, 20 Aug 2025 08:04:14 +0000
Received: from [IPV6:2001:861:4448:6b00:20fd:26:c2f8:c9f] (unknown [IPv6:2001:861:4448:6b00:20fd:26:c2f8:c9f])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4c6JrC2QgmzPJWp;
	Wed, 20 Aug 2025 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1755677051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMUHV2biYjMKULytOIgMtPUkaCGW9xlfdLxetsPLKQ0=;
	b=bwcnzzloMYkYFIwecZqL7F9zUp9qgHGO3OmNr0UJzMM0NjPHsn0izntsnsd6Fvh98+4JlZ
	8ZvXSVIYViQDG7fbkNBBe0nDAIQNy/XywsW4aUkSnNFCZSZzTVUocKxnE7zMy0fdi88ibG
	3zTvJNQi5Qv9shbHW0CFvWgIpbkGuqfo/y5Qy1RvE7yprolPY65+2jFyG9aAy4F8IgmYFI
	Ptc+UcnMt2oNqf8osyqgmtQqWWIchpp0mAGzPZl4z/fQQPE1lgKzLrJunGvPZ4o6wcwpvf
	Uh3ROh/BBnpYaCy5qle11vD6thl813TxFNLFykcJT2bnxFh7gKVBbf5LQ0lZEQ==
Message-ID: <e37ef122-48fa-4422-890b-22f9ad8e9d33@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] kernel-hardening-checker:
 backport recipe
To: Gyorgy Sarvari <skandigraun@gmail.com>
References: <20250819203929.1272607-1-michael.opdenacker@rootcommit.com>
 <1d47e8eb-0753-47e3-9339-b469f2f141f1@gmail.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <1d47e8eb-0753-47e3-9339-b469f2f141f1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Aug 2025 08:04:11 +0000 (UTC)
X-CM-Envelope: MS4xfFYA4EL8AEUvzEdhDdp6xJsnDZshwf2Q5btf44KxsEuw2YflT7mmkxR8lZBVN7FJUBDx28j0xAQXtPSHoR+cd7HZAU4o/AzMbSTUaJ1H+DRD8cPocsx3 E4pB4tUe91GBiePByore39yzgOx80NAp5BL1luSsGjEKq/2fE0gjPKeI4MiOwJNAty+I6zrYF2jorQHK7XDMrybT3FkBnpU1+riZ9gCaV/3KmgsUgjJJoE6w HhsHte99DHQ8ue3ATJU6gU8IW8kQS60AZWHSDtW+ZJl6d/tZG8wjKo3bHaz21EgJofpjuUfafM3ZvJOpAyjDwAIWqI//JdAEQwy71xR2lVbzqXJVTzAo8IZZ ht/lPyJgSGmcK/jRDwZEiX9KZtUF8NlldZT2OE19EB0t3NmK7YLntCNBPt+PQ2BO6pxizZKT
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68a5817b a=SFIAAhqJPBxWPFAgY/jUJg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=d70CFdQeAAAA:8 a=fphHwwEshI2KGcsdC04A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119012

Hi Gyorgy

Thanks for your reply!

On 8/20/25 09:44, Gyorgy Sarvari wrote:
> On 8/19/25 22:39, Michael Opdenacker via lists.openembedded.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>
>> This recipe is a Scarthgap backport of kernel-hardening-checker_0.6.10.2.bb
>> in the master branch as of August 19, 2025.
>>
>> Tested on qemux86-64 and on beaglebone-yocto
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> ---
>>   ...ject.toml-fix-up-license-information.patch | 31 ++++++++++++++
>>   ...-relax-setuptool-version-requirement.patch | 29 +++++++++++++
>>   .../kernel-hardening-checker_0.6.10.2.bb      | 41 +++++++++++++++++++
>>   3 files changed, 101 insertions(+)
>>   create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/files/0001-pyproject.toml-fix-up-license-information.patch
>>   create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/files/0002-pyproject.toml-relax-setuptool-version-requirement.patch
>>   create mode 100644 meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb
> Note that new recipes are only accepted in master branch, not in stable
> branches.

However, this has already been accepted in master 
(https://git.openembedded.org/meta-openembedded/commit/?id=5ae3536204ba3764b03647ab75169ee65ca43531)
It's true that meta-oe didn't originally have this recipe, but what's 
the harm in sharing with LTS users that could have the same need as 
mine? The risk of breaking tests again meta-oe?

I'm reading https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS 
... I guess such a backport qualifies as a "new feature". But does this 
really apply to meta-openembedded which is not officially part of the LTS?

On the other hand, mixin layers are supposed to be for "potentially 
invasive changes", which is not the case here.
So, where are such (new) backports supposed to be shared?

Thanks
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


