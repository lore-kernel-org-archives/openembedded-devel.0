Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE8F606BF
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2018 01:13:51 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id w126-v6so26624493oie.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 18:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=8LEOEA1fssedFdEplv7XwYVZnUksdsAsKClU6KpA+F4=;
	b=snN47OJiwIBfJi3opMVIy7Najl9M21orP9yZJPmXVAhb1x1O/IFI/Cdbn8Lir2mS4m
	51WOlf+Q0smMn6QNlPsA15ZDi6swFmQ3q0QNBNGHWsjr8XcoohQ+8zq9kDQReR1Nb6X4
	BwHfN7hin9Qae+QkX95BKYfzJxgTLOvVzK4Jf00D0QmOQa+q5DN6b1Ru0TuxJWExQKEB
	WUif/5M2aI6lbK7I7m7csTEKS3oKZyXtVJu7LEf6xAgl0Ip/+del6ERvZ6OimTIslmba
	B+BMGQoR+9N4YSuTsRpirdA/mc++uHiyBwXtd6Tk9otSs4uxOyXyb1N+jBgH1tF4kVdN
	Y7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=8LEOEA1fssedFdEplv7XwYVZnUksdsAsKClU6KpA+F4=;
	b=lF+S1xFmFCEiNw2jJyGXYv+3z5vFM+5yi4SYg3HDt1kO1qubsEqAbEM1e2kKszb8NP
	XVhE6uUAs+Ov7OHxHXp6s2lu9Mz9y5Jsr29jiRcg2kAAxaNZXDNjVfOHWyXnqxFOq//L
	2u0K1TJLXjVIYSmJPiNQnoKX8daWoHuuTp9XvJti+0nqNCFrSiKfQ7RqrqyttUXg2ssO
	/Fu+ZU5mHOiw8r8V8O6BevgFToKCW36/e1QQUUNd7JLc4MwufJHt7/zFqtAl6exOsnnP
	NenSYRSElPfHdz+cM4uxnL/h46noi9NwNWDY59BpYasPSdhkI45UqLZWmpf1YnzCISTh
	pvIA==
X-Gm-Message-State: APt69E1SIr112ZhJX1D5NfjgOVnTFyrZJ3F7wzjR8D6UP/TM9eEEBFic
	0po4zfxn09bEbVufBSmsMSkuNg==
X-Google-Smtp-Source: AAOMgpd01rAcT/RxLCt0X6+CLovMYsRmeB200Zf8lnb2png0SJoo9MihKrxFF14wZdmwdK7JfaaPuw==
X-Received: by 2002:aca:51c2:: with SMTP id
	f185-v6mr14016577oib.188.1530926032370; 
	Fri, 06 Jul 2018 18:13:52 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:41a9:b69d:a923:c699?
	([2601:202:4000:1184:41a9:b69d:a923:c699])
	by smtp.gmail.com with ESMTPSA id
	16-v6sm5215687oin.5.2018.07.06.18.13.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 18:13:51 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, Jonathan Haigh <Jonathan.Haigh@arm.com>
References: <9a8e4137ac914b168091b71d755d54281530789529-12623-1-git-send-email-jonathan.haigh@arm.com>
	<DB5PR08MB0888D243F1C828A518CBA90C93470@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<CAMKF1soy4zSM3+c=iun_u6OsY4YsP2Sp0NWfB-zatsTdjFUxZg@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <b3728620-31d6-455d-7ce3-1d86c9dcf66c@gmail.com>
Date: Fri, 6 Jul 2018 18:13:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soy4zSM3+c=iun_u6OsY4YsP2Sp0NWfB-zatsTdjFUxZg@mail.gmail.com>
Cc: Jeremy.Johnson@arm.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devicetree.bbclass: DTB make targets may contain path components
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
X-List-Received-Date: Sat, 07 Jul 2018 01:13:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/06/2018 02:25 PM, Khem Raj wrote:
> On Fri, Jul 6, 2018 at 12:02 PM Jonathan Haigh <Jonathan.Haigh@arm.com> wrote:
>> normalize_dtb() turns DTS and DTB paths into values that can be used as
>> make targets. These make targets sometimes contain some directory components
>> so 'basename' is not suitable for turning the paths into make targets -
>> we should only strip off leading directory components of the path up to
>> and including the 'dts' directory (if it exists). For example:
>> * 'overlays/at86rf233.dtbo' should not be changed.
>> * 'some/directory/path/dts/overlays/at86rf233.dtbo' should be changed to
>>   'overlays/at86rf233.dtbo' rather than just 'at86rf233.dtbo'
>>
>> Signed-off-by: Jonathan Haigh <jonathan.haigh@arm.com>
>> ---
>>  meta/classes/kernel-devicetree.bbclass | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
>> index 9866d84..0ffa8e9 100644
>> --- a/meta/classes/kernel-devicetree.bbclass
>> +++ b/meta/classes/kernel-devicetree.bbclass
>> @@ -12,9 +12,10 @@ KERNEL_DEVICETREE_BUNDLE ?= "0"
>>  normalize_dtb () {
>>          DTB="$1"
>>          if echo ${DTB} | grep -q '/dts/'; then
>> -               bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
>> +               bbwarn "${DTB} contains the full path to the the dts file, but the path should be relative to the dts directory."
>> +               DTB=`echo "${DTB}" | sed 's,^.*/dts/,,'`
>>          fi
>> -       DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>> +       DTB=`echo "${DTB}" | sed 's,\.dts$,.dtb,g'`
> This patch is fine however, you should rebase it on top of master as of today.
> secondly, this should be sent to oe-core mailing list since its
> changing that layer

this landed in master already. patch was posted earlier this week.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=8b9264824689e99fb257901be3c0f91f79f920ef
>
>>          echo "${DTB}"
>>  }
>>
>> --
>> 2.7.4
>>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


