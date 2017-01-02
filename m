Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id D2CD0606D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jan 2017 17:07:25 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id n5so30922220pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jan 2017 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=umpwtSmJ9ZCQ78GufwNt85AIBAM74vCtyfRH4YMlKFU=;
	b=NKjYx/aUtulNmWbKEI4vFzbw+V9A1OiElJUYbGIOxvRWtg/OywzGS6EK0F5zd+XuRi
	qT4+USPsy53HhKN6VXEA+tWaSDdPJ4liaVd8/ZXiq3DGwYb8aRDS8VwMG7HPtCic9vwY
	Dunyi65AWPuCoukAsF6+mKc6baitjMRL4Bwn3wz474vtLMqA1SE0fQEmrDKkaYM9DzUt
	DcCmEPXO1AkmuRwVy+5X1eSqAtFsCKnpaIg3VRdlR1HksDYvLislNzj3iyxu4wuy/Cix
	ZNf1N8MGjQp7uHEYI6VhfqY9X9WznpaEQVX30v5RPb+6OAo9xCPMcUuhY3W+Prk7TQPn
	/buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=umpwtSmJ9ZCQ78GufwNt85AIBAM74vCtyfRH4YMlKFU=;
	b=WrMk1WGYxgcDVSjp7ogsX6OjVc9eUl7QEnvQ3JSeMxq71D65QSvk6lrVx6+gIGC8C+
	BqI7MP+7Y/aER97sL5BCocLFxWX09P3kfPYp1pODJBVZuRT+W3L5yPcVFncwuZTrgAfX
	xVG0JITWQEpxv3FUSi7V0t7vVXxJH94wXKtRVOcGOMmMXKkConiXFHdfiKLT6yb406pP
	Pox+94V+8qVh0og6hLQCi/v+PQkr0wjZx4E6wWktYJbnY5vdcnwLpgVx88PLulmRc2LR
	QWrHF4VI9SkXSiHO0WVaWdXEB6xDrSpcD0Hd+Vhlflaf3AWDBeIAZdVACY63NpOha/AC
	oEew==
X-Gm-Message-State: AIkVDXIh6+gnaaTFqC3vjT4kwO1PL2/gXb/+aiiJEikO7byQm8qF3jB3sKInsTUMoJUnKw==
X-Received: by 10.99.164.9 with SMTP id c9mr109930445pgf.141.1483376845648;
	Mon, 02 Jan 2017 09:07:25 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	r2sm133655903pfi.67.2017.01.02.09.07.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jan 2017 09:07:25 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <15daa04b-92db-cc3f-f0f9-14ac92764641@topic.nl>
	<CALbNGRTvDGuegSZPiV1E7WteGqjdYQkjfdHtB-dU0B=PT8xzxg@mail.gmail.com>
	<2fe8322b-11d9-8e04-09ed-77c78cda59b1@gmail.com>
	<45e5bbb8-6e17-d030-cf2c-f54e2c2e30ba@topic.nl>
From: akuster808 <akuster808@gmail.com>
Message-ID: <24baf650-5877-aa72-06ae-436a8e6e9a11@gmail.com>
Date: Mon, 2 Jan 2017 09:07:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <45e5bbb8-6e17-d030-cf2c-f54e2c2e30ba@topic.nl>
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
X-List-Received-Date: Mon, 02 Jan 2017 17:07:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01/02/2017 12:18 AM, Mike Looijmans wrote:
> There's no trace of any attempt to bring back 'libwnck3' in the morty 
> branch, am I the only one in the world using morty to build an XCFE 
> image?

there are a few traces:
http://lists.openembedded.org/pipermail/openembedded-core/2016-December/129529.html
http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130155.html


The revert fix in Core has been sitting in my staging branch
https://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akuster/morty-next 
since Dec 11th.

- Armin


>
>
> On 21-12-16 02:33, akuster808 wrote:
>>
>>
>> On 12/20/2016 03:53 AM, Andreas Müller wrote:
>>> On Tue, Dec 20, 2016 at 10:54 AM, Mike Looijmans
>>> <mike.looijmans@topic.nl> wrote:
>>>> With current "morty" branches of OE-core and meta-openembedded, a 
>>>> build of
>>>> an xfce desktop image fails:
>> There is a patch pending merge to Morty sitting in my morty-next
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/morty-next&id=4cb131f10885a84489cbcd3750a45f64f0547cda 
>>
>>
>>
>> I will send a pull request.
>>
>> - armin
>>>>
>>>> NOTE: Resolving any missing task queue dependencies
>>>> ERROR: Nothing PROVIDES 'libwnck3' (but
>>>> /.../meta-oe/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb 
>>>>
>>>>
>>>> DEPENDS on or otherwise requires it). Close matches:
>>>>    libwnck
>>>> NOTE: Runtime target 'xfce4-hotcorner-plugin' is unbuildable, 
>>>> removing...
>>>> Missing or unbuildable dependency chain was: 
>>>> ['xfce4-hotcorner-plugin',
>>>> 'libwnck3']
>>>> NOTE: Runtime target 'packagegroup-xfce-extended' is unbuildable,
>>>> removing...
>>>> Missing or unbuildable dependency chain was: 
>>>> ['packagegroup-xfce-extended',
>>>> 'xfce4-hotcorner-plugin', 'libwnck3']
>>>> NOTE: Runtime target 'desktop-image' is unbuildable, removing...
>>>> Missing or unbuildable dependency chain was: ['desktop-image',
>>>> 'packagegroup-xfce-extended', 'xfce4-hotcorner-plugin', 'libwnck3']
>>>>
>>>>
>>>>
>>>>
>>>> Kind regards,
>>>>
>>>> Mike Looijmans
>>>> System Expert
>>>>
>>>> TOPIC Products
>>>> Materiaalweg 4, NL-5681 RJ Best
>>>> Postbus 440, NL-5680 AK Best
>>>> Telefoon: +31 (0) 499 33 69 79
>>>> E-mail: mike.looijmans@topicproducts.com
>>>> Website: www.topicproducts.com
>>>>
>>>> Please consider the environment before printing this e-mail
>>>>
>>>>
>>> So we need in morty at least
>>>
>>> commit 5b0060bbbacf405405e292e8a8e5db9589f63325
>>> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>>> Date:   Tue Nov 1 17:28:21 2016 +0200
>>>
>>>      libwnck3: add a recipe
>>>
>>>      It is no longer needed in oe-core.
>>>
>>>      Signed-off-by: Alexander Kanavin 
>>> <alexander.kanavin@linux.intel.com>
>>>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>
>>>
>>> and maybe (don't know the status of gnome.bbclass in morty) - but
>>> should not do any harm
>>>
>>> commit 3be9eea720ba70fd3a9e4744401fd268e31731f8
>>> Author: Khem Raj <raj.khem@gmail.com>
>>> Date:   Mon Dec 5 18:36:21 2016 -0800
>>>
>>>      libwnck3: Add missing dependency on gnome-common-native
>>>
>>>      Fixes configure errors
>>>      ../libwnck-3.20.1/configure: line 13391: syntax error near
>>> unexpected token `maximum'
>>>      ../libwnck-3.20.1/configure: line 13391: 
>>> `GNOME_COMPILE_WARNINGS(maximum)'
>>>
>>>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>


