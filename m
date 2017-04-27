Return-Path: <andrej.rode@ettus.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5539F77E25
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 23:08:23 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id v1so5404565pgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 16:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=NI9OTtMF1IW3sS0YG0LBCYb2MZ9hpMR1NkhVXN2Xt+I=;
	b=ArZLtQ5j985bW1dmwOfnEJHZUcsbHGSBZGSY7gQpwi2y3Xy3gbEIYPpfKOEq605knA
	CsbyZO6R2B2sr1XmAcDhIshWsPdXHVr5uneW1efT/RaWO3JRhinaCGi8KHc2YTCF7oDC
	PTgjI+HR+5FavTZELK+pYSycekdWldJhi0Zo4UaVGTgxP6vJNM2NVL6PiLOWR/JACiBL
	9/Vun7s7mk8weF1GifRm1zuvtmP000TCAOJbEpyGGW890tYR6TiIF3TX3yftgJZf/8Pn
	LLYGYCIPOe3yLUv0dmOl4kouYXMXUsjGEnV21SwIZIiYJvd2HulyrauUX3c2a9hYHWW/
	KK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=NI9OTtMF1IW3sS0YG0LBCYb2MZ9hpMR1NkhVXN2Xt+I=;
	b=IW5+zK4uIHmd98+8XCeiyGzmtBeyZYKVsrKu3IW6xS7PVi7zVGdShktHXoYGD6+vAV
	RYhs89MDk3brBCqC/DaiXHImYBjc9piecskLLkwpnI0Mh9eYvP+dDliTt1W6H19boGBo
	Fe8o6Ehm654jA/nm/jNIMGdFJJzNVSlrMT7YDxk6NrthObs4RSQB8/HWosUqwtaoE3YY
	wi59P4GhquzFkMypd/eAxyWiFPZjv6JHnukyT7+cVoHp4abnC+Nn8rrmjIteZY1lNoe3
	HAW4HdyHqpgKFOFY7vaO1ucx6hd53XgN3WL8V5tstWTxVM7RYr8X04+/pC5PgVf+KB51
	04pg==
X-Gm-Message-State: AN3rC/4UAmGEitwkAQRXhXZ9CNUV/nhI4B0mR5n/+ogrVVDgLfE0vJ0B
	Wjr+rjIpR3SIrVgP
X-Received: by 10.84.134.129 with SMTP id 1mr10974793plh.61.1493334504577;
	Thu, 27 Apr 2017 16:08:24 -0700 (PDT)
Received: from [10.16.32.196] (207-114-172-147.static.twtelecom.net.
	[207.114.172.147]) by smtp.gmail.com with ESMTPSA id
	a16sm7982512pgd.22.2017.04.27.16.08.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Apr 2017 16:08:24 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20170427211948.12255-1-andrej.rode@ettus.com>
	<20170427211948.12255-2-andrej.rode@ettus.com>
	<CAMKF1sosx80ehDcFOKdt88GDRTbW3i577y-zxFdZ4V4OuQkjYQ@mail.gmail.com>
From: Andrej Rode <andrej.rode@ettus.com>
Message-ID: <0efff3a1-304d-750e-1675-b31c108c09f9@ettus.com>
Date: Thu, 27 Apr 2017 16:08:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sosx80ehDcFOKdt88GDRTbW3i577y-zxFdZ4V4OuQkjYQ@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH v3 2/2] python-mprpc: add new recipe
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
X-List-Received-Date: Thu, 27 Apr 2017 23:08:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

> I think you could just do SRC_URI += and remove patch=1 and pnum=1
> they are defaults.
>

yeah, that would be better, but as Martin pointed out all my pending 
patches are already merged.
Sorry for resending and not checking if they are already merged.
I was looking at patchwork, but somewhat I missed that everything is 
already in-tree.

Cheers,
Andrej


