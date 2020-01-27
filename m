Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9F87379AE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 16:05:50 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id j26so11237081ljc.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jan 2020 08:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9XhexwnhKOV0AfDwSPSg7bfM79wroD7xt1A4qu8kemE=;
	b=bm55rpFdCq5GCCTA87s+RTaJIsNR33cw//rV75Y4BS5uBf/bH2tCTrEUMdQLr6Ui2X
	XIcggVF+q3lUaVGrmpI57xoEWfzWnXaHFsS5URUYTf9Do5QCQEaO1VGUkgrDBYyvT9k2
	LnEqM1O2kda0vupOjvTfbDsMdpwr2L5/ErZxV5cWH6m262ldZ2TnOJ8AOm56Uw1S9Ckm
	hsYv9UxlxRKLM1FsQEGCc32xOFL/xfPJyNx7G7UXs+QaIN8Mp3rjejJ/5ipMkjxVpCQm
	QG6Hl2nOqwj8C7bsu4zisUm3KAqKNhjBT6RMYrQfiQ4ee7s7ETJgB3Eo1+4hpUSXdPdB
	Ue+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9XhexwnhKOV0AfDwSPSg7bfM79wroD7xt1A4qu8kemE=;
	b=AYJOdRgJn5sxuXQngToCv8GWz61TzsY8kUwOgImNBtrpchF/5ZqwLsVOzqZZyIpOFZ
	loEUcdMMxsheO1iaC/ZK8YEdZHzff+S59VKwpp0w6RCaldvLjUrKUmZ/tnK/s4PUstIK
	Cj4aTF8HVxFE4opphQeCyCxJd6X0nDoBFrah6OJ3uP1mzg2MCYaLrjY+tEEkIp1IFWeD
	IkTk6ySI27o/qnFpE78BB63o5ip8ngurwURQwg7kROleQqPOfJ+OK9LGqeMaOdfHWJvt
	7nY5dz8l8ITWknWv7esiWVoFWhdXmDaKxlRJ/UedtET4aU5EYrTi9TvKMdhD5ijV/5EO
	Ot+g==
X-Gm-Message-State: APjAAAWFL1vbYhts5uZ1+p2z5iUII5wIxhOpiAOHlbCCCC/Tix2+JN+r
	85GVCMifD41u3IrK/vAMgBA=
X-Google-Smtp-Source: APXvYqwxgJLy90EnPqxeADbzhTht2HHgI7Mp+HGCe4LAubMYA1kIgtrDDysgNasbOCpAzwp0urdtjg==
X-Received: by 2002:a2e:a408:: with SMTP id p8mr10985222ljn.145.1580141151197; 
	Mon, 27 Jan 2020 08:05:51 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id f8sm8296710lfc.22.2020.01.27.08.05.50
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 08:05:50 -0800 (PST)
To: Richard Leitner <richard.leitner@skidata.com>
References: <20200127112451.165555-1-richard.leitner@skidata.com>
	<c43cf573-d876-8a4a-d978-fc4b2303e747@gmail.com>
	<20200127145758.GA603314@pcleri>
From: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <6c208020-0b53-4701-1173-6e59c0f2b5c2@gmail.com>
Date: Mon, 27 Jan 2020 17:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127145758.GA603314@pcleri>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 0/4] openjdk-8: update to jdk8u242ga
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
X-List-Received-Date: Mon, 27 Jan 2020 16:05:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/27/20 3:57 PM, Richard Leitner wrote:
> On Mon, Jan 27, 2020 at 03:10:04PM +0100, Jacob Kroon wrote:
>> On 1/27/20 12:24 PM, Richard Leitner wrote:
>>> This series updates Openjdk 8 to the latest "ga" release 242.
>>>
>>> Successful testing has been done on a fedora-31 build host for
>>> qemuarm64, qemux86-64, qemuarm32 and armv7a.
>>>
>>
>> <cut>
>>
>> I don't know if it is related to my setup, but "bitbake openjre-8" insists
>> on rebuilding itself every time I run it, and I don't see any sstate cache
>> being generated for it.
> 
> I just tried to reproduce it, but neither for armv7a nor for aarch64
> openjre-8 is rebuiled on the latest poky/oe-core master when nothing was
> changed in meta-java.
> 
> So in your case it also rebuilds if you call "bitbake openjre-8"
> directly one-after-another without any change to the layers?
> 

Yes, precisely.

But.. I think you can ignore this. I suspect I have confused bitbake's 
hashequiv database by pruning old cache-files using the 
sstate-cache-management.sh script.

Joshua, do you know if that script is supported when using hashequiv ?

Gonna try and remove cache/ aswell, and see if that helps.

Jacob

