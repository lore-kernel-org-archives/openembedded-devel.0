Return-Path: <leon.anavi@konsulko.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 90B637FA43
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 13:30:58 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id e9so10678158ljp.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 05:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=/SSeCZKO02unkAw8MtnnXzpRJV4wFzjCa4YLHaiWj/E=;
	b=qEKL+N+8jI13rO4/2NGLt3uDml+E6ibhzR3d2XX2B71a2N1UAo3GN+ZdadVgtuediB
	pNVXkICThZFVJa3x/25WoNinHjMfR5JvWOmxvSN1GkFUcNW55fKCBz/RhOWjzkuvtua1
	yW83XoZk9f0Ch96m+9ZHY5RdeFBk0do815bG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/SSeCZKO02unkAw8MtnnXzpRJV4wFzjCa4YLHaiWj/E=;
	b=GISWa9P1hzzWhU+fHYH4/Ig6YQYesB8H8JSpV7p2OUm4w+ONrJAj3RPatBkdcj4vR0
	6m7iOFcT9fn4HfQLxnPItn24pKZufnb3eE26RaDU8V29oSsMErZQEFd2Y6VTJGBaCxu6
	/Ow7RbI5dw7C3dHuUk85Y/cthtdv1MsrfD0P3eWF7CKTySi+PSZOGNgdwwiiAmICovr/
	GsRQKtJK0zgUjdPT0PWSzFwg9pveyRlqXI/g9J0E/kQSLVBCvx9d8AKvvFTbooZcCOrf
	G/N3Jw2hvPqkyU3iwznfKXWTt+OpEDfeEsSaQNpa4eJxvkVJCscxgkX4/KKgZeYLS4eH
	mRFw==
X-Gm-Message-State: APjAAAVRTEWswwwhDCBmp848RKnb7tPBoK/tbW4lChjHK+g4X0Q/GgUT
	EwwaLgjJoAZCSqHOmf4cE6o9uJ0Hse0=
X-Google-Smtp-Source: APXvYqzzeJA9IGcjAicZMvi+dqRKdRTs+zxx0d8xoFSQaVp1jvJWD2n2XInOLl3joG7YSUaZaGuoAA==
X-Received: by 2002:a2e:9cc8:: with SMTP id g8mr11254815ljj.91.1573824658958; 
	Fri, 15 Nov 2019 05:30:58 -0800 (PST)
Received: from [192.168.4.166] ([78.130.245.67])
	by smtp.gmail.com with ESMTPSA id 70sm4579879lfh.86.2019.11.15.05.30.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2019 05:30:58 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>,
	martin.jansa@gmail.com
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<f88b8bfe-e3d9-d45c-8187-ad039df89cc0@intel.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Message-ID: <3b9d3a8a-6edc-2c4f-ac81-8f2036f1d064@konsulko.com>
Date: Fri, 15 Nov 2019 15:30:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f88b8bfe-e3d9-d45c-8187-ad039df89cc0@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Fri, 15 Nov 2019 13:30:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Ross, Martin, Khem,

Thanks you for the feedback and for helping me. I've just submitted an 
updated version of the patch for a review. Now the recipe inherits 
distro_features_check.

On 15.11.19 г. 1:22 ч., Ross Burton wrote:
> On 14/11/2019 17:20, Leon Anavi wrote:
>> +DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0 xserver-nodm-init"
>
> Are you sure it *build* depends on the X init scripts?
>
No, sorry, xserver-nodm-init is not a build dependency. I've removed it 
from the new version of the patch.
>> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
>> +INHIBIT_PACKAGE_STRIP = "1"
>
> Why?
These two lines prevent already-stripped QA errors.

I have tested the recipe on QEMU and Raspberry Pi 4.

Thanks, Leon
>
> Ross
>
-- 
Leon Anavi
Software Engineer
konsulko.com


