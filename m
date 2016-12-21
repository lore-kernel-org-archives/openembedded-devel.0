Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49E366FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 01:33:19 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id b1so14179074pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 17:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=PcK9K+D88nRcTf4cpwv8lYHLpVx8JVHo4Uj/yjmD/bs=;
	b=ccAqY7VzR9gDHC3kkbsnLmizHpe6vH5Mo46LvVjqtOnQejZK8TQp2Dz0DZ23XcSj2i
	Q4fi/0Eh3k7xYazYnn9EKliKnsNOic+oAM8WuNa1OJ2qjFP1pYunESfp7qJk0Iyn6SOL
	Tr4j4ov5dzJg0RPg4jYnSyGTzTXvq3JSDQBD3kJUhhg0ZGT3rExvjllK5kK60eo/+7c0
	iJZjamAnAaolQFGXV+4BeluLWFzLgkrhRLP3MYOwPUjuRjobF41VTY9VKObe0ZCGiFmb
	zl1bBuP4NWLqNILqhI8ERg7wedcTqeyQ0+EYgVlI8NKw9sXgrFTLB4nQuftjUVveikjm
	7ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=PcK9K+D88nRcTf4cpwv8lYHLpVx8JVHo4Uj/yjmD/bs=;
	b=RjdA34aqhUFltZ/UTAWt1mvFXR1B5efXrppefxSTVhBInTiczKB6jjhg1DOBqhJldf
	hJzOImgmvhioVpTmcSnIXNOEnR/Uszt+MN3ArHDR64WVAxppvlnWRs4rjMQOA3sCtm8i
	mmeUGqx+qp/ICAXjBqEuqndrYDQsBwGghhFfdoAChcBLnMm6Iu6fAjS67VNiZ8/0c93t
	AyyNrT1ubSN39gmFzx4GueV1isn11zx7X8B35FANdtEgY+qnYs1oIs3GbVRv24OE0Vs0
	SPCMg5A27oFINwr+6Crl/vqCKviR7YNfOVSFSono85BgHDmjSPQU881wN6A28JB0WtGs
	IRFg==
X-Gm-Message-State: AIkVDXI+1wtl/0oR/xPIa2u9XVAUbez00T06OmC2YanuH+E5PV7ACuwytYe+SsdZKXrZVw==
X-Received: by 10.99.132.194 with SMTP id k185mr3432367pgd.171.1482284000788; 
	Tue, 20 Dec 2016 17:33:20 -0800 (PST)
Received: from [10.22.11.123] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	p25sm41833535pfk.20.2016.12.20.17.33.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 17:33:20 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <15daa04b-92db-cc3f-f0f9-14ac92764641@topic.nl>
	<CALbNGRTvDGuegSZPiV1E7WteGqjdYQkjfdHtB-dU0B=PT8xzxg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2fe8322b-11d9-8e04-09ed-77c78cda59b1@gmail.com>
Date: Tue, 20 Dec 2016 17:33:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRTvDGuegSZPiV1E7WteGqjdYQkjfdHtB-dU0B=PT8xzxg@mail.gmail.com>
Subject: Re: morty branch XFCE no longer builds, missing libwnck3
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
X-List-Received-Date: Wed, 21 Dec 2016 01:33:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit



On 12/20/2016 03:53 AM, Andreas Müller wrote:
> On Tue, Dec 20, 2016 at 10:54 AM, Mike Looijmans
> <mike.looijmans@topic.nl> wrote:
>> With current "morty" branches of OE-core and meta-openembedded, a build of
>> an xfce desktop image fails:
There is a patch pending merge to Morty sitting in my morty-next

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/morty-next&id=4cb131f10885a84489cbcd3750a45f64f0547cda

I will send a pull request.

- armin
>>
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: Nothing PROVIDES 'libwnck3' (but
>> /.../meta-oe/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb
>> DEPENDS on or otherwise requires it). Close matches:
>>    libwnck
>> NOTE: Runtime target 'xfce4-hotcorner-plugin' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['xfce4-hotcorner-plugin',
>> 'libwnck3']
>> NOTE: Runtime target 'packagegroup-xfce-extended' is unbuildable,
>> removing...
>> Missing or unbuildable dependency chain was: ['packagegroup-xfce-extended',
>> 'xfce4-hotcorner-plugin', 'libwnck3']
>> NOTE: Runtime target 'desktop-image' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['desktop-image',
>> 'packagegroup-xfce-extended', 'xfce4-hotcorner-plugin', 'libwnck3']
>>
>>
>>
>>
>> Kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>> TOPIC Products
>> Materiaalweg 4, NL-5681 RJ Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: +31 (0) 499 33 69 79
>> E-mail: mike.looijmans@topicproducts.com
>> Website: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>>
>>
> So we need in morty at least
>
> commit 5b0060bbbacf405405e292e8a8e5db9589f63325
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Date:   Tue Nov 1 17:28:21 2016 +0200
>
>      libwnck3: add a recipe
>
>      It is no longer needed in oe-core.
>
>      Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
>
> and maybe (don't know the status of gnome.bbclass in morty) - but
> should not do any harm
>
> commit 3be9eea720ba70fd3a9e4744401fd268e31731f8
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Mon Dec 5 18:36:21 2016 -0800
>
>      libwnck3: Add missing dependency on gnome-common-native
>
>      Fixes configure errors
>      ../libwnck-3.20.1/configure: line 13391: syntax error near
> unexpected token `maximum'
>      ../libwnck-3.20.1/configure: line 13391: `GNOME_COMPILE_WARNINGS(maximum)'
>
>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


