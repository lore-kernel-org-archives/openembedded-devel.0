Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f41.google.com (mail-pl0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id B82257887B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:40:00 +0000 (UTC)
Received: by mail-pl0-f41.google.com with SMTP id k8-v6so740046pli.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 19:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6n2l/0rmYTLpIQW5MARzVcbpzKaf9jM6AUFzv4/NNJI=;
	b=UXo5/l3I942y4xvF6RMUU76HQQ0PrLz7AWrHvUa7NXmzf/sL1JNc5G9cwx/nuUQNWQ
	I2lnT75XHGEYRh4Tj3S5VYsiDJuu3RzMU5Zyi/xvnrGZeQbg8YIs1NHLTJ0mu/gK1IOF
	aCSKGKUK91NLR6ZI4gdI5hlc6nb6Q+LNUCa8Lv3paaEG9qOOWr121zTMZUfUETPURA7+
	Zz6Rx9HvNWBQKGBTHhZctOfK7PdJPbH38wFsCvmGNmXh/5X2a5Ia5mvxK4Y932pI8ddi
	iKl0mqk5Q8CevxHugf2xMCjEBGlkUqWsix3PqcP3OG/NxNFLrjnkH+Y82LCfXuWAWggx
	TuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=6n2l/0rmYTLpIQW5MARzVcbpzKaf9jM6AUFzv4/NNJI=;
	b=YDwc8T4cwO1F2vbkn0jEOMdZ35NxRR5Mx/HUBoHWJb1mt0r9R118IKtjPZUzpy9qra
	KuFo/YEHzTKjO5u3vXZyf6Ul/p3hMz2L893Zuhvx6XjdZZRZbwwhHPbKbtRse9Nrfya4
	iSioRei2zwoOxXHu/kDkRdEgqzGVmlhNnDX4uWuUKFsOtTPfyxGfJdWd3bazpFe1tQ9F
	bYmI2nyQb8888WyHeXgStnA/C1f7u1w58csCmIv1tiymxtDWvCz3LZq4vNj5qXO4h+nx
	Dgo172V50kVl3p1CA8JJNdZcDF6PTwVZRj4KkFxj8q/pAk60Xb/g/7VXqCcxBOJU5rss
	AQYA==
X-Gm-Message-State: APf1xPD8BRGWq6z2Api+2IkfkcwrkoHu5BhvoX+9GwrvsGfhUlKkkJpy
	VVKe5OUvhH3r0X/GRgOIrc4tlUQ3
X-Google-Smtp-Source: AH8x225zTioKC1Z6nUGd+ZRww4M/EEKwosEMYwIHe2WDoU2GtuHgO5RuxX0/0sT/qGUv4rfmICLnYA==
X-Received: by 2002:a17:902:40a:: with SMTP id
	10-v6mr16492663ple.245.1519789201333; 
	Tue, 27 Feb 2018 19:40:01 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:812d:b93c:3785:4a27])
	by smtp.gmail.com with ESMTPSA id
	o128sm886363pfg.96.2018.02.27.19.40.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 19:40:00 -0800 (PST)
To: Jaewon Lee <JAEWON@xilinx.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <BY2PR02MB4253E02A1E05FE35944B351AFC00@BY2PR02MB425.namprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6cd44716-fc35-e7a0-96c1-b1c2edb04315@gmail.com>
Date: Tue, 27 Feb 2018 19:39:59 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <BY2PR02MB4253E02A1E05FE35944B351AFC00@BY2PR02MB425.namprd02.prod.outlook.com>
Subject: Re: qt moc issue
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
X-List-Received-Date: Wed, 28 Feb 2018 03:40:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/27/18 9:59 AM, Jaewon Lee wrote:
> Hi All,
> 
> I'm seeing the following build error:
> 
> | /scratch/DAILYBUILD/build/tmp/work/aarch64-xilinx-linux/qtdeclarative/5.9.4+gitAUTOINC+317908e72a-r0/git/tests/benchmarks/qml/binding/tst_binding.cpp:175:10: fatal error: tst_binding.moc: No such file or directory
> |  #include "tst_binding.moc"
> |           ^~~~~~~~~~~~~~~~~
> | compilation terminated.
> | make[4]: *** [.obj/tst_binding.o] Error 1
> | make[4]: *** Waiting for unfinished jobs....
> 
> There are a the same errors for a bunch of other moc files,
> #include "tst_qxmlquery.moc"
> #include "tst_qxmlresultitems.moc"
> #include "tst_qxmlname.moc"
> #include "tst_qxmlformatter.moc"
> 
> If I check for the file after the error, the files are there.
> Im also seeing the same for other qt recipes, like  qtxmlpatterns
> 
> Has anybody seen the same error/is there a fix for this out there?
> 

I have seen this, my hunch is its a race in parallel build. I have a

workaround/hack that I use is

PACKAGECONFIG_remove = "tests" in qtbase_%.bbappend

> 
> Thanks,
> Jaewon
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
> 

