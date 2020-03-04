Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 97679611D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 18:59:28 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z12so1428892pgl.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 10:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BLADnIdctP3wHvFu9AyBDpH23KtI2N+4wPXUarAL3Mw=;
	b=F5x4qrQ22dyJd1J06XDvMaEdKqVLUVuBDZJKJAk2l3ZKpeOJ5h9hmKgSq+Ny7t+F74
	b/e2DcgnDbPeZ68QjBM3mxaLnkn4r8fqk+5mov99kf1qx0tp/ksmInhhUj9yVpJUq3sM
	M/6RWGuvhJiECCjhheCSv+sKJtIwZKKW4xM4t7+HE4h5xR2xcMn0Xo7P2/fXG5RDjSG5
	OJRFHSRUA02Ji240O3v7q92Kdf6eOQaIGpVtee1aqT07gmnAGbkd5zZo2p0SdSe8DCuX
	WheKTiY/ZLDdcXZzZiKcB5uRgbao14AykRsYN4eT+o2e/+9dUXfrVlPcxCu7LiakGBj6
	t6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BLADnIdctP3wHvFu9AyBDpH23KtI2N+4wPXUarAL3Mw=;
	b=H5AgYwdVKMNaUxddhqmdPshLX3UE7o/g7E3qqE4ECRMoDTZFmpWdB95XwS5BZyqRoF
	5t4PY/+RdXwcMVVolbwK+507/3YxAOvNKq654BQOn7phUy4ft5UK9scQWQqm/B/J+Rx6
	40Hf4/vX+n77l++IIo4vFwNtitZ9G4tbNFJ/S2QYfAaYqh1iqd+N9GsJ4GpauSWw0SH7
	evClbl0nKr2+bduxE8CaP/oOcj8ElEZSHHePIsdtMLnbK8GPWM52b6itdmL9ca9a2jnB
	cxa8BVcQ/0MAKN5o7OuVy6cDR1A+0ZNbNCF1FEjMB0znmZc8dTp/qVqS6viQSZnDa9BI
	+yfg==
X-Gm-Message-State: ANhLgQ1bZ+0MYluACFXKorPwTHnrdNjpZ831kF181QCqmF+PW2JQQeco
	UPGn4MVW/Xrc8YsITjVKbHenyTOQEQU=
X-Google-Smtp-Source: ADFU+vvKhgUq+bAtnGu/dSlBktiuj6j5KbYTVy6xQfklx7CDjUspq6ePdgkuYCBDChn4ypaMtpqtuQ==
X-Received: by 2002:a62:874d:: with SMTP id i74mr4295118pfe.241.1583348369123; 
	Wed, 04 Mar 2020 10:59:29 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:dcd2:b9cb:142a:850e?
	([2601:646:9200:4e0:dcd2:b9cb:142a:850e])
	by smtp.gmail.com with ESMTPSA id
	b27sm28941697pgl.77.2020.03.04.10.59.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 10:59:28 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>
References: <20200304171927.2068660-1-raj.khem@gmail.com>
	<20200304171927.2068660-2-raj.khem@gmail.com>
	<20200304184942.GA7858@localhost>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8297d4fe-eb5d-4b54-d117-be221e341c1f@gmail.com>
Date: Wed, 4 Mar 2020 10:59:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200304184942.GA7858@localhost>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 2/5] vlc: Depend on gst-1.0 ugly plugins instead of 0.10
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
X-List-Received-Date: Wed, 04 Mar 2020 18:59:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/4/20 10:49 AM, Adrian Bunk wrote:
> On Wed, Mar 04, 2020 at 09:19:24AM -0800, Khem Raj wrote:
>> ...
>> -PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gst-plugins-bad"
>> +PACKAGECONFIG[gstreamer] = "--enable-gst-decode,--disable-gst-decode,gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
>> ...
> 
> The subject should say bad, not ugly (ugly is a different set of plugins).
> 

Thanks, fixed in master-next

> cu
> Adrian
> 

