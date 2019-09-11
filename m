Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B6D0E7E457
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2019 01:40:17 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n4so10675079pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 18:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FOD9KYeU1NZpUW90+GM45WVap5EeSOgfgzQVPfeKMZk=;
	b=JQW0Fb2QDFmiVsE6LfIyZDvUBKsDLDTuHnhr2Dj3PjEcfe0kSoJ/UV7wLZArYqSmrX
	7M5sykQ46N2UyvoztxQ2W9EDEmlfxQE2uBM1r0/2qnUBbf69y8jA2VyIBWJ4rc6ap7vq
	BYybkNiF7ArCACxDT1iQwFwV7nfbK1x6iLEmOnJ/UPSC5lOV1ck46jVb9ZDiXuRuzVhV
	PV5fqtVYsRN98WbN/fhfRiL+npypePhqxNRPNKSr4MCMYSpSZeePdCzd5OFqjFN6iD6d
	oR/EYpVvi2xowXayCa7wbBiG7KYdeIZ6D79a/OdyJHr0ZruFys7PbYmq++Vn4pSQpGYI
	BHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=FOD9KYeU1NZpUW90+GM45WVap5EeSOgfgzQVPfeKMZk=;
	b=jXCRk/JMv4uk2iUmAhKWudX4v0GLSLX7JTAoVVA2oIraqH/pgoARL4UkmZIGqfOtv0
	Fu95t6k4D0/nAQNFnFLb9iy7iCdIVa4cRol0qvhfWEd/ljprbtK8MdCkzr0OQ64HxzeF
	9WdozryzhWxD9Fl7+9bgNwuUYBuSVFkWDbZKTFfZIfqpkwTtb1as+T9FvEZ1AxiBpxoI
	lGfmdP//HOd3q3kt8eUAlmuRNWWldK4gPr4xNw3d2rnCHj5ycw4Khy+1sj3PU/nMNSgJ
	4QJWFMZM3ds5G4enS1YhTDnJmU3cOKFzWF2Kq0Nl+0O/zjzzaaozlR8YB8P9Vl+P2UF5
	oNHw==
X-Gm-Message-State: APjAAAXRW/Jap3Kd7OqVvcx8piqdY3m9+f5fcm3TEkksLzQwWhbLQtj+
	pvxDNgcexF74i0EeDO2Q9sw=
X-Google-Smtp-Source: APXvYqxc5kZU0t5jU5tWLuMGv3bR0JphdepSF8o2t/Q0yX4qORGlCNURCRtQ6QtkpFYXArnVpN0JLA==
X-Received: by 2002:a62:64c9:: with SMTP id y192mr40585766pfb.6.1568166018286; 
	Tue, 10 Sep 2019 18:40:18 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:1c20:88fd:f000:b247:9b0f?
	([2601:646:8500:1c20:88fd:f000:b247:9b0f])
	by smtp.gmail.com with ESMTPSA id i1sm24030911pfg.2.2019.09.10.18.40.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Sep 2019 18:40:17 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>, Stefan Agner <stefan@agner.ch>,
	openembedded-devel@lists.openembedded.org
References: <20190910214919.9171-1-stefan@agner.ch>
	<c30d914c-da23-70f0-cde3-6bb32a5b8f98@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <9ca2559a-1b60-367a-ce6e-5f85b4763c4f@gmail.com>
Date: Tue, 10 Sep 2019 18:40:16 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c30d914c-da23-70f0-cde3-6bb32a5b8f98@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-filesystems][PATCH] fuse3: add libfuse3 recipe
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
X-List-Received-Date: Wed, 11 Sep 2019 01:40:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Armin

On 9/10/19 3:06 PM, akuster808 wrote:
> Stefan,
> 
> On 9/10/19 2:49 PM, Stefan Agner wrote:
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Add recipe for libfuse version 3 series. Follow the scheme other
>> distributions use and create a new recipe with 3 in its name.
>> To avoid conflict with the fuse (2) recipe this recipe does not
>> provide init scripts/configuration files which automatically load
>> the fuse kernel driver.
>>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> 
> This recipe appears to already exist in meta-filesystem
> 
> https://git.openembedded.org/meta-openembedded/tree/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> 
> Is this a all together a different Major version that is not compatible
> with the one above? or should we just update the old one?
> 

These are different revisions which can be installed together see [1]
I think best solution is as proposed where both revisions can live 
together, we don't want to force fuse2 users to fuse3 since it could 
mean quite a bit of unplanned work. Eventually we might drop fuse2 maybe 
in 3.1+ releases if all users of fuse in OE have moved over to fuse3

[1] 
https://github.com/libfuse/libfuse/blob/master/ChangeLog.rst#libfuse-300-2016-12-08

