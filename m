Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id E128A70031
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 17:33:23 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id pp5so8050905pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=FK71EIi8Ch1S6Q0o0XRYFeS2zwbe2s+5l+t5jakOUjk=;
	b=QWZAxW69siPKpWv6oTBwMdqwi6h6Pk0hcahJlg8Z10vJDPl89MHEQiD6rJcwHkqHnM
	1d0DpUpNMs+UFwgUAwSbhc+1PbygsVw+LBGhyJNOsYQi/V33v6gsZ6IsiFMZKCLYRSgX
	NXTWvctiMqtwgRSj9TvBmDDc20No52hiSB6GwXpxnD0Sy1c58JGe96fGYOeb7jOjOsVA
	b9mEUhbV4NkVOrUdDK5SNKD9mCagYsVzCV6jYAw8WwvPc3BJIXDleQojmk6GRF5r8AbO
	05HLadKl4NIkFRLM9+w3U1sri7u1BH4MUHEVd2rU3Xe6xxBO87VSBxtqeYU82yHysMBU
	2yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=FK71EIi8Ch1S6Q0o0XRYFeS2zwbe2s+5l+t5jakOUjk=;
	b=mfDrPfBAY/apM6sLGy3vwlw8OGlvUlvGxlxqrKD3kQxQndfkbG9qAitWvprqDVcxtp
	2P41C/n9bD3gQkKT5NdVIoNVuJA+o2t+EWeuUTcsuAKV1EE52N2pzQ1cA0cvLr2L94MA
	h6A7eS9EChJdxadfAjeu1P4EV+5RYY1hmjJsv6hStjxtXnrSv1+cjPUmn2x84tEpgJZA
	KhuV0kF70U7FsZt7X+83kGM9doP0YXTV697DR4nOUP1dkJ4Rck+v3ZmZr08UyVftGtin
	LQ4zy+K4ytjt7yliVO1UpntVO+pJ28VPucDhbSdbZQUouUELAbE5JMYXUmyT9oBR+Qzh
	Qo8A==
X-Gm-Message-State: AE9vXwMM8NGYmRYD9X0+NhPvqtLzUPPdHPWlrQIMG0BudxAF6cdQCMZn4GDJl8xp6KOAjw==
X-Received: by 10.66.120.11 with SMTP id ky11mr35255277pab.79.1473701603110;
	Mon, 12 Sep 2016 10:33:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:f0a1:4ecf:1e7b:61b2?
	([2601:202:4001:9ea0:f0a1:4ecf:1e7b:61b2])
	by smtp.gmail.com with ESMTPSA id
	s1sm25981836paz.47.2016.09.12.10.33.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Sep 2016 10:33:21 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20160912170647.14289-1-Martin.Jansa@gmail.com>
	<CAMKF1sqY8tOj5y0kMNkVESWfZcddU3p9Lw2ZrxFOETGMC6rY8Q@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bdbed90b-1aa2-b42e-2279-716cb2259bef@gmail.com>
Date: Mon, 12 Sep 2016 10:33:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqY8tOj5y0kMNkVESWfZcddU3p9Lw2ZrxFOETGMC6rY8Q@mail.gmail.com>
Subject: Re: [meta-oe][meta-networking][PATCH] iscsitarget, netmap-moduls, vboxguestdrivers: Blacklist, not compatible with default kernel version 4.8
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
X-List-Received-Date: Mon, 12 Sep 2016 17:33:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 09/12/2016 10:12 AM, Khem Raj wrote:
> 4.8 isnt released yet. So I would suggest to wait merging this until its
> released

4.8-rc5 is so this patch is valid IMHO.

-armin
> On Sep 12, 2016 10:07 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>   .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb        |
>> 3 +++
>>   meta-networking/recipes-kernel/netmap/netmap-modules_git.bb            |
>> 3 +++
>>   meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb     |
>> 3 +++
>>   3 files changed, 9 insertions(+)
>>
>> diff --git a/meta-networking/recipes-extended/iscsitarget/
>> iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-
>> extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>> index ba51c25..4b5622b 100644
>> --- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
>> svn502.bb
>> +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
>> svn502.bb
>> @@ -56,3 +56,6 @@ FILES_${PN} += "${sbindir} \
>>
>>   RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
>>   RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
>> +
>> +# http://errors.yoctoproject.org/Errors/Details/83334/
>> +PNBLACKLIST[iscsitarget] ?= "BROKEN: not compatible with default kernel
>> version 4.8"
>> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> index 6544bb5..e9eea56 100644
>> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> @@ -87,3 +87,6 @@ do_install () {
>>       cd ${S}/LINUX
>>       oe_runmake install
>>   }
>> +
>> +# http://errors.yoctoproject.org/Errors/Details/83335/
>> +PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default
>> kernel version 4.8"
>> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>> ers_5.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>> ers_5.1.4.bb
>> index 66068d1..1d1b1d8 100644
>> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
>> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
>> @@ -63,3 +63,6 @@ FILES_${PN} = "${base_sbindir}"
>>
>>   # autoload if installed
>>   KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
>> +
>> +# http://errors.yoctoproject.org/Errors/Details/83333/
>> +PNBLACKLIST[vboxguestdrivers] ?= "BROKEN: not compatible with default
>> kernel version 4.8"
>> --
>> 2.10.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


