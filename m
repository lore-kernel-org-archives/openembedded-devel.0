Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id EF9B4729F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Apr 2015 01:52:44 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so5990561pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Apr 2015 18:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Cdb5zKqXz1fB/JfqARaVrd0nUPyJBnzCe3v2FWTNEMk=;
	b=WpY7+2VVp9DA3kwG7a7s/wvIfcvsm86PIdrwyTcnnSa4zyLH3pMng0qcf1uaSjfqFr
	i9dN6SDrZZHQ2DD/VL/F3oUBHsGitP8HThC3JyF74or6UPYcno7kQyYsi0pRTv8ucDjI
	HV+5+w749lB8vNZubDv4yE/oiNXqJZTjkfJoLfMOpGahHJukkzznIbcpiRS7U5EkNjEG
	e7t6gBqfPn28OaCfSml7X/6DZ26lXmZys1u3dG+UtqjGITG8B6w/JbBrRMCTq/36FFcF
	I1hGlaCWa5dxurxh/S0jCoqD8oLHM+jdlDEYIa/oUQxoiDukliq1wYO55tAjRa85qTeS
	ssIQ==
X-Received: by 10.67.14.73 with SMTP id fe9mr60965577pad.10.1428630764977;
	Thu, 09 Apr 2015 18:52:44 -0700 (PDT)
Received: from [10.22.11.71] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id sm7sm316989pac.45.2015.04.09.18.52.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 18:52:43 -0700 (PDT)
Message-ID: <55272CE9.6020303@gmail.com>
Date: Thu, 09 Apr 2015 18:52:41 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1428624150-7753-1-git-send-email-akuster808@gmail.com>
	<7F311B04-E1D6-4FA8-8218-A754DB918102@gmail.com>
In-Reply-To: <7F311B04-E1D6-4FA8-8218-A754DB918102@gmail.com>
Subject: Re: [meta-ruby][PATCH] bundler: Fix QA new Error
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
X-List-Received-Date: Fri, 10 Apr 2015 01:52:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/09/2015 05:30 PM, Khem Raj wrote:
>
>> On Apr 9, 2015, at 5:02 PM, Armin Kuster <akuster808@gmail.com> wrote:
>>
>> +FILES_${PN} += "${libdir}/ruby/gems/2.2.0"
>
> 2.2.0 could we use something else so we don’t have to revisit it when git recipe moves to say 2.3.0
>

most likely.. could just drop the version entirely.

thanks,

-armin

