Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8FB74C0D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 02:18:04 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id w4-v6so2624232pgq.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 19:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=slBKT6ScVnSBxn/PINz3+4Wht6DMtgaLdGlmYMA4TfA=;
	b=rxLH8tsb9Jf2LvCURJaIwkkXG6KgVy+XFn++A+QcSA1n0LzPHLSK2LRF5mtKIFUYRA
	UG9PlSw4Emo/fbZKB8TyOl1i0g1S5gdOcFsIi7lPXUhpI9eks0xL6W12HjC1xT0gpXaG
	TGz+ZeK045nhEISdHymr+e7Jc0ZXLI+Iy00Wo6gD3tM22uXwiAsp3jXXVinfuW8O8eo5
	R4VsLcnZfXaNsWb4f4d+DeMI/CeDLjYzJIRuCqxfK2J5sjpX4JJnTXg2UTnTOuZCmgCu
	VcyRUMMgAyn+4j7GGe4xqayqBoMLN3cJcH5n679zpRAgdGHDQxQagPfhnYUkNHzhkWpH
	wuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=slBKT6ScVnSBxn/PINz3+4Wht6DMtgaLdGlmYMA4TfA=;
	b=igboYB0pbCavscVV+QIqvE1gZg2VELfPLvd25ksv1Zs3SN2f81j9z1jx6lMOnAwadg
	pPsXe9BLSHxOh+UHJCm6CTFzwTani7+JLNHiFF01SkJQZp16fKP27JQCvLBnlXbreB3b
	Kjf0NhegP7e2AlAEWxhGENFOWXk6t5nizHh46n3VHFQFD5i2xh0TXMmbAn28M+4GLr4I
	4MQQpVM8YdCoUF7anbrZZVNeM0w6r6tQ2ASufTEDIEuX3KN6kQUP4DioshVmm8j+JImB
	VHM3vkrnxPg4Jkj32q7mctK34WtwlU5C2cGAIrQiamf+bcmaT/tdpXqlOBHl/JXPs5uJ
	+nvQ==
X-Gm-Message-State: ALKqPwdF2uQq7qCfrEsi0iTL6aSU9HUBZVFOFO56a9J6/5bME0SZlmDZ
	oMu25s2QmzcC3QiDVndqxFUca+GR
X-Google-Smtp-Source: AB8JxZr6fAY5DfAtwH2GXIX7NQNQF02KuXcJXCL3YlBp/2fLUbed7tNt/x7zu9ulCSC4F6gN2VpG5Q==
X-Received: by 2002:a63:a60a:: with SMTP id
	t10-v6mr5870586pge.351.1526609884901; 
	Thu, 17 May 2018 19:18:04 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:50cf:a971:a3cb:56ce])
	by smtp.gmail.com with ESMTPSA id
	z25-v6sm12196126pfi.171.2018.05.17.19.18.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 19:18:03 -0700 (PDT)
To: Anuj Mittal <anuj.mittal@intel.com>,
	Pierre-Jean TEXIER <texier.pj2@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1526407511-29723-1-git-send-email-texier.pj2@gmail.com>
	<1cb75da3-dd0b-ad66-69fe-9f4b521a4c9d@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b6457a0a-e299-eec8-7b88-4a16aba1d869@gmail.com>
Date: Thu, 17 May 2018 19:18:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1cb75da3-dd0b-ad66-69fe-9f4b521a4c9d@intel.com>
Subject: Re: [meta-oe][PATCH] minicoredumper: fixes for sysvinit and systemd
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
X-List-Received-Date: Fri, 18 May 2018 02:18:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/15/18 3:53 PM, Anuj Mittal wrote:
> On 05/16/2018 02:05 AM, Pierre-Jean TEXIER wrote:
>> The sysv initscript and systemd service assumes minicoredumper is
>> installed in /usr/bin/. In our case minicoredumper is installed in
>> /usr/sbin/ by default. Therefore, fix this path.
>>
>> Signed-off-by: Pierre-Jean TEXIER <texier.pj2@gmail.com>
>> ---
>>   meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init    | 2 +-
>>   meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
>> index 90ef7fa..9c96e31 100644
>> --- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
>> +++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.init
>> @@ -22,7 +22,7 @@
>>   
>>   case "$1" in
>>       start)
>> -        echo "|/usr/bin/minicoredumper %p %u %g %s %t %h %e" > /proc/sys/kernel/core_pattern
>> +        echo "|/usr/sbin/minicoredumper %p %u %g %s %t %h %e" > /proc/sys/kernel/core_pattern
>>           ;;
>>       stop)
>>           echo "core" > /proc/sys/kernel/core_pattern
>> diff --git a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
>> index 851b54c..45d098f 100644
>> --- a/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
>> +++ b/meta-oe/recipes-kernel/minicoredumper/files/minicoredumper.service
>> @@ -4,7 +4,7 @@ Description=Enable minicoredumper.
>>   [Service]
>>   Type=oneshot
>>   RemainAfterExit=yes
>> -ExecStart=/bin/sh -c '/bin/echo "|/usr/bin/minicoredumper %%p %%u %%g %%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
>> +ExecStart=/bin/sh -c '/bin/echo "|/usr/sbin/minicoredumper %%p %%u %%g %%s %%t %%h %%e" > /proc/sys/kernel/core_pattern'
>>   ExecStop=/bin/sh -c '/bin/echo "core" > /proc/sys/kernel/core_pattern'
> 
> There was a comment that /usr/sbin shouldn't be used on an exact same
> patch submitted last month. Please take a look at that suggestion.
> 
> https://patchwork.openembedded.org/patch/150063/
> 

there is updated v3 for that patch here 
https://patchwork.openembedded.org/patch/150821/

I would suggest to build upon that change on missing pieces if any. I 
have staged the v3 for now.

> Thanks,
> Anuj
> 

